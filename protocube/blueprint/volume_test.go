package blueprint

import (
	"testing"

	"gopkg.in/yaml.v3"
)

func TestArtifactName(t *testing.T) {
	tests := []struct {
		ref  string
		want string
	}{
		{"ghcr.io/protoxon/sls/chunk_runner:latest", "chunk_runner"},
		{"ghcr.io/protoxon/sls/chunk_runner:1.2.0", "chunk_runner"},
		{"localhost:5000/chunk_runner@sha256:abc", "chunk_runner"},
		{"chunk_runner:1.0", "chunk_runner"},
		{"chunk_runner", "chunk_runner"},
		{"", ""},
	}
	for _, tt := range tests {
		if got := artifactName(tt.ref); got != tt.want {
			t.Errorf("artifactName(%q) = %q, want %q", tt.ref, got, tt.want)
		}
	}
}

func TestVolumeNormalizeInfersNameAndMode(t *testing.T) {
	v := Volume{
		Artifact: "ghcr.io/protoxon/sls/chunk_runner:latest",
		Target:   "/world",
	}
	if err := v.Validate(); err != nil {
		t.Fatal(err)
	}
	if v.Name != "chunk_runner" {
		t.Fatalf("name: got %q", v.Name)
	}
	if v.Mode != VolumeModeCOW {
		t.Fatalf("mode: got %q", v.Mode)
	}
}

func TestVolumeKeepsExplicitName(t *testing.T) {
	v := Volume{
		Name:     "extra_plugins",
		Artifact: "ghcr.io/protoxon/sls/worldedit:7.3",
		Target:   "/plugins",
		Mode:     VolumeModeRO,
	}
	if err := v.Validate(); err != nil {
		t.Fatal(err)
	}
	if v.Name != "extra_plugins" {
		t.Fatalf("name: got %q", v.Name)
	}
	if v.Mode != VolumeModeRO {
		t.Fatalf("mode: got %q", v.Mode)
	}
}

func TestVolumeYAMLOmitsName(t *testing.T) {
	var v Volume
	err := yaml.Unmarshal([]byte(`
artifact: ghcr.io/protoxon/sls/chunk_runner:latest
target: /world
`), &v)
	if err != nil {
		t.Fatal(err)
	}
	if err := v.Validate(); err != nil {
		t.Fatal(err)
	}
	if v.Name != "chunk_runner" {
		t.Fatalf("name: got %q", v.Name)
	}
}

func TestStateRejectsDuplicateInferredNames(t *testing.T) {
	s := &State{
		Volumes: []Volume{
			{Artifact: "ghcr.io/a/world:1", Target: "/world"},
			{Artifact: "ghcr.io/b/world:2", Target: "/other"},
		},
	}
	if err := s.Validate(); err == nil {
		t.Fatal("expected duplicate name error")
	}
}

func TestVolumeRejectsArtifactRW(t *testing.T) {
	v := Volume{Artifact: "localhost:5000/world:latest", Mode: VolumeModeRW}
	if err := v.Validate(); err == nil {
		t.Fatal("expected artifact rw to fail")
	}
}

func TestVolumeRejectsArtifactAndSource(t *testing.T) {
	v := Volume{Artifact: "localhost:5000/world:latest", Source: "shared/data", Target: "/data"}
	if err := v.Validate(); err == nil {
		t.Fatal("expected both artifact and source to fail")
	}
}

func TestVolumeLocalRequiresSourceAndTarget(t *testing.T) {
	v := Volume{Name: "data", Source: "shared/data", Mode: VolumeModeRW}
	if err := v.Validate(); err == nil {
		t.Fatal("expected missing target to fail")
	}
	v = Volume{Name: "data", Target: "/data", Mode: VolumeModeRW}
	if err := v.Validate(); err == nil {
		t.Fatal("expected missing source to fail")
	}
}

func TestVolumeLocalRW(t *testing.T) {
	v := Volume{Source: "shared/data", Target: "/data", Mode: VolumeModeRW}
	if err := v.Validate(); err != nil {
		t.Fatal(err)
	}
	if v.Name != "data" {
		t.Fatalf("name: got %q", v.Name)
	}
}

func TestVolumeRejectsCacheSource(t *testing.T) {
	v := Volume{Source: "digests/sha256-abc", Target: "/world", Mode: VolumeModeRW}
	if err := v.Validate(); err == nil {
		t.Fatal("expected cache source to fail")
	}
	v = Volume{Source: "../etc", Target: "/world", Mode: VolumeModeRW}
	if err := v.Validate(); err == nil {
		t.Fatal("expected path escape to fail")
	}
}

func TestMergeStatesReplacesByInferredName(t *testing.T) {
	base := &State{
		Volumes: []Volume{
			{Artifact: "ghcr.io/protoxon/sls/chunk_runner:1.0", Target: "/world"},
		},
	}
	overlay := &State{
		Volumes: []Volume{
			{Artifact: "ghcr.io/protoxon/sls/chunk_runner:2.0", Target: "/world"},
		},
	}

	got := mergeStates(base, overlay)
	if len(got.Volumes) != 1 {
		t.Fatalf("volumes: got %d", len(got.Volumes))
	}
	if got.Volumes[0].Artifact != "ghcr.io/protoxon/sls/chunk_runner:2.0" {
		t.Fatalf("artifact: got %q", got.Volumes[0].Artifact)
	}
	if got.Volumes[0].Name != "chunk_runner" {
		t.Fatalf("name: got %q", got.Volumes[0].Name)
	}
}
