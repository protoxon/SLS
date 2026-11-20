package docker

import (
	"context"
	"os"
	"strconv"
	"strings"
	"time"

	"github.com/apex/log"
	"protoxon.com/sls/internal/api"
)

// SampleCgroup reads this container's memory and CPU counters from the host
// cgroup tree. The daemon needs pid: host and cgroup: host so sibling
// docker-*.scope directories are visible (private cgroup namespaces hide them).
func (e *Environment) SampleCgroup() (api.ServerSample, bool) {
	path := e.cgroupDir()
	if path == "" {
		return api.ServerSample{}, false
	}
	current, err := readUintFile(path + "/memory.current")
	if err != nil {
		return api.ServerSample{}, false
	}
	sample := api.ServerSample{ID: e.Id, MemoryCurrent: current}
	if peak, err := readUintFile(path + "/memory.peak"); err == nil {
		sample.MemoryPeak = peak
	}
	events := parseMemoryEvents(readOptional(path + "/memory.events"))
	sample.MemoryHigh = events["high"]
	sample.MemoryOOM = events["oom"]
	sample.MemoryOOMKill = events["oom_kill"]
	if usage, err := readCPUUsage(path + "/cpu.stat"); err == nil {
		e.setCPUDelta(&sample, usage)
	}
	e.warnCgroupMismatch(path)
	return sample, true
}

func (e *Environment) setCPUDelta(sample *api.ServerSample, usage uint64) {
	e.cgroupMu.Lock()
	defer e.cgroupMu.Unlock()
	if e.cpuLast > 0 && usage >= e.cpuLast {
		sample.CPUDeltaUsec = usage - e.cpuLast
	}
	e.cpuLast = usage
}

func (e *Environment) cgroupDir() string {
	e.cgroupMu.Lock()
	path := e.cgroupPath
	e.cgroupMu.Unlock()
	if path != "" {
		if _, err := os.Stat(path); err == nil {
			return path
		}
		e.cgroupMu.Lock()
		if e.cgroupPath == path {
			e.cgroupPath = ""
		}
		e.cgroupMu.Unlock()
	}
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()
	ins, err := e.ContainerInspect(ctx)
	if err != nil || ins.State == nil || ins.State.Pid <= 0 {
		return ""
	}
	found, err := cgroupPathFromPID(ins.State.Pid)
	if err != nil || found == "" {
		return ""
	}
	e.cgroupMu.Lock()
	e.cgroupPath = found
	e.cgroupMu.Unlock()
	return found
}

func cgroupPathFromPID(pid int) (string, error) {
	text, err := os.ReadFile("/proc/" + strconv.Itoa(pid) + "/cgroup")
	if err != nil {
		return "", err
	}
	for _, line := range strings.Split(string(text), "\n") {
		parts := strings.SplitN(line, ":", 3)
		if len(parts) != 3 {
			continue
		}
		// cgroup v2 is "0::/path".
		if parts[0] == "0" && parts[1] == "" && parts[2] != "" {
			return "/sys/fs/cgroup" + parts[2], nil
		}
	}
	return "", nil
}

func (e *Environment) warnCgroupMismatch(dir string) {
	e.cgroupMu.Lock()
	if e.cgroupWarn || e.Configuration == nil {
		e.cgroupMu.Unlock()
		return
	}
	limits := e.Configuration.Limits()
	e.cgroupMu.Unlock()

	if systemCgroupVersion() != "v2" || (limits.MemoryMax <= 0 && limits.MemoryReservation <= 0) {
		e.markCgroupChecked()
		return
	}
	readable := true
	if limits.MemoryMax > 0 {
		got, err := readCgroupLimit(dir + "/memory.max")
		want := uint64(limits.MemoryMax) * 1024 * 1024
		if err != nil {
			readable = false
		} else if got != want {
			log.WithField("server", e.Id).WithField("memory.max", got).WithField("expected", want).
				Warn("cgroup memory.max does not match the stamped hard cap")
		}
	}
	if limits.MemoryReservation > 0 {
		got, err := readCgroupLimit(dir + "/memory.high")
		want := uint64(limits.MemoryReservation) * 1024 * 1024
		if err != nil {
			readable = false
		} else if got != want {
			log.WithField("server", e.Id).WithField("memory.high", got).WithField("expected", want).
				Warn("cgroup memory.high does not match the stamped reservation")
		}
	}
	if readable {
		e.markCgroupChecked()
	}
}

func (e *Environment) markCgroupChecked() {
	e.cgroupMu.Lock()
	e.cgroupWarn = true
	e.cgroupMu.Unlock()
}

func systemCgroupVersion() string {
	if _, err := os.Stat("/sys/fs/cgroup/cgroup.controllers"); err == nil {
		return "v2"
	}
	return "v1"
}

func readOptional(path string) string {
	text, err := os.ReadFile(path)
	if err != nil {
		return ""
	}
	return string(text)
}

func readUintFile(path string) (uint64, error) {
	text, err := os.ReadFile(path)
	if err != nil {
		return 0, err
	}
	return strconv.ParseUint(strings.TrimSpace(string(text)), 10, 64)
}

func readCgroupLimit(path string) (uint64, error) {
	text, err := os.ReadFile(path)
	if err != nil {
		return 0, err
	}
	trimmed := strings.TrimSpace(string(text))
	if trimmed == "max" {
		return 0, os.ErrNotExist
	}
	return strconv.ParseUint(trimmed, 10, 64)
}

func readCPUUsage(path string) (uint64, error) {
	text, err := os.ReadFile(path)
	if err != nil {
		return 0, err
	}
	for _, line := range strings.Split(string(text), "\n") {
		fields := strings.Fields(line)
		if len(fields) == 2 && fields[0] == "usage_usec" {
			return strconv.ParseUint(fields[1], 10, 64)
		}
	}
	return 0, os.ErrNotExist
}

func parseMemoryEvents(text string) map[string]uint64 {
	out := map[string]uint64{}
	for _, line := range strings.Split(text, "\n") {
		fields := strings.Fields(line)
		if len(fields) != 2 {
			continue
		}
		value, err := strconv.ParseUint(fields[1], 10, 64)
		if err != nil {
			continue
		}
		out[fields[0]] = value
	}
	return out
}
