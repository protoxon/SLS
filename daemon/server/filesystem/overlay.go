package filesystem

import (
	"os"
	"path/filepath"
	"slices"
	"sync"
	"sync/atomic"

	"emperror.dev/errors"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/internal/overlay"
)

// OverlayVolume represents a single logical volume composed of multiple OverlayFS
type OverlayVolume struct {
	mu           sync.Mutex
	Root         string
	mounted      atomic.Bool
	serverVolume string
	usage        atomic.Int64
	Overlays     []*overlay.Overlay
	ServerPath   string
}

// NewOverlayVolume creates a new overlay volume at the path
// root is the directory where the overlay's will store their work and upper directories
// root = internal/overlay/<server_id>
// serverVolume is the servers volume in the daemons data directory
// serverPath is the path to the base server files
func NewOverlayVolume(root string, serverVolume string, serverPath string) (*OverlayVolume, error) {
	return &OverlayVolume{
		Root:         root,
		ServerPath:   serverPath,
		serverVolume: serverVolume,
	}, nil
}

func (ov *OverlayVolume) addOverlay(o *overlay.Overlay) {
	ov.mu.Lock()
	defer ov.mu.Unlock()
	ov.Overlays = append(ov.Overlays, o)
}

// RootOverlay is the server data overlay created first (merged at the data dir).
func (ov *OverlayVolume) RootOverlay() *overlay.Overlay {
	ov.mu.Lock()
	defer ov.mu.Unlock()
	if len(ov.Overlays) == 0 {
		return nil
	}
	return ov.Overlays[0]
}

// NewOverlay creates and adds a new overlay to the volume.
// The given name is used to create a folder under the volume's root,
// with work and upper directories created inside it.
func (ov *OverlayVolume) NewOverlay(name string, lowerDirs []string, merged string) *overlay.Overlay {
	o := overlay.New(filepath.Join(ov.Root, name), lowerDirs, merged)
	ov.addOverlay(o)
	return o
}

// EnsureOverlay returns the overlay named name, creating it if needed, and
// replaces its lowerdirs. It does not append a second overlay on retry.
func (ov *OverlayVolume) EnsureOverlay(name string, lowerDirs []string, merged string) *overlay.Overlay {
	ov.mu.Lock()
	defer ov.mu.Unlock()
	dir := filepath.Join(ov.Root, name)
	for _, o := range ov.Overlays {
		if filepath.Clean(filepath.Dir(o.Work)) == filepath.Clean(dir) {
			o.SetLower(lowerDirs)
			return o
		}
	}
	o := overlay.New(dir, lowerDirs, merged)
	ov.Overlays = append(ov.Overlays, o)
	return o
}

// SetRootVolumeLowers keeps ServerPath as lower[0] and replaces any volume lowers.
func (ov *OverlayVolume) SetRootVolumeLowers(sources []string) error {
	root := ov.RootOverlay()
	if root == nil {
		return errors.New("server overlay is not initialized")
	}
	lowers := make([]string, 0, 1+len(sources))
	lowers = append(lowers, ov.ServerPath)
	lowers = append(lowers, sources...)
	root.SetLower(lowers)
	return nil
}

func (ov *OverlayVolume) IsMounted() bool {
	return ov.mounted.Load()
}

// Mount mounts the overlay volume
func (ov *OverlayVolume) Mount() error {
	ov.mu.Lock()
	defer ov.mu.Unlock()

	// Mount the overlays
	for _, o := range ov.Overlays {

		if err := Mkdirs(o.Work, o.Upper, o.Merged); err != nil {
			return errors.Wrapf(err, "failed to create directories for overlay %s", o.Merged)
		}

		if err := o.Mount(); err != nil {
			return err
		}

	}

	ov.mounted.Store(true)
	return nil
}

// Unmount unmounts the overlay volume
func (ov *OverlayVolume) Unmount() error {
	ov.mu.Lock()
	defer ov.mu.Unlock()

	var errs []error

	for _, v := range slices.Backward(ov.Overlays) {
		if err := v.Unmount(); err != nil {
			errs = append(errs, err)
		}
	}

	// If any errors happened, combine them
	if len(errs) > 0 {
		return errors.Combine(errs...)
	}

	ov.mounted.Store(false)
	return nil
}

// Destroy unmounts the overlay volume and deletes the root directory.
func (ov *OverlayVolume) Destroy() error {
	if err := ov.Unmount(); err != nil {
		return errors.Wrap(err, "failed to unmount overlay volume")
	}

	if ov.Root != "" {
		if err := os.RemoveAll(ov.Root); err != nil {
			return errors.Wrapf(err, "failed to delete overlay volume %s", ov.Root)
		}
	}
	return nil
}

// Reset destroys the overlay filesystem and recreates the work and upper directories
func (ov *OverlayVolume) Reset() error {
	if err := ov.Destroy(); err != nil {
		return err
	}

	for _, o := range ov.Overlays {
		if err := Mkdirs(o.Work, o.Upper); err != nil {
			return errors.Wrap(err, "failed to create overlay directories")
		}
	}

	return nil
}

// Mkdirs creates the provided directories if they do not exist.
func Mkdirs(dirs ...string) error {
	for _, dir := range dirs {
		if dir == "" {
			continue
		}
		if err := mkdirAllOwned(dir); err != nil {
			return errors.Wrapf(err, "failed to create directory %s", dir)
		}
	}
	return nil
}

func mkdirAllOwned(path string) error {
	path = filepath.Clean(path)
	var missing []string
	for p := path; ; {
		_, err := os.Lstat(p)
		if err == nil {
			break
		}
		if !os.IsNotExist(err) {
			return err
		}
		missing = append(missing, p)
		next := filepath.Dir(p)
		if next == p {
			break
		}
		p = next
	}
	uid, gid := -1, -1
	if cfg := config.Get(); cfg != nil {
		uid, gid = cfg.System.User.Uid, cfg.System.User.Gid
	}
	for _, m := range slices.Backward(missing) {
		if err := os.Mkdir(m, 0o755); err != nil && !os.IsExist(err) {
			return err
		}
		if uid < 0 {
			continue
		}
		if err := os.Chown(m, uid, gid); err != nil {
			return errors.Wrapf(err, "failed to chown %s", m)
		}
	}
	return nil
}

// DiskUsage returns the physical disk space usage of the overlay not including the lowerdirs
func (ov *OverlayVolume) DiskUsage(allowStaleValue bool) (int64, error) {
	if allowStaleValue {
		return ov.CachedUsage(), nil
	}
	size, err := DirectorySizePhysical(ov.Root)
	if err != nil {
		return 0, err
	}
	ov.SetUsage(size)
	return size, nil
}

// Returns the cached value for the amount of physical disk space used by the overlay filesystem. Do not rely on this
// function for critical logical checks. It should only be used in areas where the actual disk usage
// does not need to be perfect, e.g. API responses for server resource usage.
func (ov *OverlayVolume) CachedUsage() int64 {
	return ov.usage.Load()
}

// SetUsage updates the total usage of the filesystem.
func (ov *OverlayVolume) SetUsage(newUsage int64) int64 {
	return ov.usage.Swap(newUsage)
}
