package filesystem

import (
	"os"
	"path/filepath"
	"testing"
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
