package volume

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"io/fs"
	"os"
	"path/filepath"
	"reflect"
	"strings"
	"syscall"
	"testing"
	"time"

	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"oras.land/oras-go/v2/content"
	"oras.land/oras-go/v2/content/memory"
	"protoxon.com/sls/daemon/oras/volume/compress"
)

func testPackOpts() PackOptions {
	return PackOptions{
		LayerMaxBytes:    256,
		LayerMaxFiles:    8,
		RegistryMaxBytes: 1024,
		Chunking: ChunkingConfig{
			MinSize:     64,
			AverageSize: 96,
			MaxSize:     192,
		},
	}
}

func writeTree(t *testing.T, root string, files map[string]string) {
	t.Helper()
	for rel, body := range files {
		p := filepath.Join(root, filepath.FromSlash(rel))
		if err := os.MkdirAll(filepath.Dir(p), 0o755); err != nil {
			t.Fatal(err)
		}
		if err := os.WriteFile(p, []byte(body), 0o644); err != nil {
			t.Fatal(err)
		}
	}
}

func readTree(t *testing.T, root string) map[string]string {
	t.Helper()
	out := map[string]string{}
	err := filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		rel, err := filepath.Rel(root, path)
		if err != nil {
			return err
		}
		rel = filepath.ToSlash(rel)
		if rel == slsDir || strings.HasPrefix(rel, slsDir+"/") {
			if d.IsDir() {
				return fs.SkipDir
			}
			return nil
		}
		if d.IsDir() {
			return nil
		}
		b, err := os.ReadFile(path)
		if err != nil {
			return err
		}
		out[rel] = string(b)
		return nil
	})
	if err != nil {
		t.Fatal(err)
	}
	return out
}

func packedConfig(t *testing.T, ctx context.Context, src content.Fetcher, desc ocispec.Descriptor) Manifest {
	t.Helper()
	cfg, err := FetchConfig(ctx, src, desc)
	if err != nil {
		t.Fatal(err)
	}
	return cfg
}

func fileDigest(cfg Manifest, path string) string {
	for _, f := range cfg.Files {
		if f.Path == path {
			return f.Digest.String()
		}
	}
	return ""
}

func TestPackUnpackRoundTrip(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat":        "level-v1",
		"world/region/r.0.0.mca": "region-a",
		"plugins/example.jar":    "plugin-bytes",
		"server.properties":      "motd=hello",
	})

	store := memory.New()
	desc, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}

	dest := t.TempDir()
	if err := Unpack(ctx, store, desc, dest); err != nil {
		t.Fatal(err)
	}
	if !reflect.DeepEqual(readTree(t, dest), readTree(t, src)) {
		t.Fatalf("tree mismatch\ngot  %#v\nwant %#v", readTree(t, dest), readTree(t, src))
	}
}

func TestUnpackEmitsMountProgress(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{"world/level.dat": "level"})
	opts := testPackOpts()
	opts.Mount = MountInfo{Target: "/world", Mode: "ro"}
	store := memory.New()
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	var mounts []ProgressEvent
	if err := UnpackWith(ctx, store, desc, t.TempDir(), UnpackOptions{
		Progress: func(ev ProgressEvent) {
			if ev.Kind == ProgressMount {
				mounts = append(mounts, ev)
			}
		},
	}); err != nil {
		t.Fatal(err)
	}
	if len(mounts) != 1 || mounts[0].Name != "/world" || mounts[0].Detail != "ro" {
		t.Fatalf("mount progress: %#v", mounts)
	}

	opts.Mount = MountInfo{}
	bare, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	mounts = nil
	if err := UnpackWith(ctx, store, bare, t.TempDir(), UnpackOptions{
		Progress: func(ev ProgressEvent) {
			if ev.Kind == ProgressMount {
				mounts = append(mounts, ev)
			}
		},
	}); err != nil {
		t.Fatal(err)
	}
	if len(mounts) != 0 {
		t.Fatalf("empty mount should be silent: %#v", mounts)
	}
}

func TestFetchArtifact(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{"world/level.dat": "level"})
	opts := testPackOpts()
	opts.Mount = MountInfo{Target: "/world", Mode: "ro"}
	store := memory.New()
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	man, cfg, err := FetchArtifact(ctx, store, desc)
	if err != nil {
		t.Fatal(err)
	}
	if man.ArtifactType != ArtifactType {
		t.Fatalf("artifact type: %q", man.ArtifactType)
	}
	if cfg.MountInfo != (MountInfo{Target: "/world", Mode: "ro"}) {
		t.Fatalf("config mount: %#v", cfg.MountInfo)
	}
	if len(cfg.Layers) == 0 || cfg.LayerBytes() == 0 {
		t.Fatalf("layers=%d bytes=%d", len(cfg.Layers), cfg.LayerBytes())
	}
	if cfg.FileBytes() == 0 {
		t.Fatalf("file bytes=%d", cfg.FileBytes())
	}
}

func TestUnpackWritesMountJSON(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{"world/level.dat": "level"})
	opts := testPackOpts()
	opts.Mount = MountInfo{Target: "/home/container/world", Mode: "ro"}
	store := memory.New()
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	dest := t.TempDir()
	if err := Unpack(ctx, store, desc, dest); err != nil {
		t.Fatal(err)
	}
	got, err := ReadMount(dest)
	if err != nil {
		t.Fatal(err)
	}
	if got.Artifact != desc.Digest {
		t.Fatalf("mount artifact %s, want %s", got.Artifact, desc.Digest)
	}
	if got.Target != opts.Mount.Target || got.Mode != opts.Mount.Mode {
		t.Fatalf("mount sidecar: %#v", got)
	}

	opts.Mount = MountInfo{Target: "/data", Mode: "rw"}
	next, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	if err := Unpack(ctx, store, next, dest); err != nil {
		t.Fatal(err)
	}
	got, err = ReadMount(dest)
	if err != nil {
		t.Fatal(err)
	}
	if got.Artifact != next.Digest || got.Target != "/data" || got.Mode != "rw" {
		t.Fatalf("mount sidecar not updated: %#v", got)
	}
}

func TestUnpackSkipSidecarOmitsMountJSON(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{"world/level.dat": "level"})
	opts := testPackOpts()
	opts.Mount = MountInfo{Target: "/world", Mode: "ro"}
	store := memory.New()
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	dest := t.TempDir()
	if err := UnpackWith(ctx, store, desc, dest, UnpackOptions{SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}
	got, err := ReadMount(dest)
	if err != nil {
		t.Fatal(err)
	}
	if got != (SidecarMount{}) {
		t.Fatalf("CLI pull should not write mount.json: %#v", got)
	}
	if _, err := os.Stat(filepath.Join(dest, slsDir, mountFile)); !os.IsNotExist(err) {
		t.Fatalf("expected no mount.json, err=%v", err)
	}
}

func TestPackDeterministicFileDigests(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat":   "level",
		"plugins/mod.jar":   "mod",
		"server.properties": "online-mode=true",
	})

	a, b := memory.New(), memory.New()
	da, err := Pack(ctx, a, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	db, err := Pack(ctx, b, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	ca, cb := packedConfig(t, ctx, a, da), packedConfig(t, ctx, b, db)
	if !reflect.DeepEqual(ca.Files, cb.Files) {
		t.Fatalf("files differ\n%#v\n%#v", ca.Files, cb.Files)
	}
}

func TestUnpackSkipsUnchangedFiles(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat":   "level",
		"plugins/mod.jar":   "mod",
		"server.properties": "a=1",
	})
	store := memory.New()
	desc, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	dest := t.TempDir()
	if err := Unpack(ctx, store, desc, dest); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(dest, "world", "marker"), []byte("keep"), 0o644); err != nil {
		t.Fatal(err)
	}
	if err := Unpack(ctx, store, desc, dest); err != nil {
		t.Fatal(err)
	}
	got, err := os.ReadFile(filepath.Join(dest, "world", "marker"))
	if err != nil {
		t.Fatal(err)
	}
	if string(got) != "keep" {
		t.Fatalf("expected skip to preserve marker, got %q", got)
	}
}

func TestUnpackUpdatesChangedFileOnly(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat":   "level-v1",
		"plugins/mod.jar":   "mod-v1",
		"server.properties": "a=1",
	})
	first := memory.New()
	d1, err := Pack(ctx, first, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	dest := t.TempDir()
	if err := Unpack(ctx, first, d1, dest); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(dest, "world", "marker"), []byte("keep"), 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(src, "plugins", "mod.jar"), []byte("mod-v2"), 0o644); err != nil {
		t.Fatal(err)
	}

	c1 := packedConfig(t, ctx, first, d1)
	second := memory.New()
	d2, err := Pack(ctx, second, src, PackOptions{
		LayerMaxBytes:    testPackOpts().LayerMaxBytes,
		LayerMaxFiles:    testPackOpts().LayerMaxFiles,
		RegistryMaxBytes: testPackOpts().RegistryMaxBytes,
		Chunking:         testPackOpts().Chunking,
		Previous:         &c1,
	})
	if err != nil {
		t.Fatal(err)
	}
	c2 := packedConfig(t, ctx, second, d2)
	if fileDigest(c1, "world/level.dat") != fileDigest(c2, "world/level.dat") {
		t.Fatal("world file digest shifted")
	}
	if fileDigest(c1, "plugins/mod.jar") == fileDigest(c2, "plugins/mod.jar") {
		t.Fatal("plugins digest did not change")
	}

	if err := Unpack(ctx, second, d2, dest); err != nil {
		t.Fatal(err)
	}
	got := readTree(t, dest)
	if got["plugins/mod.jar"] != "mod-v2" {
		t.Fatalf("plugins not updated: %q", got["plugins/mod.jar"])
	}
	if got["world/marker"] != "keep" {
		t.Fatal("unrelated extra file was removed")
	}
	if got["world/level.dat"] != "level-v1" {
		t.Fatalf("world content lost: %q", got["world/level.dat"])
	}
}

func TestUnpackAddsAndDeletesFiles(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat": "level",
		"plugins/mod.jar": "mod",
	})
	first := memory.New()
	d1, err := Pack(ctx, first, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	dest := t.TempDir()
	if err := Unpack(ctx, first, d1, dest); err != nil {
		t.Fatal(err)
	}

	if err := os.Remove(filepath.Join(src, "plugins", "mod.jar")); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(src, "world", "new.dat"), []byte("new"), 0o644); err != nil {
		t.Fatal(err)
	}

	c1 := packedConfig(t, ctx, first, d1)
	second := memory.New()
	d2, err := Pack(ctx, second, src, PackOptions{
		LayerMaxBytes:    testPackOpts().LayerMaxBytes,
		LayerMaxFiles:    testPackOpts().LayerMaxFiles,
		RegistryMaxBytes: testPackOpts().RegistryMaxBytes,
		Chunking:         testPackOpts().Chunking,
		Previous:         &c1,
	})
	if err != nil {
		t.Fatal(err)
	}
	c2 := packedConfig(t, ctx, second, d2)
	if fileDigest(c1, "world/level.dat") != fileDigest(c2, "world/level.dat") {
		t.Fatal("adding a file shifted an existing file digest")
	}

	if err := Unpack(ctx, second, d2, dest); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(filepath.Join(dest, "plugins", "mod.jar")); !os.IsNotExist(err) {
		t.Fatalf("expected deleted file to be removed, err=%v", err)
	}
	got, err := os.ReadFile(filepath.Join(dest, "world", "new.dat"))
	if err != nil {
		t.Fatal(err)
	}
	if string(got) != "new" {
		t.Fatalf("new file: %q", got)
	}
}

func TestLargeFileIsSplit(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	payload := bytes.Repeat([]byte("0123456789abcdef"), 40) // 640 bytes
	writeTree(t, src, map[string]string{
		"world/big.bin": string(payload),
	})
	store := memory.New()
	opts := testPackOpts()
	opts.LayerMaxBytes = 128
	opts.RegistryMaxBytes = 256
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	cfg := packedConfig(t, ctx, store, desc)
	if len(cfg.Files) != 1 {
		t.Fatalf("files: %d", len(cfg.Files))
	}
	if len(cfg.Files[0].Parts) < 2 {
		t.Fatalf("expected multiple parts, got %d", len(cfg.Files[0].Parts))
	}
	for _, part := range cfg.Files[0].Parts {
		if part.Size > opts.RegistryMaxBytes {
			t.Fatalf("part %d larger than registry max", part.Size)
		}
		if part.Layer == "" {
			t.Fatal("part missing layer")
		}
	}
	dest := t.TempDir()
	if err := Unpack(ctx, store, desc, dest); err != nil {
		t.Fatal(err)
	}
	got, err := os.ReadFile(filepath.Join(dest, "world", "big.bin"))
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(got, payload) {
		t.Fatalf("round trip mismatch: %d vs %d", len(got), len(payload))
	}
}

type recordingStore struct {
	content.Fetcher
	rangeOK    bool
	rangeCalls int
	fetchCalls int
	rangeBytes int64
}

func (s *recordingStore) Fetch(ctx context.Context, desc ocispec.Descriptor) (io.ReadCloser, error) {
	if desc.MediaType == LayerMediaType {
		s.fetchCalls++
	}
	return s.Fetcher.Fetch(ctx, desc)
}

func (s *recordingStore) FetchRange(ctx context.Context, desc ocispec.Descriptor, offset, size int64) ([]byte, error) {
	s.rangeCalls++
	if !s.rangeOK {
		return nil, errNoRange
	}
	raw, err := content.FetchAll(ctx, s.Fetcher, desc)
	if err != nil {
		return nil, err
	}
	s.rangeBytes += size
	return raw[offset : offset+size], nil
}

func TestUnpackRangeVersusFallback(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/a":           "aaaa",
		"world/b":           "bbbb",
		"plugins/mod.jar":   "mod",
		"server.properties": "x=1",
	})
	store := memory.New()
	desc, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}

	var rangeEvents []string
	progress := func(ev ProgressEvent) {
		if ev.Kind == ProgressRange && (ev.Detail == RangeSupported || ev.Detail == RangeFallback) {
			rangeEvents = append(rangeEvents, ev.Detail)
		}
	}

	ranged := &recordingStore{Fetcher: store, rangeOK: true}
	dest1 := t.TempDir()
	if err := UnpackWith(ctx, ranged, desc, dest1, UnpackOptions{DeleteMissing: true, Progress: progress}); err != nil {
		t.Fatal(err)
	}
	if ranged.rangeCalls == 0 && ranged.fetchCalls == 0 {
		t.Fatal("expected layer data to be fetched")
	}
	if ranged.rangeCalls > 0 && (len(rangeEvents) != 1 || rangeEvents[0] != RangeSupported) {
		t.Fatalf("range progress: %v", rangeEvents)
	}

	rangeEvents = nil
	fallback := &recordingStore{Fetcher: store, rangeOK: false}
	dest2 := t.TempDir()
	if err := UnpackWith(ctx, fallback, desc, dest2, UnpackOptions{DeleteMissing: true, Progress: progress}); err != nil {
		t.Fatal(err)
	}
	if fallback.fetchCalls == 0 {
		t.Fatal("expected whole-layer fetches")
	}
	if fallback.rangeCalls > 0 && (len(rangeEvents) != 1 || rangeEvents[0] != RangeFallback) {
		t.Fatalf("fallback progress: %v", rangeEvents)
	}
	if !reflect.DeepEqual(readTree(t, dest1), readTree(t, dest2)) {
		t.Fatal("range and fallback dest trees differ")
	}
}

func TestUnpackHashDestIgnoresSidecar(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat": "level-v1",
		"plugins/mod.jar": "mod",
	})
	store := memory.New()
	desc, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}

	dest := t.TempDir()
	writeTree(t, dest, map[string]string{
		"world/level.dat": "level-v1",
		"plugins/mod.jar": "mod",
		"world/notes.txt": "local",
	})
	opts := UnpackOptions{HashDest: true, SkipSidecar: true}
	matched := &recordingStore{Fetcher: store, rangeOK: true}
	if err := UnpackWith(ctx, matched, desc, dest, opts); err != nil {
		t.Fatal(err)
	}
	if matched.rangeCalls != 0 || matched.fetchCalls != 0 {
		t.Fatalf("matching dest files should not be fetched, range=%d fetch=%d", matched.rangeCalls, matched.fetchCalls)
	}

	if err := os.WriteFile(filepath.Join(dest, "world", "level.dat"), []byte("edited"), 0o644); err != nil {
		t.Fatal(err)
	}
	edited := &recordingStore{Fetcher: store, rangeOK: true}
	if err := UnpackWith(ctx, edited, desc, dest, opts); err != nil {
		t.Fatal(err)
	}
	if edited.rangeCalls == 0 && edited.fetchCalls == 0 {
		t.Fatal("edited dest file should be fetched from remote")
	}

	got := readTree(t, dest)
	if got["world/level.dat"] != "level-v1" {
		t.Fatalf("edited file not restored from remote: %q", got["world/level.dat"])
	}
	if got["plugins/mod.jar"] != "mod" {
		t.Fatal("matching dest file was rewritten incorrectly")
	}
	if got["world/notes.txt"] != "local" {
		t.Fatal("untracked local file was removed")
	}
	if _, err := os.Stat(filepath.Join(dest, slsDir)); err == nil {
		t.Fatal("HashDest pull should not write a sidecar")
	}
}

func TestUnpackTrustMtimeSkipsHash(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat": "level-v1",
		"plugins/mod.jar": "mod",
	})
	srcInfo, err := os.Stat(filepath.Join(src, "world", "level.dat"))
	if err != nil {
		t.Fatal(err)
	}
	store := memory.New()
	desc, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	cfg := packedConfig(t, ctx, store, desc)
	if cfg.Files[0].Mtime == 0 {
		t.Fatal("packed file missing mtime")
	}

	dest := t.TempDir()
	if err := Unpack(ctx, store, desc, dest); err != nil {
		t.Fatal(err)
	}
	gotInfo, err := os.Stat(filepath.Join(dest, "world", "level.dat"))
	if err != nil {
		t.Fatal(err)
	}
	if gotInfo.ModTime().Unix() != srcInfo.ModTime().Unix() {
		t.Fatalf("extract mtime %d != source %d", gotInfo.ModTime().Unix(), srcInfo.ModTime().Unix())
	}

	opts := UnpackOptions{HashDest: true, TrustMtime: true, SkipSidecar: true}
	untouched := &recordingStore{Fetcher: store, rangeOK: true}
	if err := UnpackWith(ctx, untouched, desc, dest, opts); err != nil {
		t.Fatal(err)
	}
	if untouched.rangeCalls != 0 || untouched.fetchCalls != 0 {
		t.Fatalf("matching mtime should skip fetch, range=%d fetch=%d", untouched.rangeCalls, untouched.fetchCalls)
	}

	level := filepath.Join(dest, "world", "level.dat")
	now := time.Now().Add(time.Hour)
	if err := os.Chtimes(level, now, now); err != nil {
		t.Fatal(err)
	}
	touched := &recordingStore{Fetcher: store, rangeOK: true}
	if err := UnpackWith(ctx, touched, desc, dest, opts); err != nil {
		t.Fatal(err)
	}
	if touched.rangeCalls != 0 || touched.fetchCalls != 0 {
		t.Fatalf("mtime change with same bytes should rehash but not fetch, range=%d fetch=%d", touched.rangeCalls, touched.fetchCalls)
	}

	if err := os.WriteFile(level, []byte("edited"), 0o644); err != nil {
		t.Fatal(err)
	}
	edited := &recordingStore{Fetcher: store, rangeOK: true}
	if err := UnpackWith(ctx, edited, desc, dest, opts); err != nil {
		t.Fatal(err)
	}
	if edited.rangeCalls == 0 && edited.fetchCalls == 0 {
		t.Fatal("content change should fetch from remote")
	}
	got, err := os.ReadFile(level)
	if err != nil {
		t.Fatal(err)
	}
	if string(got) != "level-v1" {
		t.Fatalf("edited file not restored: %q", got)
	}
}

func TestMergeLayerSpans(t *testing.T) {
	spans := mergeLayerSpans([]Part{
		{Offset: 10, Size: 5},
		{Offset: 0, Size: 10},
		{Offset: 20, Size: 3},
	})
	if len(spans) != 2 {
		t.Fatalf("spans: %d", len(spans))
	}
	if spans[0].offset != 0 || spans[0].size != 15 || spans[0].parts != 2 {
		t.Fatalf("first span: %+v", spans[0])
	}
	if spans[1].offset != 20 || spans[1].size != 3 || spans[1].parts != 1 {
		t.Fatalf("second span: %+v", spans[1])
	}
}

func TestUnpackCoalescesAdjacentRanges(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/a": "aaaa",
		"world/b": "bbbb",
		"world/c": "cccc",
	})
	store := memory.New()
	desc, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	cfg := packedConfig(t, ctx, store, desc)
	layer := cfg.Files[0].Parts[0].Layer
	for _, file := range cfg.Files {
		if file.Parts[0].Layer != layer {
			t.Fatal("expected all files in one layer")
		}
	}

	full := &recordingStore{Fetcher: store, rangeOK: true}
	dest := t.TempDir()
	if err := UnpackWith(ctx, full, desc, dest, UnpackOptions{HashDest: true, SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}
	if full.fetchCalls != 1 {
		t.Fatalf("contiguous full layer should be one GET, fetch=%d range=%d", full.fetchCalls, full.rangeCalls)
	}
	if full.rangeCalls != 0 {
		t.Fatalf("full layer should not use per-file ranges, got %d", full.rangeCalls)
	}

	gap := t.TempDir()
	writeTree(t, gap, map[string]string{"world/b": "bbbb"})
	partial := &recordingStore{Fetcher: store, rangeOK: true}
	if err := UnpackWith(ctx, partial, desc, gap, UnpackOptions{HashDest: true, SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}
	if partial.rangeCalls != 2 {
		t.Fatalf("gap in the middle should be two ranges, got %d (fetch=%d)", partial.rangeCalls, partial.fetchCalls)
	}
	if partial.fetchCalls != 0 {
		t.Fatalf("partial pull should not fetch whole layer, got %d", partial.fetchCalls)
	}
	if !reflect.DeepEqual(readTree(t, gap), readTree(t, src)) {
		t.Fatal("gapped pull dest tree mismatch")
	}
}

func TestUnpackDeleteExtraRemovesGoneFiles(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/keep.dat":  "keep",
		"world/gone.dat":  "gone",
		"plugins/mod.jar": "mod",
	})
	store := memory.New()
	first, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	dest := t.TempDir()
	if err := UnpackWith(ctx, store, first, dest, UnpackOptions{HashDest: true, SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}

	if err := os.Remove(filepath.Join(src, "world", "gone.dat")); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(dest, "world", "notes.txt"), []byte("local"), 0o644); err != nil {
		t.Fatal(err)
	}
	second, err := Pack(ctx, store, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}

	if err := UnpackWith(ctx, store, second, dest, UnpackOptions{HashDest: true, SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}
	got := readTree(t, dest)
	if got["world/gone.dat"] != "gone" || got["world/notes.txt"] != "local" {
		t.Fatalf("default pull should keep extra dest files: %#v", got)
	}

	if err := UnpackWith(ctx, store, second, dest, UnpackOptions{HashDest: true, SkipSidecar: true, DeleteExtra: true}); err != nil {
		t.Fatal(err)
	}
	got = readTree(t, dest)
	if _, ok := got["world/gone.dat"]; ok {
		t.Fatal("gone remote file should be deleted")
	}
	if _, ok := got["world/notes.txt"]; ok {
		t.Fatal("untracked dest file should be deleted")
	}
	if got["world/keep.dat"] != "keep" || got["plugins/mod.jar"] != "mod" {
		t.Fatalf("kept files missing: %#v", got)
	}
}

func TestLayerResolvedCompression(t *testing.T) {
	if got := (LayerInfo{}).resolvedCompression(""); got != "zstd" {
		t.Fatalf("empty layer, empty manifest: %s", got)
	}
	if got := (LayerInfo{}).resolvedCompression("gzip"); got != "gzip" {
		t.Fatalf("empty layer should use manifest: %s", got)
	}
	if got := (LayerInfo{Compression: "none"}).resolvedCompression("gzip"); got != "none" {
		t.Fatalf("layer should win: %s", got)
	}
	codec, err := (Manifest{Compression: "gzip"}).codecForLayer(LayerInfo{})
	if err != nil {
		t.Fatal(err)
	}
	if codec.Name() != "gzip" {
		t.Fatalf("fallback codec: %s", codec.Name())
	}
}

func TestPackUnknownCompression(t *testing.T) {
	opts := testPackOpts()
	opts.Compression = "lz4"
	if _, err := Pack(context.Background(), memory.New(), t.TempDir(), opts); err == nil {
		t.Fatal("expected unknown compression to fail")
	}
}

func TestPackGzipAndNoneRoundTrip(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat": "level",
		"plugins/mod.jar": "mod",
	})
	for _, name := range []string{"zstd", "gzip", "none"} {
		opts := testPackOpts()
		opts.Compression = compress.Compression(name)
		store := memory.New()
		desc, err := Pack(ctx, store, src, opts)
		if err != nil {
			t.Fatalf("%s: %v", name, err)
		}
		cfg := packedConfig(t, ctx, store, desc)
		if cfg.Compression != name {
			t.Fatalf("%s: manifest compression %q", name, cfg.Compression)
		}
		if len(cfg.Layers) == 0 {
			t.Fatalf("%s: no layers", name)
		}
		for _, layer := range cfg.Layers {
			if layer.Compression != name {
				t.Fatalf("%s: layer %s has %q", name, layer.Digest, layer.Compression)
			}
		}
		dest := t.TempDir()
		if err := Unpack(ctx, store, desc, dest); err != nil {
			t.Fatalf("%s unpack: %v", name, err)
		}
		if !reflect.DeepEqual(readTree(t, dest), readTree(t, src)) {
			t.Fatalf("%s tree mismatch", name)
		}
	}
}

func TestPackReusesPreviousAcrossCompressionChange(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/keep.dat":  "keep",
		"plugins/mod.jar": "mod-v1",
	})
	store := memory.New()
	opts := testPackOpts()
	opts.Compression = compress.CompressionZstd
	d1, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	c1 := packedConfig(t, ctx, store, d1)

	if err := os.WriteFile(filepath.Join(src, "plugins", "mod.jar"), []byte("mod-v2"), 0o644); err != nil {
		t.Fatal(err)
	}
	opts.Compression = compress.CompressionGzip
	opts.Previous = &c1
	d2, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	c2 := packedConfig(t, ctx, store, d2)
	if c2.Compression != "gzip" {
		t.Fatalf("new pack should record gzip, got %q", c2.Compression)
	}

	var keep, changed File
	for _, file := range c2.Files {
		switch file.Path {
		case "world/keep.dat":
			keep = file
		case "plugins/mod.jar":
			changed = file
		}
	}
	if len(keep.Parts) == 0 || len(changed.Parts) == 0 {
		t.Fatal("missing parts")
	}
	keepLayer, ok := c2.layerInfo(keep.Parts[0].Layer)
	if !ok || keepLayer.Compression != "zstd" {
		t.Fatalf("reused file should stay on zstd layer: %#v", keepLayer)
	}
	changedLayer, ok := c2.layerInfo(changed.Parts[0].Layer)
	if !ok || changedLayer.Compression != "gzip" {
		t.Fatalf("rewritten file should be gzip: %#v", changedLayer)
	}
	if keep.Parts[0].Layer == changed.Parts[0].Layer {
		t.Fatal("reused and rewritten files should not share a layer")
	}

	dest := t.TempDir()
	if err := Unpack(ctx, store, d2, dest); err != nil {
		t.Fatal(err)
	}
	got := readTree(t, dest)
	if got["world/keep.dat"] != "keep" || got["plugins/mod.jar"] != "mod-v2" {
		t.Fatalf("mixed-codec unpack: %#v", got)
	}
}

func fileInode(t *testing.T, path string) uint64 {
	t.Helper()
	info, err := os.Stat(path)
	if err != nil {
		t.Fatal(err)
	}
	st, ok := info.Sys().(*syscall.Stat_t)
	if !ok {
		t.Fatal("stat is not syscall.Stat_t")
	}
	return st.Ino
}

func TestUnpackCASHardlinksAndSkipsFetch(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"world/level.dat": "level",
		"plugins/mod.jar": "mod",
	})
	mem := memory.New()
	desc, err := Pack(ctx, mem, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	cas := t.TempDir()
	first := t.TempDir()
	fetched := &recordingStore{Fetcher: mem, rangeOK: true}
	if err := UnpackWith(ctx, fetched, desc, first, UnpackOptions{CASRoot: cas, DeleteMissing: true}); err != nil {
		t.Fatal(err)
	}
	if fetched.rangeCalls == 0 && fetched.fetchCalls == 0 {
		t.Fatal("first cas unpack should fetch")
	}
	if !reflect.DeepEqual(readTree(t, first), readTree(t, src)) {
		t.Fatal("first cas dest mismatch")
	}

	second := t.TempDir()
	cached := &recordingStore{Fetcher: mem, rangeOK: true}
	if err := UnpackWith(ctx, cached, desc, second, UnpackOptions{CASRoot: cas, DeleteMissing: true}); err != nil {
		t.Fatal(err)
	}
	if cached.rangeCalls != 0 || cached.fetchCalls != 0 {
		t.Fatalf("cas hit should not fetch, range=%d fetch=%d", cached.rangeCalls, cached.fetchCalls)
	}
	if fileInode(t, filepath.Join(first, "world", "level.dat")) != fileInode(t, filepath.Join(second, "world", "level.dat")) {
		t.Fatal("cas dests should share inodes")
	}

	copied := t.TempDir()
	if err := UnpackWith(ctx, mem, desc, copied, UnpackOptions{CASRoot: cas, CopyFiles: true, DeleteMissing: true}); err != nil {
		t.Fatal(err)
	}
	if fileInode(t, filepath.Join(first, "world", "level.dat")) == fileInode(t, filepath.Join(copied, "world", "level.dat")) {
		t.Fatal("CopyFiles should not share inodes")
	}
	if !reflect.DeepEqual(readTree(t, copied), readTree(t, src)) {
		t.Fatal("copy dest mismatch")
	}
}

func TestUnpackStatsCountsFetchedBytes(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{"a.txt": "hello"})
	mem := memory.New()
	desc, err := Pack(ctx, mem, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	stats := &UnpackStats{}
	if err := UnpackWith(ctx, mem, desc, t.TempDir(), UnpackOptions{Stats: stats}); err != nil {
		t.Fatal(err)
	}
	if stats.FetchedBytes <= 0 {
		t.Fatal("expected fetched bytes")
	}
}

func TestUnpackOwnsDestAndCAS(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{"world/datapacks/pack.mcmeta": "{}"})
	mem := memory.New()
	desc, err := Pack(ctx, mem, src, testPackOpts())
	if err != nil {
		t.Fatal(err)
	}
	owner := &Owner{Uid: os.Getuid(), Gid: os.Getgid()}
	cas := t.TempDir()
	dest := t.TempDir()
	if err := UnpackWith(ctx, mem, desc, dest, UnpackOptions{Owner: owner, CASRoot: cas, DeleteMissing: true}); err != nil {
		t.Fatal(err)
	}
	cfg, err := FetchConfig(ctx, mem, desc)
	if err != nil {
		t.Fatal(err)
	}
	var file File
	for _, f := range cfg.Files {
		if f.Path == "world/datapacks/pack.mcmeta" {
			file = f
			break
		}
	}
	casPath, err := CASPath(cas, file.Digest)
	if err != nil {
		t.Fatal(err)
	}
	for _, path := range []string{
		dest,
		filepath.Join(dest, "world"),
		filepath.Join(dest, "world", "datapacks"),
		filepath.Join(dest, "world", "datapacks", "pack.mcmeta"),
		casPath,
	} {
		info, err := os.Stat(path)
		if err != nil {
			t.Fatal(err)
		}
		st := info.Sys().(*syscall.Stat_t)
		if int(st.Uid) != owner.Uid || int(st.Gid) != owner.Gid {
			t.Fatalf("%s owner %d:%d want %d:%d", path, st.Uid, st.Gid, owner.Uid, owner.Gid)
		}
	}
	if fileInode(t, filepath.Join(dest, "world", "datapacks", "pack.mcmeta")) != fileInode(t, casPath) {
		t.Fatal("dest should hardlink cas")
	}
}

func TestPackEmitsRewriteHintWhenFragmented(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	files := map[string]string{}
	for i := 0; i < 16; i++ {
		files[fmt.Sprintf("f/%d.txt", i)] = fmt.Sprintf("payload-%d", i)
	}
	writeTree(t, src, files)
	opts := testPackOpts()
	opts.LayerMaxBytes = 400 << 20
	opts.LayerMaxFiles = 1
	opts.RegistryMaxBytes = 400 << 20
	store := memory.New()
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	prev := packedConfig(t, ctx, store, desc)
	if !prev.Fragmented() {
		t.Fatalf("setup: layers=%d avg=%d", len(prev.Layers), prev.avgLayerBytes())
	}
	var hints []ProgressEvent
	opts.Previous = &prev
	opts.Progress = func(ev ProgressEvent) {
		if ev.Kind == ProgressRewriteHint {
			hints = append(hints, ev)
		}
	}
	if _, err := Pack(ctx, memory.New(), src, opts); err != nil {
		t.Fatal(err)
	}
	if len(hints) != 1 || hints[0].Count != len(prev.Layers) {
		t.Fatalf("hints: %+v", hints)
	}
}

func TestUnpackStreamsWhenOverInMemoryMax(t *testing.T) {
	prev := inMemoryExtractMax
	inMemoryExtractMax = 8
	defer func() { inMemoryExtractMax = prev }()

	ctx := context.Background()
	src := t.TempDir()
	payload := bytes.Repeat([]byte("0123456789abcdef"), 40)
	writeTree(t, src, map[string]string{"world/big.bin": string(payload)})
	store := memory.New()
	opts := testPackOpts()
	opts.LayerMaxBytes = 128
	opts.RegistryMaxBytes = 256
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	cfg := packedConfig(t, ctx, store, desc)
	if len(cfg.Files) != 1 || cfg.Files[0].Size <= inMemoryExtractMax {
		t.Fatalf("need a file over the in-memory max, got %+v", cfg.Files)
	}
	if len(cfg.Files[0].Parts) < 2 {
		t.Fatalf("need multiple parts, got %d", len(cfg.Files[0].Parts))
	}

	dest := t.TempDir()
	cas := t.TempDir()
	if err := UnpackWith(ctx, store, desc, dest, UnpackOptions{CASRoot: cas, DeleteMissing: true}); err != nil {
		t.Fatal(err)
	}
	got, err := os.ReadFile(filepath.Join(dest, "world", "big.bin"))
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(got, payload) {
		t.Fatalf("streamed cas unpack mismatch: %d vs %d", len(got), len(payload))
	}
	if !hasCAS(cas, cfg.Files[0].Digest) {
		t.Fatal("expected cas object")
	}

	cli := t.TempDir()
	if err := UnpackWith(ctx, store, desc, cli, UnpackOptions{HashDest: true, SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}
	got, err = os.ReadFile(filepath.Join(cli, "world", "big.bin"))
	if err != nil {
		t.Fatal(err)
	}
	if !bytes.Equal(got, payload) {
		t.Fatalf("streamed dest unpack mismatch: %d vs %d", len(got), len(payload))
	}
}

func TestLayerPullerEvictsAfterLastPart(t *testing.T) {
	ctx := context.Background()
	src := t.TempDir()
	writeTree(t, src, map[string]string{
		"a.txt": strings.Repeat("a", 80),
		"b.txt": strings.Repeat("b", 80),
	})
	store := memory.New()
	opts := testPackOpts()
	opts.LayerMaxFiles = 1
	desc, err := Pack(ctx, store, src, opts)
	if err != nil {
		t.Fatal(err)
	}
	cfg := packedConfig(t, ctx, store, desc)
	if len(cfg.Files) != 2 {
		t.Fatalf("files: %d", len(cfg.Files))
	}
	if cfg.Files[0].Parts[0].Layer == cfg.Files[1].Parts[0].Layer {
		t.Fatal("expected files on different layers")
	}

	puller := newLayerPuller(store, nil, nil)
	puller.plan(cfg.Files)
	if err := extractFile(ctx, puller, &cfg, t.TempDir(), t.TempDir(), cfg.Files[0], UnpackOptions{SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}
	firstLayer := cfg.Files[0].Parts[0].Layer.String()
	if _, ok := puller.spans[firstLayer]; ok {
		t.Fatal("first file layer should be evicted")
	}
	if _, ok := puller.cache[firstLayer]; ok {
		t.Fatal("first file layer cache should be evicted")
	}
	if puller.cachedLayerCount() > 1 {
		t.Fatalf("live layers after first file: %d", puller.cachedLayerCount())
	}

	if err := extractFile(ctx, puller, &cfg, t.TempDir(), t.TempDir(), cfg.Files[1], UnpackOptions{SkipSidecar: true}); err != nil {
		t.Fatal(err)
	}
	if puller.cachedLayerCount() != 0 {
		t.Fatalf("expected no cached layers, got %d", puller.cachedLayerCount())
	}
}
