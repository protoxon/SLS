package overlay

import (
	"path/filepath"
	"strings"
	"testing"

	"emperror.dev/errors"
	"golang.org/x/sys/unix"
)

func fakeMount(t *testing.T, fn func(opts string) error) *[]string {
	t.Helper()
	prevMount := mount
	prevUnsupported := metacopyUnsupported.Load()
	t.Cleanup(func() {
		mount = prevMount
		metacopyUnsupported.Store(prevUnsupported)
	})
	metacopyUnsupported.Store(false)
	var calls []string
	mount = func(_, opts string) error {
		calls = append(calls, opts)
		return fn(opts)
	}
	return &calls
}

func newTestOverlay(t *testing.T) *Overlay {
	root := t.TempDir()
	o := New(root, []string{t.TempDir()}, t.TempDir())
	if err := mkdirs(o.Upper, o.Work); err != nil {
		t.Fatal(err)
	}
	return o
}

func TestMountFallsBackWithoutMetacopy(t *testing.T) {
	calls := fakeMount(t, func(opts string) error {
		if strings.Contains(opts, "metacopy=on") {
			return unix.EINVAL
		}
		return nil
	})
	if err := newTestOverlay(t).Mount(); err != nil {
		t.Fatal(err)
	}
	if len(*calls) != 2 || strings.Contains((*calls)[1], "metacopy") {
		t.Fatalf("mount calls = %q", *calls)
	}
	if err := newTestOverlay(t).Mount(); err != nil {
		t.Fatal(err)
	}
	if len(*calls) != 3 || strings.Contains((*calls)[2], "metacopy") {
		t.Fatalf("metacopy was retried after the kernel rejected it: %q", *calls)
	}
}

func TestMountKeepsErrorWhenFallbackFails(t *testing.T) {
	calls := fakeMount(t, func(string) error { return unix.EINVAL })
	err := newTestOverlay(t).Mount()
	if !errors.Is(err, unix.EINVAL) {
		t.Fatalf("err = %v", err)
	}
	if len(*calls) != 2 || metacopyUnsupported.Load() {
		t.Fatalf("calls %q, metacopy disabled %t", *calls, metacopyUnsupported.Load())
	}
}

func TestMountDoesNotRetryOtherErrors(t *testing.T) {
	calls := fakeMount(t, func(string) error { return unix.EPERM })
	if err := newTestOverlay(t).Mount(); !errors.Is(err, unix.EPERM) {
		t.Fatalf("err = %v", err)
	}
	if len(*calls) != 1 {
		t.Fatalf("mount calls = %q", *calls)
	}
}

func mkdirs(paths ...string) error {
	for _, p := range paths {
		if err := unix.Mkdir(p, 0o755); err != nil && !errors.Is(err, unix.EEXIST) {
			return err
		}
	}
	return nil
}

func TestMountRoot(t *testing.T) {
	dir := t.TempDir()
	if !mountRoot("/") {
		t.Error("/ is not reported as a mount root")
	}
	if mountRoot(dir) {
		t.Errorf("plain directory %s is reported as a mount root", dir)
	}
	if mountRoot(filepath.Join(dir, "missing")) {
		t.Error("missing path is reported as a mount root")
	}
}

// Unmounting a directory that was never mounted succeeds without privileges.
func TestUnmountSkipsUnmountedDirectory(t *testing.T) {
	o := New(t.TempDir(), []string{t.TempDir()}, t.TempDir())
	if err := o.Unmount(); err != nil {
		t.Fatal(err)
	}
}
