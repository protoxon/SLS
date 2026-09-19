package store

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strings"
	"time"

	"emperror.dev/errors"
	"github.com/google/go-containerregistry/pkg/name"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/oras/client"
)

const originFile = "origin.json"

// Origin is the registry name a digest was pulled as (repo + tag).
type Origin struct {
	Registry   string    `json:"registry"`
	Repository string    `json:"repository"`
	Reference  string    `json:"reference"`
	DigestPin  bool      `json:"digest_pin,omitempty"`
	PulledAt   time.Time `json:"pulled_at"`
}

func (o Origin) Key() string {
	if o.Registry == "" || o.Repository == "" || o.Reference == "" || o.DigestPin {
		return ""
	}
	return strings.ToLower(o.Registry + "/" + o.Repository + ":" + o.Reference)
}

func originFromReference(reference string) (Origin, error) {
	ref, err := client.ParseReference(reference)
	if err != nil {
		return Origin{}, errors.Wrap(err, "failed to parse volume origin")
	}
	o := Origin{
		Registry:   ref.Context().RegistryStr(),
		Repository: ref.Context().RepositoryStr(),
		Reference:  ref.Identifier(),
	}
	if _, ok := ref.(name.Digest); ok {
		o.DigestPin = true
	}
	return o, nil
}

func (s *Store) originPath(d digest.Digest) string {
	return filepath.Join(s.DigestPath(d), slsDir, originFile)
}

func (s *Store) writeOrigin(d digest.Digest, o Origin) error {
	if o.Key() == "" {
		return nil
	}
	if o.PulledAt.IsZero() {
		o.PulledAt = time.Now()
	}
	dir := filepath.Join(s.DigestPath(d), slsDir)
	if err := os.MkdirAll(dir, 0o755); err != nil {
		return err
	}
	b, err := json.MarshalIndent(o, "", "  ")
	if err != nil {
		return err
	}
	tmp := s.originPath(d) + ".tmp"
	if err := os.WriteFile(tmp, append(b, '\n'), 0o644); err != nil {
		return errors.Wrap(err, "failed to write volume origin")
	}
	if err := os.Rename(tmp, s.originPath(d)); err != nil {
		return errors.Wrap(err, "failed to replace volume origin")
	}
	return nil
}

func (s *Store) loadOrigin(d digest.Digest) (Origin, time.Time, error) {
	path := s.originPath(d)
	info, err := os.Stat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return Origin{}, time.Time{}, nil
		}
		return Origin{}, time.Time{}, err
	}
	b, err := os.ReadFile(path)
	if err != nil {
		return Origin{}, time.Time{}, errors.Wrap(err, "failed to read volume origin")
	}
	var o Origin
	if err := json.Unmarshal(b, &o); err != nil {
		return Origin{}, time.Time{}, errors.Wrap(err, "failed to parse volume origin")
	}
	mtime := o.PulledAt
	if mtime.IsZero() {
		mtime = info.ModTime()
	}
	return o, mtime, nil
}

func (s *Store) RememberOrigin(d digest.Digest, reference string) error {
	if reference == "" {
		return nil
	}
	o, err := originFromReference(reference)
	if err != nil {
		return err
	}
	return s.writeOrigin(d, o)
}

func originLookupKey(o Origin) string {
	if o.Registry == "" || o.Repository == "" || o.Reference == "" || o.DigestPin {
		return ""
	}
	repo := o.Repository
	if !strings.Contains(repo, "/") {
		repo = client.DefaultNamespace + "/" + repo
	}
	return strings.ToLower(o.Registry + "/" + repo + ":" + o.Reference)
}

// LatestLocal returns the newest digest tree previously pulled as reference.
func (s *Store) LatestLocal(reference string) (Result, bool, error) {
	o, err := originFromReference(reference)
	if err != nil {
		return Result{}, false, err
	}
	if o.DigestPin {
		d := digest.Digest(o.Reference)
		if err := d.Validate(); err != nil {
			return Result{}, false, err
		}
		return s.localResult(d)
	}
	key := originLookupKey(o)
	if key == "" {
		return Result{}, false, nil
	}
	trees, err := s.listDigestTrees()
	if err != nil {
		return Result{}, false, err
	}
	var matches []digestTree
	for _, tree := range trees {
		if originLookupKey(tree.origin) == key {
			matches = append(matches, tree)
		}
	}
	if len(matches) == 0 {
		return Result{}, false, nil
	}
	return s.localResult(newestTree(matches).digest)
}

func (s *Store) localResult(d digest.Digest) (Result, bool, error) {
	ok, err := s.Has(d)
	if err != nil || !ok {
		return Result{}, false, err
	}
	dest := s.DigestPath(d)
	match, err := destMatchesDigest(dest, d)
	if err != nil {
		return Result{}, false, err
	}
	if !match {
		return Result{}, false, nil
	}
	return Result{Path: dest, Descriptor: ocispec.Descriptor{Digest: d}, Cached: true}, true, nil
}
