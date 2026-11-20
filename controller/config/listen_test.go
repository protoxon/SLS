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
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if !Get().Api.ListenEnabled() {
		t.Fatal("omitted api.listen should enable the TCP listener")
	}
}

func TestLoadListenFalseStaysOff(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yml")
	if err := os.WriteFile(path, []byte("api:\n  listen: false\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := Get()
	t.Cleanup(func() { SetForTest(prev) })
	if err := loadConfigFromFile(path); err != nil {
		t.Fatal(err)
	}
	if Get().Api.ListenEnabled() {
		t.Fatal("api.listen false was turned back on")
	}
}
