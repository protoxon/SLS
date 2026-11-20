package system

import (
	"bufio"
	"strconv"
	"strings"
)

// PSIFile is one /proc/pressure resource.
type PSIFile struct {
	SomeAvg10 float64
	SomeAvg60 float64
	FullAvg10 float64
	FullAvg60 float64
	HasSome   bool
	HasFull   bool
}

// ParsePSI reads a /proc/pressure file. CPU files omit the full line.
func ParsePSI(text string) PSIFile {
	var out PSIFile
	scanner := bufio.NewScanner(strings.NewReader(text))
	for scanner.Scan() {
		fields := strings.Fields(scanner.Text())
		if len(fields) == 0 {
			continue
		}
		kind := fields[0]
		avg10, avg60, ok := psiAverages(fields[1:])
		if !ok {
			continue
		}
		switch kind {
		case "some":
			out.SomeAvg10 = avg10
			out.SomeAvg60 = avg60
			out.HasSome = true
		case "full":
			out.FullAvg10 = avg10
			out.FullAvg60 = avg60
			out.HasFull = true
		}
	}
	return out
}

func psiAverages(fields []string) (avg10, avg60 float64, ok bool) {
	found := 0
	for _, field := range fields {
		key, value, cut := strings.Cut(field, "=")
		if !cut {
			continue
		}
		parsed, err := strconv.ParseFloat(value, 64)
		if err != nil {
			continue
		}
		switch key {
		case "avg10":
			avg10 = parsed
			found++
		case "avg60":
			avg60 = parsed
			found++
		}
	}
	return avg10, avg60, found == 2
}

// VMStat holds the swap page counters from /proc/vmstat.
type VMStat struct {
	SwapIn  uint64
	SwapOut uint64
	OK      bool
}

// ParseVMStat reads pswpin and pswpout.
func ParseVMStat(text string) VMStat {
	var out VMStat
	var sawIn, sawOut bool
	scanner := bufio.NewScanner(strings.NewReader(text))
	for scanner.Scan() {
		fields := strings.Fields(scanner.Text())
		if len(fields) != 2 {
			continue
		}
		value, err := strconv.ParseUint(fields[1], 10, 64)
		if err != nil {
			continue
		}
		switch fields[0] {
		case "pswpin":
			out.SwapIn = value
			sawIn = true
		case "pswpout":
			out.SwapOut = value
			sawOut = true
		}
	}
	out.OK = sawIn && sawOut
	return out
}

// MemInfo is the subset of /proc/meminfo the scheduler needs.
type MemInfo struct {
	TotalBytes     uint64
	AvailableBytes uint64
	CacheBytes     uint64
	SwapTotalBytes uint64
	SwapFreeBytes  uint64
	OK             bool
}

// ParseMemInfo reads MemTotal, MemAvailable, cache, SwapTotal, and SwapFree.
// Cache is Buffers + Cached + SReclaimable.
func ParseMemInfo(text string) MemInfo {
	var out MemInfo
	var total, avail, swapTotal, swapFree bool
	scanner := bufio.NewScanner(strings.NewReader(text))
	for scanner.Scan() {
		fields := strings.Fields(scanner.Text())
		if len(fields) < 2 {
			continue
		}
		name := strings.TrimSuffix(fields[0], ":")
		value, err := strconv.ParseUint(fields[1], 10, 64)
		if err != nil {
			continue
		}
		bytes := value * 1024
		switch name {
		case "MemTotal":
			out.TotalBytes = bytes
			total = true
		case "MemAvailable":
			out.AvailableBytes = bytes
			avail = true
		case "Buffers", "Cached", "SReclaimable":
			out.CacheBytes += bytes
		case "SwapTotal":
			out.SwapTotalBytes = bytes
			swapTotal = true
		case "SwapFree":
			out.SwapFreeBytes = bytes
			swapFree = true
		}
	}
	out.OK = total && avail && swapTotal && swapFree
	return out
}
