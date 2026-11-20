package server

import (
	"context"
	"net"
	"net/http"
	"testing"
	"time"

	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/internal/api"
)

func schedulableNode(t *testing.T, id string) *node.Node {
	t.Helper()
	n := node.New(id, id, "local", "http://127.0.0.1:1", "token", false)
	alloc, err := allocator.NewAllocator([]models.Allocation{{
		Address: "127.0.0.1",
		Alias:   "127.0.0.1",
		Ports:   "25565-25565",
	}})
	if err != nil {
		t.Fatal(err)
	}
	n.Allocator = alloc
	n.SetCapacity(api.NodeCapacity{
		CPUThreads:  8,
		MemoryBytes: 32 << 30,
		DiskBytes:   100 << 30,
		Role:        api.RoleStandard,
	})
	n.SetMetrics(api.NodeMetrics{
		Timestamp: 1,
		Complete:  true,
		Memory:    api.MemoryMetrics{AvailableBytes: 32 << 30},
		Disk:      api.DiskMetrics{AvailableBytes: 50 << 30},
	})
	return n
}

func testBlueprint() *blueprint.Blueprint {
	mem := int64(1024)
	return &blueprint.Blueprint{
		Meta:   blueprint.Meta{ID: "bp"},
		Server: &blueprint.Server{Limits: &environment.Limits{MemoryLimit: &mem}},
	}
}

func TestAdmitStampsAndAccounts(t *testing.T) {
	nm := node.NewManager(client.New())
	n := schedulableNode(t, "a")
	nm.Add(n)
	m := NewEmptyManager()
	m.nodes = nm

	s, _, stamp, err := m.admit(context.Background(), testBlueprint(), "", nil, "srv-1", nil)
	if err != nil {
		t.Fatal(err)
	}
	if s.NodeId() != "a" || stamp.MemoryReservationMB != 870 || stamp.MemoryMaxMB != 1178 || stamp.CPURequest != 25 {
		t.Fatalf("placement %+v stamp %+v", s.NodeId(), stamp)
	}
	if n.Allocator.HasFreePort() {
		t.Fatal("expected the port to be claimed")
	}
	if m.GetServer(s.Id()) == nil {
		t.Fatal("server was not inserted")
	}
}

func TestAdmitPinnedMissingNode(t *testing.T) {
	m := NewEmptyManager()
	m.nodes = node.NewManager(client.New())
	_, _, _, err := m.admit(context.Background(), testBlueprint(), "missing", nil, "srv", nil)
	place, ok := err.(*PlaceError)
	if !ok || place.Status != http.StatusNotFound {
		t.Fatalf("got %#v", err)
	}
}

func creatableBlueprint() *blueprint.Blueprint {
	bp := testBlueprint()
	bp.Server.Software = "paper"
	bp.Server.Image = "img"
	bp.Server.Version = "1"
	return bp
}

func testSoftware() *software.Registry {
	reg := software.NewRegistry()
	reg.Register(&software.Software{
		Id:           "paper",
		Invocation:   "java",
		StopCommand:  "stop",
		OnlineSignal: "Done",
	})
	return reg
}

func openCreateDB(t *testing.T) {
	t.Helper()
	if database.Ready() {
		return
	}
	prev := config.Get()
	config.SetForTest(&config.Configuration{System: config.SystemConfiguration{RootDirectory: t.TempDir()}})
	t.Cleanup(func() { config.SetForTest(prev) })
	if err := database.Initialize(); err != nil {
		t.Fatal(err)
	}
}

// A node that never accepts the connection does not keep the server. A node
// that accepts it and then stays silent might have created it, so the record stays.
func TestCreateUndeliveredDropsAndAcceptedKeeps(t *testing.T) {
	openCreateDB(t)

	t.Run("unreachable", func(t *testing.T) {
		nm := node.NewManager(client.New())
		n := schedulableNode(t, "closed")
		nm.Add(n)
		m := NewEmptyManager()
		m.nodes = nm

		_, err := m.CreateServer(context.Background(), creatableBlueprint(), testSoftware(), "closed", nil, nil)
		if err == nil {
			t.Fatal("create reached a closed port")
		}
		if len(m.All()) != 0 {
			t.Fatal("undelivered create left a server")
		}
		if !n.Allocator.HasFreePort() {
			t.Fatal("undelivered create kept the port")
		}
	})

	t.Run("accepted then silent", func(t *testing.T) {
		ln, err := net.Listen("tcp", "127.0.0.1:0")
		if err != nil {
			t.Fatal(err)
		}
		defer ln.Close()
		go func() {
			for {
				conn, err := ln.Accept()
				if err != nil {
					return
				}
				time.Sleep(time.Second)
				conn.Close()
			}
		}()

		nm := node.NewManager(client.New())
		n := schedulableNode(t, "silent")
		n.SetClient(client.New(
			client.WithHTTPClient(&http.Client{Timeout: 200 * time.Millisecond}),
			client.WithMaxAttempts(1),
		).Node(n.Id(), "http://"+ln.Addr().String(), "token"))
		nm.Add(n)
		m := NewEmptyManager()
		m.nodes = nm

		// The node may have the server, so the create is accepted and
		// ensureCreated keeps checking in the background.
		t.Cleanup(m.Close)
		_, err = m.CreateServer(context.Background(), creatableBlueprint(), testSoftware(), "silent", nil, nil)
		if err != nil {
			t.Fatalf("create with an unknown outcome failed: %v", err)
		}
		if len(m.All()) != 1 {
			t.Fatalf("accepted create left %d servers", len(m.All()))
		}
		if n.Allocator.HasFreePort() {
			t.Fatal("accepted create released the port")
		}
	})
}

func TestCreateFailureReleasesPort(t *testing.T) {
	nm := node.NewManager(client.New())
	n := schedulableNode(t, "a")
	nm.Add(n)
	m := NewEmptyManager()
	m.nodes = nm

	_, err := m.CreateServer(context.Background(), testBlueprint(), software.NewRegistry(), "", nil, nil)
	if err == nil {
		t.Fatal("expected software lookup to fail")
	}
	if _, ok := err.(*PlaceError); ok {
		t.Fatalf("build failure was reported as placement: %v", err)
	}
	if len(m.All()) != 0 {
		t.Fatal("failed create left a server in the manager")
	}
	if !n.Allocator.HasFreePort() {
		t.Fatal("failed create kept the port")
	}
}
