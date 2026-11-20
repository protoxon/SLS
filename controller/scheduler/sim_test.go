package scheduler

import (
	"fmt"
	"math"
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

// The simulation places servers onto one node over a simulated day. Each step
// is one heartbeat: the node is sampled, then one more server is offered, so
// servers keep arriving as learning frees room.
// Servers follow a usage curve expressed as a share of memory.max, because
// the JVM sizes its heap from the container limit it sees.

const (
	simStep      = 30 * time.Second
	simDay       = 24 * time.Hour
	simOSBytes   = 3 << 29 // kernel, daemon, docker
	simCoresEach = 0.3     // average cores per server
)

// usageCurve is the share of memory.max server i is using, given its age and
// the time of day.
type usageCurve func(i int, age, clock time.Duration) float64

func boot(age time.Duration, settle float64) float64 {
	const ramp = 2 * time.Minute
	if age >= ramp {
		return settle
	}
	return settle * float64(age) / float64(ramp)
}

// quiet servers boot and stay at a third of memory.max.
func quiet(_ int, age, _ time.Duration) float64 {
	return boot(age, 0.35)
}

// growing servers boot quiet and use a little more over six hours. The rise
// is shared across the node, within the room the burst reserve leaves.
func growing(_ int, age, _ time.Duration) float64 {
	const grow = 6 * time.Hour
	if age < 2*time.Minute {
		return boot(age, 0.35)
	}
	f := math.Min(1, float64(age)/float64(grow))
	return 0.35 + f*(0.45-0.35)
}

// eveningSpike is how far, as a share of memory.max, every fourth server
// rises above the quiet working set. 0.15 of a 4 GiB server is about 0.7 GiB.
// On the nodes this test packs, a quarter of them rising by that much stays
// inside the burst reserve (2 GiB on 16 GiB, 3.2 GiB on 32 GiB, 6 GiB on 64 GiB).
const eveningSpike = 0.15

// eveningPeak servers are quiet until 18:00. Then every fourth one rises
// together for two hours, by an amount the burst reserve can absorb.
func eveningPeak(i int, age, clock time.Duration) float64 {
	base := quiet(i, age, clock)
	if clock >= 18*time.Hour && clock < 20*time.Hour && i%4 == 0 {
		return base + eveningSpike
	}
	return base
}

// simServer is a placed server. sampled is false until its first heartbeat.
type simServer struct {
	resident Resident
	created  time.Duration
	sampled  bool
}

type simResult struct {
	servers      int
	oomSteps     int
	firstOOM     time.Duration
	minAvailable int64
	peakUsed     int64
}

func simulate(t *testing.T, ramGiB int64, threads int, limits api.Limits, cfg Config, curve usageCurve) simResult {
	t.Helper()
	cfg = Normalize(cfg)
	start := time.Date(2026, 1, 1, 0, 0, 0, 0, time.UTC)
	node := hostNode("sim", ramGiB, threads)
	ram := node.Capacity.MemoryBytes
	req := Derive(limits, cfg)
	var servers []*simServer
	res := simResult{minAvailable: ram}

	for clock := time.Duration(0); clock < simDay; clock += simStep {
		now := start.Add(clock)

		var used int64
		node.Servers = node.Servers[:0]
		var samples []api.ServerSample
		for i, s := range servers {
			share := curve(i, clock-s.created, clock)
			cur := uint64(share * float64(mb(s.resident.Limits.MemoryMax)))
			r := &s.resident
			r.MemoryCurrent = cur
			r.Peak = max(r.Peak, cur)
			if s.sampled {
				r.Observed += simStep
			}
			s.sampled = true
			used += int64(cur)
			node.Servers = append(node.Servers, *r)
			samples = append(samples, api.ServerSample{ID: r.ID, MemoryCurrent: cur, MemoryPeak: r.Peak})
		}

		available := ram - simOSBytes - used
		if available < res.minAvailable {
			res.minAvailable = available
		}
		if used > res.peakUsed {
			res.peakUsed = used
		}
		if available <= 0 {
			if res.oomSteps == 0 {
				res.firstOOM = clock
			}
			res.oomSteps++
		}
		node.Metrics.Servers = samples
		node.Metrics.Memory.AvailableBytes = uint64(max(available, 0))
		node.Metrics.Memory.Pressure = memoryPressure(available, ram)
		busy := math.Min(100, float64(len(servers))*simCoresEach/float64(threads)*100)
		node.Metrics.CPUBusyOK = true
		node.Metrics.CPUBusyAvg10, node.Metrics.CPUBusyAvg60 = busy, busy
		node.Metrics.CPU = cpuPressure(busy)
		node.MetricsAt = now

		placeAt := now.Add(time.Second)
		result := Select(Snapshot{Now: placeAt, Config: cfg, Nodes: []Node{node}}, req)
		if result.OK() {
			servers = append(servers, &simServer{
				resident: Resident{ID: fmt.Sprint("srv-", len(servers)), Limits: stamped(limits, result.Stamp)},
				created:  clock,
			})
		}
	}
	res.servers = len(servers)
	return res
}

// memoryPressure is a rough PSI model: none until MemAvailable is under a
// tenth of RAM, then rising as reclaim gets harder.
func memoryPressure(available, ram int64) api.Pressure {
	frac := float64(available) / float64(ram)
	if frac >= 0.10 {
		return api.Pressure{}
	}
	some := math.Min(100, (0.10-frac)*400)
	full := some / 4
	return api.Pressure{SomeAvg10: some, SomeAvg60: some, FullAvg10: full, FullAvg60: full}
}

func cpuPressure(busy float64) api.Pressure {
	if busy < 80 {
		return api.Pressure{SomeAvg10: 2, SomeAvg60: 2}
	}
	some := (busy - 80) * 2
	return api.Pressure{SomeAvg10: some, SomeAvg60: some}
}

func TestSimulatedDay(t *testing.T) {
	scenarios := []struct {
		name  string
		curve usageCurve
	}{
		{"quiet", quiet},
		{"growing", growing},
		{"evening peak", eveningPeak},
	}
	nodes := []struct {
		ramGiB  int64
		threads int
	}{
		{16, 4},
		{32, 8},
		{64, 16},
	}
	for _, sc := range scenarios {
		for _, n := range nodes {
			t.Run(fmt.Sprintf("%s/%dGiB", sc.name, n.ramGiB), func(t *testing.T) {
				cfg := DefaultConfig()
				limits := paperLimits()
				res := simulate(t, n.ramGiB, n.threads, limits, cfg, sc.curve)
				budget, _, _ := hostNode("x", n.ramGiB, n.threads).budgets(Normalize(cfg))
				byLimits := int(budget / mb(limits.MemoryLimit))
				t.Logf("%d servers (%d by limits), peak use %.1f GiB of %d GiB, min available %.1f GiB",
					res.servers, byLimits, float64(res.peakUsed)/(1<<30), n.ramGiB, float64(res.minAvailable)/(1<<30))
				if res.oomSteps > 0 {
					t.Errorf("node ran out of memory for %s, first at %s", time.Duration(res.oomSteps)*simStep, res.firstOOM)
				}
				if res.servers <= byLimits {
					t.Errorf("%d servers placed, learning added none over the %d limits allow", res.servers, byLimits)
				}
			})
		}
	}
}
