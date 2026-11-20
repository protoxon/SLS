package config

import (
	"testing"

	"github.com/creasty/defaults"
)

func TestConsoleProxyDefaultsTrue(t *testing.T) {
	cfg := &Configuration{}
	if err := defaults.Set(cfg); err != nil {
		t.Fatal(err)
	}
	if !cfg.Api.ProxyConsole() {
		t.Fatal("omitted console_proxy should be proxied")
	}
	off := false
	cfg.Api.ConsoleProxy = &off
	if cfg.Api.ProxyConsole() {
		t.Fatal("console_proxy false should be direct")
	}
}
