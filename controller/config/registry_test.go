package config

import "testing"

func TestResolveSnapshotUsesDefault(t *testing.T) {
	cfg := RegistryConfiguration{Default: "controller.sls.net:5620/sls"}
	ref, err := cfg.ResolveSnapshot("abc")
	if err != nil {
		t.Fatal(err)
	}
	if ref != "controller.sls.net:5620/sls/snapshots:abc" {
		t.Fatalf("reference %q", ref)
	}
	if got := cfg.SnapshotRepository(); got != "sls/snapshots" {
		t.Fatalf("repository %q", got)
	}
}

func TestResolveSnapshotUsesConfiguredRegistry(t *testing.T) {
	cfg := RegistryConfiguration{
		Default:   "ghcr.io/myorg",
		Snapshots: "https://registry.internal:5000/backups/",
	}
	ref, err := cfg.ResolveSnapshot("abc")
	if err != nil {
		t.Fatal(err)
	}
	if ref != "registry.internal:5000/backups/snapshots:abc" {
		t.Fatalf("reference %q", ref)
	}
	vol, err := cfg.ResolveArtifact("world:1")
	if err != nil {
		t.Fatal(err)
	}
	if vol != "ghcr.io/myorg/world:1" {
		t.Fatalf("volume reference %q", vol)
	}
	if got := cfg.SnapshotRepository(); got != "backups/snapshots" {
		t.Fatalf("repository %q", got)
	}
}

func TestResolveArtifact(t *testing.T) {
	cfg := RegistryConfiguration{Default: "controller.sls.net:5620/sls"}
	tests := []struct{ in, want string }{
		{"slimelabs-core:5000/worlds/missile_wars:latest", "slimelabs-core:5000/worlds/missile_wars:latest"},
		{"slimelabs-core:5000/worlds/missile_wars", "slimelabs-core:5000/worlds/missile_wars:latest"},
		{"10.10.10.11:5000/worlds/missile_wars", "10.10.10.11:5000/worlds/missile_wars:latest"},
		{"ghcr.io/example/world:1", "ghcr.io/example/world:1"},
		{"worlds/missile_wars", "controller.sls.net:5620/worlds/missile_wars:latest"},
		{"world:1", "controller.sls.net:5620/sls/world:1"},
	}
	for _, tt := range tests {
		got, err := cfg.ResolveArtifact(tt.in)
		if err != nil {
			t.Fatalf("ResolveArtifact(%q): %v", tt.in, err)
		}
		if got != tt.want {
			t.Fatalf("ResolveArtifact(%q) = %q, want %q", tt.in, got, tt.want)
		}
	}
}

func TestResolveSnapshotRequiresRegistry(t *testing.T) {
	if _, err := (RegistryConfiguration{}).ResolveSnapshot("abc"); err == nil {
		t.Fatal("expected missing registry to fail")
	}
	if _, err := (RegistryConfiguration{Default: "ghcr.io/myorg"}).ResolveSnapshot("  "); err == nil {
		t.Fatal("expected empty id to fail")
	}
}
