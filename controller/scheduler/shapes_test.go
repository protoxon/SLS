package scheduler

import (
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

func TestAdmissionMixedSizes(t *testing.T) {
	big := &api.Limits{MemoryLimit: 16 * 1024}
	runAdmission(t, []admissionCase{
		{
			name: "a big young server's room to grow must stay backed",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, osGiB: 12, servers: []fakeServer{{limitMB: 16 * 1024, used: 0.2, observed: young}}},
			},
		},
		{
			name: "large server where every node only has small gaps",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: smallN(8, 0.3, young)},
				{id: "b", ramGiB: 32, threads: 8, servers: smallN(8, 0.3, young)},
			},
			limits: big,
		},
		{
			name:   "large server onto a node of small ones with room",
			hosts:  []fakeHost{{id: "a", ramGiB: 32, threads: 8, servers: smallN(5, 0.3, young)}},
			limits: big,
			admit:  true,
		},
	})
}

func TestAdmissionPinnedAndOverflow(t *testing.T) {
	runAdmission(t, []admissionCase{
		{
			name: "pinned to a full node while another node has room",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: paperN(8, 0, 0)},
				{id: "b", ramGiB: 32, threads: 8},
			},
			pin: "a",
		},
		{
			name: "pinned to the busier node that still has room",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: paperN(3, 0.3, young)},
				{id: "b", ramGiB: 32, threads: 8},
			},
			pin:   "a",
			admit: true,
			node:  "a",
		},
		{
			name: "standard node with room is used before an empty overflow node",
			hosts: []fakeHost{
				{id: "std", ramGiB: 32, threads: 8, servers: paperN(3, 0.3, young)},
				{id: "spill", ramGiB: 32, threads: 8, overflow: true},
			},
			admit: true,
			node:  "std",
		},
		{
			name: "overflow node takes the server when standard nodes are full",
			hosts: []fakeHost{
				{id: "std", ramGiB: 32, threads: 8, servers: paperN(8, 0, 0)},
				{id: "spill", ramGiB: 32, threads: 8, overflow: true},
			},
			admit: true,
			node:  "spill",
		},
		{
			name: "a full overflow node is refused like any other",
			hosts: []fakeHost{
				{id: "std", ramGiB: 32, threads: 8, servers: paperN(8, 0, 0)},
				{id: "spill", ramGiB: 32, threads: 8, overflow: true, servers: paperN(8, 0, 0)},
			},
		},
	})
}

// Overallocate may place past the resource totals. It must never place onto
// a node whose live state says it is out of room or unhealthy.
func TestAdmissionOverallocate(t *testing.T) {
	on := func(cfg *Config) { cfg.Overallocate = true }
	// Four servers whose cpu_limit is eight cores each fill the CPU request
	// backstop of an otherwise idle node.
	cpuHeavy := make([]fakeServer, 4)
	for i := range cpuHeavy {
		cpuHeavy[i] = fakeServer{limitMB: 4096, cpuLimit: 800, used: 0.3, observed: young}
	}
	runAdmission(t, []admissionCase{
		{
			name:          "CPU requests full but the node is idle",
			hosts:         []fakeHost{{id: "a", ramGiB: 32, threads: 8, servers: cpuHeavy}},
			configure:     on,
			admit:         true,
			overallocated: true,
		},
		{
			name:  "without overallocate the same node is refused",
			hosts: []fakeHost{{id: "a", ramGiB: 32, threads: 8, servers: cpuHeavy}},
		},
		{
			name:      "never onto a node nearly out of memory",
			hosts:     []fakeHost{{id: "a", ramGiB: 16, threads: 8, osGiB: 14.8}},
			configure: on,
		},
		{
			name: "never onto a node that cannot back residents' headroom",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, osGiB: 20, servers: paperN(4, 0.3, learned)},
			},
			configure: on,
		},
		{
			name: "never onto a CPU-stalled node",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: []fakeServer{
					{limitMB: 4096, used: 0.4, cores: 2, observed: learned},
					{limitMB: 4096, used: 0.4, cores: 2, observed: learned},
					{limitMB: 4096, used: 0.4, cores: 2, observed: learned},
					{limitMB: 4096, used: 0.4, cores: 2, observed: learned},
				}},
			},
			configure: on,
		},
		{
			name:      "never onto a drained node",
			hosts:     []fakeHost{{id: "a", ramGiB: 32, threads: 8, drained: true}},
			configure: on,
		},
	})
}

// A server with no memory limit takes the whole node.
func TestAdmissionNoMemoryLimit(t *testing.T) {
	unlimited := &api.Limits{}
	runAdmission(t, []admissionCase{
		{
			name:   "onto an empty node",
			hosts:  []fakeHost{{id: "a", ramGiB: 32, threads: 8}},
			limits: unlimited,
			admit:  true,
		},
		{
			name:   "next to an existing server",
			hosts:  []fakeHost{{id: "a", ramGiB: 32, threads: 8, servers: paperN(1, 0.3, young)}},
			limits: unlimited,
		},
		{
			name:  "a node running one takes nothing else",
			hosts: []fakeHost{{id: "a", ramGiB: 32, threads: 8, servers: []fakeServer{{observed: young}}}},
		},
		{
			name:   "a second one on the same node",
			hosts:  []fakeHost{{id: "a", ramGiB: 32, threads: 8, servers: []fakeServer{{observed: young}}}},
			limits: unlimited,
		},
	})
}

// fillCluster offers Paper servers one at a time until every node refuses.
// step runs after each placement.
func fillCluster(t *testing.T, cfg Config, hosts []fakeHost, step func(placed int, hosts []fakeHost)) []fakeHost {
	t.Helper()
	for placed := 0; placed < 500; placed++ {
		now := time.Now()
		snap := Snapshot{Now: now, Config: cfg}
		for _, h := range hosts {
			snap.Nodes = append(snap.Nodes, h.node(cfg, now))
		}
		result := Select(snap, Derive(paperLimits(), cfg))
		if !result.OK() {
			return hosts
		}
		for i := range hosts {
			if hosts[i].id == result.NodeID {
				hosts[i].servers = append(hosts[i].servers, fakeServer{limitMB: paperLimits().MemoryLimit})
			}
		}
		if step != nil {
			step(placed+1, hosts)
		}
	}
	t.Fatal("cluster never refused")
	return nil
}

// memoryShare is the share of schedulable RAM the host's limits and its burst
// reserve take. The reserve is what placement treats as already spoken for.
func memoryShare(h fakeHost, cfg Config) float64 {
	cfg = Normalize(cfg)
	node := h.node(cfg, time.Now())
	budget, _, _ := node.budgets(cfg)
	burst := burstReserve(node.Capacity.MemoryBytes, budget, cfg)
	var limits int64
	for _, s := range h.servers {
		limits += mb(s.limitMB)
	}
	return float64(limits+burst) / float64(budget)
}

func unevenCluster() []fakeHost {
	return []fakeHost{
		{id: "small", ramGiB: 16, threads: 4},
		{id: "medium", ramGiB: 32, threads: 8},
		{id: "large", ramGiB: 64, threads: 16},
	}
}

// The default fills nodes evenly by their size, so a static fleet uses all of
// its machines instead of stacking work on one.
func TestDefaultSpreadsByResources(t *testing.T) {
	cfg := DefaultConfig()
	// One Paper server is 27% of the small node. The burst floor also stops
	// that node one server before its ledger does, so a full fleet can sit
	// about that far apart.
	const slack = 0.35
	fillCluster(t, cfg, unevenCluster(), func(placed int, hosts []fakeHost) {
		lo, hi := 2.0, -1.0
		for _, h := range hosts {
			share := memoryShare(h, cfg)
			lo, hi = min(lo, share), max(hi, share)
		}
		if hi-lo > slack {
			t.Fatalf("after %d servers memory shares range from %.2f to %.2f: small=%d medium=%d large=%d",
				placed, lo, hi, len(hosts[0].servers), len(hosts[1].servers), len(hosts[2].servers))
		}
	})
}

// With nothing learned yet, the cluster refuses once charges plus the burst
// reserve fill the node. That is at least as many servers as fit in the
// remaining room at memory.max, and no more than their limits allow.
func TestClusterFillsSafelyBeforeRefusing(t *testing.T) {
	cfg := DefaultConfig()
	hosts := fillCluster(t, cfg, unevenCluster(), nil)
	capMB := api.MemoryHardCapMB(paperLimits().MemoryLimit, api.OverheadPolicy{})
	for _, h := range hosts {
		node := h.node(cfg, time.Now())
		budget, _, _ := node.budgets(Normalize(cfg))
		room := budget - burstReserve(node.Capacity.MemoryBytes, budget, Normalize(cfg))
		floor := int(room / mb(capMB))
		ceiling := int(room / mb(paperLimits().MemoryLimit))
		got := len(h.servers)
		t.Logf("%s: %d servers, safe range %d to %d", h.id, got, floor, ceiling)
		if got < floor {
			t.Errorf("%s refused at %d servers, %d fit even at memory.max", h.id, got, floor)
		}
		if got > ceiling {
			t.Errorf("%s took %d servers, its limits only allow %d", h.id, got, ceiling)
		}
	}
}

func smallN(n int, used float64, observed time.Duration) []fakeServer {
	out := make([]fakeServer, n)
	for i := range out {
		out[i] = fakeServer{limitMB: 2048, used: used, observed: observed}
	}
	return out
}
