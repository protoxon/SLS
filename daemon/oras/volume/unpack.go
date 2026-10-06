package volume

import (
	"context"
	"crypto/sha256"
	"encoding/json"
	"io"
	"io/fs"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"time"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"oras.land/oras-go/v2/content"
)

// inMemoryExtractMax is the largest file assembled as a single []byte.
// Larger files are written part-by-part to a temp file.
const defaultInMemoryExtractMax int64 = 1 << 30

var inMemoryExtractMax = defaultInMemoryExtractMax

func useInMemoryExtract(file File) bool {
	return file.Size <= inMemoryExtractMax
}

// UnpackOptions controls how dest is compared to the remote artifact.
type UnpackOptions struct {
	// HashDest hashes files on disk instead of trusting dest/.sls/state.json.
	// Use this when dest may have been edited (CLI).
	HashDest bool
	// TrustMtime skips the dest hash when size and mtime still match the
	// artifact. An edit that preserves both can be missed. Requires HashDest.
	TrustMtime bool
	// SkipSidecar does not read or write dest/.sls.
	SkipSidecar bool
	// DeleteMissing removes dest files recorded in the last sidecar that are
	// gone from the remote. Ignored when SkipSidecar is set.
	DeleteMissing bool
	// DeleteExtra removes dest files that are not in the remote artifact.
	DeleteExtra bool
	// CASRoot, when set, stores file bytes under a content-addressed tree and
	// hardlinks them into dest. CLI pull leaves this empty.
	CASRoot string
	// CopyFiles writes dest files as copies of the CAS object (RW volumes).
	CopyFiles bool
	// Owner, when set, chowns dest directories, dest files, and CAS objects
	// (hardlinks share that inode) to this uid/gid.
	Owner    *Owner
	Progress ProgressFunc
	// Stats, when set, records how many bytes were fetched from src.
	Stats *UnpackStats
}

// UnpackStats is filled by UnpackWith when Stats is set on UnpackOptions.
type UnpackStats struct {
	FetchedBytes int64
}

func (s *UnpackStats) add(n int64) {
	if s == nil || n <= 0 {
		return
	}
	s.FetchedBytes += n
}

// Unpack merges a volume artifact into dest using sidecar skip (daemon cache).
func Unpack(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor, dest string) error {
	return UnpackWith(ctx, src, desc, dest, UnpackOptions{DeleteMissing: true})
}

// UnpackWith merges a volume artifact into dest using opts.
func UnpackWith(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor, dest string, opts UnpackOptions) error {
	cfg, err := fetchConfig(ctx, src, desc, opts.Stats)
	if err != nil {
		return err
	}
	opts.Progress.Emit(ProgressEvent{
		Kind:  ProgressConfig,
		Count: len(cfg.Files),
		Total: len(cfg.Layers),
	})
	if cfg.MountInfo.Target != "" || cfg.MountInfo.Mode != "" {
		opts.Progress.Emit(ProgressEvent{
			Kind:   ProgressMount,
			Name:   cfg.MountInfo.Target,
			Detail: cfg.MountInfo.Mode,
		})
	}
	if err := mkdirAllOwned(dest, opts.Owner); err != nil {
		return errors.Wrap(err, "failed to create destination")
	}
	if err := chownPath(dest, opts.Owner); err != nil {
		return errors.Wrap(err, "failed to chown destination")
	}

	var state sidecarState
	if !opts.SkipSidecar {
		state, err = loadSidecar(dest)
		if err != nil {
			return err
		}
	}

	tmpRoot := slsPath(dest, tmpDir)
	if opts.SkipSidecar {
		tmpRoot, err = os.MkdirTemp("", "sls-pull-")
		if err != nil {
			return errors.Wrap(err, "failed to create extract temp directory")
		}
		defer os.RemoveAll(tmpRoot)
	} else if err := os.RemoveAll(tmpRoot); err != nil {
		return errors.Wrap(err, "failed to clear extract temp directory")
	}

	remote := cfg.fileMap()
	puller := newLayerPuller(src, opts.Progress, opts.Stats)
	opts.Progress.Emit(ProgressEvent{Kind: ProgressMerge, Name: dest, Count: len(cfg.Files)})

	type plannedFile struct {
		file   File
		action string
	}
	plan := make([]plannedFile, 0, len(cfg.Files))
	var extract []File
	for _, file := range cfg.Files {
		if err := validateRelPath(file.Path); err != nil {
			return err
		}
		action, err := destFileAction(dest, file, state, opts)
		if err != nil {
			return err
		}
		plan = append(plan, plannedFile{file: file, action: action})
		if action == actionExtract {
			extract = append(extract, file)
		}
	}
	puller.plan(extract)
	for _, item := range plan {
		switch item.action {
		case actionExtract:
			if err := extractFile(ctx, puller, &cfg, dest, tmpRoot, item.file, opts); err != nil {
				return errors.Wrapf(err, "failed to extract %s", item.file.Path)
			}
		case actionLink:
			cas, err := CASPath(opts.CASRoot, item.file.Digest)
			if err != nil {
				return err
			}
			if err := installFromCAS(cas, dest, item.file, opts.CopyFiles, opts.Owner); err != nil {
				return errors.Wrapf(err, "failed to link %s", item.file.Path)
			}
		}
		opts.Progress.Emit(ProgressEvent{
			Kind:   ProgressMerge,
			Path:   item.file.Path,
			Group:  groupKey(item.file.Path),
			Detail: item.action,
			Size:   item.file.Size,
			Cached: item.action != actionExtract,
		})
	}

	if opts.DeleteExtra {
		if err := removeExtraDestFiles(dest, remote, opts.Progress); err != nil {
			return err
		}
	} else if !opts.SkipSidecar && opts.DeleteMissing {
		for path := range state.Files {
			if _, ok := remote[path]; ok {
				continue
			}
			if err := os.RemoveAll(filepath.Join(dest, filepath.FromSlash(path))); err != nil {
				return errors.Wrapf(err, "failed to remove %s", path)
			}
		}
	}

	if opts.SkipSidecar {
		return nil
	}
	next := sidecarState{
		Artifact: desc.Digest,
		Files:    make(map[string]digest.Digest, len(cfg.Files)),
	}
	for _, file := range cfg.Files {
		next.Files[file.Path] = file.Digest
	}
	if err := writeSidecar(dest, next, opts.Owner); err != nil {
		return err
	}
	return writeMount(dest, SidecarMount{Artifact: desc.Digest, MountInfo: cfg.MountInfo}, opts.Owner)
}

const (
	actionExtract = "extract"
	actionMtime   = "mtime"
	actionHash    = "hash"
	actionSidecar = "sidecar"
	actionLink    = "link"
	actionDelete  = "delete"
)

func removeExtraDestFiles(dest string, remote map[string]File, progress ProgressFunc) error {
	files, err := listFiles(dest)
	if err != nil {
		return err
	}
	for _, file := range files {
		if _, ok := remote[file.Rel]; ok {
			continue
		}
		if err := os.Remove(file.Abs); err != nil && !os.IsNotExist(err) {
			return errors.Wrapf(err, "failed to remove %s", file.Rel)
		}
		progress.Emit(ProgressEvent{
			Kind:   ProgressMerge,
			Path:   file.Rel,
			Group:  groupKey(file.Rel),
			Detail: actionDelete,
			Size:   file.Size,
		})
	}
	return pruneEmptyDirs(dest)
}

func pruneEmptyDirs(root string) error {
	var dirs []string
	err := filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		rel, err := filepath.Rel(root, path)
		if err != nil {
			return err
		}
		rel = filepath.ToSlash(rel)
		if rel == slsDir || strings.HasPrefix(rel, slsDir+"/") {
			if d.IsDir() {
				return fs.SkipDir
			}
			return nil
		}
		if d.IsDir() && rel != "." {
			dirs = append(dirs, path)
		}
		return nil
	})
	if err != nil {
		return err
	}
	sort.Slice(dirs, func(i, j int) bool { return len(dirs[i]) > len(dirs[j]) })
	for _, dir := range dirs {
		entries, err := os.ReadDir(dir)
		if err != nil {
			if os.IsNotExist(err) {
				continue
			}
			return err
		}
		if len(entries) == 0 {
			if err := os.Remove(dir); err != nil && !os.IsNotExist(err) {
				return err
			}
		}
	}
	return nil
}

func destFileAction(dest string, file File, state sidecarState, opts UnpackOptions) (string, error) {
	if opts.HashDest {
		if opts.TrustMtime {
			same, err := destMatchesMtime(dest, file)
			if err != nil {
				return "", err
			}
			if same {
				return actionMtime, nil
			}
		}
		got, ok, err := digestDestFile(dest, file.Path)
		if err != nil {
			return "", err
		}
		if ok && got == file.Digest {
			return actionHash, nil
		}
		return actionExtract, nil
	}
	if state.Files[file.Path] == file.Digest {
		return actionSidecar, nil
	}
	if opts.CASRoot != "" && file.Digest != "" && hasCAS(opts.CASRoot, file.Digest) {
		return actionLink, nil
	}
	return actionExtract, nil
}

func destMatchesMtime(dest string, file File) (bool, error) {
	if file.Mtime == 0 {
		return false, nil
	}
	p := filepath.Join(dest, filepath.FromSlash(file.Path))
	info, err := os.Lstat(p)
	if err != nil {
		if os.IsNotExist(err) {
			return false, nil
		}
		return false, err
	}
	if !info.Mode().IsRegular() {
		return false, nil
	}
	return info.Size() == file.Size && info.ModTime().Unix() == file.Mtime, nil
}

func digestDestFile(dest, rel string) (digest.Digest, bool, error) {
	p := filepath.Join(dest, filepath.FromSlash(rel))
	info, err := os.Lstat(p)
	if err != nil {
		if os.IsNotExist(err) {
			return "", false, nil
		}
		return "", false, err
	}
	if !info.Mode().IsRegular() {
		return "", false, nil
	}
	d, err := digestFile(p)
	if err != nil {
		return "", false, err
	}
	return d, true, nil
}

// FetchConfig loads the volume config blob for an OCI manifest descriptor.
func FetchConfig(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor) (Manifest, error) {
	_, cfg, err := fetchArtifact(ctx, src, desc, nil)
	return cfg, err
}

// FetchArtifact loads the OCI manifest and volume config for desc.
func FetchArtifact(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor) (ocispec.Manifest, Manifest, error) {
	return fetchArtifact(ctx, src, desc, nil)
}

func fetchConfig(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor, stats *UnpackStats) (Manifest, error) {
	_, cfg, err := fetchArtifact(ctx, src, desc, stats)
	return cfg, err
}

func fetchArtifact(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor, stats *UnpackStats) (ocispec.Manifest, Manifest, error) {
	raw, err := content.FetchAll(ctx, src, desc)
	if err != nil {
		return ocispec.Manifest{}, Manifest{}, errors.Wrap(err, "failed to fetch volume manifest")
	}
	stats.add(int64(len(raw)))
	var man ocispec.Manifest
	if err := json.Unmarshal(raw, &man); err != nil {
		return ocispec.Manifest{}, Manifest{}, errors.Wrap(err, "failed to parse volume manifest")
	}
	if man.ArtifactType != "" && man.ArtifactType != ArtifactType {
		return ocispec.Manifest{}, Manifest{}, errors.Errorf("unexpected artifact type %q", man.ArtifactType)
	}
	configBytes, err := content.FetchAll(ctx, src, man.Config)
	if err != nil {
		return ocispec.Manifest{}, Manifest{}, errors.Wrap(err, "failed to fetch volume config")
	}
	stats.add(int64(len(configBytes)))
	var cfg Manifest
	if err := json.Unmarshal(configBytes, &cfg); err != nil {
		return ocispec.Manifest{}, Manifest{}, errors.Wrap(err, "failed to parse volume config")
	}
	if cfg.MediaType != "" && cfg.MediaType != ConfigMediaType {
		return ocispec.Manifest{}, Manifest{}, errors.Errorf("unexpected config media type %q", cfg.MediaType)
	}
	return man, cfg, nil
}

func decodePart(ctx context.Context, puller *layerPuller, cfg *Manifest, filePath string, part Part) ([]byte, error) {
	layer, ok := cfg.layerInfo(part.Layer)
	if !ok {
		return nil, errors.Errorf("unknown layer %s", part.Layer)
	}
	compressed, err := puller.part(ctx, layer.Descriptor(), part.Offset, part.Size)
	if err != nil {
		return nil, err
	}
	codec, err := cfg.codecForLayer(layer)
	if err != nil {
		return nil, err
	}
	dec, err := codec.NewDecoder()
	if err != nil {
		return nil, err
	}
	raw, err := dec.Decode(compressed)
	dec.Close()
	if err != nil {
		return nil, errors.Wrap(err, "failed to decompress part")
	}
	if part.Digest != "" && digest.FromBytes(raw) != part.Digest {
		return nil, errors.Errorf("part digest mismatch for %s", filePath)
	}
	puller.donePart(part.Layer)
	return raw, nil
}

func writeDecodedParts(ctx context.Context, puller *layerPuller, cfg *Manifest, file File, w io.Writer) (digest.Digest, error) {
	h := sha256.New()
	mw := io.MultiWriter(w, h)
	for _, part := range file.Parts {
		raw, err := decodePart(ctx, puller, cfg, file.Path, part)
		if err != nil {
			return "", err
		}
		if _, err := mw.Write(raw); err != nil {
			return "", errors.Wrap(err, "failed to write extracted part")
		}
	}
	return digest.NewDigest(digest.SHA256, h), nil
}

func assembleFile(ctx context.Context, puller *layerPuller, cfg *Manifest, file File) ([]byte, error) {
	var plain []byte
	for _, part := range file.Parts {
		raw, err := decodePart(ctx, puller, cfg, file.Path, part)
		if err != nil {
			return nil, err
		}
		plain = append(plain, raw...)
	}
	if file.Digest != "" && digest.FromBytes(plain) != file.Digest {
		return nil, errors.Errorf("file digest mismatch for %s", file.Path)
	}
	return plain, nil
}

func extractFile(ctx context.Context, puller *layerPuller, cfg *Manifest, dest, tmpRoot string, file File, opts UnpackOptions) error {
	if useInMemoryExtract(file) {
		plain, err := assembleFile(ctx, puller, cfg, file)
		if err != nil {
			return err
		}
		return installExtractedBytes(dest, tmpRoot, file, opts, plain)
	}
	return streamExtractFile(ctx, puller, cfg, dest, tmpRoot, file, opts)
}

func installExtractedBytes(dest, tmpRoot string, file File, opts UnpackOptions, plain []byte) error {
	if opts.CASRoot != "" && file.Digest != "" {
		cas, err := storeCAS(opts.CASRoot, file.Digest, plain, opts.Owner)
		if err != nil {
			return err
		}
		return installFromCAS(cas, dest, file, opts.CopyFiles, opts.Owner)
	}
	return writeDestFile(dest, tmpRoot, file, opts, plain)
}

func streamExtractFile(ctx context.Context, puller *layerPuller, cfg *Manifest, dest, tmpRoot string, file File, opts UnpackOptions) error {
	if opts.CASRoot != "" && file.Digest != "" {
		return streamExtractCAS(ctx, puller, cfg, dest, file, opts)
	}
	return streamExtractDest(ctx, puller, cfg, dest, tmpRoot, file, opts)
}

func streamExtractCAS(ctx context.Context, puller *layerPuller, cfg *Manifest, dest string, file File, opts UnpackOptions) error {
	casDest, exists, err := casIfExists(opts.CASRoot, file.Digest, opts.Owner)
	if err != nil {
		return err
	}
	if exists {
		return installFromCAS(casDest, dest, file, opts.CopyFiles, opts.Owner)
	}
	tmp, f, err := createCASTemp(opts.CASRoot)
	if err != nil {
		return err
	}
	got, err := writeDecodedParts(ctx, puller, cfg, file, f)
	if err != nil {
		f.Close()
		os.Remove(tmp)
		return err
	}
	if file.Digest != "" && got != file.Digest {
		f.Close()
		os.Remove(tmp)
		return errors.Errorf("file digest mismatch for %s", file.Path)
	}
	cas, err := publishCASFile(f, tmp, casDest, opts.Owner)
	if err != nil {
		return err
	}
	return installFromCAS(cas, dest, file, opts.CopyFiles, opts.Owner)
}

func streamExtractDest(ctx context.Context, puller *layerPuller, cfg *Manifest, dest, tmpRoot string, file File, opts UnpackOptions) error {
	tmp := filepath.Join(tmpRoot, filepath.FromSlash(file.Path))
	if err := mkdirAllOwned(filepath.Dir(tmp), opts.Owner); err != nil {
		return err
	}
	mode := destFileMode(file)
	f, err := os.OpenFile(tmp, os.O_CREATE|os.O_WRONLY|os.O_TRUNC, mode)
	if err != nil {
		return errors.Wrap(err, "failed to create temp file")
	}
	got, err := writeDecodedParts(ctx, puller, cfg, file, f)
	if err != nil {
		f.Close()
		os.Remove(tmp)
		return err
	}
	if file.Digest != "" && got != file.Digest {
		f.Close()
		os.Remove(tmp)
		return errors.Errorf("file digest mismatch for %s", file.Path)
	}
	if err := f.Close(); err != nil {
		os.Remove(tmp)
		return err
	}
	return moveTempIntoDest(dest, tmp, file, opts, mode)
}

func writeDestFile(dest, tmpRoot string, file File, opts UnpackOptions, plain []byte) error {
	tmp := filepath.Join(tmpRoot, filepath.FromSlash(file.Path))
	if err := mkdirAllOwned(filepath.Dir(tmp), opts.Owner); err != nil {
		return err
	}
	mode := destFileMode(file)
	if err := os.WriteFile(tmp, plain, mode); err != nil {
		return errors.Wrap(err, "failed to write temp file")
	}
	return moveTempIntoDest(dest, tmp, file, opts, mode)
}

func destFileMode(file File) os.FileMode {
	mode := os.FileMode(file.Mode)
	if mode == 0 {
		return 0o644
	}
	return mode
}

func moveTempIntoDest(dest, tmp string, file File, opts UnpackOptions, mode os.FileMode) error {
	if err := chownPath(tmp, opts.Owner); err != nil {
		return err
	}
	final := filepath.Join(dest, filepath.FromSlash(file.Path))
	if err := mkdirAllOwned(filepath.Dir(final), opts.Owner); err != nil {
		return err
	}
	if err := os.RemoveAll(final); err != nil {
		return err
	}
	if err := os.Rename(tmp, final); err != nil {
		if err := copyFile(tmp, final, mode); err != nil {
			return errors.Wrap(err, "failed to move file into place")
		}
		if err := os.Remove(tmp); err != nil {
			return errors.Wrap(err, "failed to remove temp file")
		}
	}
	if err := chownPath(final, opts.Owner); err != nil {
		return err
	}
	if err := applyMtime(final, file.Mtime); err != nil {
		return errors.Wrap(err, "failed to restore mtime")
	}
	return nil
}

func applyMtime(path string, unix int64) error {
	if unix == 0 {
		return nil
	}
	t := time.Unix(unix, 0)
	return os.Chtimes(path, t, t)
}

func copyFile(src, dest string, mode os.FileMode) error {
	in, err := os.Open(src)
	if err != nil {
		return err
	}
	defer in.Close()
	out, err := os.OpenFile(dest, os.O_CREATE|os.O_WRONLY|os.O_TRUNC, mode)
	if err != nil {
		return err
	}
	if _, err := io.Copy(out, in); err != nil {
		out.Close()
		return err
	}
	return out.Close()
}
