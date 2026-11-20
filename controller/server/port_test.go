package server

import (
	"context"
	"fmt"
	"strings"
	"sync"
	"sync/atomic"
	"testing"

	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/controller/scheduler"
)

func portNode(t *testing.T, id, ports string) *node.Node {
	t.Helper()
	n := schedulableNode(t, id)
	alloc, err := allocator.NewAllocator([]models.Allocation{{
		Address: "127.0.0.1",
		Alias:   "127.0.0.1",
		Ports:   ports,
	}})
	if err != nil {
		t.Fatal(err)
	}
	n.Allocator = alloc
	return n
}

func managerWith(nodes ...*node.Node) *Manager {
	nm := node.NewManager(client.New())
	for _, n := range nodes {
		nm.Add(n)
	}
	m := NewEmptyManager()
	m.nodes = nm
	return m
}

type placed struct {
	node string
	port int
}

// admitMany places the blueprint from callers goroutines at once.
func admitMany(m *Manager, callers int) ([]placed, []error) {
	var mu sync.Mutex
	var won []placed
	var failed []error
	var wg sync.WaitGroup
	for i := 0; i < callers; i++ {
		wg.Add(1)
		go func(i int) {
			defer wg.Done()
			s, _, _, err := m.admit(context.Background(), testBlueprint(), "", nil, fmt.Sprintf("port-%d", i), nil)
			mu.Lock()
			defer mu.Unlock()
			if err != nil {
				failed = append(failed, err)
				return
			}
			alloc := s.allocations()
			won = append(won, placed{node: s.NodeId(), port: alloc.DefaultMapping.Port})
		}(i)
	}
	wg.Wait()
	return won, failed
}

func TestConcurrentAdmitLastPort(t *testing.T) {
	n := portNode(t, "a", "25565-25565")
	m := managerWith(n)

	won, failed := admitMany(m, 32)
	if len(won) != 1 {
		t.Fatalf("placed %d servers, want 1; first error: %v", len(won), firstErr(failed))
	}
	if won[0].node != "a" || won[0].port != 25565 {
		t.Fatalf("placement = %+v, want node a port 25565", won[0])
	}
	if len(failed) != 31 {
		t.Fatalf("%d callers were rejected, want 31", len(failed))
	}
	for _, err := range failed {
		if !strings.Contains(err.Error(), scheduler.ReasonNoPort) {
			t.Fatalf("rejection %v, want %s", err, scheduler.ReasonNoPort)
		}
	}
	if n.Allocator.HasFreePort() {
		t.Fatal("last port is still free")
	}
}

func TestConcurrentAdmitPortsAreUnique(t *testing.T) {
	const (
		start   = 25565
		end     = 25574
		ports   = end - start + 1
		callers = 40
	)
	n := portNode(t, "a", fmt.Sprintf("%d-%d", start, end))
	m := managerWith(n)

	won, failed := admitMany(m, callers)
	if len(won) != ports {
		t.Fatalf("placed %d servers, want %d; first error: %v", len(won), ports, firstErr(failed))
	}
	seen := map[int]struct{}{}
	for _, item := range won {
		if item.node != "a" || item.port < start || item.port > end {
			t.Fatalf("placement %+v outside %d-%d on node a", item, start, end)
		}
		if _, ok := seen[item.port]; ok {
			t.Fatalf("port %d assigned twice", item.port)
		}
		seen[item.port] = struct{}{}
	}
	if len(failed) != callers-ports {
		t.Fatalf("%d callers were rejected, want %d", len(failed), callers-ports)
	}
	for _, err := range failed {
		if !strings.Contains(err.Error(), scheduler.ReasonNoPort) {
			t.Fatalf("rejection %v, want %s", err, scheduler.ReasonNoPort)
		}
	}
	if n.Allocator.HasFreePort() {
		t.Fatal("port pool still shows a free port")
	}
}

func TestConcurrentAdmitFillsEachNodesLastPort(t *testing.T) {
	a := portNode(t, "a", "25565-25565")
	b := portNode(t, "b", "25565-25565")
	m := managerWith(a, b)

	won, failed := admitMany(m, 16)
	if len(won) != 2 {
		t.Fatalf("placed %d servers, want 2; first error: %v", len(won), firstErr(failed))
	}
	seen := map[string]struct{}{}
	for _, item := range won {
		if item.port != 25565 {
			t.Fatalf("placement %+v, want port 25565", item)
		}
		key := item.node + ":" + fmt.Sprint(item.port)
		if _, ok := seen[key]; ok {
			t.Fatalf("duplicate placement %s", key)
		}
		seen[key] = struct{}{}
	}
	if _, ok := seen["a:25565"]; !ok {
		t.Fatal("node a was not used")
	}
	if _, ok := seen["b:25565"]; !ok {
		t.Fatal("node b was not used")
	}
	if a.Allocator.HasFreePort() || b.Allocator.HasFreePort() {
		t.Fatal("a node still has a free port")
	}
}

func firstErr(errs []error) error {
	if len(errs) == 0 {
		return nil
	}
	return errs[0]
}

func TestPinnedAdmitDoesNotUseAnotherNode(t *testing.T) {
	full := portNode(t, "full", "25565-25565")
	other := portNode(t, "other", "25565-25570")
	m := managerWith(full, other)

	if _, _, _, err := m.admit(context.Background(), testBlueprint(), "full", nil, "held", nil); err != nil {
		t.Fatal(err)
	}
	_, _, _, err := m.admit(context.Background(), testBlueprint(), "full", nil, "again", nil)
	if err == nil {
		t.Fatal("pinned admit placed a server after its node had no port")
	}
	if !strings.Contains(err.Error(), scheduler.ReasonNoPort) {
		t.Fatalf("rejection %v, want %s", err, scheduler.ReasonNoPort)
	}
	if full.Allocator.HasFreePort() {
		t.Fatal("pinned node still reports a free port")
	}
	if !other.Allocator.HasFreePort() {
		t.Fatal("pinned admit took a port from another node")
	}
}

func TestConcurrentAdmitReachesEveryNode(t *testing.T) {
	nodes := []*node.Node{
		portNode(t, "a", "25565-25565"),
		portNode(t, "b", "25565-25565"),
		portNode(t, "c", "25565-25565"),
		portNode(t, "d", "25565-25565"),
	}
	m := managerWith(nodes...)

	won, failed := admitMany(m, 16)
	if len(won) != len(nodes) {
		t.Fatalf("placed %d servers, want %d; first error: %v", len(won), len(nodes), firstErr(failed))
	}
	seen := map[string]struct{}{}
	for _, item := range won {
		if item.port != 25565 {
			t.Fatalf("placement %+v, want port 25565", item)
		}
		if _, ok := seen[item.node]; ok {
			t.Fatalf("node %s was used twice", item.node)
		}
		seen[item.node] = struct{}{}
	}
	for _, n := range nodes {
		if _, ok := seen[n.Id()]; !ok {
			t.Fatalf("node %s still has its port", n.Id())
		}
		if n.Allocator.HasFreePort() {
			t.Fatalf("node %s reports a free port", n.Id())
		}
	}
}

func TestInstallAllocatorKeepsTheExistingPort(t *testing.T) {
	n := portNode(t, "a", "25565-25566")
	m := managerWith(n)
	first, _, _, err := m.admit(context.Background(), testBlueprint(), "", nil, "held", nil)
	if err != nil {
		t.Fatal(err)
	}
	held := first.allocations().DefaultMapping

	fresh, err := allocator.NewAllocator([]models.Allocation{{
		Address: "127.0.0.1",
		Alias:   "127.0.0.1",
		Ports:   "25565-25566",
	}})
	if err != nil {
		t.Fatal(err)
	}
	m.InstallAllocator(n, fresh)

	second, _, _, err := m.admit(context.Background(), testBlueprint(), "", nil, "next", nil)
	if err != nil {
		t.Fatal(err)
	}
	if second.allocations().DefaultMapping.Port == held.Port {
		t.Fatalf("new server took port %d from the restored server", held.Port)
	}
	if _, _, _, err := m.admit(context.Background(), testBlueprint(), "", nil, "overflow", nil); err == nil {
		t.Fatal("placed a third server into a two-port pool")
	}
}

func TestInstallAllocatorRacesPlacement(t *testing.T) {
	n := portNode(t, "a", "25565-25566")
	m := managerWith(n)
	first, _, _, err := m.admit(context.Background(), testBlueprint(), "", nil, "held", nil)
	if err != nil {
		t.Fatal(err)
	}
	held := first.allocations().DefaultMapping.Port

	var seq atomic.Int64
	var mu sync.Mutex
	var stolen []int
	var wg sync.WaitGroup
	for i := 0; i < 8; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for j := 0; j < 15; j++ {
				id := fmt.Sprintf("race-%d", seq.Add(1))
				s, _, _, err := m.admit(context.Background(), testBlueprint(), "", nil, id, nil)
				if err != nil {
					continue
				}
				port := s.allocations().DefaultMapping.Port
				s.discard()
				if port == held {
					mu.Lock()
					stolen = append(stolen, port)
					mu.Unlock()
				}
			}
		}()
	}
	for j := 0; j < 15; j++ {
		fresh, err := allocator.NewAllocator([]models.Allocation{{
			Address: "127.0.0.1",
			Alias:   "127.0.0.1",
			Ports:   "25565-25566",
		}})
		if err != nil {
			t.Fatal(err)
		}
		m.InstallAllocator(n, fresh)
	}
	wg.Wait()
	if len(stolen) != 0 {
		t.Fatalf("placement took restored port %d during allocator swap", held)
	}
}

func TestRegisterClaimsBeforeTheNodeIsVisible(t *testing.T) {
	openCreateDB(t)
	nm := node.NewManager(client.New())
	m := NewEmptyManager()
	m.nodes = nm

	restored := testManagedServer(m, "restored", "reconnect-node", ProcessOfflineState)
	restored.Configuration.Allocations.DefaultMapping.Ip = "127.0.0.1"
	restored.Configuration.Allocations.DefaultMapping.Port = 25565

	alloc, err := allocator.NewAllocator([]models.Allocation{{
		Address: "127.0.0.1",
		Alias:   "127.0.0.1",
		Ports:   "25565-25566",
	}})
	if err != nil {
		t.Fatal(err)
	}
	nm.SetOnNodeRegistered(func(id string, n *node.Node) {
		if _, ok := nm.Get(id); ok {
			t.Fatal("node was schedulable before its ports were claimed")
		}
		m.AttachNodeClientToServers(id, n)
	})
	n := nm.Register(context.Background(), "reconnect-node", "reconnect-node", "http://127.0.0.1:1", "local", "token", alloc, false, "", nil)
	got, err := n.Allocator.NewAllocation()
	if err != nil {
		t.Fatal(err)
	}
	if got.DefaultMapping.Port == 25565 {
		t.Fatal("restored port was free after register")
	}
}
