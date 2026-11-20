package store

import (
	"context"
	"os"
	"path/filepath"
	"testing"
	"time"

	"github.com/opencontainers/go-digest"
	"oras.land/oras-go/v2/content/memory"
	"protoxon.com/sls/internal/volume"
)

func materializeText(t *testing.T, st *Store, body string) (digest.Digest, string) {
	t.Helper()
	ctx := context.Background()
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte(body), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	dest, _, _, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	return desc.Digest, dest
}

func ageUnused(t *testing.T, st *Store, d digest.Digest) {
	t.Helper()
	if err := st.writeUnused(d, time.Now().Add(-2*time.Hour)); err != nil {
		t.Fatal(err)
	}
}

func TestGCIdleUnusedStampsThenDeletes(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "a")
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnused, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("first unused pass should keep the tree")
	}
	if _, err := os.Stat(st.unusedPath(d)); err != nil {
		t.Fatal("first unused pass should stamp unused_at")
	}
	ageUnused(t, st, d)
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); !os.IsNotExist(err) {
		t.Fatal("aged unused tree should be removed")
	}
}

func TestGCIdleNeverKeepsAgedTree(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "a")
	ageUnused(t, st, d)
	st.SetCleanup(CleanupPolicy{Mode: CleanupNever, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("never should keep an aged tree")
	}
}

func TestGCIdlePinKeepsAgedTree(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "a")
	if err := st.SavePins("srv1", []Pin{{
		Name:     "world",
		Artifact: "localhost:5000/world:latest",
		Digest:   d,
		Source:   "digests/" + DirName(d),
	}}); err != nil {
		t.Fatal(err)
	}
	ageUnused(t, st, d)
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnused, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("pinned tree should stay")
	}
}

func TestGCIdleUnreferencedWithoutList(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "a")
	if err := st.writeOrigin(d, Origin{Registry: "localhost:5000", Repository: "world", Reference: "latest"}); err != nil {
		t.Fatal(err)
	}
	ageUnused(t, st, d)
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnreferenced, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("unreferenced cleanup should wait for a retain list")
	}
}

func TestGCIdleUnreferencedKeepsListedTag(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "a")
	if err := st.writeOrigin(d, Origin{Registry: "localhost:5000", Repository: "world", Reference: "latest"}); err != nil {
		t.Fatal(err)
	}
	if err := st.SaveRetain([]string{"localhost:5000/world:latest"}); err != nil {
		t.Fatal(err)
	}
	ageUnused(t, st, d)
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnreferenced, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("listed tag should stay")
	}
}

func TestGCIdleUnreferencedDeletesUnlisted(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "a")
	if err := st.writeOrigin(d, Origin{Registry: "localhost:5000", Repository: "world", Reference: "latest"}); err != nil {
		t.Fatal(err)
	}
	if err := st.SaveRetain([]string{"localhost:5000/other:latest"}); err != nil {
		t.Fatal(err)
	}
	ageUnused(t, st, d)
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnreferenced, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); !os.IsNotExist(err) {
		t.Fatal("unlisted tree should be removed after after")
	}
}

func TestGCIdleEmptyRetainDeletes(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "a")
	if err := st.writeOrigin(d, Origin{Registry: "localhost:5000", Repository: "world", Reference: "latest"}); err != nil {
		t.Fatal(err)
	}
	if err := st.SaveRetain(nil); err != nil {
		t.Fatal(err)
	}
	ageUnused(t, st, d)
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnreferenced, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); !os.IsNotExist(err) {
		t.Fatal("empty retain list should allow deletion")
	}
}

func TestGCIdleDigestRetain(t *testing.T) {
	st := New(t.TempDir())
	d, dest := materializeText(t, st, "dig")
	if err := st.writeOrigin(d, Origin{
		Registry:   "localhost:5000",
		Repository: "repo",
		Reference:  d.String(),
		DigestPin:  true,
	}); err != nil {
		t.Fatal(err)
	}
	if err := st.SaveRetain([]string{"localhost:5000/repo@" + d.String()}); err != nil {
		t.Fatal(err)
	}
	ageUnused(t, st, d)
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnreferenced, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("listed digest should stay")
	}
	if err := st.SaveRetain([]string{}); err != nil {
		t.Fatal(err)
	}
	ageUnused(t, st, d)
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); !os.IsNotExist(err) {
		t.Fatal("digest should be removed once it leaves the list")
	}
}

func TestGCSupersededStillImmediateUnderUnused(t *testing.T) {
	st := New(t.TempDir())
	origin := Origin{Registry: "localhost:5000", Repository: "missile_wars", Reference: "latest"}
	old := origin
	old.PulledAt = time.Now().Add(-time.Hour)
	oldDesc, oldDest := materializeText(t, st, "old")
	if err := st.writeOrigin(oldDesc, old); err != nil {
		t.Fatal(err)
	}
	newOrigin := origin
	newOrigin.PulledAt = time.Now()
	newDesc, newDest := materializeText(t, st, "new")
	if err := st.writeOrigin(newDesc, newOrigin); err != nil {
		t.Fatal(err)
	}
	st.SetCleanup(CleanupPolicy{Mode: CleanupUnused, After: time.Hour})
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(oldDest); !os.IsNotExist(err) {
		t.Fatal("unpinned old version should be removed immediately")
	}
	if _, err := os.Stat(newDest); err != nil {
		t.Fatal("newer version should stay")
	}
}
