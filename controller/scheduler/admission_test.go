package scheduler

import (
	"fmt"
	"strings"
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

// Schedulable RAM is RAM minus the host reserve, max(8%, 1 GiB):
// 16 GiB -> 14.7 GiB, 32 GiB -> 29.4 GiB, 64 GiB -> 58.9 GiB.
// A Paper server has a 4 GiB limit and a 4.4 GiB memory.max.

type admissionCase struct {
	name  string
	hosts []fakeHost
	// limits is the new server. Nil means a Paper server.
	limits *api.Limits
	// pin places the request on one node.
	pin       string
	configure func(*Config)
	// admit is whether some node should take the server. node, when set, is
	// the node it should land on. overallocated is the expected flag on an
	// admitted result.
	admit         bool
	node          string
	overallocated bool
}

func TestAdmission(t *testing.T) {
	cases := []admissionCase{
		// Memory ledger.
		{
			name: "every node full of servers using most of their limits",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: paperN(7, 0.85, learned)},
				{id: "b", ramGiB: 32, threads: 8, servers: paperN(7, 0.85, learned)},
				{id: "c", ramGiB: 32, threads: 8, servers: paperN(7, 0.85, learned)},
			},
		},
		{
			name: "every node full of servers still booting",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: bootingN(7)},
				{id: "b", ramGiB: 32, threads: 8, servers: bootingN(7)},
			},
		},
		{
			name: "full node where no heartbeat has seen the servers yet",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: paperN(7, 0, 0)},
			},
		},
		// Host reserve.
		{
			name:   "server larger than schedulable RAM",
			hosts:  []fakeHost{{id: "a", ramGiB: 16, threads: 8}},
			limits: &api.Limits{MemoryLimit: 15 * 1024},
		},
		{
			name: "server only fits by using the host reserve",
			hosts: []fakeHost{
				{id: "a", ramGiB: 16, threads: 8, servers: paperN(3, 0.3, young)},
			},
		},
		{
			name: "host using far more than its reserve",
			hosts: []fakeHost{
				{id: "a", ramGiB: 16, threads: 8, osGiB: 6, servers: paperN(2, 0.9, learned)},
			},
		},
		{
			name:  "host nearly out of memory with no servers",
			hosts: []fakeHost{{id: "a", ramGiB: 16, threads: 8, osGiB: 14.8}},
		},
		// Spike headroom.
		{
			name: "new server fits in MemAvailable but leaves residents' headroom unbacked",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, osGiB: 20, servers: paperN(4, 0.3, learned)},
			},
		},
		{
			name: "sustained heavy swap-out",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, osGiB: 10, swapOut: 5000, servers: paperN(2, 0.5, learned)},
			},
		},
		// CPU.
		{
			name: "CPU pressure on every node",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: []fakeServer{
					{limitMB: 4096, used: 0.4, cores: 1.84, observed: learned},
					{limitMB: 4096, used: 0.4, cores: 1.84, observed: learned},
					{limitMB: 4096, used: 0.4, cores: 1.84, observed: learned},
					{limitMB: 4096, used: 0.4, cores: 1.84, observed: learned},
				}},
			},
		},
		// Node state.
		{
			name: "the only nodes with room are offline, drained, or stale",
			hosts: []fakeHost{
				{id: "full", ramGiB: 32, threads: 8, servers: paperN(7, 0.85, learned)},
				{id: "offline", ramGiB: 32, threads: 8, offline: true},
				{id: "drained", ramGiB: 32, threads: 8, drained: true},
				{id: "stale", ramGiB: 32, threads: 8, staleFor: 2 * time.Minute},
			},
		},

		// Cases that must still admit, so the fix cannot pass by refusing everything.
		{
			name:  "empty node",
			hosts: []fakeHost{{id: "a", ramGiB: 32, threads: 8}},
			admit: true,
		},
		{
			name:  "node a third full",
			hosts: []fakeHost{{id: "a", ramGiB: 32, threads: 8, servers: paperN(3, 0.3, young)}},
			admit: true,
		},
		{
			name: "full by limits but barely used for two days",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: paperN(7, 0.15, learned)},
			},
			admit: true,
		},
		{
			name: "busy servers on a node with real room",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: paperN(4, 0.98, learned)},
			},
			admit: true,
		},
		{
			name: "the one node with room among full ones",
			hosts: []fakeHost{
				{id: "a", ramGiB: 32, threads: 8, servers: paperN(7, 0.85, learned)},
				{id: "b", ramGiB: 32, threads: 8, servers: paperN(7, 0.85, learned)},
				{id: "c", ramGiB: 32, threads: 8, servers: paperN(2, 0.3, young)},
			},
			admit: true,
			node:  "c",
		},
	}

	runAdmission(t, cases)
}

func runAdmission(t *testing.T, cases []admissionCase) {
	t.Helper()
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			cfg := DefaultConfig()
			if tc.configure != nil {
				tc.configure(&cfg)
			}
			now := time.Now()
			limits := paperLimits()
			if tc.limits != nil {
				limits = *tc.limits
			}
			snap := Snapshot{Now: now, Config: cfg}
			for _, h := range tc.hosts {
				snap.Nodes = append(snap.Nodes, h.node(cfg, now))
			}
			req := Derive(limits, cfg)
			req.NodeID = tc.pin
			result := Select(snap, req)
			wantRejections := len(tc.hosts)
			if tc.pin != "" {
				wantRejections = 1
			}
			switch {
			case tc.admit && !result.OK():
				t.Fatalf("refused: %s\n%s", rejections(result), describe(snap))
			case !tc.admit && result.OK():
				t.Fatalf("admitted on %s\n%s", result.NodeID, describe(snap))
			case tc.node != "" && result.NodeID != tc.node:
				t.Fatalf("admitted on %s, want %s\n%s", result.NodeID, tc.node, describe(snap))
			case tc.admit && result.Overallocated != tc.overallocated:
				t.Fatalf("overallocated %v, want %v\n%s", result.Overallocated, tc.overallocated, describe(snap))
			case !tc.admit && len(result.Rejections) != wantRejections:
				t.Fatalf("%d rejections for %d nodes: %s", len(result.Rejections), wantRejections, rejections(result))
			}
			if !tc.admit {
				t.Log(rejections(result))
			}
		})
	}
}

func rejections(result Result) string {
	var parts []string
	for _, r := range result.Rejections {
		parts = append(parts, r.NodeID+"="+r.Reason)
	}
	return strings.Join(parts, ", ")
}

// describe is the state a failing case was judged on.
func describe(snap Snapshot) string {
	var b strings.Builder
	for _, n := range snap.Nodes {
		var limit, max int64
		for _, r := range n.Servers {
			limit += r.Limits.MemoryLimit
			max += r.Limits.MemoryMax
		}
		budget, _, _ := n.budgets(Normalize(snap.Config))
		fmt.Fprintf(&b, "  %s: %d servers, limits %.1f GiB, memory.max %.1f GiB, schedulable %.1f GiB, available %.1f GiB, cpu busy %.0f%%\n",
			n.ID, len(n.Servers), float64(limit)/1024, float64(max)/1024, float64(budget)/(1<<30),
			float64(n.Metrics.Memory.AvailableBytes)/(1<<30), n.Metrics.CPUBusyAvg60)
	}
	return b.String()
}
