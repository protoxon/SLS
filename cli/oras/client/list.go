package client

import (
	"context"
	"encoding/json"
	"net/http"
	"sort"
	"strings"
	"sync"

	"emperror.dev/errors"
	"github.com/google/go-containerregistry/pkg/name"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"golang.org/x/sync/errgroup"
	"oras.land/oras-go/v2/content"
	"oras.land/oras-go/v2/registry/remote"
	"oras.land/oras-go/v2/registry/remote/errcode"
	"protoxon.com/sls/daemon/oras/volume"
)

const listConcurrency = 16

// ListResult is the volume tags in a repository or namespace.
type ListResult struct {
	Repository string      `json:"repository,omitempty"`
	Namespace  string      `json:"namespace,omitempty"`
	Volumes    []VolumeRef `json:"volumes"`
}

// VolumeRef is one tagged volume artifact.
type VolumeRef struct {
	Repository string        `json:"repository"`
	Tag        string        `json:"tag"`
	Digest     digest.Digest `json:"digest"`
	Reference  string        `json:"reference"`
}

// List returns volume tags for a repository, or every volume under a
// namespace when NAME is a single path segment that is not a repository.
func List(ctx context.Context, reference string, opts Options) (ListResult, error) {
	if host, ok := registryHost(reference); ok {
		return listRegistry(ctx, host, opts)
	}
	ref, err := ParseReference(reference)
	if err != nil {
		return ListResult{}, errors.Wrap(err, "failed to parse reference")
	}
	result, err := listRepository(ctx, reference, opts)
	if err == nil || !isNamespaceCandidate(ref) || !isMissingRepository(err) {
		return result, err
	}
	return listNamespace(ctx, ref.Context().RegistryStr(), ref.Context().RepositoryStr(), opts)
}

func listRepository(ctx context.Context, reference string, opts Options) (ListResult, error) {
	ref, err := ParseReference(reference)
	if err != nil {
		return ListResult{}, errors.Wrap(err, "failed to parse reference")
	}
	repoName := repositoryName(ref)

	repository, err := NewRepository(reference, opts)
	if err != nil {
		return ListResult{}, err
	}
	return listRepositoryTags(ctx, repository, repoName)
}

func listRepositoryTags(ctx context.Context, repository *remote.Repository, repoName string) (ListResult, error) {
	var tags []string
	if err := repository.Tags(ctx, "", func(page []string) error {
		tags = append(tags, page...)
		return nil
	}); err != nil {
		return ListResult{}, errors.Wrap(err, "failed to list tags")
	}
	sort.Strings(tags)
	if len(tags) == 0 {
		return ListResult{Repository: repoName, Volumes: []VolumeRef{}}, nil
	}

	probe := probeTag(tags)
	vol, ok := volumeFromTag(ctx, repository, repoName, probe)
	if !ok {
		return ListResult{Repository: repoName, Volumes: []VolumeRef{}}, nil
	}
	volumes := []VolumeRef{vol}
	for _, tag := range tags {
		if tag == probe {
			continue
		}
		if vol, ok := volumeFromTag(ctx, repository, repoName, tag); ok {
			volumes = append(volumes, vol)
		}
	}
	sort.Slice(volumes, func(i, j int) bool {
		return volumes[i].Reference < volumes[j].Reference
	})
	return ListResult{Repository: repoName, Volumes: volumes}, nil
}

func probeTag(tags []string) string {
	for _, tag := range tags {
		if tag == "latest" {
			return tag
		}
	}
	return tags[0]
}

func listNamespace(ctx context.Context, registry, namespace string, opts Options) (ListResult, error) {
	repos, err := listCatalogPrefix(ctx, registry, namespace, opts)
	if err != nil {
		return ListResult{}, errors.Wrapf(err, "failed to list repositories under %s/%s; pass a repository like %s/%s/<name>", registry, namespace, registry, namespace)
	}
	reg, err := NewRegistry(registry, opts)
	if err != nil {
		return ListResult{}, err
	}
	return listRepoVolumes(ctx, reg, registry, repos, registry+"/"+namespace)
}

func listCatalogPrefix(ctx context.Context, registry, namespace string, opts Options) ([]string, error) {
	reg, err := NewRegistry(registry, opts)
	if err != nil {
		return nil, err
	}
	prefix := ""
	if namespace != "" {
		prefix = namespace + "/"
	}
	var repos []string
	if err := reg.Repositories(ctx, "", func(page []string) error {
		for _, repo := range page {
			if prefix == "" || strings.HasPrefix(repo, prefix) {
				repos = append(repos, repo)
			}
		}
		return nil
	}); err != nil {
		return nil, err
	}
	return repos, nil
}

func listRegistry(ctx context.Context, registry string, opts Options) (ListResult, error) {
	repos, err := listCatalogPrefix(ctx, registry, "", opts)
	if err != nil {
		return ListResult{}, errors.Wrapf(err, "failed to list repositories in %s; pass a repository like %s/<name>", registry, registry)
	}
	reg, err := NewRegistry(registry, opts)
	if err != nil {
		return ListResult{}, err
	}
	return listRepoVolumes(ctx, reg, registry, repos, registry)
}

func listRepoVolumes(ctx context.Context, reg *remote.Registry, registry string, repos []string, namespace string) (ListResult, error) {
	sort.Strings(repos)
	g, gctx := errgroup.WithContext(ctx)
	g.SetLimit(listConcurrency)
	var mu sync.Mutex
	volumes := make([]VolumeRef, 0)
	for _, repo := range repos {
		g.Go(func() error {
			r, err := reg.Repository(gctx, repo)
			if err != nil {
				return nil
			}
			remoteRepo, ok := r.(*remote.Repository)
			if !ok {
				return nil
			}
			part, err := listRepositoryTags(gctx, remoteRepo, registry+"/"+repo)
			if err != nil {
				return nil
			}
			mu.Lock()
			volumes = append(volumes, part.Volumes...)
			mu.Unlock()
			return nil
		})
	}
	if err := g.Wait(); err != nil {
		return ListResult{}, err
	}
	sort.Slice(volumes, func(i, j int) bool {
		return volumes[i].Reference < volumes[j].Reference
	})
	return ListResult{
		Namespace: namespace,
		Volumes:   volumes,
	}, nil
}

func volumeFromTag(ctx context.Context, repository *remote.Repository, repoName, tag string) (VolumeRef, bool) {
	desc, rc, err := repository.FetchReference(ctx, tag)
	if err != nil {
		return VolumeRef{}, false
	}
	raw, err := content.ReadAll(rc, desc)
	rc.Close()
	if err != nil {
		return VolumeRef{}, false
	}
	var man ocispec.Manifest
	if err := json.Unmarshal(raw, &man); err != nil {
		return VolumeRef{}, false
	}
	if !isVolumeManifest(man) {
		return VolumeRef{}, false
	}
	return VolumeRef{
		Repository: repoName,
		Tag:        tag,
		Digest:     desc.Digest,
		Reference:  repoName + ":" + tag,
	}, true
}

func isVolumeManifest(man ocispec.Manifest) bool {
	return man.ArtifactType == volume.ArtifactType || man.Config.MediaType == volume.ConfigMediaType
}

func isNamespaceCandidate(ref name.Reference) bool {
	return !strings.Contains(ref.Context().RepositoryStr(), "/")
}

func isMissingRepository(err error) bool {
	var resp *errcode.ErrorResponse
	if !errors.As(err, &resp) {
		return false
	}
	if resp.StatusCode == http.StatusNotFound {
		return true
	}
	for _, e := range resp.Errors {
		switch e.Code {
		case errcode.ErrorCodeNameUnknown, errcode.ErrorCodeNameInvalid:
			return true
		}
	}
	return false
}
