package cmd

import (
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"

	"github.com/gorilla/websocket"
)

func TestDebugStreamsGlobalEvents(t *testing.T) {
	isolateSocket(t)
	t.Cleanup(func() {
		apiLocal = false
		apiSocket = ""
	})
	upgrader := websocket.Upgrader{CheckOrigin: func(r *http.Request) bool { return true }}
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != "/api/events/ws" {
			http.NotFound(w, r)
			return
		}
		if r.Header.Get("Authorization") != "Bearer tok" {
			http.Error(w, `{"detail":"unauthorized"}`, http.StatusUnauthorized)
			return
		}
		conn, err := upgrader.Upgrade(w, r, nil)
		if err != nil {
			return
		}
		defer conn.Close()
		frames := []string{
			`{"Topic":"status","Data":{"server_id":"abc","payload":"running"}}`,
			`{"Topic":"deleted","Data":{"server_id":"abc","payload":null}}`,
		}
		for _, frame := range frames {
			if err := conn.WriteMessage(websocket.TextMessage, []byte(frame)); err != nil {
				return
			}
		}
		_ = conn.WriteMessage(websocket.CloseMessage, websocket.FormatCloseMessage(websocket.CloseNormalClosure, ""))
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_API_URL", srv.URL)
	t.Setenv("SLS_TOKEN", "tok")
	t.Setenv("SLS_CONFIG", filepath.Join(t.TempDir(), "config.yaml"))

	cmd := newDebugCommand()
	var out, errOut strings.Builder
	cmd.SetOut(&out)
	cmd.SetErr(&errOut)
	err := cmd.Execute()
	if err == nil {
		t.Fatal("expected the stream to end when the socket closed")
	}
	text := out.String()
	for _, line := range []string{
		"[DEBUG] Server (abc) changed status to: running",
		"Server abc was deleted",
	} {
		if !strings.Contains(text, line) {
			t.Fatalf("missing %q in %q (err %v)", line, text, err)
		}
	}
	if !strings.Contains(errOut.String(), "Debug mode enabled") {
		t.Fatalf("stderr %q", errOut.String())
	}
}
