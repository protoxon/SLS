package snapshot

import (
	"context"
	"os"
	"path/filepath"
	"testing"

	"oras.land/oras-go/v2/content/memory"
	"protoxon.com/sls/internal/volume"
)

func TestPackAndMaterializeRoundTrip(t *testing.T) {
	root := t.TempDir()
	layer := filepath.Join(root, "layer")
	if err := os.MkdirAll(layer, 0o755); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(layer, "a.txt"), []byte("hello"), 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.Symlink("a.txt", filepath.Join(layer, "link")); err != nil {
		t.Fatal(err)
	}
	cfg := Config{
		ID: "snap",
		Targets: []Target{{
			Target:   "/plugins",
			Name:     "layer",
			Symlinks: []Symlink{{Path: "link", Target: "a.txt"}},
			Lowers:   []Lower{{Kind: KindServer}},
		}},
	}
	ctx := context.Background()
	mem := memory.New()
	desc, err := Pack(ctx, mem, root, cfg, volume.PackOptions{LayerMaxBytes: 256, LayerMaxFiles: 8, RegistryMaxBytes: 1024})
	if err != nil {
		t.Fatal(err)
	}
	if desc.Digest == "" {
		t.Fatal("missing digest")
	}
	dest := t.TempDir()
	got, err := Materialize(ctx, mem, desc, dest, volume.UnpackOptions{})
	if err != nil {
		t.Fatal(err)
	}
	body, err := os.ReadFile(filepath.Join(dest, "layer", "a.txt"))
	if err != nil {
		t.Fatal(err)
	}
	if string(body) != "hello" {
		t.Fatalf("file %q", body)
	}
	link, err := os.Readlink(filepath.Join(dest, "layer", "link"))
	if err != nil {
		t.Fatal(err)
	}
	if link != "a.txt" {
		t.Fatalf("link %s", link)
	}
	if got.Digest != desc.Digest.String() {
		t.Fatalf("digest %s", got.Digest)
	}
	if _, err := os.Stat(filepath.Join(dest, "layer", ".sls")); !os.IsNotExist(err) {
		t.Fatal("snapshot lowerdir contains .sls")
	}
}
