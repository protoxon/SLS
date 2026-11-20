package config

import (
	"strings"
	"testing"

	"gopkg.in/yaml.v3"
)

func TestDefaultConfigKeepsComments(t *testing.T) {
	body, err := renderDefaultConfig()
	if err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(string(body), "bearer authentication") {
		t.Fatal("default config was rewritten without comments")
	}
	var cfg Configuration
	if err := yaml.Unmarshal(body, &cfg); err != nil {
		t.Fatal(err)
	}
	if cfg.Uuid == "" {
		t.Fatal("uuid was not filled in")
	}
	if !cfg.Api.ListenEnabled() || cfg.Api.Port != 5620 {
		t.Fatalf("api listen=%v port=%d", cfg.Api.ListenEnabled(), cfg.Api.Port)
	}
	if cfg.Api.AdminSocket != "/var/lib/sls/run/sls.sock" {
		t.Fatalf("admin socket = %q", cfg.Api.AdminSocket)
	}
	if cfg.Api.Socket.ActivePath() != "" || cfg.Api.Socket.Path != "/var/lib/sls/run/controller.sock" {
		t.Fatalf("api socket = %+v", cfg.Api.Socket)
	}
	if cfg.System.Software != "/var/lib/sls/software" {
		t.Fatalf("software = %q", cfg.System.Software)
	}
	if cfg.TelemetryEnabled == nil || !*cfg.TelemetryEnabled {
		t.Fatal("telemetry should default on")
	}
}
