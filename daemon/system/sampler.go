package system

import (
	"os"
	"runtime"
	"strings"
	"sync"
	"time"

	"golang.org/x/sys/unix"
	"protoxon.com/sls/internal/api"
)

const sampleInterval = time.Second

// Sampler publishes host pressure for the heartbeat.
type Sampler struct {
	mu               sync.Mutex
	root             string
	latest           api.NodeMetrics
	servers          func() []api.ServerSample
	prevIn           uint64
	prevOut          uint64
	prevAt           time.Time
	havePrev         bool
	rates            []swapRate
	prevCPU          CPUStat
	haveCPU          bool
	cpuAt            time.Time
	busyAvg10        float64
	busyAvg60        float64
	busySeeded       bool
	busyOK           bool
	busyMissingSince time.Time
	missing          string
}

// busyWarnAfter is how long utilization may stay unavailable before heartbeats warn.
const busyWarnAfter = 30 * time.Second

type swapRate struct {
	at  time.Time
	in  float64
	out float64
}

// NewSampler reads pressure for the filesystem at root.
func NewSampler(root string, servers func() []api.ServerSample) *Sampler {
	if root == "" {
		root = "/"
	}
	return &Sampler{root: root, servers: servers}
}

// Sample reads host pressure once. Start also samples, and the first read
// should happen before heartbeats so registration is not followed by an empty sample.
func (s *Sampler) Sample() {
	s.sample()
}

// Start samples once a second until done is closed.
func (s *Sampler) Start(done <-chan struct{}) {
	s.sample()
	ticker := time.NewTicker(sampleInterval)
	defer ticker.Stop()
	for {
		select {
		case <-done:
			return
		case <-ticker.C:
			s.sample()
		}
	}
}

// Current returns the latest sample. The node stays connected when Complete is false.
func (s *Sampler) Current() api.NodeMetrics {
	s.mu.Lock()
	out := s.latest
	servers := s.servers
	s.mu.Unlock()
	if servers != nil {
		out.Servers = servers()
	}
	return out
}

func (s *Sampler) sample() {
	s.mu.Lock()
	defer s.mu.Unlock()
	metrics := api.NodeMetrics{Timestamp: time.Now().Unix()}
	cpuText, cpuErr := os.ReadFile("/proc/pressure/cpu")
	memText, memErr := os.ReadFile("/proc/pressure/memory")
	ioText, ioErr := os.ReadFile("/proc/pressure/io")
	infoText, infoErr := os.ReadFile("/proc/meminfo")
	vmText, vmErr := os.ReadFile("/proc/vmstat")
	statText, statErr := os.ReadFile("/proc/stat")

	var cpu, mem, io PSIFile
	if cpuErr == nil {
		cpu = ParsePSI(string(cpuText))
		metrics.CPU = api.Pressure{SomeAvg10: cpu.SomeAvg10, SomeAvg60: cpu.SomeAvg60, FullAvg10: cpu.FullAvg10, FullAvg60: cpu.FullAvg60}
	}
	if statErr == nil {
		s.applyCPUBusy(ParseCPUStat(string(statText)), &metrics)
	} else {
		s.markBusyUnavailable()
	}
	if memErr == nil {
		mem = ParsePSI(string(memText))
		metrics.Memory.Pressure = api.Pressure{SomeAvg10: mem.SomeAvg10, SomeAvg60: mem.SomeAvg60, FullAvg10: mem.FullAvg10, FullAvg60: mem.FullAvg60}
	}
	if ioErr == nil {
		io = ParsePSI(string(ioText))
		metrics.Disk.Pressure = api.Pressure{SomeAvg10: io.SomeAvg10, SomeAvg60: io.SomeAvg60, FullAvg10: io.FullAvg10, FullAvg60: io.FullAvg60}
	}
	var info MemInfo
	if infoErr == nil {
		info = ParseMemInfo(string(infoText))
		metrics.Memory.AvailableBytes = info.AvailableBytes
		metrics.Memory.CacheBytes = info.CacheBytes
		if info.SwapTotalBytes >= info.SwapFreeBytes {
			metrics.Memory.SwapUsedBytes = info.SwapTotalBytes - info.SwapFreeBytes
		}
	}
	if vmErr == nil {
		s.applySwap(ParseVMStat(string(vmText)), &metrics)
	}
	if avail, _, err := diskBytes(s.root); err == nil {
		metrics.Disk.AvailableBytes = avail
	}
	var missing []string
	if cpuErr != nil || !cpu.HasSome {
		missing = append(missing, "cpu pressure")
	}
	if memErr != nil || !mem.HasSome {
		missing = append(missing, "memory pressure")
	}
	if ioErr != nil || !io.HasSome {
		missing = append(missing, "io pressure")
	}
	if !info.OK {
		missing = append(missing, "meminfo")
	}
	if metrics.Disk.AvailableBytes == 0 {
		missing = append(missing, "disk free space")
	}
	metrics.Complete = len(missing) == 0
	s.missing = strings.Join(missing, ", ")
	s.latest = metrics
}

func (s *Sampler) applyCPUBusy(stat CPUStat, metrics *api.NodeMetrics) {
	now := time.Now()
	if !stat.OK {
		s.markBusyUnavailable()
		if s.busySeeded {
			metrics.CPUBusyAvg10 = s.busyAvg10
			metrics.CPUBusyAvg60 = s.busyAvg60
		}
		return
	}
	if s.haveCPU {
		dt := now.Sub(s.cpuAt).Seconds()
		if busy, ok := BusyPercent(s.prevCPU, stat); ok {
			a10 := emaAlpha(dt, 10)
			a60 := emaAlpha(dt, 60)
			s.busyAvg10 = updateEMA(s.busyAvg10, busy, a10, s.busySeeded)
			s.busyAvg60 = updateEMA(s.busyAvg60, busy, a60, s.busySeeded)
			s.busySeeded = true
			s.busyOK = true
			s.busyMissingSince = time.Time{}
		}
	}
	s.prevCPU = stat
	s.cpuAt = now
	s.haveCPU = true
	if s.busyOK {
		metrics.CPUBusyOK = true
		metrics.CPUBusyAvg10 = s.busyAvg10
		metrics.CPUBusyAvg60 = s.busyAvg60
		return
	}
	s.markBusyUnavailable()
	if s.busySeeded {
		metrics.CPUBusyAvg10 = s.busyAvg10
		metrics.CPUBusyAvg60 = s.busyAvg60
	}
}

func (s *Sampler) markBusyUnavailable() {
	s.busyOK = false
	if s.busyMissingSince.IsZero() {
		s.busyMissingSince = time.Now()
	}
}

// BusyStale reports that host CPU utilization has been unavailable longer than
// the warm-up window and should be logged. Required metrics are unaffected.
func (s *Sampler) BusyStale() bool {
	s.mu.Lock()
	defer s.mu.Unlock()
	if s.busyOK || s.busyMissingSince.IsZero() {
		return false
	}
	return time.Since(s.busyMissingSince) >= busyWarnAfter
}

// Missing reports why the latest sample is incomplete. An empty string means it is usable.
func (s *Sampler) Missing() string {
	s.mu.Lock()
	defer s.mu.Unlock()
	return s.missing
}

func (s *Sampler) applySwap(vm VMStat, metrics *api.NodeMetrics) {
	now := time.Now()
	if !vm.OK {
		return
	}
	if s.havePrev {
		elapsed := now.Sub(s.prevAt).Seconds()
		if elapsed > 0 {
			in := float64(delta(vm.SwapIn, s.prevIn)) / elapsed
			out := float64(delta(vm.SwapOut, s.prevOut)) / elapsed
			s.rates = append(s.rates, swapRate{at: now, in: in, out: out})
		}
	}
	s.prevIn = vm.SwapIn
	s.prevOut = vm.SwapOut
	s.prevAt = now
	s.havePrev = true
	cutoff := now.Add(-10 * time.Second)
	kept := s.rates[:0]
	var inSum, outSum float64
	var n float64
	for _, rate := range s.rates {
		if rate.at.Before(cutoff) {
			continue
		}
		kept = append(kept, rate)
		inSum += rate.in
		outSum += rate.out
		n++
	}
	s.rates = kept
	if n > 0 {
		metrics.Memory.SwapInPerSec = inSum / n
		metrics.Memory.SwapOutPerSec = outSum / n
	}
}

func delta(next, prev uint64) uint64 {
	if next < prev {
		return 0
	}
	return next - prev
}

func diskBytes(path string) (available, total uint64, err error) {
	var stat unix.Statfs_t
	if err = unix.Statfs(path, &stat); err != nil {
		return 0, 0, err
	}
	return stat.Bavail * uint64(stat.Bsize), stat.Blocks * uint64(stat.Bsize), nil
}

var (
	activeMu sync.Mutex
	active   *Sampler
)

// UseSampler installs the process-wide sampler the heartbeat publishes.
func UseSampler(s *Sampler) {
	activeMu.Lock()
	active = s
	activeMu.Unlock()
}

// CurrentMetrics returns the latest host sample. A nil sampler yields an incomplete sample.
func CurrentMetrics() api.NodeMetrics {
	activeMu.Lock()
	s := active
	activeMu.Unlock()
	if s == nil {
		return api.NodeMetrics{Timestamp: time.Now().Unix()}
	}
	return s.Current()
}

// MetricsGap reports why the active sampler has no usable sample.
func MetricsGap() string {
	activeMu.Lock()
	s := active
	activeMu.Unlock()
	if s == nil {
		return "sampler has not started"
	}
	return s.Missing()
}

// BusyUtilizationStale reports that CPU busy averages have been unavailable
// longer than the warm-up window.
func BusyUtilizationStale() bool {
	activeMu.Lock()
	s := active
	activeMu.Unlock()
	if s == nil {
		return false
	}
	return s.BusyStale()
}

// Capacity reads the static host description sent at registration.
func Capacity(root, role string, overhead api.OverheadPolicy) api.NodeCapacity {
	if root == "" {
		root = "/"
	}
	if role == "" {
		role = api.RoleStandard
	}
	capacity := api.NodeCapacity{
		CPUThreads:    runtime.NumCPU(),
		CgroupVersion: cgroupVersion(),
		Role:          role,
		Overhead:      overhead,
	}
	if text, err := os.ReadFile("/proc/meminfo"); err == nil {
		if info := ParseMemInfo(string(text)); info.OK {
			capacity.MemoryBytes = int64(info.TotalBytes)
		}
	}
	if _, total, err := diskBytes(root); err == nil {
		capacity.DiskBytes = int64(total)
	}
	return capacity
}

func cgroupVersion() string {
	if _, err := os.Stat("/sys/fs/cgroup/cgroup.controllers"); err == nil {
		return "v2"
	}
	return "v1"
}
