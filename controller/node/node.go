package node

import (
	"context"
	"sync"
	"time"

	"emperror.dev/errors"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/internal/api"
)

type Node struct {
	id           string
	name         string
	location     string
	url          string
	socket       string
	drained      bool
	consoleProxy bool
	capacity     api.NodeCapacity
	metrics      api.NodeMetrics
	metricsAt    time.Time
	sampledAt    time.Time
	memoryHigh   bool
	swapOut      []swapOutSample
	snapshots    map[string]struct{}
	snapshotHash string
	Allocator    *allocator.Allocator
	mutex        sync.RWMutex
	nc           client.NodeClient
	*Health
}

// New builds a connected node. Registration is the normal path; tests use this
// to avoid the database.
func New(id, name, location, url, token string, consoleProxy bool) *Node {
	return &Node{
		id:           id,
		name:         name,
		location:     location,
		url:          url,
		consoleProxy: consoleProxy,
		nc:           client.New().Node(id, url, token),
		Health: &Health{
			LastSeen: time.Now(),
			Online:   true,
		},
	}
}

// Returns the underlying node client
func (n *Node) Client() client.NodeClient {
	return n.nc
}

// SetClient replaces the client used to call this node.
func (n *Node) SetClient(c client.NodeClient) {
	n.nc = c
}

// Drained reports whether placement should skip this node.
func (n *Node) Drained() bool {
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	return n.drained
}

// Sets the drained state of the node
func (n *Node) SetDrained(drained bool) error {
	// store the drained state to the database
	if err := n.storeDrainedState(drained); err != nil {
		return err
	}
	// Update the in memory state
	// If the database succeeded
	n.mutex.Lock()
	n.drained = drained
	n.mutex.Unlock()
	return nil
}

func (n *Node) Url() string {
	return n.url
}

// Socket is the Unix socket Controller dials for this node. Empty means TCP.
func (n *Node) Socket() string {
	return n.socket
}

// ConsoleProxy reports whether clients should open this node's console through Controller.
func (n *Node) ConsoleProxy() bool {
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	return n.consoleProxy
}

// SetConsoleProxy records the mode from the latest registration.
func (n *Node) SetConsoleProxy(enabled bool) {
	n.mutex.Lock()
	n.consoleProxy = enabled
	n.mutex.Unlock()
}

func (n *Node) Name() string {
	return n.name
}

func (n *Node) Location() string {
	return n.location
}

func (n *Node) Id() string {
	return n.id
}

// SetCapacity stores the static host description from registration.
func (n *Node) SetCapacity(capacity api.NodeCapacity) {
	n.mutex.Lock()
	n.capacity = capacity
	n.mutex.Unlock()
}

// Capacity returns the last registration capacity.
func (n *Node) Capacity() api.NodeCapacity {
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	return n.capacity
}

// SetMetrics stores a heartbeat sample, when the controller received it, and
// whether memory.high or oom counters climbed since the previous sample.
func (n *Node) SetMetrics(metrics api.NodeMetrics) {
	n.mutex.Lock()
	received := time.Now()
	n.memoryHigh = api.MemoryEventsClimbed(n.metrics.Servers, metrics.Servers)
	n.recordSwapOut(received, metrics.Memory.SwapOutPerSec)
	n.metrics = metrics
	n.metricsAt = received
	n.sampledAt = sampleTime(metrics.Timestamp, received)
	n.mutex.Unlock()
}

// Metrics returns the latest sample, when the controller received it, and when
// the daemon took it. The sample time is never later than receipt.
func (n *Node) Metrics() (api.NodeMetrics, time.Time, time.Time) {
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	return n.metrics, n.metricsAt, n.sampledAt
}

// MemoryHigh reports that a server on this node crossed memory.high or recorded
// an oom event since the previous heartbeat.
func (n *Node) MemoryHigh() bool {
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	return n.memoryHigh
}

const (
	swapOutHistoryLimit = 8
	swapOutHistoryGap   = 30 * time.Second
)

// swapOutSample is one heartbeat's swap-out rate.
type swapOutSample struct {
	at   time.Time
	rate float64
}

// recordSwapOut appends a heartbeat swap-out rate. A gap longer than 30
// seconds drops older samples so a stale hot rate cannot pair with a new one.
// The caller holds n.mutex.
func (n *Node) recordSwapOut(received time.Time, rate float64) {
	if len(n.swapOut) > 0 && received.Sub(n.swapOut[len(n.swapOut)-1].at) > swapOutHistoryGap {
		n.swapOut = nil
	}
	n.swapOut = append(n.swapOut, swapOutSample{at: received, rate: rate})
	if len(n.swapOut) > swapOutHistoryLimit {
		n.swapOut = append([]swapOutSample(nil), n.swapOut[len(n.swapOut)-swapOutHistoryLimit:]...)
	}
}

// SwapOutRates returns recent heartbeat swap-out rates, oldest first.
func (n *Node) SwapOutRates() []float64 {
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	out := make([]float64, len(n.swapOut))
	for i, sample := range n.swapOut {
		out[i] = sample.rate
	}
	return out
}

func sampleTime(unixSeconds int64, received time.Time) time.Time {
	if unixSeconds <= 0 {
		return received
	}
	stamped := time.Unix(unixSeconds, 0)
	if stamped.After(received) {
		return received
	}
	return stamped
}

// CreateServer sends a request to create a new server on the remote node
// and returns its data upon success.
// This only sends the request; it does not configure the server locally.
// Typically, servers should be created through the server manager.
func (n *Node) CreateServer(ctx context.Context, request models.ServerConfiguration) (models.CreateServerResponse, error) {
	return n.nc.CreateServer(ctx, request)
}

func (n *Node) GetSystemInformation(ctx context.Context) (models.Information, error) {
	return n.nc.GetSystemInformation(ctx)
}

// Server returns a server-specific client bound to this node.
func (n *Node) Server(id string) client.ServerClient {
	return n.nc.Server(id)
}

// Persists the node's drained state to the database.
// When drained is true, a record is upserted.
// When drained is false, any existing record is removed.
func (n *Node) storeDrainedState(drained bool) error {
	db := database.Instance()

	if drained {
		// Insert if not exists, update if it does
		return db.
			Clauses(clause.OnConflict{
				Columns: []clause.Column{{Name: "id"}},
				DoUpdates: clause.Assignments(map[string]interface{}{
					"drained": true,
				}),
			}).
			Create(&models.NodeState{
				Id:      n.id,
				Drained: true,
			}).Error
	}

	// Undrained remove row entirely
	return db.Delete(&models.NodeState{}, "id = ?", n.id).Error
}

// Loads the persisted drained state for this node, if present.
// Absence of a record implies the node is not drained.
// Called when a node connects to restore drained state across restarts.
func (n *Node) loadDrainedState() error {
	var state models.NodeState
	err := database.Instance().First(&state, "id = ?", n.id).Error
	if err == nil {
		n.drained = state.Drained
		return nil
	}
	if errors.Is(err, gorm.ErrRecordNotFound) {
		n.drained = false
		return nil
	}
	return err
}
