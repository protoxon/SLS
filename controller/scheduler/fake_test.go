package scheduler

import (
	"fmt"
	"math"
	"time"

	"protoxon.com/sls/internal/api"
)

// Observed running times for residents. young has just become running, so
// almost nothing is learned yet. learned has converged.
const (
	young   = 30 * time.Second
	learned = 48 * time.Hour
)

// fakeHost is a node described by what is really on it. node derives the
// heartbeat the daemon would send from those resources, so a test states RAM,
// OS use, and per-server use instead of hand-picking MemAvailable or PSI.
type fakeHost struct {
	id      string
	ramGiB  float64
	threads int
	// osGiB is memory used by the kernel, the daemon, and anything else that
	// is not a managed server. Zero means a typical 1.5 GiB.
	osGiB    float64
	servers  []fakeServer
	overflow bool
	offline  bool
	drained  bool
	staleFor time.Duration
	// swapOut is the swap-out rate in pages per second on recent heartbeats.
	swapOut float64
}

// fakeServer is one managed server and what it is using.
type fakeServer struct {
	// limitMB zero is a server with no memory limit, which takes a whole node.
	limitMB int64
	// cpuLimit is the blueprint cpu_limit in percent of a core.
	cpuLimit int64
	// used is the share of memory.max the server is using. peak, when
	// higher, is the most it has used.
	used float64
	peak float64
	// cores is the CPU the server is burning. Zero means 0.3 cores.
	cores float64
	// observed is how long it has been running. Zero means it was placed
	// after the latest heartbeat, so the heartbeat does not include it,
	// unless starting is set: then it is in the heartbeat but still booting.
	observed time.Duration
	starting bool
}

func paper(used float64, observed time.Duration) fakeServer {
	return fakeServer{limitMB: 4096, used: used, observed: observed}
}

// paperN is n identical Paper servers.
func paperN(n int, used float64, observed time.Duration) []fakeServer {
	out := make([]fakeServer, n)
	for i := range out {
		out[i] = paper(used, observed)
	}
	return out
}

// bootingN is n Paper servers in the heartbeat that have not reached running.
func bootingN(n int) []fakeServer {
	out := make([]fakeServer, n)
	for i := range out {
		out[i] = fakeServer{limitMB: 4096, used: 0.1, starting: true}
	}
	return out
}

func (h fakeHost) node(cfg Config, now time.Time) Node {
	cfg = Normalize(cfg)
	ram := int64(h.ramGiB * (1 << 30))
	osGiB := h.osGiB
	if osGiB == 0 {
		osGiB = 1.5
	}
	role := api.RoleStandard
	if h.overflow {
		role = apiRoleOverflow
	}
	n := Node{
		ID:          h.id,
		Online:      !h.offline,
		Drained:     h.drained,
		HasFreePort: true,
		Capacity: api.NodeCapacity{
			CPUThreads:    h.threads,
			MemoryBytes:   ram,
			DiskBytes:     1 << 40,
			CgroupVersion: "v2",
			Role:          role,
		},
		MetricsAt: now.Add(-5 * time.Second).Add(-h.staleFor),
		Snapshots: map[string]struct{}{},
	}
	used := int64(osGiB * (1 << 30))
	var cores float64
	for i, s := range h.servers {
		limits := api.Limits{MemoryLimit: s.limitMB, CpuLimit: s.cpuLimit}
		req := Derive(limits, cfg)
		limits.MemoryReservation = req.MemoryReservationMB
		limits.MemoryMax = api.MemoryHardCapMB(s.limitMB, n.Capacity.Overhead)
		limits.CpuRequest = req.CPURequest
		r := Resident{ID: fmt.Sprintf("%s-%d", h.id, i), Limits: limits}
		if s.observed > 0 || s.starting {
			capBytes := float64(mb(limits.MemoryMax))
			cur := uint64(s.used * capBytes)
			peak := max(cur, uint64(s.peak*capBytes))
			r.MemoryCurrent, r.Peak, r.Observed = cur, peak, s.observed
			used += int64(cur)
			n.Metrics.Servers = append(n.Metrics.Servers, api.ServerSample{ID: r.ID, MemoryCurrent: cur, MemoryPeak: peak})
		}
		c := s.cores
		if c == 0 {
			c = 0.3
		}
		cores += c
		n.Servers = append(n.Servers, r)
	}
	available := max(ram-used, 0)
	busy := math.Min(100, cores/float64(h.threads)*100)
	n.Metrics.Complete = true
	n.Metrics.Memory.AvailableBytes = uint64(available)
	n.Metrics.Memory.Pressure = memoryPressure(available, ram)
	n.Metrics.Memory.SwapOutPerSec = h.swapOut
	n.Metrics.CPUBusyOK = true
	n.Metrics.CPUBusyAvg10, n.Metrics.CPUBusyAvg60 = busy, busy
	n.Metrics.CPU = cpuPressure(busy)
	n.Metrics.Disk.AvailableBytes = 800 << 30
	if h.swapOut > 0 {
		n.SwapOutRates = []float64{h.swapOut, h.swapOut, h.swapOut}
	}
	return n
}
