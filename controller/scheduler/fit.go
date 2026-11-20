package scheduler

import (
	"math"
	"time"

	"protoxon.com/sls/internal/api"
)

type accounted struct {
	memory    int64
	memoryMax int64
	cpu       int64
	disk      int64
}

func mb(n int64) int64 {
	return n * 1024 * 1024
}

func (n Node) budgets(cfg Config) (memory, cpu, disk int64) {
	memReserve := int64(float64(n.Capacity.MemoryBytes) * cfg.MemoryReservePercent / 100)
	if memReserve < cfg.MemoryReserveBytes {
		memReserve = cfg.MemoryReserveBytes
	}
	memory = n.Capacity.MemoryBytes - memReserve
	if memory < 0 {
		memory = 0
	}
	if n.Metrics.Memory.SwapUsedBytes > 0 {
		memory -= int64(n.Metrics.Memory.SwapUsedBytes)
		if memory < 0 {
			memory = 0
		}
	}
	cpuTotal := int64(n.Capacity.CPUThreads) * 100
	cpuReserve := int64(float64(cpuTotal) * cfg.CPUReservePercent / 100)
	cpu = cpuTotal - cpuReserve
	if cpu < 0 {
		cpu = 0
	}
	diskReserve := int64(float64(n.Capacity.DiskBytes) * cfg.DiskReservePercent / 100)
	if diskReserve < cfg.DiskReserveBytes {
		diskReserve = cfg.DiskReserveBytes
	}
	if cfg.DiskReserveMax > 0 && diskReserve > cfg.DiskReserveMax {
		diskReserve = cfg.DiskReserveMax
	}
	disk = n.Capacity.DiskBytes - diskReserve
	if disk < 0 {
		disk = 0
	}
	return memory, cpu, disk
}

// burstReserve is RAM held back once for the node, for spikes above learned
// peaks. It is a percent of host RAM, clamped to [MemoryBurstBytes,
// MemoryBurstMax], and never more than half of schedulable RAM.
func burstReserve(hostRAM, memBudget int64, cfg Config) int64 {
	if hostRAM <= 0 || memBudget <= 0 {
		return 0
	}
	burst := int64(float64(hostRAM) * cfg.MemoryBurstPercent / 100)
	if burst < cfg.MemoryBurstBytes {
		burst = cfg.MemoryBurstBytes
	}
	if cfg.MemoryBurstMax > 0 && burst > cfg.MemoryBurstMax {
		burst = cfg.MemoryBurstMax
	}
	if half := memBudget / 2; burst > half {
		burst = half
	}
	if burst < 0 {
		return 0
	}
	return burst
}

// scoredMemory is the RAM a placement decision treats as taken: resident
// charges, the request, and the node's burst reserve. The reserve makes a
// larger host's larger pool show up as less free RAM.
func scoredMemory(node Node, request Request, cfg Config) (used, budget int64) {
	budget, _, _ = node.budgets(cfg)
	used = sumAccounts(node, cfg).memory + requestMemory(request) + burstReserve(node.Capacity.MemoryBytes, budget, cfg)
	return used, budget
}

// cpuAdmissionCeiling is the ledger backstop. Schedulable CPU already excludes
// the host reserve. CPUOvercommitMax is how many times that budget the sum of
// CPU requests may reach. Pressure decides before this does.
func cpuAdmissionCeiling(cpuBudget int64, cfg Config) int64 {
	ceiling := int64(math.Round(float64(cpuBudget) * cfg.CPUOvercommitMax))
	if ceiling < cpuBudget {
		ceiling = cpuBudget
	}
	return ceiling
}

// unlimited reports a server with no memory limit, reservation, or cap. It
// takes the whole node.
func unlimited(limits api.Limits) bool {
	return limits.MemoryLimit <= 0 && limits.MemoryReservation <= 0 && limits.MemoryMax <= 0
}

// declaredMemory is a server's charge before anything is learned: its limit.
func declaredMemory(limits api.Limits) int64 {
	switch {
	case limits.MemoryLimit > 0:
		return mb(limits.MemoryLimit)
	case limits.MemoryMax > 0:
		return mb(limits.MemoryMax)
	default:
		return mb(limits.MemoryReservation)
	}
}

// hardCapMB is a server's memory.max: the stamp, or what the node's overhead
// policy derives from the limit.
func hardCapMB(limits api.Limits, node Node) int64 {
	if limits.MemoryMax > 0 {
		return limits.MemoryMax
	}
	if limits.MemoryLimit <= 0 {
		return 0
	}
	if node.Capacity.Overhead.Usable() {
		return api.MemoryHardCapMB(limits.MemoryLimit, node.Capacity.Overhead)
	}
	return int64(math.Round(float64(limits.MemoryLimit) * api.FallbackHardCapMultiplier))
}

// memoryCharge is what a resident holds against the node's RAM.
//
//	target = min(limit, peak + cushion)
//	charge = limit - w*(limit - target), never below current use
//
// w follows the MemoryLearning S-curve over the server's observed running
// time. A new peak raises the target, so the charge rises on the next
// heartbeat. The cushion is ordinary jitter. Spike room is burstReserve,
// held once for the whole node.
func memoryCharge(resident Resident, cfg Config) int64 {
	limit := declaredMemory(resident.Limits)
	current := int64(resident.MemoryCurrent)
	peak := max(int64(resident.Peak), current)
	charge := limit
	if w := learnedWeight(resident.Observed, cfg); w > 0 && peak > 0 && peak < limit {
		target := learnedTarget(peak, limit, cfg)
		charge = limit - int64(math.Round(w*float64(limit-target)))
	}
	return max(charge, current)
}

// learnedTarget is the charge a fully trusted server holds: its peak plus the
// cushion, and never above its limit.
func learnedTarget(peak, limit int64, cfg Config) int64 {
	target := peak + cfg.MemoryCushionBytes
	if target > limit {
		return limit
	}
	return target
}

func account(resident Resident, node Node, cfg Config) accounted {
	limits := resident.Limits
	memBudget, cpuBudget, diskBudget := node.budgets(cfg)
	if unlimited(limits) {
		return accounted{
			memory:    memBudget,
			memoryMax: hardCeiling(memBudget, node, cfg),
			cpu:       cpuBudget,
			disk:      diskBudget,
		}
	}
	cpu := limits.CpuRequest
	if cpu <= 0 {
		if limits.CpuLimit > 0 {
			cpu = int64(math.Round(float64(limits.CpuLimit) * cfg.CPURequestRatio))
		} else {
			cpu = cfg.DefaultCPURequest
		}
	}
	return accounted{
		memory:    memoryCharge(resident, cfg),
		memoryMax: mb(hardCapMB(limits, node)),
		cpu:       cpu,
		disk:      mb(limits.DiskSpace),
	}
}

// usage is a node's ledger totals and what MemAvailable must still cover.
// headroom is the charge of heartbeat-sampled residents above their current
// use: the cushion still above the working set, plus any of the limit a young
// server has not yet given up. unsampled is the charge of residents the latest
// heartbeat did not include: new servers that are not running yet and stopped
// servers.
type usage struct {
	accounted
	headroom      int64
	unsampled     int64
	unsampledDisk int64
}

func sumAccounts(node Node, cfg Config) usage {
	sampled := make(map[string]struct{}, len(node.Metrics.Servers))
	for _, sample := range node.Metrics.Servers {
		sampled[sample.ID] = struct{}{}
	}
	var u usage
	for _, resident := range node.Servers {
		one := account(resident, node, cfg)
		u.memory += one.memory
		u.memoryMax += one.memoryMax
		u.cpu += one.cpu
		u.disk += one.disk
		if _, ok := sampled[resident.ID]; !ok {
			u.unsampled += one.memory
			u.unsampledDisk += one.disk
			continue
		}
		if unlimited(resident.Limits) {
			continue
		}
		if gap := one.memory - int64(resident.MemoryCurrent); gap > 0 {
			u.headroom += gap
		}
	}
	return u
}

// requestMemory is the charge a new server starts with.
func requestMemory(req Request) int64 {
	if req.MemoryLimitMB > 0 {
		return mb(req.MemoryLimitMB)
	}
	return mb(req.MemoryReservationMB)
}

// hardCeiling is the sum of memory.max allowed on the node.
// cgroup v1 has no memory.high throttle, so the ceiling stays at allocatable RAM.
func hardCeiling(memBudget int64, node Node, cfg Config) int64 {
	mul := cfg.MemoryOvercommitMax
	if node.Capacity.CgroupVersion != "v2" {
		mul = 1
	}
	ceiling := int64(float64(memBudget) * mul)
	if ceiling < memBudget {
		ceiling = memBudget
	}
	return ceiling
}

func ceilMB(bytes int64) int64 {
	if bytes <= 0 {
		return 0
	}
	const unit = 1024 * 1024
	return (bytes + unit - 1) / unit
}

// pressureHot is sustained pressure above the cap, or an acute spike at twice
// the cap. avg10 alone at the cap is a short stall and does not veto.
func pressureHot(avg10, avg60, limit float64) bool {
	if limit <= 0 {
		return false
	}
	if avg60 > limit {
		return true
	}
	return avg10 > limit*2
}

func candidateHardCapMB(req Request, node Node) int64 {
	if req.MemoryLimitMB <= 0 {
		return 0
	}
	if node.Capacity.Overhead.Usable() {
		return api.MemoryHardCapMB(req.MemoryLimitMB, node.Capacity.Overhead)
	}
	return int64(math.Round(float64(req.MemoryLimitMB) * api.FallbackHardCapMultiplier))
}

func exclusiveRequest(req Request) bool {
	return req.MemoryLimitMB <= 0 && req.MemoryReservationMB <= 0
}

// Fits reports the stamp this request would take on node, or the first reason
// it cannot. Live vetoes are checked before the ledger, so a ledger reason
// means everything else passed. now is the controller clock used to decide
// whether metrics are stale.
func Fits(node Node, req Request, cfg Config, now time.Time) (Stamp, string) {
	cfg = Normalize(cfg)
	if !node.Online {
		return Stamp{}, ReasonOffline
	}
	if node.Drained {
		return Stamp{}, ReasonDrained
	}
	if node.Capacity.CPUThreads <= 0 || node.Capacity.MemoryBytes <= 0 || node.Capacity.DiskBytes <= 0 {
		return Stamp{}, ReasonNoCapacity
	}
	if !node.Metrics.Complete || node.MetricsAt.IsZero() {
		return Stamp{}, ReasonIncompleteMetrics
	}
	if now.IsZero() {
		now = time.Now()
	}
	if cfg.MaxMetricAge > 0 && now.Sub(node.MetricsAt) > cfg.MaxMetricAge {
		return Stamp{}, ReasonStaleMetrics
	}
	if cfg.RejectOnSwapOccupancy && node.Metrics.Memory.SwapUsedBytes > 0 {
		return Stamp{}, ReasonSwapOccupancy
	}
	if pressureHot(node.Metrics.CPU.SomeAvg10, node.Metrics.CPU.SomeAvg60, cfg.CPUSomeAvg60) {
		return Stamp{}, ReasonPressureCPU
	}
	if pressureHot(node.Metrics.Memory.Pressure.FullAvg10, node.Metrics.Memory.Pressure.FullAvg60, cfg.MemoryFullAvg10) ||
		pressureHot(node.Metrics.Memory.Pressure.SomeAvg10, node.Metrics.Memory.Pressure.SomeAvg60, cfg.MemorySomeAvg10) {
		return Stamp{}, ReasonPressureMemory
	}
	if node.MemoryHigh {
		return Stamp{}, ReasonMemoryHigh
	}
	if swapOutSustained(node, cfg) {
		return Stamp{}, ReasonSwapRate
	}
	if !node.HasFreePort {
		return Stamp{}, ReasonNoPort
	}

	memBudget, cpuBudget, diskBudget := node.budgets(cfg)
	if memBudget <= 0 || cpuBudget <= 0 || diskBudget <= 0 {
		return Stamp{}, ReasonNoCapacity
	}
	used := sumAccounts(node, cfg)
	needMem := requestMemory(req)
	needDisk := mb(req.DiskMB)
	needCPU := req.CPURequest
	hardMB := candidateHardCapMB(req, node)
	needHard := mb(hardMB)
	// A blueprint with no memory limit takes the whole node. Charging it on
	// the way in keeps a second copy from landing beside it.
	exclusive := exclusiveRequest(req)
	if exclusive {
		needMem = memBudget
		needCPU = cpuBudget
		needDisk = diskBudget
		needHard = hardCeiling(memBudget, node, cfg)
		hardMB = ceilMB(needHard)
	}

	stamp := Stamp{
		MemoryReservationMB: req.MemoryReservationMB,
		MemoryMaxMB:         hardMB,
		CPURequest:          req.CPURequest,
	}
	if exclusive {
		stamp.MemoryReservationMB = ceilMB(needMem)
		stamp.CPURequest = needCPU
	}

	// Free space below the host reserve means the volume is actually near full.
	// Disk quotas are a per-server growth cap and are not charged unless
	// DiskQuotaCheck is set. Disk PSI does not refuse a node.
	diskReserve := node.Capacity.DiskBytes - diskBudget
	if int64(node.Metrics.Disk.AvailableBytes) < diskReserve+missingSnapshotBytes(node, req) {
		return stamp, ReasonDisk
	}
	// Real free memory must back every promise the ledger makes: the new
	// server, each running resident's cushion above current use, each
	// resident that is not running yet, the node's burst reserve, and
	// breathing room for the host. This catches memory the ledger cannot
	// see, such as processes outside SLS. An unlimited server takes the
	// whole schedulable budget and does not pay the burst on top.
	burst := int64(0)
	if !exclusive {
		burst = burstReserve(node.Capacity.MemoryBytes, memBudget, cfg)
	}
	liveNeed := used.headroom + used.unsampled + burst + cfg.MemoryReserveBytes
	if !exclusive {
		liveNeed += needMem
	}
	if liveNeed > int64(node.Metrics.Memory.AvailableBytes) {
		return stamp, ReasonMemoryAvailable
	}

	if cfg.DiskQuotaCheck && (used.disk+needDisk > diskBudget || used.unsampledDisk+needDisk > int64(node.Metrics.Disk.AvailableBytes)) {
		return stamp, ReasonDiskQuota
	}
	if used.memory+needMem+burst > memBudget {
		return stamp, ReasonMemoryReservation
	}
	if used.cpu+needCPU > cpuAdmissionCeiling(cpuBudget, cfg) {
		return stamp, ReasonCPUReservation
	}
	if used.memoryMax+needHard > hardCeiling(memBudget, node, cfg) {
		return stamp, ReasonMemoryHardCap
	}
	return stamp, ""
}

// swapOutSustained reports that the newest sustained_samples heartbeat
// swap-out rates are each above the page threshold.
func swapOutSustained(node Node, cfg Config) bool {
	need := cfg.SwapSustainedSamples
	if need < 1 {
		need = 2
	}
	if len(node.SwapOutRates) < need {
		return false
	}
	tail := node.SwapOutRates[len(node.SwapOutRates)-need:]
	for _, rate := range tail {
		if rate <= cfg.MaxSwapPagesPerSec {
			return false
		}
	}
	return true
}

// CapacityReason reports a ledger miss. Overallocation may place through these.
// Every live veto, including MemAvailable, still refuses.
func CapacityReason(reason string) bool {
	switch reason {
	case ReasonDiskQuota, ReasonMemoryReservation, ReasonCPUReservation, ReasonMemoryHardCap:
		return true
	default:
		return false
	}
}
