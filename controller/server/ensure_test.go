package server

import (
	"context"
	"net/http"
	"net/http/httptest"
	"strings"
	"sync/atomic"
	"testing"
	"time"

	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/node"
)

// ensureNode answers the presence check with presence and every create with
// createStatus, counting the creates.
func ensureNode(t *testing.T, presence func() int, createStatus int, creates *atomic.Int32) *node.Node {
	t.Helper()
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.Method == http.MethodGet && strings.HasSuffix(r.URL.Path, "/status"):
			w.WriteHeader(presence())
		case r.Method == http.MethodPost && strings.HasSuffix(r.URL.Path, "/servers"):
			creates.Add(1)
			w.WriteHeader(createStatus)
		default:
			w.WriteHeader(http.StatusTeapot)
		}
	}))
	t.Cleanup(srv.Close)
	n := schedulableNode(t, "ensure")
	n.SetClient(client.New(client.WithMaxAttempts(1)).Node(n.Id(), srv.URL, "token"))
	return n
}

func ensureSetup(t *testing.T, n *node.Node) (*Manager, *Server) {
	t.Helper()
	openCreateDB(t)
	nm := node.NewManager(client.New())
	nm.Add(n)
	m := NewEmptyManager()
	m.nodes = nm
	m.ensureDelay = retryDelay{start: time.Millisecond, max: 5 * time.Millisecond}
	s, _, _, err := m.admit(context.Background(), testBlueprint(), "ensure", nil, "srv-ensure", nil)
	if err != nil {
		t.Fatal(err)
	}
	return m, s
}

func TestEnsureCreatedResendsWhenAbsent(t *testing.T) {
	var creates atomic.Int32
	n := ensureNode(t, func() int { return http.StatusNotFound }, http.StatusOK, &creates)
	m, s := ensureSetup(t, n)

	m.ensureCreated(context.Background(), s, *s.GetServerConfiguration())
	if creates.Load() != 1 {
		t.Fatalf("sent %d creates, want 1", creates.Load())
	}
	if m.GetServer(s.Id()) == nil {
		t.Fatal("server was removed after the node accepted it")
	}
}

func TestEnsureCreatedRemovesRejectedServer(t *testing.T) {
	var creates atomic.Int32
	n := ensureNode(t, func() int { return http.StatusNotFound }, http.StatusConflict, &creates)
	m, s := ensureSetup(t, n)

	m.ensureCreated(context.Background(), s, *s.GetServerConfiguration())
	if m.GetServer(s.Id()) != nil {
		t.Fatal("rejected server is still in the manager")
	}
	if !n.Allocator.HasFreePort() {
		t.Fatal("rejected server kept the port")
	}
}

func TestEnsureCreatedRetriesUntilReachable(t *testing.T) {
	var checks, creates atomic.Int32
	n := ensureNode(t, func() int {
		if checks.Add(1) < 3 {
			return http.StatusBadGateway
		}
		return http.StatusOK
	}, http.StatusOK, &creates)
	m, s := ensureSetup(t, n)

	m.ensureCreated(context.Background(), s, *s.GetServerConfiguration())
	if checks.Load() != 3 || creates.Load() != 0 {
		t.Fatalf("checks=%d creates=%d, want 3 and 0", checks.Load(), creates.Load())
	}
	if m.GetServer(s.Id()) == nil {
		t.Fatal("server was removed while the node was unreachable")
	}
}

func TestEnsureCreatedStopsWhenClosed(t *testing.T) {
	var checks, creates atomic.Int32
	n := ensureNode(t, func() int {
		checks.Add(1)
		return http.StatusNotFound
	}, http.StatusOK, &creates)
	m, s := ensureSetup(t, n)
	m.Close()

	m.ensureCreated(m.ctx, s, *s.GetServerConfiguration())
	if checks.Load() != 0 || creates.Load() != 0 {
		t.Fatalf("closed manager sent %d checks and %d creates", checks.Load(), creates.Load())
	}
}

func TestEnsureCreatedStopsWhenDeleted(t *testing.T) {
	var creates atomic.Int32
	n := ensureNode(t, func() int { return http.StatusNotFound }, http.StatusOK, &creates)
	m, s := ensureSetup(t, n)
	m.Remove(s.Id())

	m.ensureCreated(context.Background(), s, *s.GetServerConfiguration())
	if creates.Load() != 0 {
		t.Fatalf("sent %d creates for a deleted server", creates.Load())
	}
}
