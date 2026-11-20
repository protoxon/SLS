package server

import (
	"context"
	"fmt"
	"sync"
	"sync/atomic"
	"testing"
	"time"

	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/internal/api"
)

const gib = 1 << 30

// paperBlueprint matches the limits in software/paper.yml.
func paperBlueprint() *blueprint.Blueprint {
	mem := int64(4096)
	return &blueprint.Blueprint{
		Meta:   blueprint.Meta{ID: "paper"},
		Server: &blueprint.Server{Limits: &environment.Limits{MemoryLimit: &mem}},
	}
}

// capacityNode is a 32 GiB, 8 thread node with plenty of ports, so memory and
// CPU are what limit placement.
func capacityNode(t *testing.T, id string) *node.Node {
	t.Helper()
	n := node.New(id, id, "local", "http://127.0.0.1:1", "token", false)
	alloc, err := allocator.NewAllocator([]models.Allocation{{
		Address: "127.0.0.1",
		Alias:   "127.0.0.1",
		Ports:   "25565-25664",
	}})
	if err != nil {
		t.Fatal(err)
	}
	n.Allocator = alloc
	n.SetCapacity(api.NodeCapacity{
		CPUThreads:    8,
		MemoryBytes:   32 * gib,
		DiskBytes:     500 * gib,
		CgroupVersion: "v2",
		Role:          api.RoleStandard,
	})
	heartbeat(n, 30*gib, time.Now().Add(-2*time.Second))
	return n
}

// heartbeat delivers a daemon sample taken at sampledAt by the daemon's clock.
func heartbeat(n *node.Node, available uint64, sampledAt time.Time, servers ...api.ServerSample) {
	n.SetMetrics(api.NodeMetrics{
		Timestamp: sampledAt.Unix(),
		Complete:  true,
		Memory:    api.MemoryMetrics{AvailableBytes: available},
		Disk:      api.DiskMetrics{AvailableBytes: 400 * gib},
		Servers:   servers,
	})
}

func capacityManager(nodes ...*node.Node) *Manager {
	nm := node.NewManager(client.New())
	for _, n := range nodes {
		nm.Add(n)
	}
	m := NewEmptyManager()
	m.nodes = nm
	return m
}

var serverSeq atomic.Int64

func admitPaper(m *Manager, nodeID string) (*Server, error) {
	s, _, _, err := m.admit(context.Background(), paperBlueprint(), nodeID, nil, fmt.Sprint("srv-", serverSeq.Add(1)), nil)
	return s, err
}

// fill admits Paper servers onto nodeID until it refuses and returns how many fit.
func fill(t *testing.T, m *Manager, nodeID string) int {
	t.Helper()
	for i := 0; i < 100; i++ {
		if _, err := admitPaper(m, nodeID); err != nil {
			return i
		}
	}
	t.Fatal("node never refused")
	return 0
}

// restore loads n Paper servers onto node the way the controller does at
// startup: from stored records, with the learned usage they stored.
func restore(t *testing.T, m *Manager, n *node.Node, count int, usage *models.ServerUsage) []string {
	t.Helper()
	var ids []string
	for i := 0; i < count; i++ {
		alloc, err := n.Allocator.NewAllocation()
		if err != nil {
			t.Fatal(err)
		}
		id := fmt.Sprint("restored-", serverSeq.Add(1))
		s, err := m.InitServer(&models.ServerRecord{
			Id:     id,
			NodeId: n.Id(),
			Configuration: &models.ServerConfiguration{
				Id:          id,
				Limits:      api.Limits{MemoryLimit: 4096, MemoryReservation: 3482, MemoryMax: 4506, CpuRequest: 25},
				Allocations: alloc,
			},
			InstallScript: &software.InstallationScript{},
			Usage:         usage,
		}, nil)
		if err != nil {
			t.Fatal(err)
		}
		m.Add(s)
		ids = append(ids, id)
	}
	return ids
}

// quietSamples is each server using 30% of memory.max.
func quietSamples(ids []string) ([]api.ServerSample, uint64) {
	cur := uint64(4506*(1<<20)) * 3 / 10
	var out []api.ServerSample
	for _, id := range ids {
		out = append(out, api.ServerSample{ID: id, MemoryCurrent: cur, MemoryPeak: cur})
	}
	return out, cur * uint64(len(ids))
}

// Many creates at once must not fit more servers than creating them one at a time.
func TestConcurrentAdmitsNeverOverfill(t *testing.T) {
	probe := capacityNode(t, "probe")
	want := fill(t, capacityManager(probe), "probe")

	n := capacityNode(t, "a")
	m := capacityManager(n)
	var placed atomic.Int32
	var wg sync.WaitGroup
	for i := 0; i < 3*want; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			if _, err := admitPaper(m, ""); err == nil {
				placed.Add(1)
			}
		}()
	}
	wg.Wait()
	if got := int(placed.Load()); got != want {
		t.Fatalf("%d concurrent creates placed %d servers, one at a time fits %d", 3*want, got, want)
	}
}

// After a restart the controller reloads servers with no placement time and
// relearns their usage. That must not open room the same servers did not have
// before the restart.
func TestRestartDoesNotOpenRoom(t *testing.T) {
	// Six full limits plus the burst reserve fill this 32 GiB node.
	const residents = 6
	// The samples include every resident, so they are taken after placement.
	// A future daemon timestamp is clamped to receipt.
	settle := func(n *node.Node, ids []string) {
		samples, used := quietSamples(ids)
		for i := 0; i < 20; i++ {
			heartbeat(n, 32*gib-3*gib/2-used, time.Now().Add(2*time.Second), samples...)
		}
	}

	before := capacityNode(t, "before")
	mb := capacityManager(before)
	var ids []string
	for i := 0; i < residents; i++ {
		s, err := admitPaper(mb, "before")
		if err != nil {
			t.Fatalf("resident %d refused: %v", i, err)
		}
		ids = append(ids, s.Id())
	}
	settle(before, ids)
	roomBefore := fill(t, mb, "before")

	after := capacityNode(t, "after")
	ma := capacityManager(after)
	settle(after, restore(t, ma, after, residents, nil))
	roomAfter := fill(t, ma, "after")

	if roomAfter > roomBefore {
		t.Fatalf("restart opened room: %d more servers fit after, %d before", roomAfter, roomBefore)
	}
}

// watch marks the servers running, then delivers heartbeats ten seconds apart
// for d of running time with every server at 30% of memory.max, then a final
// heartbeat for the node.
func watch(m *Manager, n *node.Node, ids []string, d time.Duration) {
	samples, used := quietSamples(ids)
	start := time.Now().Add(-d)
	for _, id := range ids {
		m.GetServer(id).noteStatus(ProcessRunningState, start)
	}
	for at := time.Duration(0); at <= d; at += 10 * time.Second {
		m.ObserveUsage(n.Id(), samples, start.Add(at))
	}
	heartbeat(n, 32*gib-3*gib/2-used, time.Now().Add(2*time.Second), samples...)
}

// Learned usage is stored with the server, so a restart keeps the room that
// learning opened. Without it the controller starts over from the limits.
func TestRestartKeepsLearnedRoom(t *testing.T) {
	// Six full limits plus the burst reserve fill this 32 GiB node.
	const residents = 6
	before := capacityNode(t, "before")
	mb := capacityManager(before)
	var ids []string
	for i := 0; i < residents; i++ {
		s, err := admitPaper(mb, "before")
		if err != nil {
			t.Fatalf("resident %d refused: %v", i, err)
		}
		ids = append(ids, s.Id())
	}
	watch(mb, before, ids, 48*time.Hour)
	peak, observed := mb.GetServer(ids[0]).learnedUsage()
	stored := &models.ServerUsage{PeakBytes: peak, ObservedSeconds: observed.Seconds()}
	roomBefore := fill(t, mb, "before")

	roomAfter := func(usage *models.ServerUsage) int {
		after := capacityNode(t, "after")
		ma := capacityManager(after)
		restored := restore(t, ma, after, residents, usage)
		samples, used := quietSamples(restored)
		heartbeat(after, 32*gib-3*gib/2-used, time.Now().Add(2*time.Second), samples...)
		return fill(t, ma, "after")
	}
	kept, lost := roomAfter(stored), roomAfter(nil)
	t.Logf("room for %d more before restart, %d with stored usage, %d without", roomBefore, kept, lost)
	if kept != roomBefore {
		t.Errorf("stored usage left room for %d, %d before the restart", kept, roomBefore)
	}
	if lost >= roomBefore {
		t.Errorf("without stored usage %d fit, learning opened no room over that (%d)", lost, roomBefore)
	}
}

// A server placed before a heartbeat arrived but missing from it is not
// running yet. It still needs its memory, whichever way the daemon clock is off.
func TestServerMissingFromHeartbeatStillCounts(t *testing.T) {
	for name, skew := range map[string]time.Duration{
		"daemon clock behind": -2 * time.Minute,
		"daemon clock ahead":  2 * time.Minute,
	} {
		t.Run(name, func(t *testing.T) {
			n := capacityNode(t, "a")
			m := capacityManager(n)
			if _, err := admitPaper(m, ""); err != nil {
				t.Fatal(err)
			}
			// Other processes leave 8.5 GiB. The first server will take up to
			// 4.4 GiB of that once it starts, which leaves too little for a
			// second plus any spike room.
			heartbeat(n, 17*gib/2, time.Now().Add(skew))
			if s, err := admitPaper(m, ""); err == nil {
				t.Fatalf("admitted %s while the first server was not in the heartbeat", s.Id())
			}
		})
	}
}

// A burst of creates can spike CPU pressure while the servers boot. The node
// refuses only while that pressure lasts, not after it has passed.
func TestCPUSpikeOnlyBlocksWhileItLasts(t *testing.T) {
	n := capacityNode(t, "a")
	m := capacityManager(n)
	cpu := func(avg10, avg60 float64) {
		n.SetMetrics(api.NodeMetrics{
			Timestamp: time.Now().Unix(),
			Complete:  true,
			CPU:       api.Pressure{SomeAvg10: avg10, SomeAvg60: avg60},
			Memory:    api.MemoryMetrics{AvailableBytes: 30 * gib},
			Disk:      api.DiskMetrics{AvailableBytes: 400 * gib},
		})
	}
	cpu(60, 35)
	if s, err := admitPaper(m, "a"); err == nil {
		t.Fatalf("admitted %s during the spike", s.Id())
	}
	cpu(3, 8)
	if _, err := admitPaper(m, "a"); err != nil {
		t.Fatalf("still refused after the spike passed: %v", err)
	}
}

// A stopped server keeps its room so starting it again cannot overload the node.
func TestStoppedServersKeepTheirRoom(t *testing.T) {
	const residents = 4
	running := capacityNode(t, "running")
	mr := capacityManager(running)
	for i := 0; i < residents; i++ {
		if _, err := admitPaper(mr, "running"); err != nil {
			t.Fatal(err)
		}
	}
	roomRunning := fill(t, mr, "running")

	stopped := capacityNode(t, "stopped")
	ms := capacityManager(stopped)
	restore(t, ms, stopped, residents, nil)
	for i := 0; i < 20; i++ {
		heartbeat(stopped, 30*gib, time.Now().Add(-time.Second))
	}
	roomStopped := fill(t, ms, "stopped")

	if roomStopped > roomRunning {
		t.Fatalf("%d stopped servers left room for %d more, %d new servers leave room for %d", residents, roomStopped, residents, roomRunning)
	}
}

// Deleting a server frees exactly its room.
func TestDeleteFreesRoom(t *testing.T) {
	n := capacityNode(t, "a")
	m := capacityManager(n)
	full := fill(t, m, "a")
	if full == 0 {
		t.Fatal("empty node took no servers")
	}
	victim := m.ServersByNode("a")[0]
	victim.releaseAlloc()
	victim.Remove()
	if _, err := admitPaper(m, "a"); err != nil {
		t.Fatalf("no room after deleting a server: %v", err)
	}
	if s, err := admitPaper(m, "a"); err == nil {
		t.Fatalf("deleting one server made room for two (%s)", s.Id())
	}
}

// A create that fails after placement leaves no reservation behind.
func TestFailedCreateLeavesNoReservation(t *testing.T) {
	probe := capacityNode(t, "probe")
	full := fill(t, capacityManager(probe), "probe")

	n := capacityNode(t, "a")
	m := capacityManager(n)
	for i := 0; i < full-1; i++ {
		if _, err := admitPaper(m, "a"); err != nil {
			t.Fatal(err)
		}
	}
	if _, err := m.CreateServer(context.Background(), paperBlueprint(), software.NewRegistry(), "a", nil, nil); err == nil {
		t.Fatal("expected the software lookup to fail")
	}
	if _, err := admitPaper(m, "a"); err != nil {
		t.Fatalf("failed create kept its room: %v", err)
	}
}
