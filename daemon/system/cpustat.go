package system

import (
	"bufio"
	"math"
	"strconv"
	"strings"
)

// CPUStat is the aggregate cpu line from /proc/stat.
type CPUStat struct {
	User    uint64
	Nice    uint64
	System  uint64
	Idle    uint64
	IOWait  uint64
	IRQ     uint64
	SoftIRQ uint64
	Steal   uint64
	OK      bool
}

// Work is ticks spent doing CPU work (not idle, not iowait).
func (c CPUStat) Work() uint64 {
	return c.User + c.Nice + c.System + c.IRQ + c.SoftIRQ + c.Steal
}

// Total is all accounted ticks, including idle and iowait.
func (c CPUStat) Total() uint64 {
	return c.Work() + c.Idle + c.IOWait
}

// ParseCPUStat reads the first "cpu " line from /proc/stat text.
func ParseCPUStat(text string) CPUStat {
	scanner := bufio.NewScanner(strings.NewReader(text))
	for scanner.Scan() {
		line := scanner.Text()
		if !strings.HasPrefix(line, "cpu ") {
			continue
		}
		fields := strings.Fields(line)
		// cpu user nice system idle iowait irq softirq steal ...
		if len(fields) < 8 {
			return CPUStat{}
		}
		vals := make([]uint64, 8)
		for i := 0; i < 8; i++ {
			n, err := strconv.ParseUint(fields[i+1], 10, 64)
			if err != nil {
				return CPUStat{}
			}
			vals[i] = n
		}
		return CPUStat{
			User:    vals[0],
			Nice:    vals[1],
			System:  vals[2],
			Idle:    vals[3],
			IOWait:  vals[4],
			IRQ:     vals[5],
			SoftIRQ: vals[6],
			Steal:   vals[7],
			OK:      true,
		}
	}
	return CPUStat{}
}

// BusyPercent is the fraction of non-iowait time spent on CPU work, as 0–100.
// iowait is in the denominator so a disk stall does not look like a full CPU.
func BusyPercent(prev, next CPUStat) (float64, bool) {
	if !prev.OK || !next.OK {
		return 0, false
	}
	dWork := delta(next.Work(), prev.Work())
	dTotal := delta(next.Total(), prev.Total())
	if dTotal == 0 {
		return 0, false
	}
	return 100 * float64(dWork) / float64(dTotal), true
}

// emaAlpha is 1 - e^(-dt/window) for a continuous-time EMA.
func emaAlpha(dt, window float64) float64 {
	if window <= 0 || dt <= 0 {
		return 1
	}
	a := 1 - math.Exp(-dt/window)
	if a < 0 {
		return 0
	}
	if a > 1 {
		return 1
	}
	return a
}

func updateEMA(prev, sample, alpha float64, seeded bool) float64 {
	if !seeded {
		return sample
	}
	return prev + alpha*(sample-prev)
}
