package scheduler

import (
	"math"
	"strings"
	"time"
)

// Select picks a node from a snapshot. It does not lock or perform I/O.
// A pinned request is scored only against that node and may land on an overflow
// node. An unpinned request uses overflow nodes only when every standard node
// was filtered out.
func Select(snapshot Snapshot, request Request) Result {
	cfg := Normalize(snapshot.Config)
	snapshot.Config = cfg
	if snapshot.Now.IsZero() {
		snapshot.Now = timeNow()
	}

	var rejected []Rejection
	var standard []scored
	var overflow []scored
	pinned := strings.TrimSpace(request.NodeID)
	seenPin := false

	for _, node := range snapshot.Nodes {
		if pinned != "" && node.ID != pinned {
			continue
		}
		if pinned != "" && node.ID == pinned {
			seenPin = true
		}
		stamp, reason := Fits(node, request, cfg, snapshot.Now)
		if reason != "" {
			rejected = append(rejected, Rejection{NodeID: node.ID, Reason: reason})
			continue
		}
		item := scored{node: node, stamp: stamp, score: scoreNode(node, request, cfg)}
		if pinned != "" || !isOverflow(node) {
			standard = append(standard, item)
			continue
		}
		overflow = append(overflow, item)
	}
	if pinned != "" && !seenPin {
		return Result{Rejections: []Rejection{{NodeID: pinned, Reason: ReasonNotConnected}}}
	}

	pool := standard
	if pinned == "" && len(pool) == 0 {
		pool = overflow
	}
	overallocated := false
	if len(pool) == 0 && cfg.Overallocate {
		pool = overallocatedNodes(snapshot, request, cfg, pinned)
		overallocated = len(pool) > 0
	}
	if len(pool) == 0 {
		return Result{Rejections: rejected}
	}
	best := pick(pool)
	return Result{NodeID: best.node.ID, Stamp: best.stamp, Overallocated: overallocated}
}

// ioScoreBand is how close two scores must be before IO full avg60 may
// choose between them. The least-allocated score runs from about 0 to 18
// and a cached multi-gigabyte snapshot adds several points, so a quarter
// point only moves nodes that already scored as the same choice.
const ioScoreBand = 0.25

// pick takes the highest score, then the lowest sustained IO stall among
// nodes inside ioScoreBand of that score. Node ID breaks a remaining tie.
// Disk PSI is a near-tie only. A download can hold IO full up without
// meaning the node should be refused or passed over for a fuller one.
func pick(pool []scored) scored {
	bestScore := math.Inf(-1)
	for _, item := range pool {
		if item.score > bestScore {
			bestScore = item.score
		}
	}
	floor := bestScore - ioScoreBand
	best := pool[0]
	chosen := false
	for _, item := range pool {
		if item.score < floor {
			continue
		}
		if !chosen || lowerIO(item, best) {
			best = item
			chosen = true
		}
	}
	return best
}

func lowerIO(a, b scored) bool {
	ai := a.node.Metrics.Disk.Pressure.FullAvg60
	bi := b.node.Metrics.Disk.Pressure.FullAvg60
	if ai != bi {
		return ai < bi
	}
	return a.node.ID < b.node.ID
}

// overallocatedNodes returns nodes whose only miss is a resource ledger.
// The score prefers the least-overcommitted reservation, including nodes that
// are already past their budget.
func overallocatedNodes(snapshot Snapshot, request Request, cfg Config, pinned string) []scored {
	var pool []scored
	for _, node := range snapshot.Nodes {
		if pinned != "" && node.ID != pinned {
			continue
		}
		stamp, reason := Fits(node, request, cfg, snapshot.Now)
		if !CapacityReason(reason) {
			continue
		}
		pool = append(pool, scored{node: node, stamp: stamp, score: slackScore(node, request, cfg)})
	}
	return pool
}

func slackScore(node Node, request Request, cfg Config) float64 {
	used, memBudget := scoredMemory(node, request, cfg)
	if memBudget <= 0 {
		return math.Inf(-1)
	}
	return 1 - float64(used)/float64(memBudget)
}

func timeNow() time.Time {
	return time.Now()
}

type scored struct {
	node  Node
	stamp Stamp
	score float64
}

func isOverflow(node Node) bool {
	return strings.EqualFold(strings.TrimSpace(node.Capacity.Role), apiRoleOverflow)
}

const apiRoleOverflow = "overflow"

func scoreNode(node Node, request Request, cfg Config) float64 {
	memUsed, memBudget := scoredMemory(node, request, cfg)
	_, cpuBudget, _ := node.budgets(cfg)
	used := sumAccounts(node, cfg)
	freeRAM := freeFraction(memUsed, memBudget)
	freeCPU := freeFraction(used.cpu+request.CPURequest, cpuBudget)
	var score float64
	if cfg.Algorithm == AlgorithmLeastAllocated {
		if node.Metrics.CPUBusyOK {
			freeBusy := 1 - node.Metrics.CPUBusyAvg60/100
			if freeBusy < 0 {
				freeBusy = 0
			}
			if freeBusy > 1 {
				freeBusy = 1
			}
			freeCPU = (freeCPU + freeBusy) / 2
		}
		score = math.Pow(10, freeCPU) + math.Pow(10, freeRAM) - 2
	} else {
		score = 20 - (math.Pow(10, freeCPU) + math.Pow(10, freeRAM))
	}
	score += snapshotLocality(node, request)
	return score
}

// snapshotLocalityCap is the most cached snapshots can add to a node score.
// The least-allocated score runs from about 0 to 18. Ten points keeps a
// multi-gigabyte snapshot on a node that still has room and loses once that
// node is low on both CPU and memory.
const snapshotLocalityCap = 10

// snapshotLocality is the score added for snapshots this node already has.
// Transfer cost follows a logistic curve of their combined size. Under about
// 100 MB the boost is a tie-break, a few gigabytes prefer the node that
// already has them, and the curve flattens around 10 GB.
func snapshotLocality(node Node, request Request) float64 {
	cached := cachedSnapshotBytes(node, request)
	if cached <= 0 {
		return 0
	}
	const (
		midGiB = 2
		k      = 1
	)
	s0 := logistic(0, midGiB, k)
	sx := logistic(float64(cached)/(1<<30), midGiB, k)
	return snapshotLocalityCap * (sx - s0) / (1 - s0)
}

func logistic(x, mid, k float64) float64 {
	return 1 / (1 + math.Exp(-k*(x-mid)))
}

func cachedSnapshotBytes(node Node, request Request) int64 {
	var n int64
	for _, snap := range request.Snapshots {
		if snap.Bytes <= 0 {
			continue
		}
		if _, ok := node.Snapshots[snap.ID]; ok {
			n += snap.Bytes
		}
	}
	return n
}

func missingSnapshotBytes(node Node, request Request) int64 {
	var n int64
	for _, snap := range request.Snapshots {
		if _, ok := node.Snapshots[snap.ID]; ok {
			continue
		}
		if snap.Bytes > 0 {
			n += snap.Bytes
		}
	}
	return n
}

func freeFraction(used, budget int64) float64 {
	if budget <= 0 {
		return 0
	}
	free := 1 - float64(used)/float64(budget)
	if free < 0 {
		return 0
	}
	if free > 1 {
		return 1
	}
	return free
}
