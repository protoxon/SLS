package scheduler

import (
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

// A download can hold IO full well above the old cap. Free disk still decides.
func TestDiskPressureDoesNotRefuse(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Now()
	node := hostNode("n", 32, 8)
	node.MetricsAt = now
	node.Metrics.Disk.Pressure = api.Pressure{FullAvg10: 80, FullAvg60: 40}
	if _, reason := Fits(node, Derive(paperLimits(), cfg), cfg, now); reason != "" {
		t.Fatalf("high disk PSI refused: %s", reason)
	}

	node.Metrics.CPU = api.Pressure{SomeAvg10: 15, SomeAvg60: 15}
	if _, reason := Fits(node, Derive(paperLimits(), cfg), cfg, now); reason != ReasonPressureCPU {
		t.Fatalf("CPU PSI reason %q", reason)
	}

	node.Metrics.CPU = api.Pressure{}
	node.Metrics.Memory.Pressure = api.Pressure{FullAvg10: 5, FullAvg60: 5}
	if _, reason := Fits(node, Derive(paperLimits(), cfg), cfg, now); reason != ReasonPressureMemory {
		t.Fatalf("memory PSI reason %q", reason)
	}
}

// Equal nodes: sustained IO full picks the quieter disk, not the lower ID.
func TestIOPressureBreaksNearTies(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Now()
	req := Derive(paperLimits(), cfg)

	hot := hostNode("a", 32, 8)
	hot.MetricsAt = now
	hot.Metrics.Disk.Pressure = api.Pressure{FullAvg10: 90, FullAvg60: 40}

	cool := hostNode("b", 32, 8)
	cool.MetricsAt = now
	cool.Metrics.Disk.Pressure.FullAvg60 = 1

	got := Select(Snapshot{Now: now, Config: cfg, Nodes: []Node{hot, cool}}, req)
	if got.NodeID != cool.ID {
		t.Fatalf("placed on %s", got.NodeID)
	}
}

// A real gap in free RAM still beats a quieter disk.
func TestResourceScoreBeatsIOPressure(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Now()
	req := Derive(paperLimits(), cfg)
	norm := Normalize(cfg)

	hot := hostNode("z-open", 64, 8)
	hot.MetricsAt = now
	hot.Metrics.Disk.Pressure.FullAvg60 = 90

	cool := hostNode("a-small", 8, 8)
	cool.MetricsAt = now
	cool.Metrics.Disk.Pressure.FullAvg60 = 0

	if gap := scoreNode(hot, req, norm) - scoreNode(cool, req, norm); gap <= ioScoreBand {
		t.Fatalf("fixture gap %v is inside the band", gap)
	}
	got := Select(Snapshot{Now: now, Config: cfg, Nodes: []Node{cool, hot}}, req)
	if got.NodeID != hot.ID {
		t.Fatalf("placed on %s", got.NodeID)
	}
}

// A cached multi-gigabyte snapshot still outweighs a busy disk.
func TestSnapshotLocalityBeatsIOPressure(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Now()
	req := Derive(paperLimits(), cfg)
	req.Snapshots = []SnapshotDisk{{ID: "snap", Bytes: 5 << 30}}

	held := hostNode("z-held", 32, 8)
	held.MetricsAt = now
	held.Snapshots["snap"] = struct{}{}
	held.Metrics.Disk.Pressure.FullAvg60 = 80

	open := hostNode("a-open", 32, 8)
	open.MetricsAt = now

	got := Select(Snapshot{Now: now, Config: cfg, Nodes: []Node{open, held}}, req)
	if got.NodeID != held.ID {
		t.Fatalf("placed on %s", got.NodeID)
	}
}
