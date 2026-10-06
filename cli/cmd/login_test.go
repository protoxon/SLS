package cmd

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"

	"protoxon.com/api"
	"protoxon.com/config"
)

func TestLoginCommand(t *testing.T) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") != "Bearer sls_live_admin" {
			http.Error(w, `{"hint":"unauthorized"}`, http.StatusUnauthorized)
			return
		}
		if r.Method != http.MethodGet || r.URL.Path != "/api/auth" {
			http.NotFound(w, r)
			return
		}
		_ = json.NewEncoder(w).Encode(api.Auth{
			Name:   "admin",
			Prefix: "sls_live_abc",
			Scopes: []string{"app:admin"},
		})
	}))
	t.Cleanup(srv.Close)

	cfgPath := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", cfgPath)
	t.Cleanup(resetAuthFlags)

	authToken = "sls_live_admin"
	authNoInteractive = true
	var out bytes.Buffer
	loginCmd.SetOut(&out)
	if err := loginCmd.RunE(loginCmd, []string{srv.URL}); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(out.String(), "Logged in") {
		t.Fatalf("output %q", out.String())
	}

	cfg, err := config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.API.Token != "sls_live_admin" || cfg.API.URL != srv.URL {
		t.Fatalf("saved %+v", cfg.API)
	}
	if len(cfg.API.Scopes) != 1 || cfg.API.Scopes[0] != "app:admin" {
		t.Fatalf("scopes %+v", cfg.API.Scopes)
	}
}
