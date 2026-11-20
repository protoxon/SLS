package overlay

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"sync"
	"sync/atomic"

	"emperror.dev/errors"
	"github.com/apex/log"
	"golang.org/x/sys/unix"
)

// Overlay is a wrapper around the Linux kernel overlay filesystem mount
// see https://docs.kernel.org/filesystems/overlayfs.html
type Overlay struct {
	Lower  []string
	Merged string
	Work   string
	Upper  string
	sync.Mutex
}

// AddLower is a helper to add a lowerdir to the overlay filesystem
func (o *Overlay) AddLower(path ...string) {
	o.Lock()
	defer o.Unlock()
	o.Lower = append(o.Lower, path...)
}

// SetLower replaces the overlay lowerdir list.
func (o *Overlay) SetLower(paths []string) {
	o.Lock()
	defer o.Unlock()
	o.Lower = append([]string(nil), paths...)
}

// Mount mounts an overlay filesystem on the provided overlay dirs
func (o *Overlay) Mount() error {
	o.Lock()
	defer o.Unlock()

	// Validate the overlay fields
	if err := o.validate(); err != nil {
		return errors.Wrap(err, "overlay validation failed")
	}

	// Call unmount to ensure that the overlay isn't already mounted
	err := o.unmountLocked()
	if err != nil {
		return errors.Wrap(err, "failed to unmount existing overlay")
	}

	if err := o.mountLocked(); err != nil {
		return errors.Wrapf(
			err,
			"failed to mount overlay (merged=%s, upper=%s, work=%s, lower=%v)",
			o.Merged,
			o.Upper,
			o.Work,
			o.Lower,
		)
	}

	return nil
}

// metacopyUnsupported is set once the kernel has rejected metacopy=on, as it
// does in an unprivileged user namespace such as an unprivileged LXC.
var metacopyUnsupported atomic.Bool

// mountLocked mounts with metacopy=on when the kernel allows it. metacopy only
// avoids copying file data on chmod/chown, so the overlay works without it.
func (o *Overlay) mountLocked() error {
	opts := fmt.Sprintf("lowerdir=%s,upperdir=%s,workdir=%s",
		strings.Join(o.Lower, ":"), o.Upper, o.Work)
	if metacopyUnsupported.Load() {
		return mount(o.Merged, opts)
	}
	err := mount(o.Merged, opts+",metacopy=on")
	if !errors.Is(err, unix.EINVAL) {
		return err
	}
	if err := mount(o.Merged, opts); err != nil {
		return err
	}
	if !metacopyUnsupported.Swap(true) {
		log.WithField("merged", o.Merged).
			Warn("kernel rejected overlay metacopy=on, mounting overlays without it")
	}
	return nil
}

// mount is replaced in tests.
var mount = func(target, opts string) error {
	return unix.Mount("overlay", target, "overlay", 0, opts)
}

// Unmount unmounts the overlay file system
func (o *Overlay) Unmount() error {
	o.Lock()
	defer o.Unlock()
	return o.unmountLocked()
}

// unmountLocked assumes the mutex is held
func (o *Overlay) unmountLocked() error {
	if !mountRoot(o.Merged) {
		return nil
	}
	err := unix.Unmount(o.Merged, unix.MNT_DETACH)
	if err != nil {
		if err == unix.EINVAL || err == unix.ENOENT {
			// Not mounted or path doesn't exist, ignore
			return nil
		}
		return errors.Wrapf(err, "failed to unmount %s", o.Merged)
	}
	return nil
}

// validate ensures the required overlay directories are set and exist on the system
func (o *Overlay) validate() error {
	// Ensure directories are set
	if o.Merged == "" {
		return errors.New("merged directory must be set")
	}
	if o.Upper == "" {
		return errors.New("upper directory must be set")
	}
	if o.Work == "" {
		return errors.New("work directory must be set")
	}
	if len(o.Lower) == 0 {
		return errors.New("at least one lower directory must be set")
	}
	// Ensure the merged directory exists
	if exists, err := DirExists(o.Merged); err != nil {
		return errors.Errorf("failed to check if merged directory exists: %s", o.Merged)
	} else if !exists {
		return errors.Errorf("merged directory does not exist: %s", o.Merged)
	}
	// Ensure the upper directory exists
	if exists, err := DirExists(o.Upper); err != nil {
		return errors.Errorf("failed to check if upper directory exists: %s", o.Upper)
	} else if !exists {
		return errors.Errorf("upper directory does not exist: %s", o.Upper)
	}
	// Ensure the work directory exists
	if exists, err := DirExists(o.Work); err != nil {
		return errors.Errorf("failed to check if work directory exists: %s", o.Work)
	} else if !exists {
		return errors.Errorf("work directory does not exist: %s", o.Work)
	}
	// Ensure the lower directories exist
	for _, lowerPath := range o.Lower {
		exists, err := DirExists(lowerPath)
		if err != nil {
			return errors.Errorf("failed to check if lower directory exists: %s, error: %v", lowerPath, err)
		}
		if !exists {
			return errors.Errorf("lower directory does not exist: %s", lowerPath)
		}
	}
	return nil
}

// mountRoot reports whether path is the root of a mount. Unmounting a path
// that is not mounted fails with EPERM without CAP_SYS_ADMIN, so callers skip
// it. When the kernel cannot tell, it reports true and the unmount is tried.
func mountRoot(path string) bool {
	var stx unix.Statx_t
	if err := unix.Statx(unix.AT_FDCWD, path, unix.AT_SYMLINK_NOFOLLOW, 0, &stx); err != nil {
		return !errors.Is(err, unix.ENOENT)
	}
	if stx.Attributes_mask&unix.STATX_ATTR_MOUNT_ROOT == 0 {
		return true
	}
	return stx.Attributes&unix.STATX_ATTR_MOUNT_ROOT != 0
}

func DirExists(path string) (bool, error) {
	info, err := os.Stat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return false, nil
		}
		return false, err
	}
	return info.IsDir(), nil
}

// New creates a new overlay
// root is the directory where the overlay's work and upper directories will exist
// lowerDirs are the lower directories to include
// merged is the target directory where the merged view will be visible
func New(root string, lowerDirs []string, merged string) *Overlay {
	o := &Overlay{
		Lower:  lowerDirs,
		Merged: merged,
		Work:   filepath.Join(root, "work"),
		Upper:  filepath.Join(root, "upper"),
	}
	return o
}
