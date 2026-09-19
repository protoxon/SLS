package config

import (
	"encoding/json"
	"fmt"
	"testing"
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

func TestConfig(t *testing.T) {
	InitConfig()
	out, err := json.MarshalIndent(Get(), "", "  ")
	if err != nil {
		t.Fatal(err)
	}

	fmt.Println(string(out))
}
