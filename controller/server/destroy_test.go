package server

import (
	"context"
	"encoding/json"
	"testing"
	"time"

	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/internal/api"
)

// The node's deleted event and the delete request both clean up. The second
// call must not free a port that another server has claimed since.
func TestCleanupForDestroyRunsOnce(t *testing.T) {
	openCreateDB(t)
	nm := node.NewManager(client.New())
	n := schedulableNode(t, "a")
	nm.Add(n)
	m := NewEmptyManager()
	m.nodes = nm

	s, _, _, err := m.admit(context.Background(), testBlueprint(), "", nil, "srv-destroy", nil)
	if err != nil {
		t.Fatal(err)
	}
	s.CleanupForDestroy()
	if m.GetServer(s.Id()) != nil {
		t.Fatal("server is still in the manager")
	}
	if _, err := n.Allocator.NewAllocation(); err != nil {
		t.Fatalf("port was not released: %v", err)
	}

	s.CleanupForDestroy()
	if n.Allocator.HasFreePort() {
		t.Fatal("second cleanup released a port another server holds")
	}
}

func TestCleanupDeletedByNodePublishesReason(t *testing.T) {
	m := NewEmptyManager()
	s := testManagedServer(m, "srv-reason", "node-aaaa", ProcessOfflineState)
	ch := make(chan []byte, 8)
	m.Events().On(ch)
	defer m.Events().Off(ch)

	s.CleanupDeletedByNode("start failed: invalid argument")

	var ev struct {
		Topic string
		Data  struct {
			ServerID string            `json:"server_id"`
			Payload  api.ServerDeleted `json:"payload"`
		}
	}
	select {
	case raw := <-ch:
		if err := json.Unmarshal(raw, &ev); err != nil {
			t.Fatal(err)
		}
	case <-time.After(time.Second):
		t.Fatal("no deleted event")
	}
	if ev.Topic != DeletedEvent || ev.Data.ServerID != "srv-reason" || ev.Data.Payload.Reason != "start failed: invalid argument" {
		t.Fatalf("event = %+v", ev)
	}
}
