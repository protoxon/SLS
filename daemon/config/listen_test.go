package config

import (
	"os"
	"path/filepath"
	"testing"
)

func TestLoadListenDefaultsOn(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("api:\n  host: 127.0.0.1\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { Set(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if !Get().Api.ListenEnabled() {
		t.Fatal("omitted api.listen should enable the TCP listener")
	}
	if Get().Api.Socket.ActivePath() != "" || Get().Api.Socket.Path != DefaultAPISocket {
		t.Fatalf("api socket = %+v", Get().Api.Socket)
	}
	if Get().RemoteApi.Socket.ActivePath() != "" || Get().RemoteApi.Socket.Path != DefaultRemoteSocket {
		t.Fatalf("remote socket = %+v", Get().RemoteApi.Socket)
	}
}

func TestLoadAPISocketEnabled(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	body := "api:\n  socket:\n    enabled: true\n    path: /tmp/daemon.sock\nremote:\n  socket:\n    enabled: true\n    path: /tmp/controller.sock\n"
	if err := os.WriteFile(path, []byte(body), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { Set(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if got := Get().Api.Socket.ActivePath(); got != "/tmp/daemon.sock" {
		t.Fatalf("api socket = %q", got)
	}
	if got := Get().RemoteApi.Socket.ActivePath(); got != "/tmp/controller.sock" {
		t.Fatalf("remote socket = %q", got)
	}
}

func TestLoadListenFalseStaysOff(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("api:\n  listen: false\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { Set(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Api.ListenEnabled() {
		t.Fatal("api.listen false was turned back on")
	}
}
