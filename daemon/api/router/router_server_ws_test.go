package router

import (
	"context"
	"encoding/json"
	"net"
	"net/http"
	"testing"
	"time"

	"github.com/gorilla/websocket"
	"protoxon.com/sls/daemon/api/auth"
	dws "protoxon.com/sls/daemon/api/router/websocket"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/daemon/server"
	"protoxon.com/sls/daemon/system"
	"protoxon.com/sls/internal/events"
)

func TestServerWebsocketDoesNotReserveSlotBeforeAuth(t *testing.T) {
	instance := newWebsocketTestServer(t)
	srv, base := startWebsocketTestServer(t, instance)
	defer srv.Close()

	conn := dialServerSocket(t, base)
	defer conn.Close()
	if instance.Websockets().Len() != 0 {
		t.Fatalf("slots before auth: %d", instance.Websockets().Len())
	}
	authenticateSocket(t, conn, "abc", []string{dws.PermissionConnect})
	if instance.Websockets().Len() != 1 {
		t.Fatalf("slots after auth: %d", instance.Websockets().Len())
	}
}

func TestServerWebsocketIgnoresLogsBeforeAuth(t *testing.T) {
	instance := newWebsocketTestServer(t)
	srv, base := startWebsocketTestServer(t, instance)
	defer srv.Close()

	conn := dialServerSocket(t, base)
	defer conn.Close()
	writeEvent(t, conn, "send logs", nil)
	if event := readEvent(t, conn, time.Second); event != "jwt error" {
		t.Fatalf("event %q", event)
	}

	instance.Sink(system.LogSink).Push([]byte("line-one"))
	_ = conn.SetReadDeadline(time.Now().Add(200 * time.Millisecond))
	_, _, err := conn.ReadMessage()
	if err == nil {
		t.Fatal("console output was forwarded before auth")
	}
}

func TestServerWebsocketConsoleOutput(t *testing.T) {
	instance := newWebsocketTestServer(t)
	srv, base := startWebsocketTestServer(t, instance)
	defer srv.Close()

	conn := dialServerSocket(t, base)
	defer conn.Close()
	authenticateSocket(t, conn, "abc", []string{dws.PermissionConnect})

	// The HTTP server timeouts are shorter than this wait. A live socket only
	// survives them when the upgrade clears the connection deadlines.
	time.Sleep(400 * time.Millisecond)

	deadline := time.Now().Add(2 * time.Second)
	for time.Now().Before(deadline) {
		instance.Sink(system.LogSink).Push([]byte("line-one"))
		_ = conn.SetReadDeadline(time.Now().Add(200 * time.Millisecond))
		_, payload, err := conn.ReadMessage()
		if err != nil {
			continue
		}
		msg := decodeEvent(t, payload)
		if msg.Event == "console output" && len(msg.Args) == 1 && msg.Args[0] == "line-one" {
			return
		}
	}
	t.Fatal("timed out waiting for console output")
}

func TestServerWebsocketReadOnlyTokenIgnoresCommands(t *testing.T) {
	instance := newWebsocketTestServer(t)
	instance.Environment.(*stubEnv).commands = make(chan string, 1)
	srv, base := startWebsocketTestServer(t, instance)
	defer srv.Close()

	conn := dialServerSocket(t, base)
	defer conn.Close()
	authenticateSocket(t, conn, "abc", []string{dws.PermissionConnect})
	writeEvent(t, conn, "send command", []string{"say hi"})

	select {
	case got := <-instance.Environment.(*stubEnv).commands:
		t.Fatalf("command executed: %s", got)
	case <-time.After(300 * time.Millisecond):
	}
}

func TestServerWebsocketRejectsMismatchedServer(t *testing.T) {
	instance := newWebsocketTestServer(t)
	srv, base := startWebsocketTestServer(t, instance)
	defer srv.Close()

	conn := dialServerSocket(t, base)
	defer conn.Close()
	token := signTestToken(t, "other", []string{dws.PermissionConnect})
	writeEvent(t, conn, "auth", []string{token})
	if event := readEvent(t, conn, time.Second); event != "jwt error" {
		t.Fatalf("event %q", event)
	}
}

func dialServerSocket(t *testing.T, base string) *websocket.Conn {
	t.Helper()
	conn, _, err := websocket.DefaultDialer.Dial(base+"/api/servers/abc/ws", nil)
	if err != nil {
		t.Fatalf("dial: %v", err)
	}
	return conn
}

func authenticateSocket(t *testing.T, conn *websocket.Conn, serverID string, permissions []string) {
	t.Helper()
	writeEvent(t, conn, "auth", []string{signTestToken(t, serverID, permissions)})
	deadline := time.Now().Add(time.Second)
	for time.Now().Before(deadline) {
		if readEvent(t, conn, time.Until(deadline)) == "auth success" {
			return
		}
	}
	t.Fatal("timed out waiting for auth success")
}

func signTestToken(t *testing.T, serverID string, permissions []string) string {
	t.Helper()
	token, err := dws.Sign("test-token", serverID, "user", permissions, time.Now().Add(time.Minute))
	if err != nil {
		t.Fatal(err)
	}
	return token
}

func writeEvent(t *testing.T, conn *websocket.Conn, event string, args []string) {
	t.Helper()
	payload := map[string]any{"event": event}
	if args != nil {
		payload["args"] = args
	}
	if err := conn.WriteJSON(payload); err != nil {
		t.Fatal(err)
	}
}

func readEvent(t *testing.T, conn *websocket.Conn, wait time.Duration) string {
	t.Helper()
	_ = conn.SetReadDeadline(time.Now().Add(wait))
	_, payload, err := conn.ReadMessage()
	if err != nil {
		t.Fatal(err)
	}
	return decodeEvent(t, payload).Event
}

func decodeEvent(t *testing.T, payload []byte) struct {
	Event string   `json:"event"`
	Args  []string `json:"args"`
} {
	t.Helper()
	var msg struct {
		Event string   `json:"event"`
		Args  []string `json:"args"`
	}
	if err := json.Unmarshal(payload, &msg); err != nil {
		t.Fatal(err)
	}
	return msg
}

func newWebsocketTestServer(t *testing.T) *server.Server {
	t.Helper()
	config.Set(&config.Configuration{
		RemoteApi: config.RemoteApi{Url: "http://controller"},
	})
	if err := auth.SetToken("test-token"); err != nil {
		t.Fatal(err)
	}
	instance, err := server.New(nil)
	if err != nil {
		t.Fatal(err)
	}
	instance.SetIDForTest("abc")
	instance.Environment = &stubEnv{state: environment.ProcessRunningState, bus: events.NewBus()}
	return instance
}

func startWebsocketTestServer(t *testing.T, instance *server.Server) (*http.Server, string) {
	t.Helper()
	manager := server.NewManager(nil)
	manager.Add(instance)
	engine := New(&Resources{
		ServerManager: manager,
		VerifyToken:   auth.Verify,
	}).Configure()

	ln, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		t.Fatal(err)
	}
	srv := &http.Server{
		Handler:      engine,
		ReadTimeout:  200 * time.Millisecond,
		WriteTimeout: 200 * time.Millisecond,
	}
	go func() {
		_ = srv.Serve(ln)
	}()
	t.Cleanup(func() {
		_ = srv.Close()
	})
	return srv, "ws://" + ln.Addr().String()
}

type stubEnv struct {
	state    string
	bus      *events.Bus
	logs     []string
	commands chan string
}

func (e *stubEnv) Type() string                       { return "stub" }
func (e *stubEnv) Config() *environment.Configuration { return &environment.Configuration{} }
func (e *stubEnv) Events() *events.Bus                { return e.bus }
func (e *stubEnv) Exists() (bool, error)              { return true, nil }
func (e *stubEnv) IsRunning(context.Context) (bool, error) {
	return e.state == environment.ProcessRunningState, nil
}
func (e *stubEnv) InSituUpdate() error                 { return nil }
func (e *stubEnv) OnBeforeStart(context.Context) error { return nil }
func (e *stubEnv) Start(context.Context) error         { return nil }
func (e *stubEnv) Stop(context.Context) error          { return nil }
func (e *stubEnv) Pause(context.Context) error         { return nil }
func (e *stubEnv) Unpause(context.Context) error       { return nil }
func (e *stubEnv) WaitForStop(context.Context, time.Duration, bool) error {
	return nil
}
func (e *stubEnv) Terminate(context.Context, string) error { return nil }
func (e *stubEnv) Destroy() error                          { return nil }
func (e *stubEnv) ExitState() (uint32, bool, error)        { return 0, false, nil }
func (e *stubEnv) Create() error                           { return nil }
func (e *stubEnv) Attach(context.Context) error            { return nil }
func (e *stubEnv) SendCommand(command string) error {
	if e.commands != nil {
		e.commands <- command
	}
	return nil
}
func (e *stubEnv) Readlog(int) ([]string, error)         { return e.logs, nil }
func (e *stubEnv) State() string                         { return e.state }
func (e *stubEnv) SetState(state string)                 { e.state = state }
func (e *stubEnv) Uptime(context.Context) (int64, error) { return 0, nil }
func (e *stubEnv) SetLogCallback(func([]byte))           {}
