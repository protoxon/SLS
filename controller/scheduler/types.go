package scheduler

import (
	"math"
	"time"

	"protoxon.com/sls/internal/api"
)

const (
	ReasonOffline           = "offline"
	ReasonDrained           = "drained"
	ReasonStaleMetrics      = "stale_metrics"
	ReasonIncompleteMetrics = "incomplete_metrics"
	ReasonNoCapacity        = "no_capacity"
	ReasonNoPort            = "no_port"
	ReasonDisk              = "disk"
	ReasonDiskQuota         = "disk_quota"
	ReasonMemoryReservation = "memory_reservation"
	ReasonMemoryAvailable   = "memory_available"
	ReasonMemoryHigh        = "memory_high"
	ReasonCPUReservation    = "cpu_reservation"
	ReasonMemoryHardCap     = "memory_hard_cap"
	ReasonPressureCPU       = "pressure_cpu"
	ReasonPressureMemory    = "pressure_memory"
	ReasonSwapRate          = "swap_rate"
	ReasonSwapOccupancy     = "swap_occupancy"
	ReasonNotConnected      = "not_connected"

	AlgorithmMostAllocated  = "most_allocated"
	AlgorithmLeastAllocated = "least_allocated"
)

// Config is the placement policy. Zero values are filled by Normalize.
type Config struct {
	Algorithm string
	// MemoryRequestRatio sets the memory.low stamp. It does not affect placement.
	MemoryRequestRatio  float64
	CPURequestRatio     float64
	DefaultCPURequest   int64
	CPUOvercommitMax    float64
	MemoryOvercommitMax float64
	// MemoryCushionBytes is added to a learned server's peak. It covers
	// ordinary jitter between heartbeats. MemoryBurstPercent is spike room
	// held once per node, as a percent of host RAM, clamped to
	// [MemoryBurstBytes, MemoryBurstMax] and to half of schedulable RAM.
	// MemoryLearning is how far the charge has moved from the limit toward
	// peak plus cushion after a server has been running for a while.
	MemoryCushionBytes   int64
	MemoryBurstPercent   float64
	MemoryBurstBytes     int64
	MemoryBurstMax       int64
	MemoryLearning       []LearnPoint
	MemoryReservePercent float64
	MemoryReserveBytes   int64
	CPUReservePercent    float64
	DiskReservePercent   float64
	// DiskReserveBytes is the smallest host disk reserve.
	// DiskReserveMax is the largest. The percent is clamped into that range.
	DiskReserveBytes      int64
	DiskReserveMax        int64
	MaxMetricAge          time.Duration
	MemoryFullAvg10       float64
	MemorySomeAvg10       float64
	CPUSomeAvg60          float64
	MaxSwapPagesPerSec    float64
	SwapSustainedSamples  int
	RejectOnSwapOccupancy bool
	// Overallocate places a server when every acceptable node is only over its
	// memory or CPU ledger. A disk quota miss counts only when DiskQuotaCheck
	// is set. Free space below the disk reserve still refuses the node.
	Overallocate bool
	// DiskQuotaCheck charges blueprint disk quotas at admission. Leave it
	// unset for CoW servers: the quota is a per-server growth cap, and create
	// time does not consume it. Free space below the disk reserve still
	// refuses a node. Disk PSI does not.
	DiskQuotaCheck bool
}

// DefaultConfig returns the starting policy from the controller config file.
func DefaultConfig() Config {
	return Config{
		Algorithm:            AlgorithmLeastAllocated,
		MemoryRequestRatio:   0.85,
		CPURequestRatio:      0.95,
		DefaultCPURequest:    25,
		CPUOvercommitMax:     4,
		MemoryOvercommitMax:  3,
		MemoryCushionBytes:   256 << 20,
		MemoryBurstPercent:   10,
		MemoryBurstBytes:     2 << 30,
		MemoryBurstMax:       6 << 30,
		MemoryLearning:       defaultLearning(),
		MemoryReservePercent: 8,
		MemoryReserveBytes:   1 << 30,
		CPUReservePercent:    5,
		DiskReservePercent:   10,
		DiskReserveBytes:     8 << 30,
		DiskReserveMax:       32 << 30,
		MaxMetricAge:         30 * time.Second,
		MemoryFullAvg10:      1,
		MemorySomeAvg10:      10,
		CPUSomeAvg60:         10,
		MaxSwapPagesPerSec:   64,
		SwapSustainedSamples: 2,
	}
}

// Normalize fills empty policy fields from DefaultConfig.
// An explicit zero ratio is treated as unset. RejectOnSwapOccupancy false is a real setting.
func Normalize(cfg Config) Config {
	base := DefaultConfig()
	if cfg.Algorithm == AlgorithmMostAllocated || cfg.Algorithm == AlgorithmLeastAllocated {
		base.Algorithm = cfg.Algorithm
	}
	if cfg.MemoryRequestRatio > 0 {
		base.MemoryRequestRatio = cfg.MemoryRequestRatio
	}
	if cfg.CPURequestRatio > 0 {
		base.CPURequestRatio = cfg.CPURequestRatio
	}
	if cfg.DefaultCPURequest > 0 {
		base.DefaultCPURequest = cfg.DefaultCPURequest
	}
	if cfg.CPUOvercommitMax > 0 {
		base.CPUOvercommitMax = cfg.CPUOvercommitMax
	}
	if cfg.MemoryOvercommitMax > 0 {
		base.MemoryOvercommitMax = cfg.MemoryOvercommitMax
	}
	if cfg.MemoryCushionBytes > 0 {
		base.MemoryCushionBytes = cfg.MemoryCushionBytes
	}
	if cfg.MemoryBurstPercent > 0 {
		base.MemoryBurstPercent = cfg.MemoryBurstPercent
	}
	if cfg.MemoryBurstBytes > 0 {
		base.MemoryBurstBytes = cfg.MemoryBurstBytes
	}
	if cfg.MemoryBurstMax > 0 {
		base.MemoryBurstMax = cfg.MemoryBurstMax
	}
	if learning := normalizeLearning(cfg.MemoryLearning); len(learning) > 0 {
		base.MemoryLearning = learning
	}
	if cfg.MemoryReservePercent > 0 {
		base.MemoryReservePercent = cfg.MemoryReservePercent
	}
	if cfg.MemoryReserveBytes > 0 {
		base.MemoryReserveBytes = cfg.MemoryReserveBytes
	}
	if cfg.CPUReservePercent > 0 {
		base.CPUReservePercent = cfg.CPUReservePercent
	}
	if cfg.DiskReservePercent > 0 {
		base.DiskReservePercent = cfg.DiskReservePercent
	}
	if cfg.DiskReserveBytes > 0 {
		base.DiskReserveBytes = cfg.DiskReserveBytes
	}
	if cfg.DiskReserveMax > 0 {
		base.DiskReserveMax = cfg.DiskReserveMax
	}
	if cfg.MaxMetricAge > 0 {
		base.MaxMetricAge = cfg.MaxMetricAge
	}
	if cfg.MemoryFullAvg10 > 0 {
		base.MemoryFullAvg10 = cfg.MemoryFullAvg10
	}
	if cfg.MemorySomeAvg10 > 0 {
		base.MemorySomeAvg10 = cfg.MemorySomeAvg10
	}
	if cfg.CPUSomeAvg60 > 0 {
		base.CPUSomeAvg60 = cfg.CPUSomeAvg60
	}
	if cfg.MaxSwapPagesPerSec > 0 {
		base.MaxSwapPagesPerSec = cfg.MaxSwapPagesPerSec
	}
	if cfg.SwapSustainedSamples > 0 {
		base.SwapSustainedSamples = cfg.SwapSustainedSamples
	}
	base.RejectOnSwapOccupancy = cfg.RejectOnSwapOccupancy
	base.Overallocate = cfg.Overallocate
	base.DiskQuotaCheck = cfg.DiskQuotaCheck
	if base.MemoryRequestRatio > 1 {
		base.MemoryRequestRatio = 1
	}
	if base.CPURequestRatio > 1 {
		base.CPURequestRatio = 1
	}
	if base.CPUOvercommitMax < 1 {
		base.CPUOvercommitMax = 1
	}
	if base.MemoryOvercommitMax < 1 {
		base.MemoryOvercommitMax = 1
	}
	return base
}

// SnapshotDisk is one overlay snapshot the request needs on the node.
type SnapshotDisk struct {
	ID    string
	Bytes int64
}

// Request is the node-independent ask. MemoryMax is computed per candidate.
type Request struct {
	MemoryLimitMB       int64
	CPULimit            int64
	DiskMB              int64
	MemoryReservationMB int64
	CPURequest          int64
	NodeID              string
	// Snapshots are charged against free disk when the node does not already
	// have them. Cached snapshots add a locality score that grows through a
	// few gigabytes and flattens around 10 GB.
	Snapshots []SnapshotDisk
}

// Derive builds the reservation and CPU request from resolved blueprint limits.
func Derive(limits api.Limits, cfg Config) Request {
	cfg = Normalize(cfg)
	req := Request{
		MemoryLimitMB: limits.MemoryLimit,
		CPULimit:      limits.CpuLimit,
		DiskMB:        limits.DiskSpace,
	}
	if limits.MemoryLimit > 0 {
		req.MemoryReservationMB = int64(math.Round(float64(limits.MemoryLimit) * cfg.MemoryRequestRatio))
		if req.MemoryReservationMB < 1 {
			req.MemoryReservationMB = 1
		}
	}
	if limits.CpuLimit > 0 {
		req.CPURequest = int64(math.Round(float64(limits.CpuLimit) * cfg.CPURequestRatio))
		if req.CPURequest < 1 {
			req.CPURequest = 1
		}
	} else {
		req.CPURequest = cfg.DefaultCPURequest
	}
	return req
}

// Stamp is written onto the server when placement commits.
type Stamp struct {
	MemoryReservationMB int64
	MemoryMaxMB         int64
	CPURequest          int64
}

// Resident is one server already admitted to a node.
// MemoryCurrent is cgroup bytes from the latest heartbeat, zero when that
// heartbeat did not include the server. Peak is the highest memory use the
// controller has seen for it, and Observed how long it has watched it run.
type Resident struct {
	ID            string
	Limits        api.Limits
	MemoryCurrent uint64
	Peak          uint64
	Observed      time.Duration
}

// Node is one candidate and the servers already admitted there.
// Metrics.Servers is the latest heartbeat. A resident missing from it is not
// running yet, or is stopped, and does not show in MemAvailable.
type Node struct {
	ID          string
	Online      bool
	Drained     bool
	Capacity    api.NodeCapacity
	Metrics     api.NodeMetrics
	MetricsAt   time.Time
	MemoryHigh  bool
	HasFreePort bool
	Servers     []Resident
	// SwapOutRates are recent heartbeat swap-out rates, oldest first.
	SwapOutRates []float64
	// Snapshots are the snapshot ids cached on this node.
	Snapshots map[string]struct{}
}

// Snapshot is a copy of the cluster. Select does not refresh it.
type Snapshot struct {
	Nodes  []Node
	Now    time.Time
	Config Config
}

// Rejection is why one node was not selected.
type Rejection struct {
	NodeID string
	Reason string
}

// Result is a winner and its stamp, or the rejections from this attempt.
// Overallocated means the winner was past a resource ledger and was chosen
// because Overallocate is set.
type Result struct {
	NodeID        string
	Stamp         Stamp
	Rejections    []Rejection
	Overallocated bool
}

// OK reports whether a node was selected.
func (r Result) OK() bool {
	return r.NodeID != ""
}

// Freeze fills stamp fields that are still empty. A server with no memory
// limit is left unchanged so admission can treat it as occupying the node.
// Existing nonzero stamps are kept.
func Freeze(limits api.Limits, policy api.OverheadPolicy, cfg Config) (api.Limits, bool) {
	cfg = Normalize(cfg)
	if limits.MemoryLimit <= 0 && limits.MemoryReservation <= 0 && limits.MemoryMax <= 0 {
		return limits, false
	}
	changed := false
	if limits.MemoryReservation <= 0 && limits.MemoryLimit > 0 {
		limits.MemoryReservation = int64(math.Round(float64(limits.MemoryLimit) * cfg.MemoryRequestRatio))
		if limits.MemoryReservation < 1 {
			limits.MemoryReservation = 1
		}
		changed = true
	}
	if limits.MemoryMax <= 0 && limits.MemoryLimit > 0 && policy.Usable() {
		limits.MemoryMax = api.MemoryHardCapMB(limits.MemoryLimit, policy)
		changed = true
	}
	if limits.CpuRequest <= 0 {
		if limits.CpuLimit > 0 {
			limits.CpuRequest = int64(math.Round(float64(limits.CpuLimit) * cfg.CPURequestRatio))
			if limits.CpuRequest < 1 {
				limits.CpuRequest = 1
			}
		} else {
			limits.CpuRequest = cfg.DefaultCPURequest
		}
		changed = true
	}
	return limits, changed
}
