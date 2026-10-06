package config

import (
	"os"
	"path/filepath"
	"testing"
)

func TestCredentialsPathDefault(t *testing.T) {
	t.Setenv("SLS_CREDENTIALS", "")
	path, err := CredentialsPath()
	if err != nil {
		t.Fatal(err)
	}
	if filepath.Base(path) != "credentials.json" {
		t.Fatalf("path = %q", path)
	}
	if filepath.Base(filepath.Dir(path)) != "sls" {
		t.Fatalf("dir = %q", filepath.Dir(path))
	}
}

func TestCredentialsPathOverride(t *testing.T) {
	want := filepath.Join(t.TempDir(), "custom.json")
	t.Setenv("SLS_CREDENTIALS", want)
	path, err := CredentialsPath()
	if err != nil {
		t.Fatal(err)
	}
	if path != want {
		t.Fatalf("path = %q, want %q", path, want)
	}
}

func TestConfigPathOverride(t *testing.T) {
	want := filepath.Join(t.TempDir(), "cfg.yaml")
	t.Setenv("SLS_CONFIG", want)
	path, err := ConfigPath()
	if err != nil {
		t.Fatal(err)
	}
	if path != want {
		t.Fatalf("path = %q, want %q", path, want)
	}
}

func TestSaveLoadAndEnvOverride(t *testing.T) {
	path := filepath.Join(t.TempDir(), "sls", "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")

	cfg := File{
		API:      API{URL: "https://pc.example", Token: "sls_live_abc", Scopes: []string{"registry:read"}, Socket: "/tmp/p.sock"},
		Registry: Registry{Default: "ghcr.io/jessefaler", Insecure: true},
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	st, err := os.Stat(path)
	if err != nil {
		t.Fatal(err)
	}
	if st.Mode().Perm() != 0o600 {
		t.Fatalf("perm %o", st.Mode().Perm())
	}

	got, err := Load()
	if err != nil {
		t.Fatal(err)
	}
	if got.API.URL != cfg.API.URL || got.API.Token != cfg.API.Token || got.API.Socket != cfg.API.Socket {
		t.Fatalf("got %+v", got.API)
	}
	if len(got.API.Scopes) != 1 || got.API.Scopes[0] != "registry:read" {
		t.Fatalf("scopes %+v", got.API.Scopes)
	}
	if got.Registry.Default != "ghcr.io/jessefaler" || !got.Registry.Insecure {
		t.Fatalf("registry %+v", got.Registry)
	}

	t.Setenv("SLS_API_URL", "https://other")
	t.Setenv("SLS_TOKEN", "env-token")
	got, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if got.API.URL != "https://other" || got.API.Token != "env-token" {
		t.Fatalf("env overlay %+v", got.API)
	}
}

func TestSudoUserConfigDir(t *testing.T) {
	if sudoUserXDG("/home/jesse") != "/home/jesse/.config" {
		t.Fatal(sudoUserXDG("/home/jesse"))
	}
}

func TestSocketFallback(t *testing.T) {
	t.Setenv("SLS_SOCKET", "")
	if Socket(File{}, "") != DefaultSocket {
		t.Fatal(Socket(File{}, ""))
	}
	if Socket(File{API: API{Socket: "/tmp/a.sock"}}, "") != "/tmp/a.sock" {
		t.Fatal("file socket")
	}
	if Socket(File{API: API{Socket: "/tmp/a.sock"}}, "/tmp/b.sock") != "/tmp/b.sock" {
		t.Fatal("flag socket")
	}
}
