package cmd

import (
	"bytes"
	"encoding/json"
	"net"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"
	"time"

	"protoxon.com/api"
	"protoxon.com/config"
)

func resetAuthFlags() {
	authToken = ""
	authTokenStdin = false
	authNoInteractive = false
	apiLocal = false
	apiSocket = ""
	tokenNoInteractive = false
	tokenName = ""
	tokenDescription = ""
	tokenScopes = ""
	tokenExpires = ""
	tokenReason = ""
}

func isolateSocket(t *testing.T) {
	t.Helper()
	t.Setenv("SLS_SOCKET", filepath.Join(t.TempDir(), "nosuch.sock"))
}

func TestAuthLoginAndTokenList(t *testing.T) {
	isolateSocket(t)
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") != "Bearer sls_live_admin" {
			http.Error(w, `{"hint":"unauthorized"}`, http.StatusUnauthorized)
			return
		}
		switch {
		case r.Method == http.MethodGet && r.URL.Path == "/api/auth":
			_ = json.NewEncoder(w).Encode(api.Auth{
				Name:      "admin",
				Prefix:    "sls_live_abc",
				Scopes:    []string{"app:admin"},
				Grantable: []api.ScopeInfo{{Scope: "servers:read", Description: "read", Group: "Servers"}},
			})
		case r.Method == http.MethodGet && r.URL.Path == "/api/tokens":
			_ = json.NewEncoder(w).Encode(map[string]any{
				"data": []api.Token{{ID: "11111111-1111-1111-1111-111111111111", Name: "admin", Prefix: "sls_live_abc", Scopes: []string{"app:admin"}}},
			})
		default:
			http.NotFound(w, r)
		}
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

	out.Reset()
	tokenListCmd.SetOut(&out)
	if err := tokenListCmd.RunE(tokenListCmd, nil); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(out.String(), "11111111-1111-1111-1111-111111111111") {
		t.Fatalf("list %q", out.String())
	}
}

func TestTokenCreateUsesSocket(t *testing.T) {
	sock := filepath.Join(t.TempDir(), "protocube.sock")
	lis, err := net.Listen("unix", sock)
	if err != nil {
		t.Fatal(err)
	}
	mux := http.NewServeMux()
	mux.HandleFunc("/api/auth", func(w http.ResponseWriter, r *http.Request) {
		_ = json.NewEncoder(w).Encode(api.Auth{
			Name:      "local",
			Prefix:    "local",
			Local:     true,
			Scopes:    []string{"app:admin"},
			Grantable: []api.ScopeInfo{{Scope: "app:admin", Description: "admin", Group: "Admin"}},
		})
	})
	mux.HandleFunc("/api/tokens", func(w http.ResponseWriter, r *http.Request) {
		if r.Method != http.MethodPost {
			http.NotFound(w, r)
			return
		}
		w.WriteHeader(http.StatusCreated)
		_ = json.NewEncoder(w).Encode(api.CreatedToken{
			Token:      api.Token{ID: "id-1", Name: "ops", Prefix: "sls_live_x", Scopes: []string{"app:admin"}},
			TokenValue: "sls_live_secret",
		})
	})
	srv := &http.Server{Handler: mux}
	go srv.Serve(lis)
	t.Cleanup(func() {
		_ = srv.Close()
		_ = lis.Close()
	})

	cfgPath := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", cfgPath)
	t.Setenv("SLS_SOCKET", sock)
	t.Cleanup(resetAuthFlags)
	tokenNoInteractive = true
	tokenName = "ops"
	tokenScopes = "app:admin"

	var out bytes.Buffer
	tokenCreateCmd.SetOut(&out)
	if err := tokenCreateCmd.RunE(tokenCreateCmd, nil); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(out.String(), "Token: sls_live_secret") {
		t.Fatalf("output %q", out.String())
	}
}

func TestTokenCreateNoInteractive(t *testing.T) {
	isolateSocket(t)
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.URL.Path == "/api/auth":
			_ = json.NewEncoder(w).Encode(api.Auth{
				Name:   "admin",
				Prefix: "sls_live_abc",
				Scopes: []string{"app:admin"},
			})
		case r.URL.Path == "/api/tokens" && r.Method == http.MethodPost:
			var req api.CreateTokenRequest
			if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
				t.Error(err)
			}
			if req.Name != "jesse" || len(req.Scopes) != 2 || req.ExpiresIn != "7d" {
				http.Error(w, "bad body", http.StatusBadRequest)
				return
			}
			w.WriteHeader(http.StatusCreated)
			_ = json.NewEncoder(w).Encode(api.CreatedToken{
				Token:      api.Token{ID: "new-id", Name: req.Name, Scopes: req.Scopes},
				TokenValue: "sls_live_new",
			})
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)

	cfgPath := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", cfgPath)
	if err := config.Save(config.File{API: config.API{URL: srv.URL, Token: "sls_live_admin"}}); err != nil {
		t.Fatal(err)
	}
	t.Cleanup(resetAuthFlags)
	tokenNoInteractive = true
	tokenName = "jesse"
	tokenScopes = "servers:read,tokens:write"
	tokenExpires = "7d"

	var out bytes.Buffer
	tokenCreateCmd.SetOut(&out)
	if err := tokenCreateCmd.RunE(tokenCreateCmd, nil); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(out.String(), "Token: sls_live_new") {
		t.Fatalf("output %q", out.String())
	}
}

func TestAuthLogout(t *testing.T) {
	cfgPath := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", cfgPath)
	if err := config.Save(config.File{API: config.API{URL: "https://pc", Token: "secret", Scopes: []string{"app:admin"}}}); err != nil {
		t.Fatal(err)
	}
	var out bytes.Buffer
	authLogoutCmd.SetOut(&out)
	if err := authLogoutCmd.RunE(authLogoutCmd, nil); err != nil {
		t.Fatal(err)
	}
	cfg, err := config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.API.Token != "" || cfg.API.URL != "https://pc" || len(cfg.API.Scopes) != 0 {
		t.Fatalf("got %+v", cfg.API)
	}
}

func TestParseScopeList(t *testing.T) {
	got := parseScopeList(" servers:read, tokens:write , ")
	if len(got) != 2 || got[0] != "servers:read" || got[1] != "tokens:write" {
		t.Fatalf("%v", got)
	}
}

func TestWriteTokenTable(t *testing.T) {
	exp := time.Date(2026, 1, 2, 3, 4, 0, 0, time.UTC)
	out := writeTokenTable([]api.Token{{
		ID: "id-1", Name: "n", Prefix: "sls_live_x", Scopes: []string{"servers:read"}, ExpiresAt: &exp,
	}})
	if !strings.Contains(out, "id-1") || !strings.Contains(out, "servers:read") {
		t.Fatal(out)
	}
}
