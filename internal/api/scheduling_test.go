package api

import "testing"

func TestHardCapMultiplierBuiltin(t *testing.T) {
	policy := OverheadPolicy{}
	cases := []struct {
		limit int64
		want  float64
	}{
		{2048, 1.15},
		{2049, 1.10},
		{4096, 1.10},
		{4097, 1.05},
		{6144, 1.05},
	}
	for _, tc := range cases {
		got := HardCapMultiplier(tc.limit, policy)
		if got != tc.want {
			t.Fatalf("limit %d: got %v want %v", tc.limit, got, tc.want)
		}
	}
	if MemoryHardCapMB(6144, policy) != 6451 {
		t.Fatalf("6 GiB cap: %d", MemoryHardCapMB(6144, policy))
	}
}

func TestHardCapMultiplierOverride(t *testing.T) {
	policy := OverheadPolicy{
		Override:          true,
		DefaultMultiplier: 1.25,
		Steps: []OverheadStep{
			{AtMB: 4096, Multiplier: 2},
			{AtMB: 1024, Multiplier: 1.5},
		},
	}
	if got := HardCapMultiplier(512, policy); got != 1.5 {
		t.Fatalf("small: %v", got)
	}
	if got := HardCapMultiplier(4096, policy); got != 2 {
		t.Fatalf("mid: %v", got)
	}
	if got := HardCapMultiplier(8192, policy); got != 1.25 {
		t.Fatalf("default: %v", got)
	}
	if (OverheadPolicy{}).Usable() != true {
		t.Fatal("builtin policy is usable")
	}
	if (OverheadPolicy{Override: true}).Usable() {
		t.Fatal("empty override is not usable")
	}
}

func TestMemoryEventsClimbed(t *testing.T) {
	if MemoryEventsClimbed(nil, []ServerSample{{ID: "a", MemoryHigh: 4}}) {
		t.Fatal("first sample is a baseline")
	}
	prev := []ServerSample{{ID: "a", MemoryHigh: 2, MemoryOOM: 1}}
	if MemoryEventsClimbed(prev, []ServerSample{{ID: "a", MemoryHigh: 2, MemoryOOM: 1}}) {
		t.Fatal("unchanged counters climbed")
	}
	if !MemoryEventsClimbed(prev, []ServerSample{{ID: "a", MemoryHigh: 3}}) {
		t.Fatal("memory.high increase was ignored")
	}
	if !MemoryEventsClimbed(prev, []ServerSample{{ID: "b", MemoryOOMKill: 1}}) {
		t.Fatal("new server already over the line was ignored")
	}
}
