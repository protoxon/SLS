package config

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func TestInitConfigMissing(t *testing.T) {
	old := Path
	t.Cleanup(func() { Path = old })
	Path = filepath.Join(t.TempDir(), "missing.yml")

	err := InitConfig()
	if err == nil || !strings.Contains(err.Error(), "Error: Configuration File Not Found") || !strings.Contains(err.Error(), Path) || !strings.Contains(err.Error(), "Create default config file with: sls run controller --init-config") {
		t.Fatalf("InitConfig() = %v", err)
	}
}

func TestWriteDefaultConfigFile(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	softwareDir, err := writeDefaultConfig(path)
	if err != nil {
		t.Fatal(err)
	}
	if softwareDir == "" {
		t.Fatal("software directory was empty")
	}
	data, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(string(data), "uuid:") {
		t.Fatalf("config missing uuid:\n%s", data)
	}
}

func TestWriteDefaultConfigExists(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("uuid: keep\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	_, err := WriteDefaultConfig(path)
	if err == nil || !strings.Contains(err.Error(), "already exists") {
		t.Fatalf("WriteDefaultConfig() = %v", err)
	}
	data, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if string(data) != "uuid: keep\n" {
		t.Fatalf("existing config was changed:\n%s", data)
	}
}

func TestWriteDefaultConfigError(t *testing.T) {
	dir := t.TempDir()
	blocker := filepath.Join(dir, "not-a-directory")
	if err := os.WriteFile(blocker, []byte("x"), 0o644); err != nil {
		t.Fatal(err)
	}
	target := filepath.Join(blocker, "config.yml")
	_, err := WriteDefaultConfig(target)
	if err == nil {
		t.Fatal("expected write to fail")
	}
	if !strings.Contains(err.Error(), "not a directory") {
		t.Fatalf("error = %v", err)
	}
}
