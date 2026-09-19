package server

import (
	"context"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
	"oras.land/oras-go/v2/content/memory"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/daemon/oras/store"
	"protoxon.com/sls/daemon/oras/volume"
	"protoxon.com/sls/daemon/server/filesystem"
	"protoxon.com/sls/daemon/system"
)

func TestValidateVolumeSpec(t *testing.T) {
	err := validateVolumeSpec(models.Volume{Artifact: "localhost:5000/world:latest", Mode: models.VolumeModeRW})
	if err == nil {
		t.Fatal("artifact rw")
	}
	if !errors.Is(err, ErrInvalidServerConfig) {
		t.Fatalf("artifact rw should be invalid config: %v", err)
	}
	if err := validateVolumeSpec(models.Volume{Artifact: "localhost:5000/world:latest", Source: "shared/data"}); err == nil {
		t.Fatal("artifact and local source")
	} else if !errors.Is(err, ErrInvalidServerConfig) {
		t.Fatalf("artifact and local source should be invalid config: %v", err)
	}
	if err := validateVolumeSpec(models.Volume{Name: "data", Source: "shared/data", Target: "/data", Mode: models.VolumeModeRW}); err != nil {
		t.Fatal(err)
	}
	if err := validateVolumeSpec(models.Volume{Name: "data", Source: "digests/sha256-abc", Target: "/data", Mode: models.VolumeModeRW}); err == nil {
		t.Fatal("cache source")
	} else if !errors.Is(err, ErrInvalidServerConfig) {
		t.Fatalf("cache source should be invalid config: %v", err)
	}
	if err := validateVolumeSpec(models.Volume{Artifact: "localhost:5000/world:latest", Source: "digests/sha256-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", Mode: models.VolumeModeCOW}); err != nil {
		t.Fatal(err)
	}
	if err := validateVolumeSpec(models.Volume{Artifact: "localhost:5000/world:latest", Source: "shared/sha256-aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"}); err == nil {
		t.Fatal("digest basename outside digests/ is not a pin")
	} else if !errors.Is(err, ErrInvalidServerConfig) {
		t.Fatalf("digest basename outside digests/ should be invalid config: %v", err)
	}
}

func TestEnsureVolumesRestoresPinWithoutTagResolve(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte("pin"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	st := store.New(t.TempDir())
	dest, _, _, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	rel, err := filepath.Rel(st.Root, dest)
	if err != nil {
		t.Fatal(err)
	}
	if err := st.SavePins("srv1", []store.Pin{{
		Name:     "world",
		Artifact: "localhost:5000/world:latest",
		Digest:   desc.Digest,
		Source:   filepath.ToSlash(rel),
	}}); err != nil {
		t.Fatal(err)
	}

	s := &Server{
		id:          "srv1",
		volumeStore: st,
		volumes:     []models.Volume{{Name: "world", Artifact: "localhost:5000/world:latest"}},
	}
	if err := s.EnsureVolumes(ctx); err != nil {
		t.Fatal(err)
	}
	if s.volumes[0].Source != filepath.ToSlash(rel) {
		t.Fatalf("source: %q", s.volumes[0].Source)
	}
	refs, err := st.LoadPins("srv1")
	if err != nil || len(refs) != 1 || refs[0].Digest != desc.Digest {
		t.Fatalf("pins after ensure: %+v %v", refs, err)
	}

	if err := s.releaseVolumeRefs(); err != nil {
		t.Fatal(err)
	}
	if pins, err := st.LoadPins("srv1"); err != nil || len(pins) != 0 {
		t.Fatalf("pins after delete: %+v %v", pins, err)
	}
}

func TestEnsureVolumesDropsOldPinOnArtifactChange(t *testing.T) {
	ctx := context.Background()
	st := store.New(t.TempDir())

	pack := func(body string) digest.Digest {
		t.Helper()
		src := t.TempDir()
		if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte(body), 0o644); err != nil {
			t.Fatal(err)
		}
		mem := memory.New()
		desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
		if err != nil {
			t.Fatal(err)
		}
		if _, _, _, err := st.Materialize(ctx, mem, desc, false); err != nil {
			t.Fatal(err)
		}
		return desc.Digest
	}
	oldDigest := pack("old")
	newDigest := pack("new")
	if err := st.SavePins("srv1", []store.Pin{{
		Name:     "world",
		Artifact: "localhost:5000/world:latest",
		Digest:   oldDigest,
		Source:   filepath.ToSlash(st.RelDigestPath(oldDigest)),
	}}); err != nil {
		t.Fatal(err)
	}
	if _, err := st.ReconcileRefs("srv1", []digest.Digest{oldDigest}); err != nil {
		t.Fatal(err)
	}

	s := &Server{
		id:          "srv1",
		volumeStore: st,
		volumes:     []models.Volume{{Name: "world", Artifact: "localhost:5000/other:latest"}},
	}
	// other:latest is not in a registry; seed the new pin as if it already resolved.
	if err := st.SavePins("srv1", []store.Pin{{
		Name:     "world",
		Artifact: "localhost:5000/other:latest",
		Digest:   newDigest,
		Source:   filepath.ToSlash(st.RelDigestPath(newDigest)),
	}}); err != nil {
		t.Fatal(err)
	}
	s.volumes[0].Artifact = "localhost:5000/other:latest"
	if err := s.EnsureVolumes(ctx); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(s.volumes[0].Source, store.DirName(newDigest)) {
		t.Fatalf("expected new digest source, got %q", s.volumes[0].Source)
	}
	pins, err := st.LoadPins("srv1")
	if err != nil || len(pins) != 1 || pins[0].Digest != newDigest {
		t.Fatalf("pins after change: %+v %v", pins, err)
	}
	// Reconcile again: old digest must already have dropped this server.
	dropped, err := st.ReconcileRefs("srv1", []digest.Digest{newDigest})
	if err != nil || dropped {
		t.Fatalf("old ref should already be gone, dropped=%v err=%v", dropped, err)
	}
}

func TestInitVolumesWiresOnce(t *testing.T) {
	volumesRoot := t.TempDir()
	config.Set(&config.Configuration{
		System: config.SystemConfiguration{Volumes: volumesRoot},
	})
	world := filepath.Join(volumesRoot, "worlds", "test")
	if err := os.MkdirAll(world, 0o755); err != nil {
		t.Fatal(err)
	}
	data := t.TempDir()
	ov, err := filesystem.NewOverlayVolume(t.TempDir(), data, t.TempDir())
	if err != nil {
		t.Fatal(err)
	}
	serverFolder := ov.ServerPath
	ov.NewOverlay(system.PathId("/"), []string{serverFolder}, data)
	fs, err := filesystem.New(data, ov, 0, nil)
	if err != nil {
		t.Fatal(err)
	}
	s := &Server{
		id:          "srv-wire",
		volumeStore: store.New(t.TempDir()),
		fs:          fs,
		volumes: []models.Volume{
			{Name: "world", Source: "worlds/test", Target: "world", Mode: models.VolumeModeCOW},
			{Name: "rw", Source: "worlds/test", Target: "data", Mode: models.VolumeModeRW},
		},
	}
	if err := s.initVolumes(context.Background()); err != nil {
		t.Fatal(err)
	}
	if !s.volumesConfigured {
		t.Fatal("expected volumes to be wired")
	}
	if len(s.cfg.VolumeMounts) != 1 {
		t.Fatalf("rw binds: %d", len(s.cfg.VolumeMounts))
	}
	if s.cfg.VolumeMounts[0].Target != "/home/container/data" {
		t.Fatalf("bind target: %q", s.cfg.VolumeMounts[0].Target)
	}
	if len(ov.Overlays) != 2 {
		t.Fatalf("overlays after wire: %d", len(ov.Overlays))
	}
	if err := s.initVolumes(context.Background()); err != nil {
		t.Fatal(err)
	}
	if len(ov.Overlays) != 2 {
		t.Fatalf("second init should not add overlays: %d", len(ov.Overlays))
	}
}

func TestCowTargetDepth(t *testing.T) {
	cases := []struct {
		target string
		depth  int
	}{
		{"/", 0},
		{".", 0},
		{"", 0},
		{"world", 1},
		{"/world", 1},
		{"/world/nether", 2},
		{"world/nether/end", 3},
	}
	for _, c := range cases {
		if got := cowTargetDepth(c.target); got != c.depth {
			t.Fatalf("%q: got %d want %d", c.target, got, c.depth)
		}
	}
}

func TestConfigureMountsReplaceAndSort(t *testing.T) {
	volumesRoot := t.TempDir()
	config.Set(&config.Configuration{
		System: config.SystemConfiguration{Volumes: volumesRoot},
	})
	world := filepath.Join(volumesRoot, "worlds", "test")
	if err := os.MkdirAll(world, 0o755); err != nil {
		t.Fatal(err)
	}
	absWorld, err := filepath.Abs(world)
	if err != nil {
		t.Fatal(err)
	}
	data := t.TempDir()
	serverFolder := t.TempDir()
	ov, err := filesystem.NewOverlayVolume(t.TempDir(), data, serverFolder)
	if err != nil {
		t.Fatal(err)
	}
	ov.NewOverlay(system.PathId("/"), []string{serverFolder}, data)
	fs, err := filesystem.New(data, ov, 0, nil)
	if err != nil {
		t.Fatal(err)
	}
	s := &Server{
		id:          "srv-cow",
		volumeStore: store.New(t.TempDir()),
		fs:          fs,
		volumes: []models.Volume{
			{Name: "nether", Source: "worlds/test", Target: "/world/nether", Mode: models.VolumeModeCOW},
			{Name: "datapack", Source: "worlds/test", Target: "/", Mode: models.VolumeModeCOW},
			{Name: "world", Source: "worlds/test", Target: "/world", Mode: models.VolumeModeCOW},
		},
	}
	if err := s.configureMounts(); err != nil {
		t.Fatal(err)
	}
	if err := s.configureMounts(); err != nil {
		t.Fatal(err)
	}
	if len(ov.Overlays) != 3 {
		t.Fatalf("overlays: %d", len(ov.Overlays))
	}
	root := ov.RootOverlay()
	if len(root.Lower) != 2 || root.Lower[0] != serverFolder || root.Lower[1] != absWorld {
		t.Fatalf("root lowers: %v", root.Lower)
	}
	if ov.Overlays[1].Merged != filepath.Join(data, "world") {
		t.Fatalf("world merged: %q", ov.Overlays[1].Merged)
	}
	if ov.Overlays[2].Merged != filepath.Join(data, "world/nether") {
		t.Fatalf("nether merged: %q", ov.Overlays[2].Merged)
	}
}

func TestEnsureVolumesPinnedMissingDoesNotUseNewerLocal(t *testing.T) {
	ctx := context.Background()
	st := store.New(t.TempDir())
	const artifact = "127.0.0.1:1/world:latest"

	pack := func(body string) (digest.Digest, string) {
		t.Helper()
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
		if err := st.RememberOrigin(desc.Digest, artifact); err != nil {
			t.Fatal(err)
		}
		return desc.Digest, dest
	}
	oldDigest, oldDest := pack("old")
	newDigest, _ := pack("new")
	if oldDigest == newDigest {
		t.Fatal("expected distinct digests")
	}
	if err := st.SavePins("srv-pin", []store.Pin{{
		Name:     "world",
		Artifact: artifact,
		Digest:   oldDigest,
		Source:   filepath.ToSlash(st.RelDigestPath(oldDigest)),
	}}); err != nil {
		t.Fatal(err)
	}
	if err := os.RemoveAll(oldDest); err != nil {
		t.Fatal(err)
	}

	s := &Server{
		id:          "srv-pin",
		volumeStore: st,
		volumes:     []models.Volume{{Name: "world", Artifact: artifact}},
	}
	err := s.EnsureVolumes(ctx)
	if err == nil {
		t.Fatal("expected pinned server to fail closed instead of mounting a newer local tree")
	}
	if !errors.Is(err, store.ErrResolve) && !errors.Is(err, store.ErrNotFound) {
		t.Fatalf("want registry error, got %v", err)
	}
	pins, err := st.LoadPins("srv-pin")
	if err != nil || len(pins) != 1 || pins[0].Digest != oldDigest {
		t.Fatalf("pin must stay on the missing digest, got %+v %v", pins, err)
	}
}

func TestEnsureVolumesUsesLocalWhenRegistryDown(t *testing.T) {
	ctx := context.Background()
	prev := config.Get()
	defer config.Set(prev)
	config.Set(nil)
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte("local"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	st := store.New(t.TempDir())
	dest, _, _, err := st.Materialize(ctx, mem, desc, false)
	if err != nil {
		t.Fatal(err)
	}
	const artifact = "127.0.0.1:1/world:latest"
	if err := st.RememberOrigin(desc.Digest, artifact); err != nil {
		t.Fatal(err)
	}
	rel, err := filepath.Rel(st.Root, dest)
	if err != nil {
		t.Fatal(err)
	}

	config.Set(&config.Configuration{Name: "SLS"})
	s := &Server{
		id:          "srv-offline",
		volumeStore: st,
		volumes:     []models.Volume{{Name: "world", Artifact: artifact}},
	}
	if err := s.EnsureVolumes(ctx); err != nil {
		t.Fatal(err)
	}
	if s.volumes[0].Source != filepath.ToSlash(rel) {
		t.Fatalf("source: %q", s.volumes[0].Source)
	}
	pins, err := st.LoadPins("srv-offline")
	if err != nil || len(pins) != 1 || pins[0].Digest != desc.Digest {
		t.Fatalf("pins: %+v %v", pins, err)
	}
}

func TestEnsureVolumesFailsWhenRegistryDownAndMissingLocal(t *testing.T) {
	s := &Server{
		id:          "srv-missing",
		volumeStore: store.New(t.TempDir()),
		volumes:     []models.Volume{{Name: "world", Artifact: "127.0.0.1:1/missing-volume:latest"}},
	}
	err := s.EnsureVolumes(context.Background())
	if err == nil {
		t.Fatal("expected pull failure without a local tree")
	}
	if !errors.Is(err, store.ErrResolve) && !errors.Is(err, store.ErrNotFound) {
		t.Fatalf("want registry error, got %v", err)
	}
}

func TestProbeVolumesUsesLocal(t *testing.T) {
	prev := config.Get()
	defer config.Set(prev)
	config.Set(nil)
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
	st := store.New(t.TempDir())
	if _, _, _, err := st.Materialize(ctx, mem, desc, false); err != nil {
		t.Fatal(err)
	}
	const artifact = "127.0.0.1:1/world:latest"
	if err := st.RememberOrigin(desc.Digest, artifact); err != nil {
		t.Fatal(err)
	}
	s := &Server{
		id:          "srv-probe-local",
		volumeStore: st,
		volumes:     []models.Volume{{Name: "world", Artifact: artifact}},
	}
	if err := s.probeVolumes(ctx); err != nil {
		t.Fatal(err)
	}
}

func TestProbeVolumesAcceptsDigestSource(t *testing.T) {
	prev := config.Get()
	defer config.Set(prev)
	config.Set(nil)
	ctx := context.Background()
	src := t.TempDir()
	if err := os.WriteFile(filepath.Join(src, "a.txt"), []byte("pin"), 0o644); err != nil {
		t.Fatal(err)
	}
	mem := memory.New()
	desc, err := volume.Pack(ctx, mem, src, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	st := store.New(t.TempDir())
	if _, _, _, err := st.Materialize(ctx, mem, desc, false); err != nil {
		t.Fatal(err)
	}
	s := &Server{
		id:          "srv-probe-digest",
		volumeStore: st,
		volumes: []models.Volume{{
			Name:     "world",
			Artifact: "127.0.0.1:1/world:latest",
			Source:   filepath.ToSlash(st.RelDigestPath(desc.Digest)),
		}},
	}
	if err := s.probeVolumes(ctx); err != nil {
		t.Fatal(err)
	}
}

func TestProbeVolumesFailsWhenMissing(t *testing.T) {
	s := &Server{
		id:          "srv-probe-miss",
		volumeStore: store.New(t.TempDir()),
		volumes:     []models.Volume{{Name: "world", Artifact: "127.0.0.1:1/missing-volume:latest"}},
	}
	err := s.probeVolumes(context.Background())
	if err == nil {
		t.Fatal("expected probe failure without a local tree")
	}
	if !errors.Is(err, store.ErrResolve) && !errors.Is(err, store.ErrNotFound) {
		t.Fatalf("want registry error, got %v", err)
	}
}

func TestProbeVolumesSkipsLocalOnly(t *testing.T) {
	s := &Server{
		id:      "srv-probe-localonly",
		volumes: []models.Volume{{Name: "data", Source: "shared/data", Target: "/data", Mode: models.VolumeModeRW}},
	}
	if err := s.probeVolumes(context.Background()); err != nil {
		t.Fatal(err)
	}
}
