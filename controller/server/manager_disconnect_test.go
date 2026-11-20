package server

import (
	"encoding/json"
	"testing"
	"time"

	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/internal/events"
)

func TestDetachNodeClientFromServersSetsUnknown(t *testing.T) {
	m := NewEmptyManager()
	running := testManagedServer(m, "running-server", "node-aaaa", ProcessRunningState)
	offline := testManagedServer(m, "offline-server", "node-aaaa", ProcessOfflineState)
	other := testManagedServer(m, "other-server", "node-bbbb", ProcessRunningState)

	ch := make(chan []byte, 8)
	m.Events().On(ch)
	defer m.Events().Off(ch)

	m.DetachNodeClientFromServers("node-aaaa")

	if running.GetStatus() != ProcessUnknownState || offline.GetStatus() != ProcessUnknownState {
		t.Fatalf("disconnected servers status = %q, %q, want unknown", running.GetStatus(), offline.GetStatus())
	}
	if other.GetStatus() != ProcessRunningState {
		t.Fatalf("other node status = %q, want running", other.GetStatus())
	}
	if _, err := running.Client().Node(); err == nil {
		t.Fatal("expected node client to be cleared")
	}

	got := statusPayloads(t, ch)
	if len(got) != 2 {
		t.Fatalf("status events = %v, want one per disconnected server", got)
	}
	if got["running-server"] != ProcessUnknownState || got["offline-server"] != ProcessUnknownState {
		t.Fatalf("status events = %v, want unknown", got)
	}

	m.DetachNodeClientFromServers("node-aaaa")
	if extra := statusPayloads(t, ch); len(extra) != 0 {
		t.Fatalf("second detach published %v", extra)
	}
}

func TestDeferUnknownStatusKeepsLastStatusUntilGrace(t *testing.T) {
	m := NewEmptyManager()
	m.unknownGrace = 40 * time.Millisecond
	running := testManagedServer(m, "running-server", "node-aaaa", ProcessRunningState)
	offline := testManagedServer(m, "offline-server", "node-aaaa", ProcessOfflineState)
	other := testManagedServer(m, "other-server", "node-bbbb", ProcessRunningState)
	setNodeClient(running)
	setNodeClient(offline)

	ch := make(chan []byte, 8)
	m.Events().On(ch)
	defer m.Events().Off(ch)

	m.DeferUnknownStatus("node-aaaa")

	if running.GetStatus() != ProcessRunningState || offline.GetStatus() != ProcessOfflineState {
		t.Fatalf("status during grace = %q, %q", running.GetStatus(), offline.GetStatus())
	}
	if _, err := running.Client().Node(); err == nil {
		t.Fatal("expected node client to be cleared during grace")
	}
	if other.GetStatus() != ProcessRunningState {
		t.Fatalf("other node status = %q, want running", other.GetStatus())
	}
	if got := statusPayloads(t, ch); len(got) != 0 {
		t.Fatalf("published during grace: %v", got)
	}

	waitForStatus(t, running, ProcessUnknownState)
	waitForStatus(t, offline, ProcessUnknownState)
	got := statusPayloads(t, ch)
	if got["running-server"] != ProcessUnknownState || got["offline-server"] != ProcessUnknownState {
		t.Fatalf("status events = %v, want unknown", got)
	}
	if _, ok := got["other-server"]; ok {
		t.Fatalf("other node published a status: %v", got)
	}
}

func TestAttachCancelsDeferredUnknown(t *testing.T) {
	m := NewEmptyManager()
	m.unknownGrace = 40 * time.Millisecond
	running := testManagedServer(m, "running-server", "node-aaaa", ProcessRunningState)
	setNodeClient(running)

	m.DeferUnknownStatus("node-aaaa")

	n := node.New("node-aaaa", "node", "loc", "http://127.0.0.1:8080", "token", false)
	alloc, err := allocator.NewAllocator(nil)
	if err != nil {
		t.Fatal(err)
	}
	n.Allocator = alloc
	m.AttachNodeClientToServers("node-aaaa", n)

	m.pendingMu.Lock()
	_, pending := m.pendingUnknown["node-aaaa"]
	m.pendingMu.Unlock()
	if pending {
		t.Fatal("reconnect left the unknown grace pending")
	}
	if _, err := running.Client().Node(); err != nil {
		t.Fatalf("expected node client to be restored: %v", err)
	}

	time.Sleep(120 * time.Millisecond)
	if running.GetStatus() != ProcessRunningState {
		t.Fatalf("status after cancelled grace = %q, want running", running.GetStatus())
	}
}

func setNodeClient(server *Server) {
	server.Client().SetNodeClient(client.New().Node(server.nodeId, "http://127.0.0.1:8080", "token"))
}

func waitForStatus(t *testing.T, server *Server, want string) {
	t.Helper()
	deadline := time.Now().Add(time.Second)
	for time.Now().Before(deadline) {
		if server.GetStatus() == want {
			return
		}
		time.Sleep(5 * time.Millisecond)
	}
	t.Fatalf("status = %q, want %q", server.GetStatus(), want)
}

func testManagedServer(m *Manager, id, nodeID, status string) *Server {
	s := &Server{
		id:            id,
		nodeId:        nodeID,
		status:        status,
		sc:            client.NewServerClient(id, nodeID+"12345678"),
		GlobalEvents:  m.Events,
		Configuration: &models.ServerConfiguration{},
	}
	m.Add(s)
	return s
}

func statusPayloads(t *testing.T, ch <-chan []byte) map[string]string {
	t.Helper()
	got := map[string]string{}
	for {
		select {
		case data := <-ch:
			ev := events.MustDecode(data)
			if ev.Topic != StatusEvent {
				t.Fatalf("topic %q", ev.Topic)
			}
			raw, err := json.Marshal(ev.Data)
			if err != nil {
				t.Fatal(err)
			}
			var body struct {
				ServerID string `json:"server_id"`
				Payload  string `json:"payload"`
			}
			if err := json.Unmarshal(raw, &body); err != nil {
				t.Fatal(err)
			}
			got[body.ServerID] = body.Payload
		default:
			return got
		}
	}
}
