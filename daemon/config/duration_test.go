package config

import (
	"testing"
	"time"

	"github.com/creasty/defaults"
	"gopkg.in/yaml.v3"
)

func TestParseDuration(t *testing.T) {
	day := 24 * time.Hour
	tests := []struct {
		in   string
		want time.Duration
	}{
		{"1m", time.Minute},
		{"30m", 30 * time.Minute},
		{"12h", 12 * time.Hour},
		{"1d", day},
		{"2d", 2 * day},
		{"1w", 7 * day},
		{"1mo", 30 * day},
		{"2mo", 60 * day},
		{"1y", 365 * day},
		{"1W", 7 * day},
		{"1MO", 30 * day},
	}
	for _, tt := range tests {
		got, err := ParseDuration(tt.in)
		if err != nil {
			t.Fatalf("ParseDuration(%q): %v", tt.in, err)
		}
		if got != tt.want {
			t.Fatalf("ParseDuration(%q) = %s, want %s", tt.in, got, tt.want)
		}
	}
	if minute, err := ParseDuration("1m"); err != nil || minute != time.Minute {
		t.Fatalf("1m = %s, err %v", minute, err)
	}
	month, err := ParseDuration("1mo")
	if err != nil {
		t.Fatal(err)
	}
	if month == time.Minute || month != 30*day {
		t.Fatalf("1mo = %s", month)
	}
	for _, in := range []string{"", "1", "0w", "-1h", "1.5h", "1x", "1 w", "m"} {
		if _, err := ParseDuration(in); err == nil {
			t.Fatalf("ParseDuration(%q) should fail", in)
		}
	}
}

func TestVolumeCleanupDefaults(t *testing.T) {
	cfg := &Configuration{}
	if err := defaults.Set(cfg); err != nil {
		t.Fatal(err)
	}
	if err := cfg.System.Volume.Cleanup.prepare(); err != nil {
		t.Fatal(err)
	}
	if cfg.System.Volume.Cleanup.Policy != VolumeCleanupUnreferenced {
		t.Fatalf("policy %q", cfg.System.Volume.Cleanup.Policy)
	}
	if cfg.System.Volume.Cleanup.After != "1w" {
		t.Fatalf("after %q", cfg.System.Volume.Cleanup.After)
	}
	if cfg.System.Volume.Cleanup.AfterDuration != 7*24*time.Hour {
		t.Fatalf("duration %s", cfg.System.Volume.Cleanup.AfterDuration)
	}
}

func TestVolumeCleanupYAML(t *testing.T) {
	var cfg Configuration
	raw := []byte("system:\n  volume:\n    cleanup:\n      policy: unused\n      after: 2d\n")
	if err := yaml.Unmarshal(raw, &cfg); err != nil {
		t.Fatal(err)
	}
	if err := defaults.Set(&cfg); err != nil {
		t.Fatal(err)
	}
	if err := cfg.System.Volume.Cleanup.prepare(); err != nil {
		t.Fatal(err)
	}
	if cfg.System.Volume.Cleanup.Policy != VolumeCleanupUnused {
		t.Fatalf("policy %q", cfg.System.Volume.Cleanup.Policy)
	}
	if cfg.System.Volume.Cleanup.AfterDuration != 48*time.Hour {
		t.Fatalf("duration %s", cfg.System.Volume.Cleanup.AfterDuration)
	}
}

func TestVolumeCleanupRejectsUnknownPolicy(t *testing.T) {
	cfg := VolumeCleanupConfiguration{Policy: "retain", After: "1w"}
	if err := cfg.prepare(); err == nil {
		t.Fatal("expected unknown policy to fail")
	}
}
