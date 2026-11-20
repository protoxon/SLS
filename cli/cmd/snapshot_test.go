package cmd

import (
	"bytes"
	"encoding/json"
	"io"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"
	"time"

	"protoxon.com/sls/cli/api"
)

func TestSnapshotTableTag(t *testing.T) {
	table := snapshotTable([]api.Snapshot{
		{ID: "k3m9", Tag: "reset", Status: "ready", BlueprintID: "bedwars", ServerID: "srv_a"},
		{ID: "h8w2", Status: "ready"},
	})
	if len(table.Columns) < 2 || table.Columns[0].Header != "TAG" || table.Columns[1].Header != "ID" {
		t.Fatalf("columns %+v", table.Columns)
	}
	if table.Rows[0][0] != "reset" || table.Rows[0][1] != "k3m9" {
		t.Fatalf("tagged row %v", table.Rows[0])
	}
	if table.Rows[1][0] != "-" || table.Rows[1][1] != "h8w2" {
		t.Fatalf("untagged row %v", table.Rows[1])
	}
	fields := snapshotFields(api.Snapshot{ID: "k3m9", Tag: "reset"})
	if len(fields.Items) < 2 || fields.Items[1].Key != "Tag" || fields.Items[1].Value != "reset" {
		t.Fatalf("fields %+v", fields.Items)
	}
}

func TestSnapshotAgeAndPaths(t *testing.T) {
	if snapshotAge(time.Time{}) != "-" || formatSnapshotTime(time.Time{}) != "-" {
		t.Fatal("zero time should render as a dash")
	}
	if got := snapshotAge(time.Now().Add(-2*time.Hour - time.Second)); got != "2h" {
		t.Fatalf("age = %s", got)
	}
	if got := snapshotAge(time.Now().Add(-3*24*time.Hour - time.Second)); got != "3d" {
		t.Fatalf("age = %s", got)
	}
	got := splitPaths([]string{" /world, /plugins ", "config"})
	if strings.Join(got, "|") != "/world|/plugins|config" {
		t.Fatalf("paths %v", got)
	}
	if cleanCommands([]string{" save-off ", ""})[0] != "save-off" || len(cleanCommands([]string{"  "})) != 0 {
		t.Fatal("commands were not trimmed")
	}
}

func TestSnapshotLsJSON(t *testing.T) {
	isolateSocket(t)
	t.Cleanup(func() { outputFormat = "table" })
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != "/api/snapshots" {
			http.NotFound(w, r)
			return
		}
		_, _ = w.Write([]byte(`[{"id":"snap1","blueprint_id":"bedwars","server_id":"srv_a","status":"ready","size":1536,"created_at":"2026-01-02T15:04:05Z"}]`))
	}))
	t.Cleanup(srv.Close)
	withAPIEnv(t, srv.URL)

	cmd := newSnapshotLsCommand()
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
	if len(got) != 1 || got[0]["id"] != "snap1" || got[0]["blueprint_id"] != "bedwars" {
		t.Fatalf("got %#v from %q", got, out.String())
	}
}

func TestSnapshotCreateWatch(t *testing.T) {
	isolateSocket(t)
	t.Cleanup(func() { outputFormat = "table" })
	var body api.CreateSnapshotRequest
	var watched bool
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.Method == http.MethodGet && r.URL.Path == "/api/servers":
			_, _ = w.Write([]byte(`[{"id":"srv_a","blueprint_id":"bedwars"}]`))
		case r.Method == http.MethodGet && r.URL.Path == "/api/servers/srv_a/status":
			_, _ = w.Write([]byte(`{"status":"running"}`))
		case r.Method == http.MethodPost && r.URL.Path == "/api/servers/srv_a/snapshots":
			watched = r.URL.Query().Get("watch") == "true"
			if err := json.NewDecoder(r.Body).Decode(&body); err != nil {
				t.Errorf("decode: %v", err)
			}
			w.Header().Set("Content-Type", "application/x-ndjson")
			_, _ = io.WriteString(w, "{\"id\":\"snap1\",\"phase\":\"copying\"}\n{\"id\":\"snap1\",\"phase\":\"copying\"}\n{\"id\":\"snap1\",\"phase\":\"ready\"}\n")
		case r.Method == http.MethodGet && r.URL.Path == "/api/snapshots/snap1":
			_, _ = w.Write([]byte(`{"id":"snap1","status":"ready","phase":"ready","blueprint_id":"bedwars","server_id":"srv_a","size":2048,"digest":"sha256:abc","targets":[{"target":"/"}]}`))
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	withAPIEnv(t, srv.URL)

	cmd := newSnapshotCreateCommand()
	var stdout, stderr bytes.Buffer
	cmd.SetOut(&stdout)
	cmd.SetErr(&stderr)
	cmd.SetArgs([]string{"srv_a", "--target", "/world,/plugins"})
	if err := cmd.Execute(); err != nil {
		t.Fatal(err)
	}
	if !watched {
		t.Fatal("expected watch=true")
	}
	if strings.Join(body.Targets, ",") != "/world,/plugins" {
		t.Fatalf("targets %#v", body.Targets)
	}
	if strings.Join(body.Pre, ",") != "save-off,save-all" || strings.Join(body.Post, ",") != "save-on" || body.PreDelaySeconds != 5 {
		t.Fatalf("save commands %#v", body)
	}
	if strings.Count(stderr.String(), "copying") != 1 || !strings.Contains(stderr.String(), "Snapshot snap1: ready") {
		t.Fatalf("progress %q", stderr.String())
	}
	if !strings.Contains(stdout.String(), "snap1") || !strings.Contains(stdout.String(), "sha256:abc") || !strings.Contains(stdout.String(), "/") {
		t.Fatalf("stdout %q", stdout.String())
	}
}

func TestSnapshotCreateFlags(t *testing.T) {
	tests := []struct {
		name    string
		status  string
		args    []string
		wantPre string
		detach  bool
	}{
		{name: "offline", status: "offline", wantPre: ""},
		{name: "no-save", status: "running", args: []string{"--no-save"}, wantPre: ""},
		{name: "custom", status: "running", args: []string{"--pre", "say hi", "--post", "save-on", "--pre-delay", "2"}, wantPre: "say hi"},
		{name: "detach", status: "running", args: []string{"--detach", "--no-save"}, wantPre: "", detach: true},
		{name: "tag", status: "running", args: []string{"--tag", "reset", "--detach", "--no-save"}, wantPre: "", detach: true},
	}
	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			isolateSocket(t)
			t.Cleanup(func() { outputFormat = "table" })
			var body api.CreateSnapshotRequest
			var watched string
			srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
				switch {
				case r.Method == http.MethodGet && r.URL.Path == "/api/servers":
					_, _ = w.Write([]byte(`[{"id":"srv_a","blueprint_id":"bedwars"}]`))
				case r.Method == http.MethodGet && r.URL.Path == "/api/servers/srv_a/status":
					_, _ = w.Write([]byte(`{"status":"` + tc.status + `"}`))
				case r.Method == http.MethodPost && r.URL.Path == "/api/servers/srv_a/snapshots":
					watched = r.URL.Query().Get("watch")
					_ = json.NewDecoder(r.Body).Decode(&body)
					if watched == "true" {
						_, _ = io.WriteString(w, "{\"id\":\"snap1\",\"phase\":\"ready\"}\n")
						return
					}
					w.WriteHeader(http.StatusAccepted)
					_, _ = w.Write([]byte(`{"id":"snap1","status":"creating","phase":"copying"}`))
				case r.Method == http.MethodGet && r.URL.Path == "/api/snapshots/snap1":
					_, _ = w.Write([]byte(`{"id":"snap1","status":"ready"}`))
				default:
					http.NotFound(w, r)
				}
			}))
			t.Cleanup(srv.Close)
			withAPIEnv(t, srv.URL)

			cmd := newSnapshotCreateCommand()
			cmd.SetOut(io.Discard)
			cmd.SetErr(io.Discard)
			cmd.SetArgs(append([]string{"srv_a"}, tc.args...))
			if err := cmd.Execute(); err != nil {
				t.Fatal(err)
			}
			if got := strings.Join(body.Pre, ","); got != tc.wantPre {
				t.Fatalf("pre = %q", got)
			}
			if tc.name == "custom" && (body.PreDelaySeconds != 2 || strings.Join(body.Post, ",") != "save-on") {
				t.Fatalf("custom %#v", body)
			}
			if tc.detach && watched != "" {
				t.Fatalf("detach watch = %q", watched)
			}
			if !tc.detach && watched != "true" {
				t.Fatalf("watch = %q", watched)
			}
			if strings.Contains(strings.Join(tc.args, " "), "--tag") && body.Tag != "reset" {
				t.Fatalf("tag = %q", body.Tag)
			}
		})
	}
}

func TestSnapshotCreateFailed(t *testing.T) {
	isolateSocket(t)
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.Method == http.MethodGet && r.URL.Path == "/api/servers":
			_, _ = w.Write([]byte(`[{"id":"srv_a","blueprint_id":"bedwars"}]`))
		case r.Method == http.MethodGet && r.URL.Path == "/api/servers/srv_a/status":
			_, _ = w.Write([]byte(`{"status":"offline"}`))
		case r.Method == http.MethodPost && r.URL.Path == "/api/servers/srv_a/snapshots":
			_, _ = io.WriteString(w, "{\"id\":\"snap1\",\"phase\":\"failed\",\"error\":\"disk full\"}\n")
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	withAPIEnv(t, srv.URL)

	cmd := newSnapshotCreateCommand()
	cmd.SetOut(io.Discard)
	cmd.SetErr(io.Discard)
	cmd.SetArgs([]string{"srv_a"})
	err := cmd.Execute()
	if err == nil || err.Error() != "snapshot snap1 failed: disk full" {
		t.Fatalf("err = %v", err)
	}
}

func TestSnapshotRestoreAndDelete(t *testing.T) {
	isolateSocket(t)
	t.Cleanup(func() { outputFormat = "table" })
	var created api.CreateServerRequest
	var deleted []string
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.Method == http.MethodGet && r.URL.Path == "/api/snapshots":
			_, _ = w.Write([]byte(`[{"id":"snap1"},{"id":"snap2"}]`))
		case r.Method == http.MethodGet && r.URL.Path == "/api/snapshots/snap1":
			_, _ = w.Write([]byte(`{"id":"snap1","blueprint_id":"bedwars","status":"ready"}`))
		case r.Method == http.MethodGet && r.URL.Path == "/api/snapshots/missing":
			w.WriteHeader(http.StatusOK)
			_, _ = w.Write([]byte(`{"id":"missing","status":"ready"}`))
		case r.Method == http.MethodPost && r.URL.Path == "/api/servers":
			if err := json.NewDecoder(r.Body).Decode(&created); err != nil {
				t.Errorf("decode: %v", err)
			}
			w.WriteHeader(http.StatusAccepted)
			_, _ = w.Write([]byte(`{"id":"srv_new","blueprint_id":"bedwars","node_name":"node-1"}`))
		case r.Method == http.MethodDelete && strings.HasPrefix(r.URL.Path, "/api/snapshots/"):
			if r.URL.Query().Get("force") != "true" {
				t.Errorf("force missing on %s", r.URL.Path)
			}
			deleted = append(deleted, strings.TrimPrefix(r.URL.Path, "/api/snapshots/"))
			w.WriteHeader(http.StatusNoContent)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	withAPIEnv(t, srv.URL)

	restore := newSnapshotRestoreCommand()
	var out bytes.Buffer
	restore.SetOut(&out)
	restore.SetErr(&out)
	restore.SetArgs([]string{"snap1", "--node", "node-9"})
	if err := restore.Execute(); err != nil {
		t.Fatal(err)
	}
	if created.BlueprintID != "bedwars" || created.NodeId != "node-9" || len(created.SnapshotIDs) != 1 || created.SnapshotIDs[0] != "snap1" {
		t.Fatalf("create %#v", created)
	}
	if !strings.Contains(out.String(), "srv_new") {
		t.Fatalf("restore output %q", out.String())
	}

	missing := newSnapshotRestoreCommand()
	missing.SetOut(io.Discard)
	missing.SetErr(io.Discard)
	missing.SetArgs([]string{"missing"})
	if err := missing.Execute(); err == nil || err.Error() != "snapshot missing has no blueprint" {
		t.Fatalf("missing blueprint err = %v", err)
	}

	rm := newSnapshotRmCommand()
	out.Reset()
	rm.SetOut(&out)
	rm.SetErr(&out)
	rm.SetArgs([]string{"all", "--force"})
	if err := rm.Execute(); err != nil {
		t.Fatal(err)
	}
	if strings.Join(deleted, ",") != "snap1,snap2" {
		t.Fatalf("deleted %v", deleted)
	}
	if !strings.Contains(out.String(), "snap1") || !strings.Contains(out.String(), "delete") {
		t.Fatalf("delete output %q", out.String())
	}
}

func TestSnapshotCommandsRegistered(t *testing.T) {
	for _, args := range [][]string{
		{"snapshot", "list"},
		{"snapshot", "info", "snap1"},
		{"snapshot", "delete", "snap1"},
	} {
		cmd, _, err := rootCmd.Find(args)
		if err != nil {
			t.Fatal(err)
		}
		switch args[1] {
		case "list":
			if cmd.Name() != "ls" {
				t.Fatalf("list = %s", cmd.Name())
			}
		case "info":
			if cmd.Name() != "inspect" {
				t.Fatalf("info = %s", cmd.Name())
			}
		case "delete":
			if cmd.Name() != "rm" {
				t.Fatalf("delete = %s", cmd.Name())
			}
		}
	}
}

func withAPIEnv(t *testing.T, url string) {
	t.Helper()
	t.Setenv("SLS_API_URL", url)
	t.Setenv("SLS_TOKEN", "tok")
	t.Setenv("SLS_CONFIG", filepath.Join(t.TempDir(), "config.yaml"))
}
