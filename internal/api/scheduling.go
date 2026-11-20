package api

import "math"

const (
	// RoleStandard nodes are placed on first.
	RoleStandard = "standard"
	// RoleOverflow nodes are used only when every standard node was filtered out.
	RoleOverflow = "overflow"

	// FallbackHardCapMultiplier is the temporary hard-cap multiplier used when a
	// server has a memory limit but the node's overhead policy is not loaded yet.
	FallbackHardCapMultiplier = 1.15
)

// OverheadStep is one upper bound in a node's memory overhead policy.
// A limit at or below AtMB uses Multiplier.
type OverheadStep struct {
	AtMB       int64   `json:"at_mb"`
	Multiplier float64 `json:"multiplier"`
}

// OverheadPolicy is the daemon's memory overhead configuration, sent at registration.
// Override false uses the built-in 15% / 10% / 5% steps and ignores Steps.
type OverheadPolicy struct {
	Override          bool           `json:"override"`
	DefaultMultiplier float64        `json:"default_multiplier"`
	Steps             []OverheadStep `json:"steps,omitempty"`
}

// Usable reports whether the policy can compute a hard cap.
// The built-in steps are usable when Override is false. An override needs a
// default multiplier or at least one step.
func (p OverheadPolicy) Usable() bool {
	if !p.Override {
		return true
	}
	if p.DefaultMultiplier > 0 {
		return true
	}
	for _, step := range p.Steps {
		if step.Multiplier > 0 {
			return true
		}
	}
	return false
}

// HardCapMultiplier matches the daemon's historical overhead rules.
// When Override is false the large-server multiplier is 1.05, not DefaultMultiplier.
func HardCapMultiplier(limitMB int64, policy OverheadPolicy) float64 {
	if !policy.Override {
		if limitMB <= 2048 {
			return 1.15
		}
		if limitMB <= 4096 {
			return 1.10
		}
		return 1.05
	}
	steps := append([]OverheadStep(nil), policy.Steps...)
	for i := 1; i < len(steps); i++ {
		j := i
		for j > 0 && steps[j].AtMB < steps[j-1].AtMB {
			steps[j], steps[j-1] = steps[j-1], steps[j]
			j--
		}
	}
	for _, step := range steps {
		if limitMB > step.AtMB {
			continue
		}
		if step.Multiplier > 0 {
			return step.Multiplier
		}
	}
	if policy.DefaultMultiplier > 0 {
		return policy.DefaultMultiplier
	}
	return 1.05
}

// MemoryHardCapMB is the overhead-adjusted hard cap in megabytes.
func MemoryHardCapMB(limitMB int64, policy OverheadPolicy) int64 {
	if limitMB <= 0 {
		return 0
	}
	return int64(math.Round(float64(limitMB) * HardCapMultiplier(limitMB, policy)))
}

// NodeCapacity is the static host description sent with registration.
type NodeCapacity struct {
	CPUThreads    int            `json:"cpu_threads"`
	MemoryBytes   int64          `json:"memory_bytes"`
	DiskBytes     int64          `json:"disk_bytes"`
	CgroupVersion string         `json:"cgroup_version"`
	Role          string         `json:"role"`
	Overhead      OverheadPolicy `json:"overhead"`
}

// Pressure is one PSI resource. Averages are the kernel's percent of wall time stalled.
type Pressure struct {
	SomeAvg10 float64 `json:"some_avg10"`
	SomeAvg60 float64 `json:"some_avg60"`
	FullAvg10 float64 `json:"full_avg10"`
	FullAvg60 float64 `json:"full_avg60"`
}

// NodeMetrics is the heartbeat body. Complete is false when a required sample
// could not be read; the node stays online and is not schedulable.
type NodeMetrics struct {
	Timestamp int64    `json:"timestamp"`
	Complete  bool     `json:"complete"`
	CPU       Pressure `json:"cpu"`
	// CPUBusyOK is true when CPUBusyAvg* are from a real /proc/stat delta.
	// False during warm-up or when utilization cannot be read; scoring omits busy then.
	CPUBusyOK bool `json:"cpu_busy_ok"`
	// CPUBusyAvg10 and CPUBusyAvg60 are host busy percent (0–100) from /proc/stat.
	// Busy is CPU work time only; iowait is not counted as busy.
	CPUBusyAvg10 float64        `json:"cpu_busy_avg10"`
	CPUBusyAvg60 float64        `json:"cpu_busy_avg60"`
	Memory       MemoryMetrics  `json:"memory"`
	Disk         DiskMetrics    `json:"disk"`
	Servers      []ServerSample `json:"servers,omitempty"`
	// SnapshotHash is the fingerprint of the snapshot ids cached on this node.
	// Empty means the daemon did not report one.
	SnapshotHash string `json:"snapshot_hash,omitempty"`
}

// MemoryMetrics is host memory pressure and swap movement.
// AvailableBytes is MemAvailable, so reclaimable cache counts as free.
// CacheBytes is Buffers + Cached + SReclaimable, the cache included in a
// typical "used" reading.
type MemoryMetrics struct {
	Pressure       Pressure `json:"pressure"`
	AvailableBytes uint64   `json:"available_bytes"`
	CacheBytes     uint64   `json:"cache_bytes"`
	SwapUsedBytes  uint64   `json:"swap_used_bytes"`
	SwapInPerSec   float64  `json:"swap_in_per_sec"`
	SwapOutPerSec  float64  `json:"swap_out_per_sec"`
}

// DiskMetrics is pressure and free bytes on the server-data filesystem.
type DiskMetrics struct {
	Pressure       Pressure `json:"pressure"`
	AvailableBytes uint64   `json:"available_bytes"`
}

// ServerSample is one container's cgroup counters.
type ServerSample struct {
	ID            string `json:"id"`
	MemoryCurrent uint64 `json:"memory_current"`
	MemoryPeak    uint64 `json:"memory_peak"`
	CPUDeltaUsec  uint64 `json:"cpu_delta_usec"`
	MemoryHigh    uint64 `json:"memory_high"`
	MemoryOOM     uint64 `json:"memory_oom"`
	MemoryOOMKill uint64 `json:"memory_oom_kill"`
}

// MemoryEventsClimbed reports whether memory.high, oom, or oom_kill increased
// since the previous sample. The first sample is a baseline and does not count.
// A server that appears already over memory.high does count.
func MemoryEventsClimbed(prev, next []ServerSample) bool {
	if len(prev) == 0 || len(next) == 0 {
		return false
	}
	type counts struct {
		high uint64
		oom  uint64
		kill uint64
		seen bool
	}
	old := make(map[string]counts, len(prev))
	for _, sample := range prev {
		old[sample.ID] = counts{high: sample.MemoryHigh, oom: sample.MemoryOOM, kill: sample.MemoryOOMKill, seen: true}
	}
	for _, sample := range next {
		was, seen := old[sample.ID]
		if !seen {
			if sample.MemoryHigh > 0 || sample.MemoryOOM > 0 || sample.MemoryOOMKill > 0 {
				return true
			}
			continue
		}
		if sample.MemoryHigh > was.high || sample.MemoryOOM > was.oom || sample.MemoryOOMKill > was.kill {
			return true
		}
	}
	return false
}
