package registry

import (
	"context"
	"fmt"
	"time"

	"github.com/apex/log"
	"github.com/distribution/distribution/v3"
	"github.com/distribution/distribution/v3/registry/storage"
	"github.com/distribution/distribution/v3/registry/storage/driver"
	"github.com/distribution/distribution/v3/registry/storage/driver/factory"
	"github.com/distribution/reference"
	"github.com/opencontainers/go-digest"
	v1 "github.com/opencontainers/image-spec/specs-go/v1"
)

// Schedule arms (or resets) the debounced garbage collection timer.
// If a GC run is already in progress, another run is queued when it finishes.
func (r *Registry) Schedule() {
	r.mu.Lock()
	defer r.mu.Unlock()

	if r.running {
		r.pending = true
		return
	}
	r.armTimerLocked()
}

func (r *Registry) armTimerLocked() {
	if r.timer != nil {
		r.timer.Stop()
	}
	delay := r.debounce
	if delay <= 0 {
		delay = defaultGCDebounce
	}
	r.timer = time.AfterFunc(delay, r.fire)
}

func (r *Registry) fire() {
	r.mu.Lock()
	if r.running {
		r.pending = true
		r.mu.Unlock()
		return
	}
	r.running = true
	r.timer = nil
	run := r.runGC
	r.mu.Unlock()

	if run == nil {
		run = r.markAndSweep
	}

	err := run(context.Background())

	r.mu.Lock()
	r.running = false
	pending := r.pending
	r.pending = false
	if pending {
		r.armTimerLocked()
	}
	r.mu.Unlock()

	if err != nil {
		log.WithError(err).Error("embedded registry garbage collection failed")
	}
}

// protectLocked records dgst until the push has been idle for the debounce
// interval. The caller holds protectMu.
func (r *Registry) protectLocked(raw string) {
	if r == nil || raw == "" {
		return
	}
	dgst, err := digest.Parse(raw)
	if err != nil {
		return
	}
	if r.protected == nil {
		r.protected = map[digest.Digest]time.Time{}
	}
	now := time.Now()
	for id, until := range r.protected {
		if !now.Before(until) {
			delete(r.protected, id)
		}
	}
	window := r.debounce
	if window <= 0 {
		window = defaultGCDebounce
	}
	deadline := now.Add(window)
	if prev, ok := r.protected[dgst]; !ok || deadline.After(prev) {
		r.protected[dgst] = deadline
	}
}

// digestProtected reports whether dgst was committed by a push that is still
// inside its quiet interval. The caller holds protectMu.
func (r *Registry) digestProtected(dgst digest.Digest) bool {
	if r == nil || r.protected == nil {
		return false
	}
	until, ok := r.protected[dgst]
	if !ok {
		return false
	}
	if !time.Now().Before(until) {
		delete(r.protected, dgst)
		return false
	}
	return true
}

// removeIfIdle deletes dgst when no in-progress push has committed it.
// The check and delete share protectMu with commit recording.
func (r *Registry) removeIfIdle(dgst digest.Digest, remove func() error) error {
	r.protectMu.Lock()
	defer r.protectMu.Unlock()
	if r.digestProtected(dgst) {
		return nil
	}
	return remove()
}

func (r *Registry) markAndSweep(ctx context.Context) error {
	fs, err := factory.Create(ctx, "filesystem", map[string]any{
		"rootdirectory": r.root,
	})
	if err != nil {
		return fmt.Errorf("registry gc driver: %w", err)
	}
	reg, err := storage.NewRegistry(ctx, fs)
	if err != nil {
		return fmt.Errorf("registry gc namespace: %w", err)
	}
	if err := r.sweep(ctx, fs, reg); err != nil {
		return fmt.Errorf("registry mark and sweep: %w", err)
	}
	return nil
}

// sweep marks manifests and the blobs they reference, then deletes what is
// still unreferenced. Digests committed by a push that has not gone idle are kept.
func (r *Registry) sweep(ctx context.Context, fs driver.StorageDriver, reg distribution.Namespace) error {
	repositoryEnumerator, ok := reg.(distribution.RepositoryEnumerator)
	if !ok {
		return fmt.Errorf("unable to convert Namespace to RepositoryEnumerator")
	}

	markSet := map[digest.Digest]struct{}{}
	deleteLayers := map[string][]digest.Digest{}
	var untagged []storage.ManifestDel
	err := repositoryEnumerator.Enumerate(ctx, func(repoName string) error {
		named, err := reference.WithName(repoName)
		if err != nil {
			return fmt.Errorf("failed to parse repo name %s: %v", repoName, err)
		}
		repository, err := reg.Repository(ctx, named)
		if err != nil {
			return fmt.Errorf("failed to construct repository: %v", err)
		}
		manifestService, err := repository.Manifests(ctx)
		if err != nil {
			return fmt.Errorf("failed to construct manifest service: %v", err)
		}
		manifestEnumerator, ok := manifestService.(distribution.ManifestEnumerator)
		if !ok {
			return fmt.Errorf("unable to convert ManifestService into ManifestEnumerator")
		}
		err = manifestEnumerator.Enumerate(ctx, func(dgst digest.Digest) error {
			tags, err := repository.Tags(ctx).Lookup(ctx, v1.Descriptor{Digest: dgst})
			if err != nil {
				return fmt.Errorf("failed to retrieve tags for digest %v: %v", dgst, err)
			}
			if len(tags) == 0 {
				allTags, err := repository.Tags(ctx).All(ctx)
				if err != nil {
					if _, ok := err.(distribution.ErrRepositoryUnknown); ok {
						return nil
					}
					return fmt.Errorf("failed to retrieve tags %v", err)
				}
				untagged = append(untagged, storage.ManifestDel{Name: repoName, Digest: dgst, Tags: allTags})
				return nil
			}
			markSet[dgst] = struct{}{}
			return markManifestReferences(ctx, manifestService, dgst, markSet)
		})
		if err != nil {
			if _, ok := err.(driver.PathNotFoundError); !ok {
				return err
			}
		}
		blobService := repository.Blobs(ctx)
		layerEnumerator, ok := blobService.(distribution.ManifestEnumerator)
		if !ok {
			return fmt.Errorf("unable to convert BlobService into ManifestEnumerator")
		}
		var layers []digest.Digest
		err = layerEnumerator.Enumerate(ctx, func(dgst digest.Digest) error {
			if _, marked := markSet[dgst]; !marked {
				layers = append(layers, dgst)
			}
			return nil
		})
		if len(layers) > 0 {
			deleteLayers[repoName] = layers
		}
		return err
	})
	if err != nil {
		return fmt.Errorf("failed to mark: %v", err)
	}
	untagged = unmarkReferenced(untagged, markSet)

	vacuum := storage.NewVacuum(ctx, fs)
	for _, obj := range untagged {
		err = r.removeIfIdle(obj.Digest, func() error {
			return vacuum.RemoveManifest(obj.Name, obj.Digest, obj.Tags)
		})
		if err != nil {
			return fmt.Errorf("failed to delete manifest %s: %v", obj.Digest, err)
		}
	}

	var blobs []digest.Digest
	err = reg.Blobs().Enumerate(ctx, func(dgst digest.Digest) error {
		if _, marked := markSet[dgst]; !marked {
			blobs = append(blobs, dgst)
		}
		return nil
	})
	if err != nil {
		return fmt.Errorf("error enumerating blobs: %v", err)
	}
	for _, dgst := range blobs {
		err = r.removeIfIdle(dgst, func() error {
			return vacuum.RemoveBlob(dgst.String())
		})
		if err != nil {
			return fmt.Errorf("failed to delete blob %s: %v", dgst, err)
		}
	}
	for repo, dgsts := range deleteLayers {
		for _, dgst := range dgsts {
			err = r.removeIfIdle(dgst, func() error {
				return vacuum.RemoveLayer(repo, dgst)
			})
			if err != nil {
				return fmt.Errorf("failed to delete layer link %s of repo %s: %v", dgst, repo, err)
			}
		}
	}
	return nil
}

func unmarkReferenced(manifests []storage.ManifestDel, markSet map[digest.Digest]struct{}) []storage.ManifestDel {
	var out []storage.ManifestDel
	for _, obj := range manifests {
		if _, marked := markSet[obj.Digest]; !marked {
			out = append(out, obj)
		}
	}
	return out
}

func markManifestReferences(ctx context.Context, manifestService distribution.ManifestService, dgst digest.Digest, markSet map[digest.Digest]struct{}) error {
	manifest, err := manifestService.Get(ctx, dgst)
	if err != nil {
		return fmt.Errorf("failed to retrieve manifest for digest %v: %v", dgst, err)
	}
	for _, descriptor := range manifest.References() {
		if _, marked := markSet[descriptor.Digest]; marked {
			continue
		}
		markSet[descriptor.Digest] = struct{}{}
		ok, err := manifestService.Exists(ctx, descriptor.Digest)
		if err != nil || !ok {
			continue
		}
		if err := markManifestReferences(ctx, manifestService, descriptor.Digest, markSet); err != nil {
			return err
		}
	}
	return nil
}
