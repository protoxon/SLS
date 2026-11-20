package filesystem

import (
	"os"
	"path/filepath"
	"testing"

	"golang.org/x/sys/unix"
)

func TestMkdirsCreatesParentsAndLeavesLowerUntouched(t *testing.T) {
	root := t.TempDir()
	serverVolume := filepath.Join(root, "data")
	lower := filepath.Join(root, "lower")
	work := filepath.Join(root, "work")
	upper := filepath.Join(root, "upper")
	merged := filepath.Join(serverVolume, "world")
	if err := os.MkdirAll(lower, 0o755); err != nil {
		t.Fatal(err)
	}
	file := filepath.Join(lower, "a.txt")
	if err := os.WriteFile(file, []byte("keep"), 0o640); err != nil {
		t.Fatal(err)
	}
	before, err := os.Stat(file)
	if err != nil {
		t.Fatal(err)
	}

	if err := Mkdirs(work, upper, merged); err != nil {
		t.Fatal(err)
	}
	if err := Mkdirs(work, upper, merged); err != nil {
		t.Fatal(err)
	}

	after, err := os.Stat(file)
	if err != nil {
		t.Fatal(err)
	}
	if after.Mode().Perm() != before.Mode().Perm() {
		t.Fatalf("lower mode changed: %o -> %o", before.Mode().Perm(), after.Mode().Perm())
	}
	for _, dir := range []string{work, upper, merged, serverVolume} {
		info, err := os.Stat(dir)
		if err != nil {
			t.Fatal(err)
		}
		if !info.IsDir() {
			t.Fatalf("%s is not a directory", dir)
		}
	}
}

func TestEnsureOverlayReplacesLower(t *testing.T) {
	data := t.TempDir()
	ov, err := NewOverlayVolume(t.TempDir(), data, t.TempDir())
	if err != nil {
		t.Fatal(err)
	}
	ov.NewOverlay("root", []string{ov.ServerPath}, data)
	first := ov.EnsureOverlay("vol", []string{"/a"}, filepath.Join(data, "vol"))
	second := ov.EnsureOverlay("vol", []string{"/b", "/c"}, filepath.Join(data, "vol"))
	if first != second {
		t.Fatal("expected the same overlay")
	}
	if len(ov.Overlays) != 2 {
		t.Fatalf("overlays: %d", len(ov.Overlays))
	}
	if got := second.Lower; len(got) != 2 || got[0] != "/b" || got[1] != "/c" {
		t.Fatalf("lower: %v", got)
	}
}

func TestSetRootVolumeLowersKeepsServerPath(t *testing.T) {
	serverPath := t.TempDir()
	data := t.TempDir()
	ov, err := NewOverlayVolume(t.TempDir(), data, serverPath)
	if err != nil {
		t.Fatal(err)
	}
	ov.NewOverlay("root", []string{serverPath}, data)
	if err := ov.SetRootVolumeLowers([]string{"/vol1"}); err != nil {
		t.Fatal(err)
	}
	if err := ov.SetRootVolumeLowers([]string{"/vol2"}); err != nil {
		t.Fatal(err)
	}
	got := ov.RootOverlay().Lower
	if len(got) != 2 || got[0] != serverPath || got[1] != "/vol2" {
		t.Fatalf("lower: %v", got)
	}
}

func TestSelectedOverlayRespectsExclude(t *testing.T) {
	data := t.TempDir()
	ov, err := NewOverlayVolume(t.TempDir(), data, t.TempDir())
	if err != nil {
		t.Fatal(err)
	}
	ov.NewOverlay("root", []string{ov.ServerPath}, data)
	ov.NewOverlay("plugins", []string{"/vol"}, filepath.Join(data, "plugins"))
	specs, err := ov.selectedLocked(SnapshotOptions{Excludes: []string{"/"}})
	if err != nil {
		t.Fatal(err)
	}
	if len(specs) != 1 || specs[0].target != "/plugins" || specs[0].name != "plugins" {
		t.Fatalf("specs: %+v", specs)
	}
	if _, err := ov.selectedLocked(SnapshotOptions{Targets: []string{"/missing"}}); err == nil {
		t.Fatal("expected unknown target to fail")
	}
}

func TestCaptureUpperPrefersMergedBytes(t *testing.T) {
	upper := t.TempDir()
	merged := t.TempDir()
	if err := os.WriteFile(filepath.Join(upper, "a.txt"), []byte("stub"), 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(merged, "a.txt"), []byte("full"), 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.Mkdir(filepath.Join(upper, "empty"), 0o755); err != nil {
		t.Fatal(err)
	}
	if err := os.Symlink("a.txt", filepath.Join(upper, "link")); err != nil {
		t.Fatal(err)
	}
	dest := filepath.Join(t.TempDir(), "layer")
	layer, err := captureUpper(upper, merged, dest)
	if err != nil {
		t.Fatal(err)
	}
	got, err := os.ReadFile(filepath.Join(dest, "a.txt"))
	if err != nil {
		t.Fatal(err)
	}
	if string(got) != "full" {
		t.Fatalf("file: %q", got)
	}
	link, err := os.Readlink(filepath.Join(dest, "link"))
	if err != nil {
		t.Fatal(err)
	}
	if link != "a.txt" {
		t.Fatalf("link: %s", link)
	}
	if layer.Size != int64(len("full")) {
		t.Fatalf("size: %d", layer.Size)
	}
	if len(layer.Symlinks) != 1 || len(layer.Dirs) != 1 {
		t.Fatalf("layer: %+v", layer)
	}
}

func TestCaptureUpperKeepsWhiteout(t *testing.T) {
	upper := t.TempDir()
	whiteout := filepath.Join(upper, "gone")
	if err := unix.Mknod(whiteout, unix.S_IFCHR|0o644, 0); err != nil {
		t.Skip(err)
	}
	dest := filepath.Join(t.TempDir(), "layer")
	layer, err := captureUpper(upper, t.TempDir(), dest)
	if err != nil {
		t.Fatal(err)
	}
	if len(layer.Whiteouts) != 1 || layer.Whiteouts[0] != "gone" {
		t.Fatalf("whiteouts: %v", layer.Whiteouts)
	}
	if ok, err := isWhiteout(filepath.Join(dest, "gone")); err != nil || !ok {
		t.Fatalf("dest whiteout: %v %v", ok, err)
	}
}

func TestSnapshotClearsInProgressFlag(t *testing.T) {
	data := t.TempDir()
	ov, err := NewOverlayVolume(t.TempDir(), data, t.TempDir())
	if err != nil {
		t.Fatal(err)
	}
	ov.NewOverlay("root", []string{ov.ServerPath}, data)
	_, _ = ov.Snapshot(SnapshotOptions{ID: "snap", Root: t.TempDir()})
	if ov.snapshotting.Load() {
		t.Fatal("snapshot flag still set")
	}
}
