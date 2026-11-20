package scheduler

import (
	"fmt"
	"math"
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

// paperLimits are the limits in software/paper.yml.
func paperLimits() api.Limits {
	return api.Limits{MemoryLimit: 4096, CpuLimit: 0}
}

func hostNode(id string, ramGiB int64, threads int) Node {
	return Node{
		ID:          id,
		Online:      true,
		HasFreePort: true,
		Capacity: api.NodeCapacity{
			CPUThreads:    threads,
			MemoryBytes:   ramGiB << 30,
			DiskBytes:     1 << 40,
			CgroupVersion: "v2",
			Role:          api.RoleStandard,
		},
		Metrics: api.NodeMetrics{
			Complete: true,
			Memory:   api.MemoryMetrics{AvailableBytes: uint64(ramGiB<<30) - 3<<29},
			Disk:     api.DiskMetrics{AvailableBytes: 800 << 30},
		},
		Snapshots: map[string]struct{}{},
	}
}

func stamped(limits api.Limits, stamp Stamp) api.Limits {
	limits.MemoryReservation = stamp.MemoryReservationMB
	limits.MemoryMax = stamp.MemoryMaxMB
	limits.CpuRequest = stamp.CPURequest
	return limits
}

type packing struct {
	// usedFraction is the share of memory.max each resident is using.
	// Negative means the residents were just placed and no heartbeat has
	// included them.
	usedFraction float64
	// observed is how long the controller has watched each resident run.
	observed time.Duration
}

// pack admits copies of limits onto node until Fits refuses and returns the
// node and the refusal. Each admitted server immediately takes on p's usage.
func pack(t *testing.T, node Node, limits api.Limits, cfg Config, p packing) (Node, string) {
	t.Helper()
	now := time.Now()
	req := Derive(limits, cfg)
	for i := 0; i < 500; i++ {
		node.MetricsAt = now
		var used uint64
		for _, r := range node.Servers {
			used += r.MemoryCurrent
		}
		node.Metrics.Memory.AvailableBytes = uint64(node.Capacity.MemoryBytes) - 3<<29 - used
		stamp, reason := Fits(node, req, cfg, now)
		if reason != "" {
			return node, reason
		}
		r := Resident{ID: fmt.Sprint("srv-", i), Limits: stamped(limits, stamp)}
		if p.usedFraction >= 0 {
			cur := uint64(p.usedFraction * float64(mb(stamp.MemoryMaxMB)))
			r.MemoryCurrent, r.Peak, r.Observed = cur, cur, p.observed
			node.Metrics.Servers = append(node.Metrics.Servers, api.ServerSample{ID: r.ID, MemoryCurrent: cur, MemoryPeak: cur})
		}
		node.Servers = append(node.Servers, r)
	}
	t.Fatal("node never refused")
	return node, ""
}

func sumLimitsMB(node Node) (limit, max int64) {
	for _, r := range node.Servers {
		limit += r.Limits.MemoryLimit
		max += r.Limits.MemoryMax
	}
	return limit, max
}

// A burst of new servers is charged at their limits, so it cannot commit more
// memory than the node has.
func TestFreshPackStaysWithinMemoryBudget(t *testing.T) {
	cfg := DefaultConfig()
	for _, ram := range []int64{16, 32, 64, 128} {
		t.Run(fmt.Sprintf("%dGiB", ram), func(t *testing.T) {
			node, reason := pack(t, hostNode("n", ram, 64), paperLimits(), cfg, packing{usedFraction: -1})
			budget, _, _ := node.budgets(Normalize(cfg))
			limit, max := sumLimitsMB(node)
			t.Logf("%d servers, stopped by %s, limits %.1f GiB, memory.max %.1f GiB, budget %.1f GiB",
				len(node.Servers), reason, float64(limit)/1024, float64(max)/1024, float64(budget)/(1<<30))
			if mb(limit) > budget {
				t.Fatalf("new servers' limits total %.1f GiB on %.1f GiB of schedulable RAM", float64(limit)/1024, float64(budget)/(1<<30))
			}
		})
	}
}

// Servers that stay well under their limits free room for more servers, more
// the longer they are watched. A packed node still holds the burst reserve:
// learned charges plus that reserve fit in schedulable RAM.
func TestUsageLearningPacksQuietNodes(t *testing.T) {
	cfg := DefaultConfig()
	const used = 0.3
	fresh, _ := pack(t, hostNode("n", 32, 64), paperLimits(), cfg, packing{usedFraction: -1})
	prev := len(fresh.Servers)
	for _, observed := range []time.Duration{young, 3 * time.Minute, 5 * time.Minute, 15 * time.Minute, learned} {
		node, reason := pack(t, hostNode("n", 32, 64), paperLimits(), cfg, packing{usedFraction: used, observed: observed})
		got := len(node.Servers)
		t.Logf("running %s: %d servers (stopped by %s), %d fresh", observed, got, reason, len(fresh.Servers))
		if observed == young && got != len(fresh.Servers) {
			t.Errorf("running %s: %d servers, almost nothing is learned yet so want %d", observed, got, len(fresh.Servers))
		}
		if got < prev {
			t.Errorf("running %s: %d servers, fewer than %d after less running time", observed, got, prev)
		}
		prev = got
		if observed == learned {
			if got <= len(fresh.Servers) {
				t.Errorf("quiet servers watched for two days allowed %d servers, fresh ones %d", got, len(fresh.Servers))
			}
			cfgN := Normalize(cfg)
			budget, _, _ := node.budgets(cfgN)
			charges := sumAccounts(node, cfgN).memory
			burst := burstReserve(node.Capacity.MemoryBytes, budget, cfgN)
			if charges+burst > budget {
				t.Errorf("charges %.1f GiB plus burst %.1f GiB exceed the %.1f GiB budget",
					float64(charges)/(1<<30), float64(burst)/(1<<30), float64(budget)/(1<<30))
			}
		}
	}
}

// The burst reserve is a percent of host RAM, clamped to its floor and cap,
// and never more than half of schedulable RAM.
func TestBurstReserveIsClamped(t *testing.T) {
	cfg := Normalize(DefaultConfig())
	budget := func(ramGiB int64) int64 {
		b, _, _ := hostNode("n", ramGiB, 8).budgets(cfg)
		return b
	}
	host := func(ramGiB int64) int64 { return ramGiB << 30 }
	// 50 GiB is 5 GiB, inside the 2–6 GiB clamp.
	if got := burstReserve(host(50), budget(50), cfg); got != 5<<30 {
		t.Errorf("50 GiB burst = %.2f GiB, want 5", float64(got)/(1<<30))
	}
	// 16 GiB is 1.6 GiB before the floor raises it to 2 GiB.
	if got := burstReserve(host(16), budget(16), cfg); got != 2<<30 {
		t.Errorf("16 GiB burst = %.2f GiB, want 2", float64(got)/(1<<30))
	}
	// 128 GiB is 12.8 GiB before the cap lowers it to 6 GiB.
	if got := burstReserve(host(128), budget(128), cfg); got != 6<<30 {
		t.Errorf("128 GiB burst = %.2f GiB, want 6", float64(got)/(1<<30))
	}
	// A tiny node keeps at least half its schedulable RAM for charges.
	tinyBudget := int64(1 << 30)
	if got := burstReserve(host(4), tinyBudget, cfg); got != tinyBudget/2 {
		t.Errorf("tiny node burst = %d, want half of schedulable RAM", got)
	}
}

// The charge starts at the limit, follows the learning curve toward peak
// plus the cushion, and never goes below that target.
func TestChargeFollowsLearningCurve(t *testing.T) {
	cfg := Normalize(DefaultConfig())
	limit := mb(4096)
	peak := int64(1 << 30)
	target := learnedTarget(peak, limit, cfg)
	charge := func(observed time.Duration, peak uint64) int64 {
		return memoryCharge(Resident{Limits: paperLimits(), Peak: peak, MemoryCurrent: peak, Observed: observed}, cfg)
	}
	if got := charge(0, uint64(peak)); got != limit {
		t.Errorf("not running yet: charged %d MiB, want the %d MiB limit", got>>20, limit>>20)
	}
	for _, p := range cfg.MemoryLearning {
		moved := float64(limit-charge(p.After, uint64(peak))) / float64(limit-target)
		if math.Abs(moved-p.Learned) > 0.001 {
			t.Errorf("running %s: moved %.3f of the way, the curve says %.3f", p.After, moved, p.Learned)
		}
	}
	if got := charge(1000*time.Hour, uint64(peak)); got < target {
		t.Errorf("charged %d MiB, below the %d MiB target", got>>20, target>>20)
	}
	newPeak := uint64(3 << 30)
	newTarget := learnedTarget(int64(newPeak), limit, cfg)
	if got := charge(learned, newPeak); got < newTarget {
		t.Errorf("after a new peak charged %d MiB, want at least %d MiB", got>>20, newTarget>>20)
	}
}

// A resident is charged at least what it is using now, even above its limit.
func TestChargeCoversObservedUsage(t *testing.T) {
	cfg := Normalize(DefaultConfig())
	node := hostNode("n", 32, 8)
	now := time.Now()
	node.MetricsAt = now
	limits := paperLimits()
	stamp, reason := Fits(node, Derive(limits, cfg), cfg, now)
	if reason != "" {
		t.Fatalf("empty node refused: %s", reason)
	}
	limits = stamped(limits, stamp)
	nearCap := uint64(float64(mb(limits.MemoryMax)) * 0.97)
	cases := map[string]Resident{
		"young near cap":   {Limits: limits, Observed: 30 * time.Second, MemoryCurrent: nearCap, Peak: nearCap},
		"learned near cap": {Limits: limits, Observed: learned, MemoryCurrent: nearCap, Peak: nearCap},
	}
	for name, resident := range cases {
		t.Run(name, func(t *testing.T) {
			got := account(resident, node, cfg).memory
			if got < int64(resident.MemoryCurrent) {
				t.Fatalf("charged %d MiB while using %d MiB", got>>20, resident.MemoryCurrent>>20)
			}
		})
	}
}

// When residents start using more, their charges rise at once and the node
// stops taking servers.
func TestRisingUsageStopsAdmission(t *testing.T) {
	cfg := DefaultConfig()
	node, _ := pack(t, hostNode("n", 32, 64), paperLimits(), cfg, packing{usedFraction: 0.3, observed: learned})
	for i := range node.Servers {
		r := &node.Servers[i]
		r.MemoryCurrent = uint64(0.6 * float64(mb(r.Limits.MemoryMax)))
		r.Peak = r.MemoryCurrent
		node.Metrics.Servers[i].MemoryCurrent = r.MemoryCurrent
	}
	var used uint64
	for _, r := range node.Servers {
		used += r.MemoryCurrent
	}
	node.Metrics.Memory.AvailableBytes = uint64(node.Capacity.MemoryBytes) - 3<<29 - used
	budget, _, _ := node.budgets(Normalize(cfg))
	if got := sumAccounts(node, Normalize(cfg)).memory; got <= budget {
		t.Fatalf("charges total %.1f GiB after usage doubled, within the %.1f GiB budget", float64(got)/(1<<30), float64(budget)/(1<<30))
	}
	if _, reason := Fits(node, Derive(paperLimits(), cfg), cfg, time.Now()); reason == "" {
		t.Fatal("node took a server after its residents doubled their usage")
	}
}

// PSI decides CPU. A busy CPU with no stalls still takes servers.
func TestCPUPressureNotBusyDecides(t *testing.T) {
	cases := []struct {
		name  string
		busy  float64
		psi   api.Pressure
		admit bool
	}{
		{"busy without stalls", 97, api.Pressure{SomeAvg10: 2, SomeAvg60: 2}, true},
		{"sustained stalls", 60, api.Pressure{SomeAvg10: 15, SomeAvg60: 15}, false},
		{"acute stalls", 60, api.Pressure{SomeAvg10: 25, SomeAvg60: 5}, false},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			cfg := DefaultConfig()
			node := hostNode("n", 32, 8)
			node.MetricsAt = time.Now()
			node.Metrics.CPUBusyOK = true
			node.Metrics.CPUBusyAvg10, node.Metrics.CPUBusyAvg60 = tc.busy, tc.busy
			node.Metrics.CPU = tc.psi
			_, reason := Fits(node, Derive(paperLimits(), cfg), cfg, time.Now())
			if tc.admit && reason != "" {
				t.Fatalf("refused: %s", reason)
			}
			if !tc.admit && reason == "" {
				t.Fatal("admitted")
			}
		})
	}
}

// Live stats veto. A node already short on MemAvailable takes no new server
// even when its ledger has room.
func TestLowMemAvailableRefusesNode(t *testing.T) {
	cfg := DefaultConfig()
	node := hostNode("n", 32, 8)
	node.MetricsAt = time.Now()
	node.Metrics.Memory.AvailableBytes = 2 << 30
	if _, reason := Fits(node, Derive(paperLimits(), cfg), cfg, time.Now()); reason == "" {
		t.Fatal("node with 2 GiB available accepted a 4 GiB server")
	}
}

// most_allocated fills the busier node first so whole nodes stay free.
func TestMostAllocatedPacksBusierNode(t *testing.T) {
	cfg := DefaultConfig()
	cfg.Algorithm = AlgorithmMostAllocated
	now := time.Now()
	limits := paperLimits()
	req := Derive(limits, cfg)
	busy := hostNode("busy", 32, 8)
	busy.MetricsAt = now
	stamp, _ := Fits(busy, req, cfg, now)
	busy.Servers = []Resident{{ID: "a", Limits: stamped(limits, stamp)}}
	empty := hostNode("empty", 32, 8)
	empty.MetricsAt = now
	got := Select(Snapshot{Now: now, Config: cfg, Nodes: []Node{empty, busy}}, req)
	if got.NodeID != "busy" {
		t.Fatalf("most_allocated chose %q", got.NodeID)
	}
}
