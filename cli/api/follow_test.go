package api

import (
	"context"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"strconv"
	"strings"
	"sync/atomic"
	"testing"
	"time"

	"github.com/gorilla/websocket"
)

func TestFollowLogsRenewsToken(t *testing.T) {
	var fetches atomic.Int32
	upgrader := websocket.Upgrader{CheckOrigin: func(*http.Request) bool { return true }}
	var srv *httptest.Server
	srv = httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case "/api/servers/srv/websocket":
			n := fetches.Add(1)
			socket := "ws" + strings.TrimPrefix(srv.URL, "http") + "/api/servers/srv/ws"
			_ = json.NewEncoder(w).Encode(consoleTicket{Token: "token-" + strconv.Itoa(int(n)), Socket: socket})
		case "/api/servers/srv/ws":
			conn, err := upgrader.Upgrade(w, r, nil)
			if err != nil {
				return
			}
			defer conn.Close()
			if _, _, err := conn.ReadMessage(); err != nil {
				return
			}
			if err := conn.WriteJSON(map[string]any{"event": "token expiring"}); err != nil {
				return
			}
			if _, _, err := conn.ReadMessage(); err != nil {
				return
			}
			_ = conn.WriteJSON(map[string]any{"event": "console output", "args": []string{"hello"}})
			for {
				if _, _, err := conn.ReadMessage(); err != nil {
					return
				}
			}
		default:
			http.NotFound(w, r)
		}
	}))
	defer srv.Close()

	c := &Client{
		baseURL:    srv.URL,
		token:      "key",
		httpClient: &http.Client{Timeout: 15 * time.Second},
	}
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()
	var got string
	err := c.FollowLogs(ctx, "srv", func(line string) error {
		got = line
		cancel()
		return nil
	})
	if err != nil {
		t.Fatal(err)
	}
	if got != "hello" {
		t.Fatalf("line %q", got)
	}
	if fetches.Load() < 2 {
		t.Fatalf("fetches %d", fetches.Load())
	}
}

func TestConsoleLine(t *testing.T) {
	line, ok := consoleLine([]byte(`{"event":"console output","args":["hello"]}`))
	if !ok || line != "hello" {
		t.Fatalf("console line %q ok=%v", line, ok)
	}
	line, ok = consoleLine([]byte(`{"event":"install output","args":["pull ","image"]}`))
	if !ok || line != "pull image" {
		t.Fatalf("install line %q ok=%v", line, ok)
	}
	if _, ok := consoleLine([]byte(`{"event":"status","args":["running"]}`)); ok {
		t.Fatal("status frame should be ignored")
	}
}
