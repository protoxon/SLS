package store

import (
	"context"
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"sync"
	"syscall"
	"testing"
	"time"

	"github.com/opencontainers/go-digest"
	"oras.land/oras-go/v2/content/memory"
	"oras.land/oras-go/v2/errdef"
	"protoxon.com/sls/daemon/oras/volume"
	"protoxon.com/sls/daemon/system"
)

func packTree(t *testing.T, files map[string]string) (*memory.Store, volume.PackOptions) {
	t.Helper()
	src := t.TempDir()
	for rel, body := range files {
		p := filepath.Join(src, filepath.FromSlash(rel))
		if err := os.MkdirAll(filepath.Dir(p), 0o755); err != nil {
			t.Fatal(err)
		}
		if err := os.WriteFile(p, []byte(body), 0o644); err != nil {
			t.Fatal(err)
		}
	}
	mem := memory.New()
	opts := volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024}
	if _, err := volume.Pack(context.Background(), mem, src, opts); err != nil {
		t.Fatal(err)
	}
	return mem, opts
}

func TestMaterializeAndCASShare(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	if err := os.MkdirAll(filepath.Join(src, "world"), 0o755); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(src, "world", "level.dat"), []byte("level"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}

	root := t.TempDir()
	st := New(root)
	a, fetched, cached, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	if cached {
		t.Fatal("first materialize should pull")
	}
	if fetched <= 0 {
		t.Fatal("first materialize should report fetched bytes")
	}
	b, fetched, cached, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	if a != b {
		t.Fatalf("same digest should reuse dest: %s vs %s", a, b)
	}
	if !cached || fetched != 0 {
		t.Fatalf("second materialize should be cached, fetched=%d cached=%v", fetched, cached)
	}
	if filepath.Base(filepath.Dir(a)) != digestDir {
		t.Fatalf("digest tree should be under %s, got %s", digestDir, a)
	}

	other := t.TempDir()
	if err := volume.UnpackWith(ctx, mem, desc, other, volume.UnpackOptions{CASRoot: st.CASRoot(), DeleteMissing: true}); err != nil {
		t.Fatal(err)
	}
	ino := func(path string) uint64 {
		info, err := os.Stat(path)
		if err != nil {
			t.Fatal(err)
		}
		return info.Sys().(*syscall.Stat_t).Ino
	}
	if ino(filepath.Join(a, "world", "level.dat")) != ino(filepath.Join(other, "world", "level.dat")) {
		t.Fatal("cas should share inodes across dests")
	}
}

func TestRefsAndGC(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte("a"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	st := New(t.TempDir())
	dest, _, _, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("digest without refs.json should not be gc'd")
	}
	if err := st.AddRef(desc.Digest, "srv1"); err != nil {
		t.Fatal(err)
	}
	if err := st.AddRef(desc.Digest, "srv2"); err != nil {
		t.Fatal(err)
	}
	if err := st.DropRef(desc.Digest, "srv1"); err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("digest still referenced by srv2")
	}
	if err := st.DropRef(desc.Digest, "srv2"); err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(dest); err != nil {
		t.Fatal("unused digest tree should stay cached")
	}
}

func TestGCSupersededSameOrigin(t *testing.T) {
	ctx := context.Background()
	st := New(t.TempDir())
	origin := Origin{Registry: "localhost:5000", Repository: "missile_wars", Reference: "latest"}

	oldSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(oldSrc, "a.txt"), []byte("old"), 0o644); err != nil {
		t.Fatal(err)
	}
	oldStore := memory.New()
	oldDesc, err := volume.Pack(ctx, oldStore, oldSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	oldDest, _, _, err := st.Materialize(ctx, oldStore, oldDesc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(oldDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}

	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(oldDest); err != nil {
		t.Fatal("sole version should stay even with no refs")
	}

	newSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(newSrc, "a.txt"), []byte("new"), 0o644); err != nil {
		t.Fatal(err)
	}
	newStore := memory.New()
	newDesc, err := volume.Pack(ctx, newStore, newSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	newDest, _, _, err := st.Materialize(ctx, newStore, newDesc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(newDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(oldDest); !os.IsNotExist(err) {
		t.Fatal("unused old version should be removed after a newer pull")
	}
	if _, err := os.Stat(newDest); err != nil {
		t.Fatal("newer version should stay")
	}
}

func TestGCKeepsReferencedOldVersion(t *testing.T) {
	ctx := context.Background()
	st := New(t.TempDir())
	origin := Origin{Registry: "localhost:5000", Repository: "missile_wars", Reference: "latest"}

	oldSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(oldSrc, "a.txt"), []byte("old"), 0o644); err != nil {
		t.Fatal(err)
	}
	oldStore := memory.New()
	oldDesc, err := volume.Pack(ctx, oldStore, oldSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	oldDest, _, _, err := st.Materialize(ctx, oldStore, oldDesc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(oldDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}
	if err := st.AddRef(oldDesc.Digest, "srv1"); err != nil {
		t.Fatal(err)
	}

	newSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(newSrc, "a.txt"), []byte("new"), 0o644); err != nil {
		t.Fatal(err)
	}
	newStore := memory.New()
	newDesc, err := volume.Pack(ctx, newStore, newSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	if _, _, _, err := st.Materialize(ctx, newStore, newDesc, false); err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(newDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(oldDest); err != nil {
		t.Fatal("referenced old version should stay")
	}
}

func TestGCKeepsPinnedWithoutRefs(t *testing.T) {
	ctx := context.Background()
	st := New(t.TempDir())
	origin := Origin{Registry: "localhost:5000", Repository: "missile_wars", Reference: "latest"}

	oldSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(oldSrc, "a.txt"), []byte("old"), 0o644); err != nil {
		t.Fatal(err)
	}
	oldStore := memory.New()
	oldDesc, err := volume.Pack(ctx, oldStore, oldSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	oldDest, _, _, err := st.Materialize(ctx, oldStore, oldDesc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(oldDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}
	if err := st.SavePins("srv1", []Pin{{
		Name:     "world",
		Artifact: "localhost:5000/missile_wars:latest",
		Digest:   oldDesc.Digest,
		Source:   filepath.ToSlash(st.RelDigestPath(oldDesc.Digest)),
	}}); err != nil {
		t.Fatal(err)
	}

	newSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(newSrc, "a.txt"), []byte("new"), 0o644); err != nil {
		t.Fatal(err)
	}
	newStore := memory.New()
	newDesc, err := volume.Pack(ctx, newStore, newSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	if _, _, _, err := st.Materialize(ctx, newStore, newDesc, false); err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(newDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(oldDest); err != nil {
		t.Fatal("pinned old version should stay even with empty refs.json")
	}
}

func TestGCDoesNotCollectDifferentOrigin(t *testing.T) {
	ctx := context.Background()
	st := New(t.TempDir())

	aSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(aSrc, "a.txt"), []byte("a"), 0o644); err != nil {
		t.Fatal(err)
	}
	aStore := memory.New()
	aDesc, err := volume.Pack(ctx, aStore, aSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	aDest, _, _, err := st.Materialize(ctx, aStore, aDesc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(aDesc.Digest, Origin{Registry: "localhost:5000", Repository: "alpha", Reference: "latest"}); err != nil {
		t.Fatal(err)
	}

	bSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(bSrc, "b.txt"), []byte("b"), 0o644); err != nil {
		t.Fatal(err)
	}
	bStore := memory.New()
	bDesc, err := volume.Pack(ctx, bStore, bSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	if _, _, _, err := st.Materialize(ctx, bStore, bDesc, false); err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(bDesc.Digest, Origin{Registry: "localhost:5000", Repository: "beta", Reference: "latest"}); err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(aDest); err != nil {
		t.Fatal("unused tree of a different volume should stay")
	}
}

func TestOriginFromReference(t *testing.T) {
	o, err := originFromReference("localhost:5000/missile_wars:latest")
	if err != nil {
		t.Fatal(err)
	}
	if o.Key() != "localhost:5000/missile_wars:latest" {
		t.Fatalf("tag key %q", o.Key())
	}
	pinned, err := originFromReference("localhost:5000/missile_wars@sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
	if err != nil {
		t.Fatal(err)
	}
	if pinned.Key() != "" {
		t.Fatalf("digest pin should not group for gc, key=%q", pinned.Key())
	}
}

func TestIsCacheRel(t *testing.T) {
	if !IsCacheRel("digests/sha256-abc") || !IsCacheRel("by-digest/sha256-abc") || !IsCacheRel("cas/sha256/ab/cd/dead") {
		t.Fatal("expected cache paths")
	}
	if IsCacheRel("shared/data") || IsCacheRel("worlds/world") {
		t.Fatal("local volume paths are not cache")
	}
}

func TestDigestFromSource(t *testing.T) {
	hex := strings.Repeat("a", 64)
	name := "sha256-" + hex
	d, ok := DigestFromSource("digests/" + name)
	if !ok || d.String() != "sha256:"+hex {
		t.Fatalf("digests pin: %v %q", ok, d)
	}
	if _, ok := DigestFromSource("by-digest/" + name); !ok {
		t.Fatal("by-digest pin")
	}
	if _, ok := DigestFromSource(name); ok {
		t.Fatal("bare digest name is not a pin")
	}
	if _, ok := DigestFromSource("shared/" + name); ok {
		t.Fatal("local path with digest basename is not a pin")
	}
}

func TestConcurrentMaterialize(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte("a"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	st := New(t.TempDir())
	var wg sync.WaitGroup
	errc := make(chan error, 8)
	for range 8 {
		wg.Add(1)
		go func() {
			defer wg.Done()
			_, _, _, err := st.Materialize(ctx, mem, desc, false)
			errc <- err
		}()
	}
	wg.Wait()
	close(errc)
	for err := range errc {
		if err != nil {
			t.Fatal(err)
		}
	}
}

func TestMaterializeRejectsMismatchedSidecar(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte("a"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	st := New(t.TempDir())
	dest, _, _, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	wrong := dest + "/.sls/mount.json"
	if err := os.WriteFile(wrong, []byte(`{"artifact":"sha256:`+strings.Repeat("b", 64)+`"}`+"\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	_, fetched, cached, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	if cached || fetched <= 0 {
		t.Fatalf("mismatch should rematerialize, fetched=%d cached=%v", fetched, cached)
	}
	match, err := destMatchesDigest(dest, desc.Digest)
	if err != nil || !match {
		t.Fatalf("sidecar should match after rematerialize: %v %v", match, err)
	}
}

func TestGCTmpSkipsLockedDigest(t *testing.T) {
	st := New(t.TempDir())
	d := digest.Digest("sha256:" + strings.Repeat("c", 64))
	parent := filepath.Join(st.Root, digestDir)
	if err := os.MkdirAll(parent, 0o755); err != nil {
		t.Fatal(err)
	}
	tmp := filepath.Join(parent, DirName(d)+tmpSuffix+".leftover")
	if err := os.MkdirAll(tmp, 0o755); err != nil {
		t.Fatal(err)
	}
	unlock := st.lock(d.String())
	if err := st.GC(); err != nil {
		unlock()
		t.Fatal(err)
	}
	if _, err := os.Stat(tmp); err != nil {
		unlock()
		t.Fatal("locked tmp should stay")
	}
	unlock()
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(tmp); !os.IsNotExist(err) {
		t.Fatal("unlocked tmp should be collected")
	}
}

func TestPinsAndReconcileRefs(t *testing.T) {
	ctx := context.Background()
	st := New(t.TempDir())
	origin := Origin{Registry: "localhost:5000", Repository: "world", Reference: "latest"}

	oldSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(oldSrc, "a.txt"), []byte("old"), 0o644); err != nil {
		t.Fatal(err)
	}
	oldStore := memory.New()
	oldDesc, err := volume.Pack(ctx, oldStore, oldSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	oldDest, _, _, err := st.Materialize(ctx, oldStore, oldDesc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(oldDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}

	newSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(newSrc, "a.txt"), []byte("new"), 0o644); err != nil {
		t.Fatal(err)
	}
	newStore := memory.New()
	newDesc, err := volume.Pack(ctx, newStore, newSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	if _, _, _, err := st.Materialize(ctx, newStore, newDesc, false); err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(newDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}

	pin := Pin{
		Name:     "world",
		Artifact: "localhost:5000/world:latest",
		Digest:   oldDesc.Digest,
		Source:   filepath.ToSlash(st.RelDigestPath(oldDesc.Digest)),
	}
	if err := st.SavePins("srv1", []Pin{pin}); err != nil {
		t.Fatal(err)
	}
	got, err := st.LoadPins("srv1")
	if err != nil || len(got) != 1 || got[0].Digest != oldDesc.Digest {
		t.Fatalf("pins: %+v %v", got, err)
	}

	res, err := st.EnsurePinned(ctx, pin.Artifact, pin.Digest, false, nil)
	if err != nil || !res.Cached || res.Path != oldDest {
		t.Fatalf("pinned cache: %+v %v", res, err)
	}

	if _, err := st.ReconcileRefs("srv1", []digest.Digest{oldDesc.Digest}); err != nil {
		t.Fatal(err)
	}
	dropped, err := st.ReconcileRefs("srv1", []digest.Digest{newDesc.Digest})
	if err != nil || !dropped {
		t.Fatalf("expected drop on artifact change, dropped=%v err=%v", dropped, err)
	}
	if err := st.SavePins("srv1", []Pin{{
		Name:     "world",
		Artifact: "localhost:5000/world:latest",
		Digest:   newDesc.Digest,
		Source:   filepath.ToSlash(st.RelDigestPath(newDesc.Digest)),
	}}); err != nil {
		t.Fatal(err)
	}
	if err := st.GC(); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(oldDest); !os.IsNotExist(err) {
		t.Fatal("unpinned old version should be collected")
	}

	if err := st.DeletePins("srv1"); err != nil {
		t.Fatal(err)
	}
	if pins, err := st.LoadPins("srv1"); err != nil || len(pins) != 0 {
		t.Fatalf("deleted pins: %+v %v", pins, err)
	}
	if dropped, err := st.ReconcileRefs("srv1", nil); err != nil || !dropped {
		t.Fatalf("delete should drop remaining refs, dropped=%v err=%v", dropped, err)
	}
}

func TestWrapResolveErrNotFound(t *testing.T) {
	err := wrapResolveErr(fmt.Errorf("localhost:5000/vol:latest: %w", errdef.ErrNotFound))
	if !errors.Is(err, ErrNotFound) {
		t.Fatalf("not found should map to ErrNotFound, got %v", err)
	}
	if !IsRegistryUnavailable(err) {
		t.Fatal("not found should be registry unavailable")
	}
	if !system.IsExpected(err) {
		t.Fatal("not found should be expected")
	}
}

func TestWrapResolveErrResolve(t *testing.T) {
	err := wrapResolveErr(fmt.Errorf("dial tcp 127.0.0.1:5000: connect: connection refused"))
	if !errors.Is(err, ErrResolve) {
		t.Fatalf("connect failure should map to ErrResolve, got %v", err)
	}
	if !IsRegistryUnavailable(err) {
		t.Fatal("resolve failure should be registry unavailable")
	}
	if !system.IsExpected(err) {
		t.Fatal("resolve should be expected")
	}
}

func TestLatestLocalByOrigin(t *testing.T) {
	ctx := context.Background()
	st := New(t.TempDir())
	origin := Origin{Registry: "localhost:5000", Repository: "world", Reference: "latest"}

	oldSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(oldSrc, "a.txt"), []byte("old"), 0o644); err != nil {
		t.Fatal(err)
	}
	oldStore := memory.New()
	oldDesc, err := volume.Pack(ctx, oldStore, oldSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	if _, _, _, err := st.Materialize(ctx, oldStore, oldDesc, false); err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(oldDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}

	newSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(newSrc, "a.txt"), []byte("new"), 0o644); err != nil {
		t.Fatal(err)
	}
	newStore := memory.New()
	newDesc, err := volume.Pack(ctx, newStore, newSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	newDest, _, _, err := st.Materialize(ctx, newStore, newDesc, false)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(newDesc.Digest, origin); err != nil {
		t.Fatal(err)
	}

	otherSrc := t.TempDir()
	if err := os.WriteFile(filepath.Join(otherSrc, "a.txt"), []byte("other"), 0o644); err != nil {
		t.Fatal(err)
	}
	otherStore := memory.New()
	otherDesc, err := volume.Pack(ctx, otherStore, otherSrc, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	if _, _, _, err := st.Materialize(ctx, otherStore, otherDesc, false); err != nil {
		t.Fatal(err)
	}
	if err := st.writeOrigin(otherDesc.Digest, Origin{Registry: "localhost:5000", Repository: "other", Reference: "latest"}); err != nil {
		t.Fatal(err)
	}

	res, ok, err := st.LatestLocal("localhost:5000/world:latest")
	if err != nil || !ok {
		t.Fatalf("local world: ok=%v err=%v", ok, err)
	}
	if res.Path != newDest || res.Descriptor.Digest != newDesc.Digest || !res.Cached {
		t.Fatalf("wanted newest world tree, got %+v", res)
	}
	if _, ok, err := st.LatestLocal("localhost:5000/missing:latest"); err != nil || ok {
		t.Fatalf("missing should be empty, ok=%v err=%v", ok, err)
	}
}

func TestProbeUsesLocalWithoutRegistry(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte("local"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	st := New(t.TempDir())
	if _, _, _, err := st.Materialize(ctx, mem, desc, false); err != nil {
		t.Fatal(err)
	}
	const artifact = "127.0.0.1:1/world:latest"
	if err := st.RememberOrigin(desc.Digest, artifact); err != nil {
		t.Fatal(err)
	}
	if err := st.Probe(ctx, artifact); err != nil {
		t.Fatal(err)
	}
}

func TestProbeFailsFastWhenUnreachable(t *testing.T) {
	st := New(t.TempDir())
	start := time.Now()
	err := st.Probe(context.Background(), "127.0.0.1:1/missing-volume:latest")
	elapsed := time.Since(start)
	if err == nil {
		t.Fatal("expected probe failure")
	}
	if !errors.Is(err, ErrResolve) {
		t.Fatalf("want ErrResolve, got %v", err)
	}
	if elapsed > 2*time.Second {
		t.Fatalf("probe should fail fast, took %s", elapsed)
	}
}
