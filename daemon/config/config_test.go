package config

import (
	"os"
	"path/filepath"
	"strings"
	"testing"

	"gopkg.in/yaml.v3"
)

func TestMatchInsecureRegistry(t *testing.T) {
	list := []string{"localhost:5000", "registry.local"}
	if !MatchInsecureRegistry("localhost:5000", list) {
		t.Fatal("expected host:port match")
	}
	if MatchInsecureRegistry("localhost:5001", list) {
		t.Fatal("different port should not match host:port entry")
	}
	if !MatchInsecureRegistry("registry.local:443", list) {
		t.Fatal("host-only entry should match any port")
	}
	if MatchInsecureRegistry("ghcr.io", list) {
		t.Fatal("unlisted registry should be secure")
	}
}

func TestInitConfigMissing(t *testing.T) {
	old := Path
	t.Cleanup(func() { Path = old })
	Path = filepath.Join(t.TempDir(), "missing.yml")

	err := InitConfig()
	if err == nil || !strings.Contains(err.Error(), "Error: Configuration File Not Found") || !strings.Contains(err.Error(), Path) || !strings.Contains(err.Error(), "Create default config file with: sls run daemon --init-config") {
		t.Fatalf("InitConfig() = %v", err)
	}
}

func TestWriteDefaultConfig(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	written, err := WriteDefaultConfig(path)
	if err != nil {
		t.Fatal(err)
	}
	if written != path {
		t.Fatalf("written path = %s, want %s", written, path)
	}
	data, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(string(data), "uuid:") {
		t.Fatalf("config missing uuid:\n%s", data)
	}
	if !strings.Contains(string(data), "TCP listener") {
		t.Fatal("default config was rewritten without comments")
	}
	var cfg Configuration
	if err := yaml.Unmarshal(data, &cfg); err != nil {
		t.Fatal(err)
	}
	if cfg.Uuid == "" {
		t.Fatal("uuid was not filled in")
	}
	if !cfg.Api.ListenEnabled() || cfg.Api.Port != 5585 {
		t.Fatalf("api listen=%v port=%d", cfg.Api.ListenEnabled(), cfg.Api.Port)
	}
	if cfg.Docker.Network.Interface != "172.60.0.1" || len(cfg.Docker.Network.Dns) != 2 {
		t.Fatalf("docker network = %+v", cfg.Docker.Network)
	}
	if cfg.Docker.Network.Interfaces.V4.Subnet != "172.60.0.0/16" {
		t.Fatalf("v4 subnet = %q", cfg.Docker.Network.Interfaces.V4.Subnet)
	}
	if cfg.Api.Socket.ActivePath() != "" || cfg.Api.Socket.Path != "/var/lib/sls/run/daemon.sock" {
		t.Fatalf("api socket = %+v", cfg.Api.Socket)
	}
	if cfg.RemoteApi.Socket.ActivePath() != "" || cfg.RemoteApi.Socket.Path != "/var/lib/sls/run/controller.sock" {
		t.Fatalf("remote socket = %+v", cfg.RemoteApi.Socket)
	}

	_, err = WriteDefaultConfig(path)
	if err == nil || !strings.Contains(err.Error(), "already exists") {
		t.Fatalf("second write = %v", err)
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
