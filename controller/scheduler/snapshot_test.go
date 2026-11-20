package scheduler

import (
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

func fitNode(id string, free uint64) Node {
	return Node{
		ID:          id,
		Online:      true,
		HasFreePort: true,
		Capacity: api.NodeCapacity{
			CPUThreads:  4,
			MemoryBytes: 8 << 30,
			DiskBytes:   100 << 30,
		},
		Metrics: api.NodeMetrics{
			Complete: true,
			Memory:   api.MemoryMetrics{AvailableBytes: 4 << 30},
			Disk:     api.DiskMetrics{AvailableBytes: free},
		},
		MetricsAt: time.Now(),
		Snapshots: map[string]struct{}{},
	}
}

func TestMissingSnapshotRequiresFreeDisk(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Now()
	req := Request{
		MemoryLimitMB:       512,
		MemoryReservationMB: 256,
		CPURequest:          100,
		DiskMB:              1024,
		Snapshots:           []SnapshotDisk{{ID: "snap", Bytes: 40 << 30}},
	}
	local := fitNode("local", 20<<30)
	local.Snapshots["snap"] = struct{}{}
	if _, reason := Fits(local, req, cfg, now); reason != "" {
		t.Fatalf("local node rejected: %s", reason)
	}
	remote := fitNode("remote", 20<<30)
	if _, reason := Fits(remote, req, cfg, now); reason != ReasonDisk {
		t.Fatalf("remote reason %q", reason)
	}
}

func TestDiskReserveIsClamped(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Now()
	req := Request{
		MemoryLimitMB:       512,
		MemoryReservationMB: 256,
		CPURequest:          100,
		DiskMB:              1024,
	}
	large := fitNode("large", 90<<30)
	large.Capacity.DiskBytes = 915 << 30
	if _, reason := Fits(large, req, cfg, now); reason != "" {
		t.Fatalf("large disk with 90GiB free rejected: %s", reason)
	}
	tight := fitNode("tight", 20<<30)
	tight.Capacity.DiskBytes = 1 << 40
	if _, reason := Fits(tight, req, cfg, now); reason != ReasonDisk {
		t.Fatalf("under the cap: %s", reason)
	}
	small := fitNode("small", 6<<30)
	small.Capacity.DiskBytes = 40 << 30
	if _, reason := Fits(small, req, cfg, now); reason != ReasonDisk {
		t.Fatalf("under the floor: %s", reason)
	}
	smallOK := fitNode("small-ok", 10<<30)
	smallOK.Capacity.DiskBytes = 40 << 30
	if _, reason := Fits(smallOK, req, cfg, now); reason != "" {
		t.Fatalf("above the floor rejected: %s", reason)
	}
}

func TestSnapshotLocalityCurve(t *testing.T) {
	bonus := func(bytes int64) float64 {
		return snapshotLocality(cachedNode("snap"), Request{Snapshots: []SnapshotDisk{{ID: "snap", Bytes: bytes}}})
	}
	mb := func(n int64) int64 { return n << 20 }
	gb := func(n int64) int64 { return n << 30 }
	hundredMB := bonus(mb(100))
	fiveHundred := bonus(mb(500))
	one := bonus(gb(1))
	three := bonus(gb(3))
	five := bonus(gb(5))
	ten := bonus(gb(10))
	if hundredMB <= 0 || hundredMB >= fiveHundred || fiveHundred >= one || one >= three || three >= five || five >= ten {
		t.Fatalf("curve did not rise: %v %v %v %v %v %v", hundredMB, fiveHundred, one, three, five, ten)
	}
	if hundredMB > snapshotLocalityCap*0.03 {
		t.Fatalf("100 MB bonus %v", hundredMB)
	}
	if fiveHundred > snapshotLocalityCap*0.12 {
		t.Fatalf("500 MB bonus %v", fiveHundred)
	}
	if one < fiveHundred*2 || one > snapshotLocalityCap*0.25 {
		t.Fatalf("1 GB bonus %v", one)
	}
	if three < snapshotLocalityCap*0.6 || three > snapshotLocalityCap*0.8 {
		t.Fatalf("3 GB bonus %v", three)
	}
	if five < snapshotLocalityCap*0.85 {
		t.Fatalf("5 GB bonus %v", five)
	}
	if ten < snapshotLocalityCap*0.97 {
		t.Fatalf("10 GB bonus %v", ten)
	}
	if ten >= five*2 {
		t.Fatalf("10 GB bonus %v is twice the 5 GB bonus %v", ten, five)
	}
	partial := snapshotLocality(cachedNode("a"), Request{Snapshots: []SnapshotDisk{
		{ID: "a", Bytes: gb(5)},
		{ID: "b", Bytes: gb(5)},
	}})
	if partial != five {
		t.Fatalf("partial cache scored %v, cached portion %v", partial, five)
	}
}

func TestSnapshotLocalityWeightsResources(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Now()
	small := Request{
		MemoryLimitMB:       512,
		MemoryReservationMB: 256,
		CPURequest:          100,
		DiskMB:              1024,
		Snapshots:           []SnapshotDisk{{ID: "snap", Bytes: 1 << 30}},
	}
	large := small
	large.Snapshots = []SnapshotDisk{{ID: "snap", Bytes: 5 << 30}}

	open := fitNode("open", 300<<30)
	open.Capacity.DiskBytes = 400 << 30
	held := fitNode("held", 80<<30)
	held.Metrics.Memory.AvailableBytes = 8 << 30
	held.Snapshots["snap"] = struct{}{}
	held.Servers = []Resident{{
		ID:     "resident",
		Limits: api.Limits{MemoryLimit: 1024, CpuRequest: 25},
	}}
	packed := fitNode("packed", 80<<30)
	packed.Metrics.Memory.AvailableBytes = 8 << 30
	packed.Snapshots["snap"] = struct{}{}
	packed.Servers = []Resident{{
		ID:     "resident",
		Limits: api.Limits{MemoryLimit: 5120, CpuRequest: 250},
	}}

	if got := Select(Snapshot{Now: now, Config: cfg, Nodes: []Node{open, held}}, small); got.NodeID != "open" {
		t.Fatalf("small snapshot stayed on the tighter node %s", got.NodeID)
	}
	if got := Select(Snapshot{Now: now, Config: cfg, Nodes: []Node{open, held}}, large); got.NodeID != "held" {
		t.Fatalf("large snapshot left the node that has it: %s", got.NodeID)
	}
	if got := Select(Snapshot{Now: now, Config: cfg, Nodes: []Node{open, packed}}, large); got.NodeID != "open" {
		t.Fatalf("packed node kept a large snapshot: %s", got.NodeID)
	}
}

func cachedNode(ids ...string) Node {
	n := Node{Snapshots: map[string]struct{}{}}
	for _, id := range ids {
		n.Snapshots[id] = struct{}{}
	}
	return n
}
