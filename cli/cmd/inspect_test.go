package cmd

import (
	"bytes"
	"encoding/json"
	"strings"
	"testing"

	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/oras/client"
	"protoxon.com/sls/daemon/oras/volume"
)

func testInspectResult() client.InspectResult {
	layerA := digest.Digest("sha256:" + strings.Repeat("a", 64))
	layerB := digest.Digest("sha256:" + strings.Repeat("b", 64))
	manDigest := digest.Digest("sha256:" + strings.Repeat("c", 64))
	cfgDigest := digest.Digest("sha256:" + strings.Repeat("d", 64))
	return client.InspectResult{
		Reference: "localhost:5000/world:latest",
		Descriptor: ocispec.Descriptor{
			MediaType: ocispec.MediaTypeImageManifest,
			Digest:    manDigest,
			Size:      1234,
		},
		Manifest: ocispec.Manifest{
			ArtifactType: volume.ArtifactType,
			Config: ocispec.Descriptor{
				MediaType: volume.ConfigMediaType,
				Digest:    cfgDigest,
				Size:      80,
			},
			Annotations: map[string]string{
				ocispec.AnnotationCreated: "2026-09-19T12:00:00Z",
			},
		},
		Config: volume.Manifest{
			Compression: "zstd",
			MountInfo:   volume.MountInfo{Target: "/world", Mode: "ro"},
			Layers: []volume.LayerInfo{
				{Digest: layerA, Size: 256, Compression: "zstd"},
				{Digest: layerB, Size: 512, Compression: "gzip"},
			},
			Files: []volume.File{
				{Path: "world/level.dat", Size: 8},
				{Path: "world/region/r.0.0.mca", Size: 100},
			},
		},
	}
}

func TestFormatInspect(t *testing.T) {
	var buf bytes.Buffer
	if err := writeInspect(&buf, testInspectResult(), false); err != nil {
		t.Fatal(err)
	}
	got := buf.String()
	for _, want := range []string{
		"localhost:5000/world:latest\n",
		"Digest:       sha256:" + strings.Repeat("c", 64) + "\n",
		"Config:       sha256:" + strings.Repeat("d", 64) + "\n",
		"Created:      2026-09-19T12:00:00Z\n",
		"Artifact:     " + volume.ArtifactType + "\n",
		"Compression:  zstd\n",
		"  Target:     /world\n",
		"  Mode:       ro\n",
		"Layers:       2  (768B compressed)\n",
		"  sha256:" + strings.Repeat("a", 12) + "  256B  zstd\n",
		"  sha256:" + strings.Repeat("b", 12) + "  512B  gzip\n",
		"Files:        2  (108B uncompressed)\n",
	} {
		if !strings.Contains(got, want) {
			t.Fatalf("missing %q in:\n%s", want, got)
		}
	}
	if strings.Contains(got, "push --rewrite") {
		t.Fatalf("unexpected rewrite hint:\n%s", got)
	}
}

func TestFormatInspectEmptyMount(t *testing.T) {
	result := testInspectResult()
	result.Config.MountInfo = volume.MountInfo{}
	var buf bytes.Buffer
	if err := writeInspect(&buf, result, false); err != nil {
		t.Fatal(err)
	}
	got := buf.String()
	if !strings.Contains(got, "  Target:     -\n") || !strings.Contains(got, "  Mode:       -\n") {
		t.Fatalf("empty mount:\n%s", got)
	}
}

func TestFormatInspectFragmented(t *testing.T) {
	result := testInspectResult()
	result.Config.LayerMaxBytes = 400 << 20
	result.Config.Layers = nil
	for i := 0; i < 16; i++ {
		result.Config.Layers = append(result.Config.Layers, volume.LayerInfo{Size: 1 << 20})
	}
	var buf bytes.Buffer
	if err := writeInspect(&buf, result, false); err != nil {
		t.Fatal(err)
	}
	got := buf.String()
	if !strings.Contains(got, "Volume has 16 small layers") || !strings.Contains(got, "sls push --rewrite") {
		t.Fatalf("missing rewrite hint:\n%s", got)
	}
}

func TestWriteInspectJSON(t *testing.T) {
	var buf bytes.Buffer
	result := testInspectResult()
	if err := writeInspect(&buf, result, true); err != nil {
		t.Fatal(err)
	}
	var got client.InspectResult
	if err := json.Unmarshal(buf.Bytes(), &got); err != nil {
		t.Fatal(err)
	}
	if got.Reference != result.Reference || got.Descriptor.Digest != result.Descriptor.Digest {
		t.Fatalf("json round trip: %+v", got)
	}
	if got.Config.MountInfo != result.Config.MountInfo {
		t.Fatalf("mount: %+v", got.Config.MountInfo)
	}
	if len(got.Config.Layers) != 2 || len(got.Config.Files) != 2 {
		t.Fatalf("layers=%d files=%d", len(got.Config.Layers), len(got.Config.Files))
	}
}
