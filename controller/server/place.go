package server

import (
	"context"
	"net/http"
	"strings"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/scheduler"
	"protoxon.com/sls/controller/server/repository"
	"protoxon.com/sls/internal/api"
)

const placeAttempts = 3

// PlaceError is a placement failure the HTTP layer maps to a status code.
type PlaceError struct {
	Status int
	Code   string
	Detail string
	Hint   string
}

func (e *PlaceError) Error() string {
	if e == nil {
		return ""
	}
	if e.Detail == "" {
		return e.Code
	}
	return e.Code + ": " + e.Detail
}

func schedulerConfig() scheduler.Config {
	cfg := config.Get()
	if cfg == nil {
		return scheduler.DefaultConfig()
	}
	src := cfg.Scheduler
	return scheduler.Normalize(scheduler.Config{
		Algorithm:             src.Algorithm,
		MemoryRequestRatio:    src.MemoryRequestRatio,
		CPURequestRatio:       src.CPURequestRatio,
		DefaultCPURequest:     src.DefaultCPURequest,
		CPUOvercommitMax:      src.CPUOvercommitMax,
		MemoryOvercommitMax:   src.MemoryOvercommitMax,
		MemoryCushionBytes:    src.MemoryCushionBytes,
		MemoryBurstPercent:    src.MemoryBurstPercent,
		MemoryBurstBytes:      src.MemoryBurstBytes,
		MemoryBurstMax:        src.MemoryBurstMax,
		MemoryLearning:        learning(src.MemoryLearning),
		MemoryReservePercent:  src.HostReserve.MemoryPercent,
		MemoryReserveBytes:    src.HostReserve.MemoryBytes,
		CPUReservePercent:     src.HostReserve.CPUPercent,
		DiskReservePercent:    src.HostReserve.DiskPercent,
		DiskReserveBytes:      src.HostReserve.DiskBytes,
		DiskReserveMax:        src.HostReserve.DiskBytesMax,
		MaxMetricAge:          duration(src.MaxMetricAge),
		MemoryFullAvg10:       src.Pressure.MemoryFullAvg10,
		MemorySomeAvg10:       src.Pressure.MemorySomeAvg10,
		CPUSomeAvg60:          src.Pressure.CPUSomeAvg60,
		MaxSwapPagesPerSec:    src.Swap.MaxPagesPerSec,
		SwapSustainedSamples:  src.Swap.SustainedSamples,
		RejectOnSwapOccupancy: src.Swap.RejectOnOccupancy,
		Overallocate:          src.Overallocate,
		DiskQuotaCheck:        src.DiskQuotaCheck,
	})
}

// learning converts the configured learning curve. A point with an invalid
// time is dropped by Normalize.
func learning(points []config.SchedulerLearnPoint) []scheduler.LearnPoint {
	out := make([]scheduler.LearnPoint, 0, len(points))
	for _, p := range points {
		out = append(out, scheduler.LearnPoint{After: duration(p.After), Learned: p.Learned})
	}
	return out
}

// duration parses a config duration. An invalid value is zero, which
// Normalize replaces with the default.
func duration(s string) time.Duration {
	d, err := time.ParseDuration(s)
	if err != nil {
		return 0
	}
	return d
}

func requestLimits(bp *blueprint.Blueprint, overrides *models.ServerOverrides) (api.Limits, error) {
	if bp == nil || bp.Server == nil {
		return api.Limits{}, errors.New("blueprint is missing a server")
	}
	limits := environment.CopyLimits(bp.Server.Limits)
	if overrides != nil {
		limits = environment.MergeLimits(limits, overrides.Limits)
	}
	resolved, err := environment.ResolveLimits(limits)
	if err != nil {
		return api.Limits{}, errors.Wrap(err, "failed to resolve server limits")
	}
	return resolved, nil
}

func (m *Manager) clusterSnapshot(cfg scheduler.Config) scheduler.Snapshot {
	var nodes []*node.Node
	if m.nodes != nil {
		nodes = m.nodes.GetNodes()
	}
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	snap := scheduler.Snapshot{Now: time.Now(), Config: cfg}
	for _, n := range nodes {
		snap.Nodes = append(snap.Nodes, m.nodeView(n))
	}
	return snap
}

func (m *Manager) nodeView(n *node.Node) scheduler.Node {
	if n == nil {
		return scheduler.Node{}
	}
	metrics, at, _ := n.Metrics()
	online := n.Health != nil && n.Online
	view := scheduler.Node{
		ID:           n.Id(),
		Online:       online,
		Drained:      n.Drained(),
		Capacity:     n.Capacity(),
		Metrics:      metrics,
		MetricsAt:    at,
		MemoryHigh:   n.MemoryHigh(),
		HasFreePort:  n.Allocator != nil && n.Allocator.HasFreePort(),
		SwapOutRates: n.SwapOutRates(),
		Snapshots:    n.SnapshotIDs(),
	}
	samples := make(map[string]api.ServerSample, len(metrics.Servers))
	for _, sample := range metrics.Servers {
		samples[sample.ID] = sample
	}
	for _, s := range m.servers {
		if s == nil || s.nodeId != n.Id() {
			continue
		}
		limits, ok := s.stampedLimits()
		if !ok {
			continue
		}
		peak, observed := s.learnedUsage()
		view.Servers = append(view.Servers, scheduler.Resident{
			ID:            s.Id(),
			Limits:        limits,
			MemoryCurrent: samples[s.Id()].MemoryCurrent,
			Peak:          peak,
			Observed:      observed,
		})
	}
	return view
}

// admit scores outside the manager lock, then rechecks, claims a port, and
// inserts the server under the lock. The returned server is already in the map.
func (m *Manager) admit(ctx context.Context, bp *blueprint.Blueprint, nodeID string, overrides *models.ServerOverrides, serverID string, snaps []scheduler.SnapshotDisk) (*Server, *node.Node, scheduler.Stamp, error) {
	cfg := schedulerConfig()
	resolved, err := requestLimits(bp, overrides)
	if err != nil {
		return nil, nil, scheduler.Stamp{}, err
	}
	req := scheduler.Derive(resolved, cfg)
	req.NodeID = strings.TrimSpace(nodeID)
	req.Snapshots = snaps

	var last scheduler.Result
	// One attempt per node, and at least placeAttempts. Callers all prefer the
	// same node, so a fixed three tries can stop while a later node still has a port.
	for attempt := 0; attempt < m.placeLimit(); attempt++ {
		if err := ctx.Err(); err != nil {
			return nil, nil, scheduler.Stamp{}, err
		}
		result := scheduler.Select(m.clusterSnapshot(cfg), req)
		last = result
		if !result.OK() {
			return nil, nil, scheduler.Stamp{}, placementError(req.NodeID != "", result)
		}

		m.mutex.Lock()
		var n *node.Node
		ok := false
		if m.nodes != nil {
			n, ok = m.nodes.Get(result.NodeID)
		}
		if !ok || n == nil {
			m.mutex.Unlock()
			if req.NodeID != "" {
				return nil, nil, scheduler.Stamp{}, &PlaceError{
					Status: http.StatusNotFound,
					Code:   "node not found: " + req.NodeID,
					Hint:   "The requested node was not found.",
				}
			}
			continue
		}
		stamp, reason := scheduler.Fits(m.nodeView(n), req, cfg, time.Now())
		if reason != "" && !(result.Overallocated && scheduler.CapacityReason(reason)) {
			m.mutex.Unlock()
			last = scheduler.Result{Rejections: []scheduler.Rejection{{NodeID: n.Id(), Reason: reason}}}
			if req.NodeID != "" {
				return nil, nil, scheduler.Stamp{}, &PlaceError{
					Status: http.StatusConflict,
					Code:   "node rejected: " + reason,
					Detail: n.Id() + "=" + reason,
					Hint:   "The requested node cannot run this server.",
				}
			}
			continue
		}
		alloc, allocErr := n.Allocator.NewAllocation()
		if allocErr != nil {
			m.mutex.Unlock()
			last = scheduler.Result{Rejections: []scheduler.Rejection{{NodeID: n.Id(), Reason: scheduler.ReasonNoPort}}}
			if req.NodeID != "" {
				return nil, nil, scheduler.Stamp{}, &PlaceError{
					Status: http.StatusConflict,
					Code:   "node rejected: " + scheduler.ReasonNoPort,
					Detail: allocErr.Error(),
					Hint:   "The requested node has no free port.",
				}
			}
			continue
		}
		s := m.insertedServer(serverID, n, bp, overrides, resolved, stamp, alloc)
		m.mutex.Unlock()
		return s, n, stamp, nil
	}
	if req.NodeID != "" {
		return nil, nil, scheduler.Stamp{}, placementError(true, last)
	}
	return nil, nil, scheduler.Stamp{}, placementError(false, last)
}

// placeLimit is how many times one placement rechecks the cluster.
func (m *Manager) placeLimit() int {
	limit := placeAttempts
	if m == nil || m.nodes == nil {
		return limit
	}
	if n := len(m.nodes.GetNodes()); n > limit {
		return n
	}
	return limit
}

func (m *Manager) insertedServer(serverID string, n *node.Node, bp *blueprint.Blueprint, overrides *models.ServerOverrides, resolved api.Limits, stamp scheduler.Stamp, alloc environment.Allocations) *Server {
	resolved.MemoryReservation = stamp.MemoryReservationMB
	resolved.MemoryMax = stamp.MemoryMaxMB
	resolved.CpuRequest = stamp.CPURequest
	s := &Server{
		id:          serverID,
		nodeName:    n.Name(),
		nodeId:      n.Id(),
		blueprintId: bp.Meta.ID,
		Overrides:   overrides,
		Configuration: &models.ServerConfiguration{
			Id:          serverID,
			Limits:      resolved,
			Allocations: alloc,
		},
		GlobalEvents: m.Events,
		Remove: func() {
			m.Remove(serverID)
		},
	}
	s.sc = n.Server(serverID)
	s.bindAllocationRelease(n.Allocator.Release)
	m.servers[serverID] = s
	return s
}

func placementError(pinned bool, result scheduler.Result) error {
	detail := rejectionDetail(result.Rejections)
	for _, item := range result.Rejections {
		if item.Reason == scheduler.ReasonNotConnected {
			return &PlaceError{
				Status: http.StatusNotFound,
				Code:   "node not found: " + item.NodeID,
				Detail: detail,
				Hint:   "The requested node was not found.",
			}
		}
	}
	if pinned {
		return &PlaceError{
			Status: http.StatusConflict,
			Code:   "node rejected",
			Detail: detail,
			Hint:   "The requested node cannot run this server.",
		}
	}
	if detail == "" {
		detail = "no nodes available"
	}
	return &PlaceError{
		Status: http.StatusServiceUnavailable,
		Code:   "no nodes available",
		Detail: detail,
		Hint:   "No nodes can run this server.",
	}
}

func rejectionDetail(items []scheduler.Rejection) string {
	parts := make([]string, 0, len(items))
	for _, item := range items {
		parts = append(parts, item.NodeID+"="+item.Reason)
	}
	return strings.Join(parts, ", ")
}

func applyStamp(limits api.Limits, stamp scheduler.Stamp) api.Limits {
	limits.MemoryReservation = stamp.MemoryReservationMB
	limits.MemoryMax = stamp.MemoryMaxMB
	limits.CpuRequest = stamp.CPURequest
	return limits
}

func rpcAmbiguous(err error) bool {
	return err != nil && client.AsRequestError(err) == nil
}

func (m *Manager) reconcileCreate(ctx context.Context, n *node.Node, id string) (bool, error) {
	if n == nil || n.Client() == nil {
		return false, errors.New("node client is missing")
	}
	ctx, cancel := context.WithTimeout(ctx, 5*time.Second)
	defer cancel()
	return n.Client().ServerPresent(ctx, id)
}

// retryDelay is a delay that doubles from start up to max.
type retryDelay struct {
	start, max time.Duration
}

// defaultEnsureDelay paces ensureCreated attempts.
var defaultEnsureDelay = retryDelay{start: 500 * time.Millisecond, max: 30 * time.Second}

// ensureCreated finishes a create whose outcome is unknown. It runs until the
// node has the server, the node rejects it, the server is deleted here, or ctx
// ends. A node that cannot be reached is retried indefinitely.
func (m *Manager) ensureCreated(ctx context.Context, s *Server, cfg models.ServerConfiguration) {
	delay := m.ensureDelay.start
	timer := time.NewTimer(delay)
	defer timer.Stop()
	for {
		select {
		case <-ctx.Done():
			return
		case <-timer.C:
		}
		delay = min(delay*2, m.ensureDelay.max)
		timer.Reset(delay)
		if m.GetServer(s.Id()) != s {
			return
		}
		var n *node.Node
		if m.nodes != nil {
			n, _ = m.nodes.Get(s.NodeId())
		}
		present, err := m.reconcileCreate(ctx, n, s.Id())
		if err != nil {
			continue
		}
		if present {
			return
		}
		_, err = n.CreateServer(ctx, cfg)
		if err == nil {
			return
		}
		if rpcAmbiguous(err) {
			continue
		}
		s.Log().WithError(err).Warn("node rejected a create with an unknown outcome, removing the server")
		s.CleanupForDestroy()
		return
	}
}

// freezeServer fills empty stamp fields. MemoryMax is written only when the
// node's overhead policy is known. Existing nonzero stamps stay put.
func (m *Manager) freezeServer(s *Server, n *node.Node) {
	if s == nil {
		return
	}
	policy := api.OverheadPolicy{Override: true}
	if n != nil {
		capacity := n.Capacity()
		if capacity.MemoryBytes > 0 || capacity.CPUThreads > 0 || capacity.Overhead.Override || len(capacity.Overhead.Steps) > 0 || capacity.Overhead.DefaultMultiplier > 0 {
			policy = capacity.Overhead
		}
	}
	s.cfgMu.Lock()
	if s.Configuration == nil {
		s.cfgMu.Unlock()
		return
	}
	next, changed := scheduler.Freeze(s.Configuration.Limits, policy, schedulerConfig())
	if !changed {
		s.cfgMu.Unlock()
		return
	}
	s.Configuration.Limits = next
	stored := *s.Configuration
	id := s.Id()
	s.cfgMu.Unlock()
	if !database.Ready() {
		return
	}
	if err := repository.UpdateConfiguration(id, &stored); err != nil {
		log.WithError(err).WithField("server", id).Error("failed to persist stamped limits")
	}
}
