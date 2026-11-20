package router

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"strings"
	"sync"
	"sync/atomic"
	"testing"
	"time"

	"github.com/gbrlsnchs/jwt/v3"
	"github.com/gorilla/websocket"
	"protoxon.com/sls/controller/auth/scope"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/server"
)

func TestServerWebsocketTicket(t *testing.T) {
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	manager := server.NewEmptyManager()
	nodeClient := client.New().Node("node", "http://daemon.example:5585", "node-token")
	manager.Add(server.NewWithClient("srv", "node", nodeClient.Server("srv")))

	rt, svc := testTokenRouter(t)
	rt.ServerManager = manager
	attachConsoleNode(rt, "node", "http://daemon.example:5585", "node-token", false)
	rt.Handler = rt.Configure()

	readKey := createTestKey(t, svc, "read", []string{scope.ServersRead}, nil)
	read := fetchTicket(t, rt, readKey.Key)
	if read.Socket != "ws://daemon.example:5585/api/servers/srv/ws" {
		t.Fatalf("socket %q", read.Socket)
	}
	readClaims := verifyTicket(t, read.Token, "node-token")
	if readClaims.ServerUUID != "srv" {
		t.Fatalf("server %q", readClaims.ServerUUID)
	}
	if readClaims.UserUUID == "" || readClaims.UserUUID == "local" {
		t.Fatalf("user %q", readClaims.UserUUID)
	}
	if !hasPermission(readClaims, permConnect) {
		t.Fatal("read token missing websocket.connect")
	}
	if hasPermission(readClaims, permCommand) {
		t.Fatal("read token includes control.console")
	}
	if readClaims.ExpirationTime == nil || time.Until(readClaims.ExpirationTime.Time) > websocketTokenTTL+time.Minute {
		t.Fatal("token lifetime is not 10 minutes")
	}

	writeKey := createTestKey(t, svc, "write", []string{scope.ServersRead, scope.ServersWrite}, nil)
	write := fetchTicket(t, rt, writeKey.Key)
	writeClaims := verifyTicket(t, write.Token, "node-token")
	if !hasPermission(writeClaims, permCommand) || !hasPermission(writeClaims, permStart) || !hasPermission(writeClaims, permStop) || !hasPermission(writeClaims, permRestart) {
		t.Fatalf("write permissions %v", writeClaims.Permissions)
	}
}

func TestServerWebsocketTicketProxied(t *testing.T) {
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
		Api:      config.ApiConfiguration{Port: 5620},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	manager := server.NewEmptyManager()
	nodeClient := client.New().Node("node", "http://daemon.example:5585", "node-token")
	manager.Add(server.NewWithClient("srv", "node", nodeClient.Server("srv")))

	rt, svc := testTokenRouter(t)
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
		Api:      config.ApiConfiguration{Port: 5620},
	})
	rt.ServerManager = manager
	attachConsoleNode(rt, "node", "http://daemon.example:5585", "node-token", true)
	rt.Handler = rt.Configure()

	key := createTestKey(t, svc, "read", []string{scope.ServersRead}, nil)
	req := httptest.NewRequest(http.MethodGet, "/api/servers/srv/websocket", nil)
	req.Host = "panel.example:5620"
	req.Header.Set("X-Forwarded-Proto", "https")
	req.Header.Set("Authorization", "Bearer "+key.Key)
	w := httptest.NewRecorder()
	rt.Handler.ServeHTTP(w, req)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
	var ticket websocketTicket
	if err := json.Unmarshal(w.Body.Bytes(), &ticket); err != nil {
		t.Fatal(err)
	}
	if ticket.Socket != "wss://panel.example:5620/api/servers/srv/ws" {
		t.Fatalf("socket %q", ticket.Socket)
	}

	local := doJSON(t, rt.Handler, http.MethodGet, "/api/servers/srv/websocket", key.Key, nil, true)
	if local.Code != http.StatusOK {
		t.Fatalf("local status %d: %s", local.Code, local.Body.String())
	}
	if err := json.Unmarshal(local.Body.Bytes(), &ticket); err != nil {
		t.Fatal(err)
	}
	if ticket.Socket != "ws://127.0.0.1:5620/api/servers/srv/ws" {
		t.Fatalf("local socket %q", ticket.Socket)
	}
}

func TestConsoleProxyRegistration(t *testing.T) {
	rt, svc := testTokenRouter(t)
	config.SetForTest(&config.Configuration{
		System:   config.SystemConfiguration{RootDirectory: t.TempDir()},
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	if err := initRouterTestDB(); err != nil {
		t.Fatal(err)
	}
	rt.NodeManager = node.NewManager(client.New())
	rt.Handler = rt.Configure()
	key := createTestKey(t, svc, "node", []string{scope.Node}, nil)

	postRegister := func(t *testing.T, body map[string]any) {
		t.Helper()
		w := doJSON(t, rt.Handler, http.MethodPost, "/api/nodes/node-reg/register", key.Key, body, false)
		if w.Code != http.StatusOK {
			t.Fatalf("status %d: %s", w.Code, w.Body.String())
		}
	}
	base := map[string]any{
		"id":       "node-reg",
		"name":     "node",
		"url":      "http://daemon.example:5585",
		"location": "main",
	}
	postRegister(t, base)
	got, ok := rt.NodeManager.Get("node-reg")
	if !ok || !got.ConsoleProxy() {
		t.Fatal("omitted console_proxy should be proxied")
	}

	off := false
	base["console_proxy"] = off
	postRegister(t, base)
	got, ok = rt.NodeManager.Get("node-reg")
	if !ok || got.ConsoleProxy() {
		t.Fatal("console_proxy false was not stored")
	}

	delete(base, "console_proxy")
	postRegister(t, base)
	got, ok = rt.NodeManager.Get("node-reg")
	if !ok || !got.ConsoleProxy() {
		t.Fatal("omitted console_proxy on re-register should be proxied")
	}
}

func TestRegisterReturnsVolumeArtifacts(t *testing.T) {
	rt, svc := testTokenRouter(t)
	config.SetForTest(&config.Configuration{
		System:   config.SystemConfiguration{RootDirectory: t.TempDir()},
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	if err := initRouterTestDB(); err != nil {
		t.Fatal(err)
	}
	rt.NodeManager = node.NewManager(client.New())
	rt.BlueprintRegistry = blueprint.NewBlueprintRegistry()
	rt.BlueprintRegistry.Register(&blueprint.Blueprint{
		Meta: blueprint.Meta{ID: "bp", Name: "BP"},
		State: &blueprint.State{Volumes: []blueprint.Volume{
			{Artifact: "ghcr.io/protoxon/sls/world:latest"},
			{Artifact: "ghcr.io/protoxon/sls/chunk_runner:latest"},
			{Artifact: "ghcr.io/protoxon/sls/chunk_runner:latest"},
			{Name: "lobby", Source: "worlds/lobby", Target: "/lobby"},
		}},
	})
	rt.Handler = rt.Configure()
	key := createTestKey(t, svc, "node", []string{scope.Node}, nil)
	body := map[string]any{
		"id":       "node-arts",
		"name":     "node",
		"url":      "http://daemon.example:5585",
		"location": "main",
	}
	w := doJSON(t, rt.Handler, http.MethodPost, "/api/nodes/node-arts/register", key.Key, body, false)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
	assertRegisterArtifacts(t, w.Body.Bytes())

	w = doJSON(t, rt.Handler, http.MethodPost, "/api/nodes/node-arts/register", key.Key, body, false)
	if w.Code != http.StatusOK {
		t.Fatalf("re-register status %d: %s", w.Code, w.Body.String())
	}
	assertRegisterArtifacts(t, w.Body.Bytes())
}

func assertRegisterArtifacts(t *testing.T, body []byte) {
	t.Helper()
	var resp struct {
		Token     string   `json:"token"`
		Artifacts []string `json:"artifacts"`
	}
	if err := json.Unmarshal(body, &resp); err != nil {
		t.Fatal(err)
	}
	if resp.Token == "" {
		t.Fatal("missing token")
	}
	want := "ghcr.io/protoxon/sls/chunk_runner:latest,ghcr.io/protoxon/sls/world:latest"
	if strings.Join(resp.Artifacts, ",") != want {
		t.Fatalf("artifacts %v", resp.Artifacts)
	}
}

func TestServerConsoleProxyCopiesFrames(t *testing.T) {
	inbound := make(chan string, 4)
	daemon := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != "/api/servers/srv/ws" {
			http.NotFound(w, r)
			return
		}
		upgrader := websocket.Upgrader{CheckOrigin: func(*http.Request) bool { return true }}
		conn, err := upgrader.Upgrade(w, r, nil)
		if err != nil {
			return
		}
		defer conn.Close()
		_ = conn.WriteJSON(map[string]any{"event": "console output", "args": []string{"hello"}})
		for {
			_, payload, err := conn.ReadMessage()
			if err != nil {
				return
			}
			var frame struct {
				Event string `json:"event"`
			}
			if json.Unmarshal(payload, &frame) == nil && frame.Event != "" {
				inbound <- frame.Event
			}
		}
	}))
	defer daemon.Close()

	rt := consoleProxyRouter(t, daemon.URL)

	missing := httptest.NewRecorder()
	rt.Handler.ServeHTTP(missing, httptest.NewRequest(http.MethodGet, "/api/servers/missing/ws", nil))
	if missing.Code != http.StatusNotFound {
		t.Fatalf("missing server status %d: %s", missing.Code, missing.Body.String())
	}

	conn := dialConsoleProxy(t, rt)
	defer conn.Close()
	if err := writeConsoleAuth(t, conn, "srv", "node-token"); err != nil {
		t.Fatal(err)
	}
	if event := readProxyEvent(t, conn); event != "console output" {
		t.Fatalf("event %q", event)
	}
	select {
	case event := <-inbound:
		if event != "auth" {
			t.Fatalf("forwarded %q", event)
		}
	case <-time.After(2 * time.Second):
		t.Fatal("auth frame was not forwarded")
	}
}

func TestServerConsoleProxyDoesNotDialWithoutAuth(t *testing.T) {
	var dials atomic.Int32
	daemon := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		dials.Add(1)
		http.Error(w, "should not be dialed", http.StatusInternalServerError)
	}))
	defer daemon.Close()

	prevTimeout := consoleAuthTimeout
	consoleAuthTimeout = 200 * time.Millisecond
	t.Cleanup(func() { consoleAuthTimeout = prevTimeout })

	rt := consoleProxyRouter(t, daemon.URL)
	conn := dialConsoleProxy(t, rt)
	defer conn.Close()

	_ = conn.SetReadDeadline(time.Now().Add(time.Second))
	_, _, err := conn.ReadMessage()
	if err == nil {
		t.Fatal("unauthenticated socket stayed open")
	}
	if dials.Load() != 0 {
		t.Fatalf("daemon dials %d", dials.Load())
	}
}

func consoleProxyRouter(t *testing.T, daemonURL string) *Router {
	t.Helper()
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	manager := server.NewEmptyManager()
	nodeClient := client.New().Node("node", daemonURL, "node-token")
	manager.Add(server.NewWithClient("srv", "node", nodeClient.Server("srv")))

	rt, _ := testTokenRouter(t)
	rt.ServerManager = manager
	rt.Handler = rt.Configure()
	return rt
}

func writeConsoleAuth(t *testing.T, conn *websocket.Conn, serverID, secret string) error {
	t.Helper()
	token, err := signWebsocketToken(secret, serverID, "user", false)
	if err != nil {
		return err
	}
	return conn.WriteJSON(map[string]any{"event": "auth", "args": []string{string(token)}})
}

func attachConsoleNode(rt *Router, id, base, token string, proxy bool) {
	if rt.NodeManager == nil {
		rt.NodeManager = node.NewManager(client.New())
	}
	rt.NodeManager.Add(node.New(id, id, "main", base, token, proxy))
}

func dialConsoleProxy(t *testing.T, rt *Router) *websocket.Conn {
	t.Helper()
	srv := httptest.NewServer(rt.Handler)
	t.Cleanup(srv.Close)
	wsURL := "ws" + srv.URL[len("http"):] + "/api/servers/srv/ws"
	conn, resp, err := websocket.DefaultDialer.Dial(wsURL, nil)
	if err != nil {
		if resp != nil && resp.Body != nil {
			resp.Body.Close()
		}
		t.Fatalf("dial %s: %v", wsURL, err)
	}
	return conn
}

func readProxyEvent(t *testing.T, conn *websocket.Conn) string {
	t.Helper()
	_ = conn.SetReadDeadline(time.Now().Add(2 * time.Second))
	_, payload, err := conn.ReadMessage()
	if err != nil {
		t.Fatal(err)
	}
	var frame struct {
		Event string `json:"event"`
	}
	if err := json.Unmarshal(payload, &frame); err != nil {
		t.Fatal(err)
	}
	return frame.Event
}

var routerTestDB sync.Once

func initRouterTestDB() error {
	var err error
	routerTestDB.Do(func() {
		defer func() {
			if recover() != nil {
				err = nil
			}
		}()
		err = database.Initialize()
	})
	return err
}

func fetchTicket(t *testing.T, rt *Router, token string) websocketTicket {
	t.Helper()
	w := doJSON(t, rt.Handler, http.MethodGet, "/api/servers/srv/websocket", token, nil, false)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
	var ticket websocketTicket
	if err := json.Unmarshal(w.Body.Bytes(), &ticket); err != nil {
		t.Fatal(err)
	}
	if ticket.Token == "" || ticket.Socket == "" {
		t.Fatalf("ticket %+v", ticket)
	}
	return ticket
}

func verifyTicket(t *testing.T, token, secret string) websocketClaims {
	t.Helper()
	var claims websocketClaims
	_, err := jwt.Verify(
		[]byte(token),
		jwt.NewHS256([]byte(secret)),
		&claims,
		jwt.ValidatePayload(&claims.Payload, jwt.ExpirationTimeValidator(time.Now())),
	)
	if err != nil {
		t.Fatal(err)
	}
	if claims.Scope != "websocket" {
		t.Fatalf("scope %q", claims.Scope)
	}
	return claims
}

func hasPermission(claims websocketClaims, permission string) bool {
	for _, got := range claims.Permissions {
		if got == permission {
			return true
		}
	}
	return false
}
