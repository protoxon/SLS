package node

import (
	"context"
	"strings"
	"sync"
	"time"

	"github.com/apex/log"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/internal/api"
)

type Manager struct {
	mutex  sync.RWMutex
	client *client.Client
	nodes  map[string]*Node

	// onNodeRegistered is called when a node is registered.
	// The callback receives the node ID and the node client.
	onNodeRegistered func(nodeId string, node *Node)

	// onNodeDisconnected is called when a node disconnects.
	// timedOut is true when the heartbeat timeout already elapsed.
	onNodeDisconnected func(nodeId string, timedOut bool)
}

// NewManager returns a new server manager instance.
func NewManager(client *client.Client) *Manager {
	m := &Manager{
		client: client,
		nodes:  make(map[string]*Node),
	}
	m.StartHealthMonitor()
	return m
}

// Add puts a connected node in the manager without touching the database.
func (m *Manager) Add(node *Node) {
	m.add(node)
}

func (m *Manager) add(node *Node) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	m.nodes[node.Id()] = node
}

// Remove removes a node from the manager
func (m *Manager) remove(id string) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	delete(m.nodes, id)
}

// SetOnNodeRegistered sets a callback that will be invoked when a node is registered.
// This allows external components to react to node connections without creating
// cyclic dependencies.
func (m *Manager) SetOnNodeRegistered(callback func(nodeId string, node *Node)) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	m.onNodeRegistered = callback
}

// SetOnNodeDisconnected sets a callback that will be invoked when a node disconnects.
// timedOut is true after a missed heartbeat timeout and false for a clean close.
func (m *Manager) SetOnNodeDisconnected(callback func(nodeId string, timedOut bool)) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	m.onNodeDisconnected = callback
}

// TriggerNodeRegistered invokes the onNodeRegistered callback if it's set.
// This is used to re-attach node clients to existing servers when a node reconnects.
func (m *Manager) TriggerNodeRegistered(nodeId string, node *Node) {
	m.mutex.RLock()
	callback := m.onNodeRegistered
	m.mutex.RUnlock()
	if callback != nil {
		callback(nodeId, node)
	}
}

// Register creates a new Node, initializes its NodeClient, and adds it to the Manager.
func (m *Manager) Register(ctx context.Context, id string, name string, url string, location string, token string, alloc *allocator.Allocator, consoleProxy bool, socket string, capacity *api.NodeCapacity) *Node {
	socket = strings.TrimSpace(socket)
	nc := m.nodeClient(id, url, token, socket)
	n := &Node{
		id:           id,
		name:         name,
		location:     location,
		url:          url,
		socket:       socket,
		consoleProxy: consoleProxy,
		nc:           nc,
		Allocator:    alloc,
		Health: &Health{
			LastSeen: time.Now(),
			Online:   true,
		},
	}
	if capacity != nil {
		n.capacity = *capacity
	}
	// Load the nodes drained state from the database
	err := n.loadDrainedState()
	if err != nil {
		log.WithError(err).Error("failed to load node drained state")
	}

	// Claim restored servers before the node can be selected. The callback
	// runs against the local node, which is not in the map yet.
	m.mutex.RLock()
	callback := m.onNodeRegistered
	m.mutex.RUnlock()
	if callback != nil {
		callback(id, n)
	}

	m.add(n)
	log.WithFields(log.Fields{
		"node_id":  n.id,
		"name":     n.name,
		"location": n.location,
	}).Info("Node connected")

	return n
}

// SetEndpoint replaces the URL and socket used to dial a connected node.
// Call it before notifying listeners so they attach the new client.
func (m *Manager) SetEndpoint(n *Node, url, socket string) {
	if n == nil {
		return
	}
	token := ""
	if nc := n.Client(); nc != nil {
		token = nc.GetToken()
	}
	socket = strings.TrimSpace(socket)
	n.mutex.Lock()
	n.url = url
	n.socket = socket
	n.nc = m.nodeClient(n.id, url, token, socket)
	n.mutex.Unlock()
}

func (m *Manager) nodeClient(id, url, token, socket string) client.NodeClient {
	if socket != "" {
		return m.client.LocalNode(id, url, token, socket)
	}
	return m.client.Node(id, url, token)
}

// Disconnect removes a node that closed its connection cleanly.
func (m *Manager) Disconnect(node *Node) {
	m.disconnect(node, false)
}

// DisconnectTimedOut removes a node that missed its heartbeat timeout.
func (m *Manager) DisconnectTimedOut(node *Node) {
	m.disconnect(node, true)
}

func (m *Manager) disconnect(node *Node, timedOut bool) {
	node.Online = false

	m.mutex.RLock()
	callback := m.onNodeDisconnected
	m.mutex.RUnlock()
	if callback != nil {
		callback(node.Id(), timedOut)
	}

	m.remove(node.Id())
}

// Get returns a single node instance and a boolean value indicating if it was
// found in the global collection or not.
func (m *Manager) Get(id string) (*Node, bool) {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	n, exists := m.nodes[id]
	return n, exists
}

// IsRegistered returns true if a node with the given ID exists in the manager.
func (m *Manager) IsRegistered(id string) bool {
	_, exists := m.Get(id)
	return exists
}

// Find returns a single element from the collection matching the filter. If
// nothing is found, a nil result is returned.
func (m *Manager) Find(filter func(match *Node) bool) *Node {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	for _, node := range m.nodes {
		if filter(node) {
			return node
		}
	}
	return nil
}

// GetNodes Returns all nodes
func (m *Manager) GetNodes() []*Node {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	nodes := make([]*Node, len(m.nodes))
	i := 0
	for _, n := range m.nodes {
		nodes[i] = n
		i++
	}
	return nodes
}
