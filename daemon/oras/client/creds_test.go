package client

import (
	"context"
	"testing"

	"oras.land/oras-go/v2/registry/remote/auth"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/models"
)

func TestNormalizeRegistryHost(t *testing.T) {
	tests := []struct {
		in, want string
	}{
		{"https://ghcr.io/", "ghcr.io"},
		{"http://localhost:5000", "localhost:5000"},
		{"https://index.docker.io/v1/", "docker.io"},
		{"registry-1.docker.io", "docker.io"},
	}
	for _, tt := range tests {
		if got := NormalizeRegistryHost(tt.in); got != tt.want {
			t.Fatalf("NormalizeRegistryHost(%q) = %q, want %q", tt.in, got, tt.want)
		}
	}
}

func TestSnapshotStoreReplaceAndGet(t *testing.T) {
	t.Cleanup(func() { ApplySnapshot(models.RegistrySnapshot{}) })
	ApplySnapshot(models.RegistrySnapshot{
		Revision: "r1",
		Credentials: []models.RegistryCredential{
			{Host: "ghcr.io", Username: "jesse", Password: "pat"},
			{Host: "localhost:5000", Password: "secret", Insecure: true},
		},
	})
	if SnapshotRevision() != "r1" {
		t.Fatalf("revision %q", SnapshotRevision())
	}
	cred, err := remoteCredentials.Get(t.Context(), "https://ghcr.io")
	if err != nil {
		t.Fatal(err)
	}
	if cred.Username != "jesse" || cred.Password != "pat" {
		t.Fatalf("ghcr %+v", cred)
	}
	if !RegistryInsecure("localhost:5000") || RegistryInsecure("ghcr.io") {
		t.Fatal("insecure flags")
	}

	ApplySnapshot(models.RegistrySnapshot{Revision: "r2"})
	cred, err = remoteCredentials.Get(t.Context(), "ghcr.io")
	if err != nil {
		t.Fatal(err)
	}
	if cred != auth.EmptyCredential {
		t.Fatalf("removed host still present: %+v", cred)
	}
	if RegistryInsecure("localhost:5000") {
		t.Fatal("insecure should drop with Replace")
	}
}

func TestCredentialStorePrefersSnapshot(t *testing.T) {
	t.Cleanup(func() {
		ApplySnapshot(models.RegistrySnapshot{})
		config.Set(nil)
	})
	config.Set(&config.Configuration{
		Docker: config.DockerConfiguration{
			Registries: map[string]config.RegistryConfiguration{
				"ghcr.io": {Username: "yaml", Password: "yaml-pass"},
			},
		},
	})
	ApplySnapshot(models.RegistrySnapshot{
		Credentials: []models.RegistryCredential{
			{Host: "ghcr.io", Username: "proto", Password: "proto-pass"},
		},
	})
	store, err := NewCredentialStore()
	if err != nil {
		t.Fatal(err)
	}
	cred, err := store.Get(context.Background(), "ghcr.io")
	if err != nil {
		t.Fatal(err)
	}
	if cred.Username != "proto" || cred.Password != "proto-pass" {
		t.Fatalf("protocube should win: %+v", cred)
	}
}

func TestCredentialStoreFallsBackToYAML(t *testing.T) {
	t.Cleanup(func() {
		ApplySnapshot(models.RegistrySnapshot{})
		config.Set(nil)
	})
	ApplySnapshot(models.RegistrySnapshot{})
	config.Set(&config.Configuration{
		Docker: config.DockerConfiguration{
			Registries: map[string]config.RegistryConfiguration{
				"localhost:5000": {Username: "sls", Password: "local"},
			},
		},
	})
	store, err := NewCredentialStore()
	if err != nil {
		t.Fatal(err)
	}
	cred, err := store.Get(context.Background(), "localhost:5000")
	if err != nil {
		t.Fatal(err)
	}
	if cred.Username != "sls" || cred.Password != "local" {
		t.Fatalf("yaml fallback: %+v", cred)
	}
}

func TestUsePlainHTTPFromInsecureHosts(t *testing.T) {
	t.Cleanup(func() {
		ApplySnapshot(models.RegistrySnapshot{})
		config.Set(&config.Configuration{})
	})
	config.Set(&config.Configuration{})
	ApplySnapshot(models.RegistrySnapshot{
		Insecure: []string{"localhost:5000"},
	})
	if !usePlainHTTP("localhost:5000") {
		t.Fatal("insecure host should enable HTTP")
	}
	cred, err := remoteCredentials.Get(t.Context(), "localhost:5000")
	if err != nil {
		t.Fatal(err)
	}
	if cred != auth.EmptyCredential {
		t.Fatalf("insecure host should not invent credentials: %+v", cred)
	}
}

func TestUsePlainHTTPFromSnapshot(t *testing.T) {
	t.Cleanup(func() {
		ApplySnapshot(models.RegistrySnapshot{})
		config.Set(&config.Configuration{})
	})
	config.Set(&config.Configuration{})
	if usePlainHTTP("localhost:5000") {
		t.Fatal("should be https without insecure flag")
	}
	ApplySnapshot(models.RegistrySnapshot{
		Credentials: []models.RegistryCredential{
			{Host: "localhost:5000", Insecure: true},
		},
	})
	if !usePlainHTTP("localhost:5000") {
		t.Fatal("protocube insecure should enable HTTP")
	}
}

func TestCredentialStoreUsesRemoteAPIToken(t *testing.T) {
	t.Cleanup(func() {
		ApplySnapshot(models.RegistrySnapshot{})
		config.Set(nil)
	})
	config.Set(&config.Configuration{
		RemoteApi: config.RemoteApi{
			Url:   "https://protocube.example:5620",
			Token: "sls_live_node",
		},
	})
	ApplySnapshot(models.RegistrySnapshot{
		Credentials: []models.RegistryCredential{
			{Host: "protocube.example:5620", Username: "proto", Password: "proto-pass"},
			{Host: "ghcr.io", Username: "jesse", Password: "pat"},
		},
	})
	store, err := NewCredentialStore()
	if err != nil {
		t.Fatal(err)
	}
	cred, err := store.Get(context.Background(), "protocube.example:5620")
	if err != nil {
		t.Fatal(err)
	}
	if cred.Username != "node" || cred.Password != "sls_live_node" {
		t.Fatalf("node token should win for remote.url host: %+v", cred)
	}
	cred, err = store.Get(context.Background(), "ghcr.io")
	if err != nil {
		t.Fatal(err)
	}
	if cred.Username != "jesse" || cred.Password != "pat" {
		t.Fatalf("other hosts should still use snapshot: %+v", cred)
	}
}

func TestUsePlainHTTPFromRemoteAPI(t *testing.T) {
	t.Cleanup(func() {
		ApplySnapshot(models.RegistrySnapshot{})
		config.Set(&config.Configuration{})
	})
	config.Set(&config.Configuration{
		RemoteApi: config.RemoteApi{Url: "http://protocube.example:5620", Token: "tok"},
	})
	if !usePlainHTTP("protocube.example:5620") {
		t.Fatal("http remote.url should enable HTTP for that host")
	}
	if usePlainHTTP("ghcr.io") {
		t.Fatal("other hosts should stay HTTPS")
	}
}
