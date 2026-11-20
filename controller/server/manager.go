package server

import (
	"context"
	"net/http"
	"runtime"
	"sync"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/gammazero/workerpool"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/controller/scheduler"
	"protoxon.com/sls/controller/server/repository"
	snaps "protoxon.com/sls/controller/snapshot"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/controller/system"
	"protoxon.com/sls/controller/system/id"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/events"
)

// unknownStatusGrace is how long a clean node disconnect keeps the last
// reported server status before marking those servers unknown.
const unknownStatusGrace = 10 * time.Second

type pendingUnknown struct {
	gen    uint64
	cancel context.CancelFunc
}

type Manager struct {
	mutex   sync.RWMutex
	servers map[string]*Server // key = server ID

	// Global event emitter that all servers will emit events to
	emitter     *events.Bus
	emitterLock sync.Mutex
	sinks       map[system.SinkName]*system.SinkPool
	nodes       *node.Manager

	// pendingUnknown tracks a clean disconnect that has not yet marked servers unknown.
	// pendingMu is acquired before m.mutex.
	pendingMu      sync.Mutex
	pendingUnknown map[string]pendingUnknown
	unknownSeq     uint64
	// unknownGrace overrides unknownStatusGrace in tests.
	unknownGrace time.Duration
	// ensureDelay paces ensureCreated attempts.
	ensureDelay retryDelay

	// ctx ends when the manager is closed and stops its background work.
	ctx   context.Context
	close context.CancelFunc
}

// NewEmptyManager returns a manager that does not load servers from the database.
func NewEmptyManager() *Manager {
	ctx, cancel := context.WithCancel(context.Background())
	return &Manager{
		servers:        make(map[string]*Server),
		emitter:        events.NewBus(),
		pendingUnknown: make(map[string]pendingUnknown),
		ensureDelay:    defaultEnsureDelay,
		ctx:            ctx,
		close:          cancel,
	}
}

// NewManager returns a new server manager instance.
func NewManager(nm *node.Manager) (*Manager, error) {
	m := NewEmptyManager()
	m.nodes = nm
	if err := m.init(nm); err != nil {
		m.Close()
		return nil, err
	}
	m.startUsageFlush()
	return m, nil
}

// Close stops the manager's background work, such as finishing creates
// whose outcome was unknown.
func (m *Manager) Close() {
	m.close()
}

// Add a server to the collection
func (m *Manager) Add(server *Server) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	m.servers[server.id] = server
}

// All returns a snapshot of all servers
func (m *Manager) All() []*Server {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	servers := make([]*Server, len(m.servers))
	i := 0
	for _, s := range m.servers {
		servers[i] = s
		i++
	}
	return servers
}

// Remove removes a server from the collection by its ID.
func (m *Manager) Remove(id string) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	delete(m.servers, id)
}

// Find returns a single element from the collection matching the filter. If
// nothing is found, a nil result is returned.
func (m *Manager) Find(filter func(match *Server) bool) *Server {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	for _, server := range m.servers {
		if filter(server) {
			return server
		}
	}
	return nil
}

// GetServer returns the Server instance with the given id.
func (m *Manager) GetServer(id string) *Server {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	return m.servers[id]
}

// ServersByNode returns all servers that belong to the specified node ID.
func (m *Manager) ServersByNode(nodeId string) []*Server {
	m.mutex.RLock()
	defer m.mutex.RUnlock()

	result := make([]*Server, 0)
	for _, server := range m.servers {
		if server.nodeId == nodeId {
			result = append(result, server)
		}
	}
	return result
}

// InstallAllocator publishes alloc as the node's port pool and claims every
// server already placed on that node before placement can see the new pool.
func (m *Manager) InstallAllocator(n *node.Node, alloc *allocator.Allocator) {
	if n == nil || alloc == nil {
		return
	}
	if m == nil {
		n.Allocator = alloc
		return
	}
	m.mutex.Lock()
	defer m.mutex.Unlock()
	n.Allocator = alloc
	for _, server := range m.servers {
		if server == nil || server.nodeId != n.Id() {
			continue
		}
		held := server.allocations()
		if held == nil || held.DefaultMapping.Port == 0 {
			continue
		}
		alloc.Claim(held.DefaultMapping.Ip, held.DefaultMapping.Port)
		server.bindAllocationRelease(alloc.Release)
	}
}

// AttachNodeClientToServers attaches a node client to all servers that belong to the specified node.
// This is called when a node connects to ensure all servers for that node have their
// node client properly set. A pending clean-disconnect status change is cancelled
// so the daemon's state report is kept.
func (m *Manager) AttachNodeClientToServers(nodeId string, node *node.Node) {
	m.pendingMu.Lock()
	defer m.pendingMu.Unlock()
	m.cancelPendingUnknownLocked(nodeId)

	servers := m.ServersByNode(nodeId)
	for _, server := range servers {
		server.sc.SetNodeClient(node.Client())
		// Update the servers node name in case it changed
		server.nodeName = node.Name()
		if a := server.allocations(); a != nil {
			// Also claim the servers allocation in the allocator
			node.Allocator.Claim(a.DefaultMapping.Ip, a.DefaultMapping.Port)
			server.bindAllocationRelease(node.Allocator.Release)
		}
		m.freezeServer(server, node)
	}
}

// DetachNodeClientFromServers clears the node client on all servers that belong to the
// specified node and marks them unknown immediately. Heartbeat timeouts use this.
// The node has already been silent, so the last status is no longer trustworthy.
// Server operations then fail fast with ErrNodeUnavailable.
func (m *Manager) DetachNodeClientFromServers(nodeId string) {
	m.pendingMu.Lock()
	defer m.pendingMu.Unlock()
	m.detachNodeClients(nodeId)
	m.cancelPendingUnknownLocked(nodeId)
	m.markDetachedUnknownLocked(nodeId)
}

// DeferUnknownStatus clears the node client immediately but keeps the last
// reported status for a short grace period. A clean disconnect is usually a
// daemon restart, and the game processes keep running. If the node registers
// again before the grace ends, the status is left for the daemon to report.
func (m *Manager) DeferUnknownStatus(nodeId string) {
	m.pendingMu.Lock()
	defer m.pendingMu.Unlock()
	m.detachNodeClients(nodeId)
	m.scheduleUnknownLocked(nodeId, m.unknownDelay())
}

func (m *Manager) unknownDelay() time.Duration {
	if m.unknownGrace > 0 {
		return m.unknownGrace
	}
	return unknownStatusGrace
}

func (m *Manager) detachNodeClients(nodeId string) {
	for _, server := range m.ServersByNode(nodeId) {
		server.sc.SetNodeClient(nil)
		server.releaseAlloc = nil
	}
}

func (m *Manager) scheduleUnknownLocked(nodeId string, after time.Duration) {
	m.cancelPendingUnknownLocked(nodeId)
	m.unknownSeq++
	gen := m.unknownSeq
	ctx, cancel := context.WithCancel(context.Background())
	m.pendingUnknown[nodeId] = pendingUnknown{gen: gen, cancel: cancel}

	go func() {
		timer := time.NewTimer(after)
		defer timer.Stop()
		select {
		case <-ctx.Done():
			return
		case <-timer.C:
		}
		m.finishUnknown(nodeId, gen)
	}()
}

func (m *Manager) finishUnknown(nodeId string, gen uint64) {
	m.pendingMu.Lock()
	defer m.pendingMu.Unlock()
	cur, ok := m.pendingUnknown[nodeId]
	if !ok || cur.gen != gen {
		return
	}
	delete(m.pendingUnknown, nodeId)
	if m.markDetachedUnknownLocked(nodeId) > 0 {
		log.WithField("node", nodeId).Info("Node still disconnected. Marking servers unknown.")
	}
}

func (m *Manager) cancelPendingUnknownLocked(nodeId string) {
	prev, ok := m.pendingUnknown[nodeId]
	if !ok {
		return
	}
	prev.cancel()
	delete(m.pendingUnknown, nodeId)
}

// markDetachedUnknownLocked sets unknown on servers whose node client is still cleared.
func (m *Manager) markDetachedUnknownLocked(nodeId string) int {
	marked := 0
	for _, server := range m.ServersByNode(nodeId) {
		if !serverNodeDetached(server) {
			continue
		}
		server.SetStatus(ProcessUnknownState)
		marked++
	}
	return marked
}

func serverNodeDetached(server *Server) bool {
	if server == nil || server.sc == nil {
		return true
	}
	_, err := server.Client().Node()
	return err != nil
}

// CreateServer places a server, stores it, and asks the daemon to create it.
func (m *Manager) CreateServer(ctx context.Context, bp *blueprint.Blueprint, swr *software.Registry, nodeID string, overrides *models.ServerOverrides, snapshotIDs []string) (*Server, error) {
	serverID := id.New()
	ids, err := resolveSnapshotRefs(snapshotIDs)
	if err != nil {
		return nil, err
	}
	rows, err := snaps.Expand(ids)
	if err != nil {
		return nil, &PlaceError{Status: http.StatusConflict, Code: err.Error(), Hint: "The snapshot could not be restored."}
	}
	needs := make([]scheduler.SnapshotDisk, 0, len(rows))
	for _, row := range rows {
		needs = append(needs, scheduler.SnapshotDisk{ID: row.ID, Bytes: row.Size})
	}
	s, n, stamp, err := m.admit(ctx, bp, nodeID, overrides, serverID, needs)
	if err != nil {
		return nil, err
	}

	created := false
	defer func() {
		if !created {
			s.discard()
		}
	}()

	alloc := s.allocations()
	if alloc == nil {
		return nil, errors.New("server is missing its port allocation")
	}
	cfg, installScript, err := BuildServerConfiguration(s, bp, swr, *alloc)
	if err != nil {
		return nil, err
	}
	cfg.Limits = applyStamp(cfg.Limits, stamp)
	pinned, err := snaps.PinVolumes(cfg.State.Volumes, rows)
	if err != nil {
		return nil, &PlaceError{Status: http.StatusConflict, Code: err.Error(), Hint: "The snapshot volumes do not match this blueprint."}
	}
	cfg.State.Volumes = pinned
	if len(rows) > 0 {
		cfg.Snapshots = make([]api.SnapshotMount, 0, len(rows))
		for _, row := range rows {
			cfg.Snapshots = append(cfg.Snapshots, api.SnapshotMount{
				ID:        row.ID,
				Digest:    row.Digest,
				Reference: row.Reference,
			})
		}
	}
	s.setConfiguration(cfg)
	s.InstallScript = installScript
	s.bindAllocationRelease(n.Allocator.Release)

	if err := repository.StoreServer(&models.ServerRecord{
		Id:            serverID,
		NodeName:      n.Name(),
		NodeId:        n.Id(),
		BlueprintId:   bp.Meta.ID,
		Overrides:     overrides,
		Configuration: cfg,
		InstallScript: installScript,
	}); err != nil {
		return nil, err
	}

	_, err = n.CreateServer(ctx, *cfg)
	if err != nil {
		// A dial failure never reached the node, so the record is safe to drop.
		// Anything else without an HTTP response may have been handled, and the
		// record stays unless a status check shows the node does not have it.
		// When the check also fails the create is accepted and finished in the
		// background.
		if !rpcAmbiguous(err) || client.NotDelivered(err) {
			return nil, err
		}
		present, lookErr := m.reconcileCreate(m.ctx, n, serverID)
		if lookErr != nil {
			created = true
			go m.ensureCreated(m.ctx, s, *cfg)
			return s, nil
		}
		if !present {
			return nil, err
		}
	}

	created = true
	return s, nil
}

// Loads in all servers stored in the database
func (m *Manager) init(nm *node.Manager) error {
	servers, err := repository.GetAllServers()
	if err != nil {
		return errors.WrapIf(err, "failed to load servers from database")
	}

	start := time.Now()
	log.WithField("total_configs", len(servers)).Info("processing servers configurations from the database")

	pool := workerpool.New(runtime.NumCPU())
	log.Debugf("using %d workerpools to instantiate server instances", runtime.NumCPU())
	for _, data := range servers {
		data := data
		n, _ := nm.Get(data.NodeId)
		pool.Submit(func() {
			s, err := m.InitServer(data, n)
			if err != nil {
				log.WithField("server", data.Id).WithField("node_id", data.NodeId).WithField("error", err).Error("failed to load server, skipping...")
				return
			}
			m.Add(s)
		})
	}

	// Wait until we've processed all the server configurations in the database
	// before continuing.
	pool.StopWait()

	for _, s := range m.All() {
		var attached *node.Node
		if nm != nil {
			attached, _ = nm.Get(s.NodeId())
		}
		m.freezeServer(s, attached)
	}

	diff := time.Since(start)
	log.WithField("duration", diff.String()).Info("finished processing server configurations")

	return nil
}

func (m *Manager) InitServer(s *models.ServerRecord, n *node.Node) (*Server, error) {
	if err := s.Validate(); err != nil {
		return nil, errors.Wrap(err, "invalid server record")
	}

	// Create the server client.
	// The node client is likely nil at startup because servers are loaded
	// during program boot, before any nodes have connected. The node client will
	// be attached later when a node becomes available.
	serverClient := client.NewServerClient(s.Id, s.NodeId)
	if n != nil {
		// Set the node client if the node has already connected
		serverClient.SetNodeClient(n.Client())
		// Update the servers node name in case it changed
		s.NodeName = n.Name()
	}

	// Instantiate the server
	server := &Server{
		id:            s.Id,
		nodeName:      s.NodeName,
		nodeId:        s.NodeId,
		blueprintId:   s.BlueprintId,
		Overrides:     s.Overrides,
		Configuration: s.Configuration,
		InstallScript: s.InstallScript,
		sc:            serverClient,
		GlobalEvents:  m.Events,
		Remove: func() {
			m.Remove(s.Id)
		},
	}
	if s.Usage != nil {
		server.setUsage(*s.Usage)
	}

	if n != nil {
		if a := server.allocations(); a != nil {
			// claim the servers allocation
			n.Allocator.Claim(a.DefaultMapping.Ip, a.DefaultMapping.Port)
			server.bindAllocationRelease(n.Allocator.Release)
		}
	}

	return server, nil
}
