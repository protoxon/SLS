package router

import (
	"context"
	"net/http"
	"path/filepath"
	"sync/atomic"
	"testing"

	"github.com/gorilla/websocket"
	"protoxon.com/sls/controller/auth/scope"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/server"
	"protoxon.com/sls/internal/httpunix"
)

func TestRegisterSocketReplacesClient(t *testing.T) {
	rt, svc := testTokenRouter(t)
	config.SetForTest(&config.Configuration{
		System:   config.SystemConfiguration{RootDirectory: t.TempDir()},
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	if err := initRouterTestDB(); err != nil {
		t.Fatal(err)
	}

	dir := t.TempDir()
	first := filepath.Join(dir, "a.sock")
	second := filepath.Join(dir, "b.sock")
	firstHits := serveOK(t, first)
	secondHits := serveOK(t, second)

	rt.NodeManager = node.NewManager(client.New())
	servers := server.NewEmptyManager()
	srv := server.NewWithClient("srv-sock", "node-sock", client.New().Node("node-sock", "http://127.0.0.1:5585", "old").Server("srv-sock"))
	servers.Add(srv)
	var attached []string
	rt.NodeManager.SetOnNodeRegistered(func(_ string, n *node.Node) {
		attached = append(attached, n.Client().Socket())
		servers.AttachNodeClientToServers(n.Id(), n)
	})
	rt.Handler = rt.Configure()
	key := createTestKey(t, svc, "node", []string{scope.Node}, nil)

	body := map[string]any{
		"id":       "node-sock",
		"name":     "node",
		"url":      "http://127.0.0.1:5585",
		"location": "main",
		"socket":   first,
	}
	post := func(socket string) {
		t.Helper()
		body["socket"] = socket
		w := doJSON(t, rt.Handler, http.MethodPost, "/api/nodes/node-sock/register", key.Key, body, false)
		if w.Code != http.StatusOK {
			t.Fatalf("status %d: %s", w.Code, w.Body.String())
		}
	}
	post(first)
	if len(attached) != 1 || attached[0] != first {
		t.Fatalf("first attach %#v", attached)
	}
	dialNode(t, srv, firstHits)

	post(second)
	if len(attached) != 2 || attached[1] != second {
		t.Fatalf("second attach %#v", attached)
	}
	before := secondHits.Load()
	dialNode(t, srv, secondHits)
	if firstHits.Load() != 1 {
		t.Fatalf("first socket hits %d", firstHits.Load())
	}
	if secondHits.Load() == before {
		t.Fatal("re-register did not dial the new socket")
	}

	got, ok := rt.NodeManager.Get("node-sock")
	if !ok || got.Socket() != second || got.Url() != "http://127.0.0.1:5585" {
		t.Fatalf("node socket %q url %q", got.Socket(), got.Url())
	}
}

func TestUpstreamWebsocketDialerUsesSocket(t *testing.T) {
	path := filepath.Join(t.TempDir(), "daemon.sock")
	lis, err := httpunix.Listen(path)
	if err != nil {
		t.Fatal(err)
	}
	upgrader := websocket.Upgrader{CheckOrigin: func(*http.Request) bool { return true }}
	srv := &http.Server{Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		conn, err := upgrader.Upgrade(w, r, nil)
		if err != nil {
			return
		}
		_ = conn.WriteMessage(websocket.TextMessage, []byte("ok"))
		_ = conn.Close()
	})}
	go func() { _ = srv.Serve(lis) }()
	t.Cleanup(func() { _ = srv.Close() })

	conn, _, err := upstreamWebsocketDialer(path).Dial("ws://127.0.0.1:5585/api/servers/srv/ws", nil)
	if err != nil {
		t.Fatal(err)
	}
	defer conn.Close()
	_, msg, err := conn.ReadMessage()
	if err != nil {
		t.Fatal(err)
	}
	if string(msg) != "ok" {
		t.Fatalf("frame %q", msg)
	}
}

func serveOK(t *testing.T, path string) *atomic.Int32 {
	t.Helper()
	lis, err := httpunix.Listen(path)
	if err != nil {
		t.Fatal(err)
	}
	var hits atomic.Int32
	srv := &http.Server{Handler: http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		hits.Add(1)
		w.WriteHeader(http.StatusNoContent)
	})}
	go func() { _ = srv.Serve(lis) }()
	t.Cleanup(func() { _ = srv.Close() })
	return &hits
}

func dialNode(t *testing.T, srv *server.Server, hits *atomic.Int32) {
	t.Helper()
	before := hits.Load()
	nc, err := srv.Client().Node()
	if err != nil {
		t.Fatal(err)
	}
	res, err := nc.Get(context.Background(), "/ping", nil)
	if err != nil {
		t.Fatal(err)
	}
	defer res.Body.Close()
	if res.StatusCode != http.StatusNoContent {
		t.Fatalf("status %d", res.StatusCode)
	}
	if hits.Load() == before {
		t.Fatal("request did not reach the socket")
	}
}
