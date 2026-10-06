package store

import (
	"context"
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"sync"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"oras.land/oras-go/v2/content"
	"oras.land/oras-go/v2/errdef"
	"oras.land/oras-go/v2/registry/remote"
	"oras.land/oras-go/v2/registry/remote/errcode"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/oras/client"
	"protoxon.com/sls/daemon/oras/volume"
	"protoxon.com/sls/daemon/system"
)

const (
	casDir          = "cas"
	digestDir       = "digests"
	legacyDigestDir = "by-digest"
	tmpSuffix       = ".tmp"
	pinLockPrefix   = "pin:"
	// ProbeTimeout is the create-time budget for resolving artifact tags.
	ProbeTimeout = 5 * time.Second
)

// ErrNotFound is returned when a volume reference does not exist in the registry.
var ErrNotFound = system.ExpectedError(errors.NewPlain("volume reference not found"))

// ErrResolve is returned when the registry cannot be reached or the reference
// cannot be resolved (connection refused, timeout, and similar).
var ErrResolve = system.ExpectedError(errors.NewPlain("failed to resolve volume reference"))

// ErrUnauthorized is returned when the registry rejects pull credentials.
var ErrUnauthorized = system.ExpectedError(errors.NewPlain("registry authentication failed"))

// IsRegistryUnavailable reports a tag resolve failure (missing or unreachable).
func IsRegistryUnavailable(err error) bool {
	return errors.Is(err, ErrNotFound) || errors.Is(err, ErrResolve)
}

// Result is the outcome of Ensure.
type Result struct {
	Path         string
	Descriptor   ocispec.Descriptor
	FetchedBytes int64
	Cached       bool
}

// Store is the daemon volume cache: CAS objects and digest trees.
type Store struct {
	Root string

	mu    sync.Mutex
	locks map[string]*sync.Mutex
}

func New(root string) *Store {
	return &Store{Root: root, locks: map[string]*sync.Mutex{}}
}

func (s *Store) CASRoot() string {
	return filepath.Join(s.Root, casDir)
}

func (s *Store) DigestPath(d digest.Digest) string {
	modern := filepath.Join(s.Root, digestDir, DirName(d))
	if ok, _ := dirExists(modern); ok {
		return modern
	}
	legacy := filepath.Join(s.Root, legacyDigestDir, DirName(d))
	if ok, _ := dirExists(legacy); ok {
		return legacy
	}
	return modern
}

func (s *Store) RelDigestPath(d digest.Digest) string {
	dest := s.DigestPath(d)
	rel, err := filepath.Rel(s.Root, dest)
	if err != nil {
		return filepath.Join(digestDir, DirName(d))
	}
	return rel
}

func DirName(d digest.Digest) string {
	return strings.ReplaceAll(d.String(), ":", "-")
}

// IsCacheRel reports whether source is under the store cas or digest trees.
func IsCacheRel(source string) bool {
	rel := strings.Trim(filepath.ToSlash(filepath.Clean(source)), "/")
	for _, dir := range []string{casDir, digestDir, legacyDigestDir} {
		if rel == dir || strings.HasPrefix(rel, dir+"/") {
			return true
		}
	}
	return false
}

// DigestFromSource parses a relative digests/ or by-digest/ path.
func DigestFromSource(source string) (digest.Digest, bool) {
	rel := strings.Trim(filepath.ToSlash(filepath.Clean(source)), "/")
	var rest string
	switch {
	case strings.HasPrefix(rel, digestDir+"/"):
		rest = rel[len(digestDir)+1:]
	case strings.HasPrefix(rel, legacyDigestDir+"/"):
		rest = rel[len(legacyDigestDir)+1:]
	default:
		return "", false
	}
	if rest == "" || strings.Contains(rest, "/") {
		return "", false
	}
	d, err := ParseDirName(rest)
	if err != nil {
		return "", false
	}
	return d, true
}

func ParseDirName(name string) (digest.Digest, error) {
	i := strings.IndexByte(name, '-')
	if i <= 0 || i == len(name)-1 {
		return "", errors.New("invalid digest directory name")
	}
	d := digest.Digest(name[:i] + ":" + name[i+1:])
	if err := d.Validate(); err != nil {
		return "", err
	}
	return d, nil
}

func (s *Store) mutexFor(key string) *sync.Mutex {
	s.mu.Lock()
	lk, ok := s.locks[key]
	if !ok {
		lk = &sync.Mutex{}
		s.locks[key] = lk
	}
	s.mu.Unlock()
	return lk
}

func (s *Store) lock(key string) func() {
	lk := s.mutexFor(key)
	lk.Lock()
	return lk.Unlock
}

func (s *Store) tryLock(key string) (func(), bool) {
	lk := s.mutexFor(key)
	if !lk.TryLock() {
		return nil, false
	}
	return lk.Unlock, true
}

// Ensure resolves reference and unpacks into digests/ if needed.
func (s *Store) Ensure(ctx context.Context, reference string, copyFiles bool, logger *log.Entry) (Result, error) {
	repository, desc, err := resolveForPull(ctx, reference)
	if err != nil {
		return Result{}, err
	}
	path, fetched, cached, err := s.materialize(ctx, repository, desc, reference, copyFiles, logger)
	if err != nil {
		return Result{}, err
	}
	if err := s.RememberOrigin(desc.Digest, reference); err != nil {
		return Result{}, err
	}
	return Result{Path: path, Descriptor: desc, FetchedBytes: fetched, Cached: cached}, nil
}

// Probe reports whether reference is already on disk or resolvable in the
// registry. It does not pull blobs.
func (s *Store) Probe(ctx context.Context, reference string) error {
	if _, ok, err := s.LatestLocal(reference); err != nil {
		return err
	} else if ok {
		return nil
	}
	if ctx == nil {
		ctx = context.Background()
	}
	if _, ok := ctx.Deadline(); !ok {
		var cancel context.CancelFunc
		ctx, cancel = context.WithTimeout(ctx, ProbeTimeout)
		defer cancel()
	}
	_, _, err := resolveWithAuthRetry(ctx, reference, client.NewProbeRepository)
	return err
}

func resolveForPull(ctx context.Context, reference string) (*remote.Repository, ocispec.Descriptor, error) {
	return resolveWithAuthRetry(ctx, reference, client.NewRepository)
}

func resolveWithAuthRetry(ctx context.Context, reference string, open func(string) (*remote.Repository, error)) (*remote.Repository, ocispec.Descriptor, error) {
	repository, err := open(reference)
	if err != nil {
		return nil, ocispec.Descriptor{}, err
	}
	desc, err := repository.Resolve(ctx, repository.Reference.Reference)
	if err == nil {
		return repository, desc, nil
	}
	if !isUnauthorized(err) {
		return nil, ocispec.Descriptor{}, wrapResolveErr(err)
	}
	if rerr := client.RefreshCredentials(ctx); rerr != nil {
		return nil, ocispec.Descriptor{}, wrapResolveErr(err)
	}
	repository, err = open(reference)
	if err != nil {
		return nil, ocispec.Descriptor{}, err
	}
	desc, err = repository.Resolve(ctx, repository.Reference.Reference)
	if err != nil {
		return nil, ocispec.Descriptor{}, wrapResolveErr(err)
	}
	return repository, desc, nil
}

func isUnauthorized(err error) bool {
	var resp *errcode.ErrorResponse
	if errors.As(err, &resp) && resp.StatusCode == http.StatusUnauthorized {
		return true
	}
	return false
}

// EnsurePinned returns the digest tree without resolving a tag. If the tree is
// missing or its sidecar does not match, it pulls artifact@digest.
func (s *Store) EnsurePinned(ctx context.Context, artifact string, d digest.Digest, copyFiles bool, logger *log.Entry) (Result, error) {
	if d == "" {
		return Result{}, errors.New("missing pin digest")
	}
	if ok, err := s.Has(d); err != nil {
		return Result{}, err
	} else if ok {
		dest := s.DigestPath(d)
		match, err := destMatchesDigest(dest, d)
		if err != nil {
			return Result{}, err
		}
		if match {
			return Result{Path: dest, Descriptor: ocispec.Descriptor{Digest: d}, Cached: true}, nil
		}
	}
	ref, err := digestReference(artifact, d)
	if err != nil {
		return Result{}, err
	}
	return s.Ensure(ctx, ref, copyFiles, logger)
}

func (s *Store) Has(d digest.Digest) (bool, error) {
	if d == "" {
		return false, nil
	}
	return dirExists(s.DigestPath(d))
}

func digestReference(artifact string, d digest.Digest) (string, error) {
	ref, err := client.ParseReference(artifact)
	if err != nil {
		return "", errors.Wrap(err, "failed to parse volume artifact")
	}
	return ref.Context().Name() + "@" + d.String(), nil
}

// Materialize unpacks desc into the digest directory if it is not already present.
func (s *Store) Materialize(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor, copyFiles bool) (string, int64, bool, error) {
	return s.materialize(ctx, src, desc, "", copyFiles, nil)
}

func (s *Store) materialize(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor, reference string, copyFiles bool, logger *log.Entry) (string, int64, bool, error) {
	if desc.Digest == "" {
		return "", 0, false, errors.New("missing volume digest")
	}
	unlock := s.lock(desc.Digest.String())
	defer unlock()

	dest := s.DigestPath(desc.Digest)
	if exists, err := dirExists(dest); err != nil {
		return "", 0, false, err
	} else if exists {
		match, err := destMatchesDigest(dest, desc.Digest)
		if err != nil {
			return "", 0, false, err
		}
		if match {
			return dest, 0, true, nil
		}
		if err := os.RemoveAll(dest); err != nil {
			return "", 0, false, errors.Wrap(err, "failed to replace mismatched volume digest directory")
		}
	}

	l := logger
	if l == nil {
		l = log.WithField("digest", desc.Digest)
	} else {
		l = l.WithField("digest", desc.Digest)
	}
	if reference != "" {
		l = l.WithField("reference", reference)
	}
	l.Info("pulling volume")

	parent := filepath.Dir(dest)
	if err := os.MkdirAll(parent, 0o755); err != nil {
		return "", 0, false, err
	}
	tmp, err := os.MkdirTemp(parent, DirName(desc.Digest)+tmpSuffix+".")
	if err != nil {
		return "", 0, false, errors.Wrap(err, "failed to create volume tmp directory")
	}
	stats := &volume.UnpackStats{}
	opts := volume.UnpackOptions{
		CASRoot:       s.CASRoot(),
		CopyFiles:     copyFiles,
		DeleteMissing: true,
		Stats:         stats,
	}
	opts.Owner = unpackOwner()
	if err := volume.UnpackWith(ctx, src, desc, tmp, opts); err != nil {
		os.RemoveAll(tmp)
		return "", 0, false, errors.Wrap(err, "failed to unpack volume")
	}
	if err := os.Rename(tmp, dest); err != nil {
		os.RemoveAll(tmp)
		if exists, _ := dirExists(dest); exists {
			match, _ := destMatchesDigest(dest, desc.Digest)
			if match {
				return dest, 0, true, nil
			}
		}
		return "", 0, false, errors.Wrap(err, "failed to publish volume digest directory")
	}
	l.WithField("size", system.FormatBytes(stats.FetchedBytes)).Info("pulled volume")
	return dest, stats.FetchedBytes, false, nil
}

func destMatchesDigest(dest string, d digest.Digest) (bool, error) {
	if d == "" {
		return false, nil
	}
	mount, err := volume.ReadMount(dest)
	if err != nil {
		return false, err
	}
	return mount.Artifact == d, nil
}

func isTmpName(name string) bool {
	return strings.Contains(name, tmpSuffix)
}

func digestFromTmpName(name string) (digest.Digest, error) {
	i := strings.Index(name, tmpSuffix)
	if i <= 0 {
		return "", errors.New("not a volume tmp directory")
	}
	return ParseDirName(name[:i])
}

func wrapResolveErr(err error) error {
	if err == nil {
		return nil
	}
	if isUnauthorized(err) {
		return errors.Wrap(ErrUnauthorized, err.Error())
	}
	if errors.Is(err, errdef.ErrNotFound) {
		return errors.Wrap(ErrNotFound, err.Error())
	}
	return fmt.Errorf("%w: %w", ErrResolve, err)
}

func unpackOwner() *volume.Owner {
	cfg := config.Get()
	if cfg == nil {
		return nil
	}
	return &volume.Owner{Uid: cfg.System.User.Uid, Gid: cfg.System.User.Gid}
}

func dirExists(path string) (bool, error) {
	info, err := os.Lstat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return false, nil
		}
		return false, err
	}
	return info.IsDir(), nil
}
