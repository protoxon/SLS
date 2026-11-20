package api

import (
	"context"
	"encoding/json"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"
	"time"

	"protoxon.com/sls/cli/config"
)

func TestSnapshotListGetDelete(t *testing.T) {
	var sawForce bool
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") != "Bearer tok" {
			http.Error(w, `{"detail":"unauthorized"}`, http.StatusUnauthorized)
			return
		}
		switch {
		case r.Method == http.MethodGet && r.URL.Path == "/api/snapshots":
			_, _ = w.Write([]byte(`[{"id":"snap1","blueprint_id":"bedwars","server_id":"srv_a","status":"ready","size":2048}]`))
		case r.Method == http.MethodGet && r.URL.Path == "/api/snapshots/snap1":
			_, _ = w.Write([]byte(`{"id":"snap1","status":"ready","digest":"sha256:abc","targets":[{"target":"/"}]}`))
		case r.Method == http.MethodDelete && r.URL.Path == "/api/snapshots/snap1":
			sawForce = r.URL.Query().Get("force") == "true"
			w.WriteHeader(http.StatusNoContent)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)

	c, err := New(config.API{URL: srv.URL, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	ctx := context.Background()

	items, err := c.ListSnapshots(ctx)
	if err != nil {
		t.Fatal(err)
	}
	if len(items) != 1 || items[0].ID != "snap1" || items[0].BlueprintID != "bedwars" || items[0].Size != 2048 {
		t.Fatalf("list %#v", items)
	}

	item, err := c.GetSnapshot(ctx, "snap1")
	if err != nil {
		t.Fatal(err)
	}
	if item.Digest != "sha256:abc" || len(item.Targets) != 1 || item.Targets[0].Target != "/" {
		t.Fatalf("get %#v", item)
	}

	if err := c.DeleteSnapshot(ctx, "snap1", true); err != nil {
		t.Fatal(err)
	}
	if !sawForce {
		t.Fatal("expected force=true")
	}
}

func TestWatchCreateSnapshot(t *testing.T) {
	var got CreateSnapshotRequest
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Method != http.MethodPost || r.URL.Path != "/api/servers/srv_a/snapshots" || r.URL.Query().Get("watch") != "true" {
			http.NotFound(w, r)
			return
		}
		if err := json.NewDecoder(r.Body).Decode(&got); err != nil {
			t.Errorf("decode: %v", err)
		}
		w.Header().Set("Content-Type", "application/x-ndjson")
		_, _ = io.WriteString(w, "{\"id\":\"snap1\",\"phase\":\"copying\"}\n")
		_, _ = io.WriteString(w, "{\"id\":\"snap1\",\"phase\":\"copying\"}\n")
		_, _ = io.WriteString(w, "{\"id\":\"snap1\",\"phase\":\"ready\",\"size\":4096,\"digest\":\"sha256:abc\"}\n")
	}))
	t.Cleanup(srv.Close)

	c, err := New(config.API{URL: srv.URL, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	var phases []string
	done, err := c.WatchCreateSnapshot(context.Background(), "srv_a", CreateSnapshotRequest{
		Targets:         []string{"/"},
		Pre:             []string{"save-off", "save-all"},
		Post:            []string{"save-on"},
		PreDelaySeconds: 5,
	}, func(ev SnapshotProgress) error {
		phases = append(phases, ev.Phase)
		return nil
	})
	if err != nil {
		t.Fatal(err)
	}
	if done.Phase != SnapshotPhaseReady || done.ID != "snap1" || done.Size != 4096 {
		t.Fatalf("done %#v", done)
	}
	if len(phases) != 3 || phases[0] != "copying" || phases[2] != "ready" {
		t.Fatalf("phases %v", phases)
	}
	if len(got.Pre) != 2 || got.Pre[0] != "save-off" || got.Post[0] != "save-on" || got.PreDelaySeconds != 5 {
		t.Fatalf("request %#v", got)
	}
	if c.httpClient.Timeout != 15*time.Second {
		t.Fatalf("default client timeout = %s", c.httpClient.Timeout)
	}
}

func TestWatchCreateSnapshotError(t *testing.T) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(http.StatusConflict)
		_, _ = w.Write([]byte(`{"detail":"snapshot already in progress","hint":"Wait for the current snapshot to finish."}`))
	}))
	t.Cleanup(srv.Close)

	c, err := New(config.API{URL: srv.URL, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	_, err = c.WatchCreateSnapshot(context.Background(), "srv_a", CreateSnapshotRequest{}, nil)
	if err == nil || err.Error() != "Wait for the current snapshot to finish.: snapshot already in progress" {
		t.Fatalf("err = %v", err)
	}
}
