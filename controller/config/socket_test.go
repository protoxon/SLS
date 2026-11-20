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
	if Get().Api.AdminSocket != "/var/lib/sls/run/sls.sock" {
		t.Fatalf("admin socket = %q", Get().Api.AdminSocket)
	}
	if Get().Api.Socket.ActivePath() != "" || Get().Api.Socket.Path != DefaultAPISocket {
		t.Fatalf("api socket = %+v", Get().Api.Socket)
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

func TestLoadExpandsRegistryPasswordFromEnv(t *testing.T) {
	t.Setenv("SLS_TEST_REGISTRY_PASSWORD", "hunter2")
	path := filepath.Join(t.TempDir(), "config.yml")
	body := "registry:\n  credentials:\n    - host: core.slpriv:5000\n      username: sls\n      password: ${SLS_TEST_REGISTRY_PASSWORD}\n      insecure: true\n"
	if err := os.WriteFile(path, []byte(body), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	creds := Get().Registry.Snapshot().Credentials
	if len(creds) != 1 || creds[0].Password != "hunter2" {
		t.Fatalf("credentials = %+v", creds)
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
	if err := os.WriteFile(path, []byte("api:\n  admin_socket: /tmp/custom.sock\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Api.AdminSocket != "/tmp/custom.sock" {
		t.Fatalf("admin socket = %q", Get().Api.AdminSocket)
	}
}

func TestLoadKeepsAPISocketEnabled(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("api:\n  socket:\n    enabled: true\n    path: /tmp/controller.sock\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if got := Get().Api.Socket.ActivePath(); got != "/tmp/controller.sock" {
		t.Fatalf("api socket = %q", got)
	}
}
