package cmd

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"testing"
)

func TestServerLsJSON(t *testing.T) {
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
		if r.Method != http.MethodGet || r.URL.Path != "/api/servers" {
			http.NotFound(w, r)
			return
		}
		_, _ = w.Write([]byte(`[{"id":"srv_a","blueprint_id":"bedwars","node_name":"node-1","software_id":"paper","software_version":"1.21","image":"ghcr.io/example/paper"}]`))
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_API_URL", srv.URL)
	t.Setenv("SLS_TOKEN", "tok")
	t.Setenv("SLS_CONFIG", filepath.Join(t.TempDir(), "config.yaml"))

	cmd := newServerLsCommand()
	addOutputFlag(cmd)
	var out bytes.Buffer
	cmd.SetOut(&out)
	cmd.SetErr(&out)
	cmd.SetArgs([]string{"-o", "json"})
	if err := cmd.Execute(); err != nil {
		t.Fatal(err)
	}
	var got []map[string]any
	if err := json.Unmarshal(out.Bytes(), &got); err != nil {
		t.Fatalf("output %q: %v", out.String(), err)
	}
	if len(got) != 1 || got[0]["id"] != "srv_a" || got[0]["blueprint_id"] != "bedwars" {
		t.Fatalf("got %#v from %q", got, out.String())
	}
}

func TestRootAliases(t *testing.T) {
	deleteCmd, _, err := rootCmd.Find([]string{"delete", "srv_a"})
	if err != nil {
		t.Fatal(err)
	}
	if deleteCmd.Annotations["canonical"] != "server rm" {
		t.Fatalf("delete canonical %v", deleteCmd.Annotations)
	}
	lsCmd, _, err := rootCmd.Find([]string{"ls"})
	if err != nil {
		t.Fatal(err)
	}
	if lsCmd.Name() != "ls" || lsCmd.Annotations["canonical"] != "server ls" {
		t.Fatalf("ls = %s canonical %v", lsCmd.Name(), lsCmd.Annotations)
	}
	for _, name := range []string{"ls", "ps", "list"} {
		vol, _, err := rootCmd.Find([]string{"volume", name, "localhost:5000/world"})
		if err != nil {
			t.Fatal(err)
		}
		if vol.Name() != "ls" || vol.Annotations["canonical"] != "" {
			t.Fatalf("volume %s = %s canonical %v", name, vol.Name(), vol.Annotations)
		}
	}
	psCmd, _, err := rootCmd.Find([]string{"ps"})
	if err != nil {
		t.Fatal(err)
	}
	if psCmd.Annotations["canonical"] != "server ls" {
		t.Fatalf("ps canonical %v", psCmd.Annotations)
	}
	listCmd, _, err := rootCmd.Find([]string{"list"})
	if err != nil {
		t.Fatal(err)
	}
	if listCmd.Name() != "list" || listCmd.Annotations["canonical"] != "server ls" {
		t.Fatalf("list = %s canonical %v", listCmd.Name(), listCmd.Annotations)
	}
}
