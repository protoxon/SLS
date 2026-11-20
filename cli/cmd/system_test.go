package cmd

import (
	"bytes"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"
)

func TestReloadPrintsLoadErrors(t *testing.T) {
	isolateSocket(t)
	t.Cleanup(func() {
		outputFormat = "table"
		apiLocal = false
		apiSocket = ""
	})
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") != "Bearer tok" {
			http.Error(w, `{"detail":"unauthorized"}`, http.StatusUnauthorized)
			return
		}
		if r.Method != http.MethodPost {
			http.NotFound(w, r)
			return
		}
		switch r.URL.Path {
		case "/api/blueprints/reload":
			_, _ = w.Write([]byte(`{"blueprints":1,"mixins":0,"errors":[{"kind":"blueprint","id":"skywars","path":"games/skywars.yml","error":"includes unknown mixin \"base\""}]}`))
		case "/api/software/reload":
			_, _ = w.Write([]byte(`{"software":2,"errors":[]}`))
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_API_URL", srv.URL)
	t.Setenv("SLS_TOKEN", "tok")
	t.Setenv("SLS_CONFIG", filepath.Join(t.TempDir(), "config.yaml"))

	text := runReload(t, "table")
	for _, line := range []string{
		"Reloaded",
		"blueprints, software",
		`Failed to load blueprint games/skywars.yml (skywars): includes unknown mixin "base"`,
	} {
		if !strings.Contains(text, line) {
			t.Errorf("missing %q in %q", line, text)
		}
	}

	jsonOut := runReload(t, "json")
	if !strings.Contains(jsonOut, `"errors"`) || !strings.Contains(jsonOut, `"skywars"`) {
		t.Fatalf("json output dropped errors: %s", jsonOut)
	}
}

func runReload(t *testing.T, format string) string {
	t.Helper()
	outputFormat = format
	cmd := newReloadCommand()
	var out bytes.Buffer
	cmd.SetOut(&out)
	cmd.SetErr(&out)
	if err := cmd.Execute(); err != nil {
		t.Fatal(err)
	}
	return out.String()
}
