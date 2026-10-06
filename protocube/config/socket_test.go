package config

import (
	"os"
	"path/filepath"
	"testing"
)

func TestLoadAppliesSocketDefault(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("app_name: SLS\napi:\n  host: 127.0.0.1\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Api.Socket != "/var/lib/sls/sls.sock" {
		t.Fatalf("socket = %q", Get().Api.Socket)
	}
}

func TestLoadAppliesRegistryStorageDefault(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("app_name: SLS\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Registry.StoragePath() != "/var/lib/sls/registry" {
		t.Fatalf("storage = %q", Get().Registry.StoragePath())
	}
}

func TestLoadKeepsConfiguredRegistryStorage(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("registry:\n  storage: /tmp/oci\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Registry.StoragePath() != "/tmp/oci" {
		t.Fatalf("storage = %q", Get().Registry.StoragePath())
	}
}

func TestConfigureDirectoriesCreatesRegistryStorage(t *testing.T) {
	root := t.TempDir()
	storage := filepath.Join(root, "registry")
	prev := Get()
	SetForTest(&Configuration{
		System: SystemConfiguration{
			RootDirectory: root,
			Plugins:       filepath.Join(root, "plugins"),
			Blueprints:    filepath.Join(root, "blueprints"),
			Software:      filepath.Join(root, "software"),
		},
		Registry: RegistryConfiguration{Storage: storage},
	})
	t.Cleanup(func() { SetForTest(prev) })
	if err := ConfigureDirectories(); err != nil {
		t.Fatal(err)
	}
	st, err := os.Stat(storage)
	if err != nil || !st.IsDir() {
		t.Fatalf("registry storage: %v", err)
	}
}

func TestLoadKeepsTLSDisabled(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("api:\n  tls:\n    enabled: false\n    cert: /etc/ssl/certs/cert.pem\n    key: /etc/ssl/certs/key.pem\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Api.Tls.Enabled {
		t.Fatal("tls.enabled: false was overwritten")
	}
}

func TestLoadKeepsTLSEnabled(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("api:\n  tls:\n    enabled: true\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if !Get().Api.Tls.Enabled {
		t.Fatal("tls.enabled: true should stay set")
	}
}

func TestLoadKeepsConfiguredSocket(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("api:\n  socket: /tmp/custom.sock\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Api.Socket != "/tmp/custom.sock" {
		t.Fatalf("socket = %q", Get().Api.Socket)
	}
}
