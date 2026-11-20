package client

import "testing"

func TestParseReferenceRequiresRegistry(t *testing.T) {
	if _, err := ParseReference("ubuntu"); err == nil {
		t.Fatal("short name should require a registry")
	}
	if _, err := ParseReference("library/ubuntu:latest"); err == nil {
		t.Fatal("docker hub short name should require a registry")
	}

	ref, err := ParseReference("ghcr.io/sls/chunk_runner")
	if err != nil {
		t.Fatal(err)
	}
	if got := ref.Context().RegistryStr() + "/" + ref.Context().RepositoryStr() + ":" + ref.Identifier(); got != "ghcr.io/sls/chunk_runner:latest" {
		t.Fatalf("default tag: %q", got)
	}

	ref, err = ParseReference("localhost:5000/missile_wars:latest")
	if err != nil {
		t.Fatal(err)
	}
	if got := ref.Context().RegistryStr() + "/" + ref.Context().RepositoryStr(); got != "localhost:5000/missile_wars" {
		t.Fatalf("registry: %q", got)
	}
}
