package api

import (
	"context"
	"encoding/json"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"

	"protoxon.com/config"
)

func TestServerListPowerDelete(t *testing.T) {
	var powerBody []byte
	var sawForce bool
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") != "Bearer tok" {
			http.Error(w, `{"detail":"unauthorized"}`, http.StatusUnauthorized)
			return
		}
		switch {
		case r.Method == http.MethodGet && r.URL.Path == "/api/servers":
			_, _ = w.Write([]byte(`[{"id":"srv_a","blueprint_id":"bedwars"}]`))
		case r.Method == http.MethodPost && r.URL.Path == "/api/servers/srv_a/power":
			body, _ := io.ReadAll(r.Body)
			powerBody = body
			w.WriteHeader(http.StatusOK)
		case r.Method == http.MethodDelete && r.URL.Path == "/api/servers/srv_a":
			sawForce = r.URL.Query().Get("force") == "true"
			w.WriteHeader(http.StatusOK)
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

	servers, err := c.ListServers(ctx)
	if err != nil {
		t.Fatal(err)
	}
	if len(servers) != 1 || servers[0].ID != "srv_a" || servers[0].BlueprintID != "bedwars" {
		t.Fatalf("servers %#v", servers)
	}

	if err := c.Power(ctx, "srv_a", "start"); err != nil {
		t.Fatal(err)
	}
	var action struct {
		Action string `json:"action"`
	}
	if err := json.Unmarshal(powerBody, &action); err != nil {
		t.Fatal(err)
	}
	if action.Action != "start" {
		t.Fatalf("power body %s", powerBody)
	}

	if err := c.DeleteServer(ctx, "srv_a", true); err != nil {
		t.Fatal(err)
	}
	if !sawForce {
		t.Fatal("expected force=true")
	}
}
