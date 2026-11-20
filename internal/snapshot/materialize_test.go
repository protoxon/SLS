package snapshot

import (
	"os"
	"path/filepath"
	"syscall"
	"testing"

	"protoxon.com/sls/internal/volume"
)

func TestApplySpecialChownsToOwner(t *testing.T) {
	dir := t.TempDir()
	owner := &volume.Owner{Uid: os.Getuid(), Gid: os.Getgid()}
	err := applySpecial(dir, Target{
		Dirs:     []string{"world"},
		Symlinks: []Symlink{{Path: "link", Target: "world"}},
	}, owner)
	if err != nil {
		t.Fatal(err)
	}
	for _, rel := range []string{".", "world", "link"} {
		info, err := os.Lstat(filepath.Join(dir, rel))
		if err != nil {
			t.Fatal(err)
		}
		stat, ok := info.Sys().(*syscall.Stat_t)
		if !ok {
			t.Fatal("stat")
		}
		if int(stat.Uid) != owner.Uid || int(stat.Gid) != owner.Gid {
			t.Fatalf("%s uid/gid %d/%d", rel, stat.Uid, stat.Gid)
		}
	}
}
