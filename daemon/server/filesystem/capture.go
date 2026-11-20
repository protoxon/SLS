package filesystem

import (
	"io"
	"io/fs"
	"os"
	"path/filepath"
	"strings"
	"syscall"

	"emperror.dev/errors"
	"golang.org/x/sys/unix"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/internal/overlay"
	"protoxon.com/sls/internal/snapshot"
)

var errSnapshotInProgress = errors.New("snapshot in progress")

// Capture is an immutable copy of the selected overlay uppers.
type Capture struct {
	ID     string
	Dir    string
	Size   int64
	Layers []CapturedLayer
}

// CapturedLayer is one overlay diff. Name is the directory under Dir.
type CapturedLayer struct {
	Target    string
	Name      string
	Dir       string
	Lowers    []string
	Whiteouts []string
	Opaque    []string
	Symlinks  []snapshot.Symlink
	Dirs      []string
	Size      int64
}

func (l CapturedLayer) empty() bool {
	return l.Size == 0 && len(l.Whiteouts) == 0 && len(l.Opaque) == 0 && len(l.Symlinks) == 0 && len(l.Dirs) == 0
}

// SnapshotOptions selects which overlay targets to capture.
// An exclude wins over a target. No targets captures every overlay.
// ID is the snapshot id. Root is the snapshots directory; an empty root
// uses the daemon configuration.
type SnapshotOptions struct {
	ID       string
	Root     string
	Targets  []string
	Excludes []string
}

// Snapshot copies the selected overlay uppers into Root/ID/<name>.
// A running server is left mounted. When the volume is not mounted, it is
// mounted for the copy so metacopy stubs are read from the merged view, then
// unmounted again. The snapshot-in-progress flag makes Unmount and Destroy fail
// until the copy finishes. The lock is not held while files are copied.
func (ov *OverlayVolume) Snapshot(opts SnapshotOptions) (cap Capture, err error) {
	if opts.ID == "" {
		return Capture{}, errors.New("snapshot id is required")
	}
	root := opts.Root
	if root == "" {
		cfg := config.Get()
		if cfg == nil || cfg.System.Snapshots == "" {
			return Capture{}, errors.New("snapshot root is not configured")
		}
		root = cfg.System.Snapshots
	}

	ov.mu.Lock()
	if !ov.snapshotting.CompareAndSwap(false, true) {
		ov.mu.Unlock()
		return Capture{}, errSnapshotInProgress
	}
	wasMounted := ov.mounted.Load()
	if !wasMounted {
		if err = ov.mountLocked(); err != nil {
			ov.snapshotting.Store(false)
			ov.mu.Unlock()
			return Capture{}, err
		}
	}
	specs, err := ov.selectedLocked(opts)
	ov.mu.Unlock()
	if err != nil {
		ov.finishSnapshot(wasMounted)
		return Capture{}, err
	}
	defer ov.finishSnapshot(wasMounted)

	snapDir := filepath.Join(root, opts.ID)
	if err = os.RemoveAll(snapDir); err != nil {
		return Capture{}, errors.Wrap(err, "failed to clear snapshot directory")
	}
	if err = os.MkdirAll(snapDir, 0o755); err != nil {
		return Capture{}, errors.Wrap(err, "failed to create snapshot directory")
	}
	defer func() {
		if err != nil {
			_ = os.RemoveAll(snapDir)
		}
	}()

	cap = Capture{ID: opts.ID, Dir: snapDir}
	for _, spec := range specs {
		dest := filepath.Join(snapDir, spec.name)
		layer, lerr := captureUpper(spec.upper, spec.merged, dest)
		if lerr != nil {
			err = lerr
			return Capture{}, err
		}
		if layer.empty() {
			_ = os.RemoveAll(dest)
			continue
		}
		if lerr = chownTree(dest); lerr != nil {
			err = lerr
			return Capture{}, err
		}
		layer.Target = spec.target
		layer.Name = spec.name
		layer.Lowers = spec.lowers
		layer.Dir = dest
		cap.Layers = append(cap.Layers, layer)
		cap.Size += layer.Size
	}
	return cap, nil
}

func (ov *OverlayVolume) finishSnapshot(wasMounted bool) {
	ov.mu.Lock()
	defer ov.mu.Unlock()
	if !wasMounted {
		_ = ov.unmountLocked()
	}
	ov.snapshotting.Store(false)
}

type overlaySpec struct {
	target string
	name   string
	upper  string
	merged string
	lowers []string
}

func (ov *OverlayVolume) selectedLocked(opts SnapshotOptions) ([]overlaySpec, error) {
	found := map[string]struct{}{}
	var specs []overlaySpec
	for _, o := range ov.Overlays {
		if o == nil {
			continue
		}
		target := overlayTarget(ov.serverVolume, o)
		if !includeTarget(target, opts) {
			continue
		}
		name := filepath.Base(filepath.Dir(o.Work))
		if name == "" || name == "." || name == string(filepath.Separator) {
			return nil, errors.Errorf("overlay %s has no name", target)
		}
		specs = append(specs, overlaySpec{
			target: target,
			name:   name,
			upper:  o.Upper,
			merged: o.Merged,
			lowers: append([]string(nil), o.Lower...),
		})
		found[target] = struct{}{}
	}
	for _, target := range opts.Targets {
		target = snapshot.NormalizeTarget(target)
		if excludedTarget(target, opts.Excludes) {
			continue
		}
		if _, ok := found[target]; !ok {
			return nil, errors.Errorf("snapshot target %s does not match an overlay", target)
		}
	}
	if len(specs) == 0 {
		return nil, errors.New("no overlays selected")
	}
	return specs, nil
}

func overlayTarget(serverVolume string, o *overlay.Overlay) string {
	base := filepath.Clean(serverVolume)
	merged := filepath.Clean(o.Merged)
	if merged == base {
		return "/"
	}
	rel, err := filepath.Rel(base, merged)
	if err != nil || rel == ".." || strings.HasPrefix(rel, "../") {
		return snapshot.NormalizeTarget(merged)
	}
	return snapshot.NormalizeTarget(rel)
}

// includeTarget reports whether target should be captured.
func includeTarget(target string, opts SnapshotOptions) bool {
	target = snapshot.NormalizeTarget(target)
	if excludedTarget(target, opts.Excludes) {
		return false
	}
	if len(opts.Targets) == 0 {
		return true
	}
	for _, want := range opts.Targets {
		if snapshot.NormalizeTarget(want) == target {
			return true
		}
	}
	return false
}

func excludedTarget(target string, excludes []string) bool {
	target = snapshot.NormalizeTarget(target)
	for _, ex := range excludes {
		if snapshot.NormalizeTarget(ex) == target {
			return true
		}
	}
	return false
}

func captureUpper(upper, merged, dest string) (CapturedLayer, error) {
	info, err := os.Lstat(upper)
	if err != nil {
		if os.IsNotExist(err) {
			return CapturedLayer{}, nil
		}
		return CapturedLayer{}, err
	}
	if !info.IsDir() {
		return CapturedLayer{}, errors.Errorf("upper %s is not a directory", upper)
	}
	if err := os.MkdirAll(dest, 0o755); err != nil {
		return CapturedLayer{}, err
	}
	var layer CapturedLayer
	err = filepath.WalkDir(upper, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		rel, err := filepath.Rel(upper, path)
		if err != nil {
			return err
		}
		rel = filepath.ToSlash(rel)
		if rel == "." {
			return nil
		}
		out := filepath.Join(dest, filepath.FromSlash(rel))
		mode := d.Type()
		switch {
		case mode&os.ModeSymlink != 0:
			link, err := os.Readlink(path)
			if err != nil {
				return err
			}
			if err := os.MkdirAll(filepath.Dir(out), 0o755); err != nil {
				return err
			}
			if err := os.Symlink(link, out); err != nil {
				return err
			}
			layer.Symlinks = append(layer.Symlinks, snapshot.Symlink{Path: rel, Target: link})
			return nil
		case mode&os.ModeCharDevice != 0:
			whiteout, err := isWhiteout(path)
			if err != nil {
				return err
			}
			if !whiteout {
				return errors.Errorf("unsupported device %s", rel)
			}
			if err := writeWhiteout(dest, rel); err != nil {
				return err
			}
			layer.Whiteouts = append(layer.Whiteouts, rel)
			return nil
		case mode.IsDir():
			if err := os.MkdirAll(out, 0o755); err != nil {
				return err
			}
			layer.Dirs = append(layer.Dirs, rel)
			opaque, err := isOpaque(path)
			if err != nil {
				return err
			}
			if opaque {
				if err := unix.Lsetxattr(out, "trusted.overlay.opaque", []byte("y"), 0); err != nil {
					return errors.Wrapf(err, "failed to mark opaque directory %s", rel)
				}
				layer.Opaque = append(layer.Opaque, rel)
			}
			return nil
		case mode.IsRegular():
			from := filepath.Join(merged, filepath.FromSlash(rel))
			if _, err := os.Stat(from); err != nil {
				if !os.IsNotExist(err) {
					return err
				}
				from = path
			}
			n, err := copyFile(from, out)
			if err != nil {
				return errors.Wrapf(err, "failed to copy %s", rel)
			}
			layer.Size += n
			return nil
		default:
			return errors.Errorf("unsupported file %s", rel)
		}
	})
	if err != nil {
		return CapturedLayer{}, errors.Wrapf(err, "failed to capture %s", upper)
	}
	return layer, nil
}

// chownTree gives the captured lowerdir to the daemon user. Lchown does not
// follow symlinks. A negative uid means ownership is left unchanged.
func chownTree(root string) error {
	uid, gid := -1, -1
	if cfg := config.Get(); cfg != nil {
		uid, gid = cfg.System.User.Uid, cfg.System.User.Gid
	}
	if uid < 0 {
		return nil
	}
	return filepath.WalkDir(root, func(path string, _ fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		if err := unix.Lchown(path, uid, gid); err != nil {
			return errors.Wrapf(err, "failed to chown %s", path)
		}
		return nil
	})
}

func writeWhiteout(dir, rel string) error {
	path := filepath.Join(dir, filepath.FromSlash(rel))
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return err
	}
	if err := os.RemoveAll(path); err != nil {
		return err
	}
	if err := unix.Mknod(path, unix.S_IFCHR|0o644, 0); err != nil {
		return errors.Wrapf(err, "failed to create whiteout %s", rel)
	}
	return nil
}

func isWhiteout(path string) (bool, error) {
	var st unix.Stat_t
	if err := unix.Lstat(path, &st); err != nil {
		return false, err
	}
	if st.Mode&unix.S_IFMT != unix.S_IFCHR {
		return false, nil
	}
	return st.Rdev == 0, nil
}

func isOpaque(path string) (bool, error) {
	buf := make([]byte, 8)
	n, err := unix.Lgetxattr(path, "trusted.overlay.opaque", buf)
	if err != nil {
		if err == unix.ENODATA || err == syscall.EOPNOTSUPP || err == syscall.ENOTSUP {
			return false, nil
		}
		return false, err
	}
	return n == 1 && buf[0] == 'y', nil
}

func copyFile(src, dst string) (int64, error) {
	in, err := os.Open(src)
	if err != nil {
		return 0, err
	}
	defer in.Close()
	info, err := in.Stat()
	if err != nil {
		return 0, err
	}
	if err := os.MkdirAll(filepath.Dir(dst), 0o755); err != nil {
		return 0, err
	}
	out, err := os.OpenFile(dst, os.O_CREATE|os.O_WRONLY|os.O_TRUNC, info.Mode().Perm())
	if err != nil {
		return 0, err
	}
	n, copyErr := io.Copy(out, in)
	closeErr := out.Close()
	if copyErr != nil {
		return n, copyErr
	}
	return n, closeErr
}
