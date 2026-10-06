package cmd

import (
	"context"
	"errors"
	"io"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/config"
	"protoxon.com/print"
)

func TestMatchServers(t *testing.T) {
	servers := []api.Server{
		{ID: "0123456789ab", BlueprintID: "missile_wars"},
		{ID: "0123zzzzzzzz", BlueprintID: "bedwars"},
		{ID: "aabbccddeeff", BlueprintID: "missile_wars"},
	}
	got := matchServers(servers, "missile_wars")
	if len(got) != 2 || got[0].ID != "0123456789ab" || got[1].ID != "aabbccddeeff" {
		t.Fatalf("blueprint matches %#v", got)
	}
	got = matchServers(servers, "0123")
	if len(got) != 2 {
		t.Fatalf("prefix matches %#v", ids(got))
	}
	got = matchServers(servers, "aabbccddeeff")
	if len(got) != 1 || got[0].BlueprintID != "missile_wars" {
		t.Fatalf("exact id %#v", got)
	}
	if len(matchServers(servers, "missing")) != 0 {
		t.Fatal("expected no matches")
	}
	got = matchServers([]api.Server{
		{ID: "499x92z8o8sk", BlueprintID: "chunk_runner"},
		{ID: "499aaaaaaaab", BlueprintID: "chunk_runner"},
		{ID: "499bbbbbbbbb", BlueprintID: "bedwars"},
		{ID: "fwxk83c9ahv1", BlueprintID: "chunk_runner"},
	}, "chunk_runner.499")
	if len(got) != 2 || got[0].ID != "499x92z8o8sk" || got[1].ID != "499aaaaaaaab" {
		t.Fatalf("composite prefix %#v", ids(got))
	}
	got = matchServers([]api.Server{
		{ID: "499x92z8o8sk", BlueprintID: "chunk_runner"},
		{ID: "499aaaaaaaab", BlueprintID: "chunk_runner"},
	}, "chunk_runner.499x92z8o8sk")
	if len(got) != 1 || got[0].ID != "499x92z8o8sk" {
		t.Fatalf("composite exact %#v", ids(got))
	}
}

func TestResolveFullIDSkipsList(t *testing.T) {
	const id = "0123456789ab"
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path == "/api/servers" {
			t.Errorf("listed servers for a full id")
			http.Error(w, `{"code":"500","status":"Internal Server Error","detail":"listed"}`, http.StatusInternalServerError)
			return
		}
		if r.URL.Path == "/api/servers/"+id {
			_, _ = w.Write([]byte(`{"id":"` + id + `","blueprint_id":"missile_wars"}`))
			return
		}
		http.NotFound(w, r)
	}))
	t.Cleanup(srv.Close)

	server, err := resolveOn(t, srv.URL, id)
	if err != nil {
		t.Fatal(err)
	}
	if server.ID != id || server.BlueprintID != "missile_wars" {
		t.Fatalf("server %#v", server)
	}
}

func TestResolveCompositeFullIDSkipsList(t *testing.T) {
	const id = "499x92z8o8sk"
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path == "/api/servers" {
			t.Errorf("listed servers for a full composite id")
			http.Error(w, `{"code":"500","status":"Internal Server Error","detail":"listed"}`, http.StatusInternalServerError)
			return
		}
		if r.URL.Path == "/api/servers/"+id {
			_, _ = w.Write([]byte(`{"id":"` + id + `","blueprint_id":"chunk_runner"}`))
			return
		}
		http.NotFound(w, r)
	}))
	t.Cleanup(srv.Close)

	server, err := resolveOn(t, srv.URL, "chunk_runner."+id)
	if err != nil {
		t.Fatal(err)
	}
	if server.ID != id || server.BlueprintID != "chunk_runner" {
		t.Fatalf("server %#v", server)
	}
}

func TestResolveBlueprintAndPrefix(t *testing.T) {
	body := `[{"id":"0123456789ab","blueprint_id":"missile_wars"},{"id":"012399999999","blueprint_id":"bedwars"}]`
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodGet && r.URL.Path == "/api/servers" {
			_, _ = w.Write([]byte(body))
			return
		}
		w.Header().Set("Content-Type", "application/json")
		http.Error(w, `{"code":"404","status":"Not Found","detail":"missing"}`, http.StatusNotFound)
	}))
	t.Cleanup(srv.Close)

	server, err := resolveOn(t, srv.URL, "missile_wars")
	if err != nil {
		t.Fatal(err)
	}
	if server.ID != "0123456789ab" {
		t.Fatalf("blueprint resolved %#v", server)
	}

	var out strings.Builder
	cmd := &cobra.Command{}
	cmd.SetOut(&out)
	cmd.SetContext(context.Background())
	client, err := api.New(config.API{URL: srv.URL, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	p, err := print.New(&out, "table")
	if err != nil {
		t.Fatal(err)
	}
	_, err = resolveServer(cmd, client, p, "0123")
	if !errors.Is(err, errMultipleMatches) {
		t.Fatalf("err %v", err)
	}
	text := out.String()
	if !strings.Contains(text, "0123456789ab") || !strings.Contains(text, "012399999999") {
		t.Fatalf("output %q", text)
	}
	if !strings.Contains(text, "2 servers matched") {
		t.Fatalf("output %q", text)
	}
	if !strings.Contains(text, "BLUEPRINT") {
		t.Fatalf("expected a table: %q", text)
	}
	if strings.Contains(text, "Node ID") {
		t.Fatalf("expected a table, got details: %q", text)
	}
}

func TestShowEachPrintsCommandOutput(t *testing.T) {
	body := `[{"id":"0123456789ab","blueprint_id":"chunk_runner"},{"id":"012399999999","blueprint_id":"chunk_runner"}]`
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if strings.HasSuffix(r.URL.Path, "/stats") {
			id := strings.TrimSuffix(strings.TrimPrefix(r.URL.Path, "/api/servers/"), "/stats")
			_, _ = w.Write([]byte(`{"state":"running","memory_bytes":10,"cpu_absolute":1}`))
			if id == "" {
				t.Errorf("missing id")
			}
			return
		}
		if r.URL.Path == "/api/servers" {
			_, _ = w.Write([]byte(body))
			return
		}
		http.NotFound(w, r)
	}))
	t.Cleanup(srv.Close)

	var out strings.Builder
	cmd := &cobra.Command{}
	cmd.SetOut(&out)
	cmd.SetContext(context.Background())
	client, err := api.New(config.API{URL: srv.URL, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	p, err := print.New(&out, "table")
	if err != nil {
		t.Fatal(err)
	}
	err = showEach(cmd, client, p, "chunk_runner", func(c *api.Client, p *print.Printer, server api.Server) error {
		stats, err := c.ServerStats(cmd.Context(), server.ID)
		if err != nil {
			return err
		}
		return p.Write(stats, statsFields(stats))
	})
	if err != nil {
		t.Fatal(err)
	}
	text := out.String()
	if !strings.Contains(text, "State") || !strings.Contains(text, "running") || !strings.Contains(text, "CPU") {
		t.Fatalf("expected stats, got %q", text)
	}
	if strings.Contains(text, "Software") {
		t.Fatalf("expected stats, got info fields: %q", text)
	}
	if !strings.Contains(text, "2 servers matched") {
		t.Fatalf("output %q", text)
	}
}

func TestResolveFullIDFallsBackToBlueprint(t *testing.T) {
	const id = "0123456789ab"
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path == "/api/servers/"+id {
			w.Header().Set("Content-Type", "application/json")
			http.Error(w, `{"code":"404","status":"Not Found","detail":"missing"}`, http.StatusNotFound)
			return
		}
		if r.URL.Path == "/api/servers" {
			_, _ = w.Write([]byte(`[{"id":"aabbccddeeff","blueprint_id":"` + id + `"}]`))
			return
		}
		http.NotFound(w, r)
	}))
	t.Cleanup(srv.Close)

	server, err := resolveOn(t, srv.URL, id)
	if err != nil {
		t.Fatal(err)
	}
	if server.ID != "aabbccddeeff" {
		t.Fatalf("fallback %#v", server)
	}
}

func resolveOn(t *testing.T, url, query string) (api.Server, error) {
	t.Helper()
	server, err := resolveOnWriter(t, url, query, &strings.Builder{})
	return server, err
}

func resolveOnWriter(t *testing.T, url, query string, w io.Writer) (api.Server, error) {
	t.Helper()
	client, err := api.New(config.API{URL: url, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	cmd := &cobra.Command{}
	cmd.SetContext(context.Background())
	p, err := print.New(w, "table")
	if err != nil {
		t.Fatal(err)
	}
	return resolveServer(cmd, client, p, query)
}

func ids(servers []api.Server) []string {
	out := make([]string, len(servers))
	for i, server := range servers {
		out[i] = server.ID
	}
	return out
}
