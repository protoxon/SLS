package api

import (
	"context"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"protoxon.com/sls/cli/config"
)

func TestListAndGetSoftware(t *testing.T) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") != "Bearer tok" {
			http.Error(w, `{"detail":"unauthorized"}`, http.StatusUnauthorized)
			return
		}
		switch r.URL.Path {
		case "/api/software":
			_, _ = w.Write([]byte(`{"meta":{"pagination":{"total":1,"per_page":100,"current_page":1,"total_pages":1}},"data":[{"id":"paper","name":"Paper","stop_command":"stop"}]}`))
		case "/api/software/paper":
			_, _ = w.Write([]byte(`{"id":"paper","name":"Paper","stop_command":"stop"}`))
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)

	c, err := New(config.API{URL: srv.URL, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	items, err := c.ListSoftware(context.Background())
	if err != nil {
		t.Fatal(err)
	}
	if len(items) != 1 || items[0].ID != "paper" || items[0].Name != "Paper" {
		t.Fatalf("list %#v", items)
	}
	raw, err := c.GetSoftware(context.Background(), "paper")
	if err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(string(raw), `"id":"paper"`) {
		t.Fatalf("software %s", raw)
	}
}
