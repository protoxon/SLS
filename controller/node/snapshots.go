package node

import "protoxon.com/sls/internal/snapshot"

// SnapshotIDs returns the snapshot ids this node has reported.
func (n *Node) SnapshotIDs() map[string]struct{} {
	if n == nil {
		return nil
	}
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	if len(n.snapshots) == 0 {
		return nil
	}
	out := make(map[string]struct{}, len(n.snapshots))
	for id := range n.snapshots {
		out[id] = struct{}{}
	}
	return out
}

// SnapshotHash is the last snapshot fingerprint reported by this node.
func (n *Node) SnapshotHash() string {
	if n == nil {
		return ""
	}
	n.mutex.RLock()
	defer n.mutex.RUnlock()
	return n.snapshotHash
}

// SetSnapshotIDs replaces the cached snapshot set and its fingerprint.
func (n *Node) SetSnapshotIDs(ids []string) {
	if n == nil {
		return
	}
	next := make(map[string]struct{}, len(ids))
	for _, id := range ids {
		if id != "" {
			next[id] = struct{}{}
		}
	}
	n.mutex.Lock()
	n.snapshots = next
	n.snapshotHash = snapshot.Hash(ids)
	n.mutex.Unlock()
}

// AddSnapshot records that this node has id, without changing the reported hash.
func (n *Node) AddSnapshot(id string) {
	if n == nil || id == "" {
		return
	}
	n.mutex.Lock()
	if n.snapshots == nil {
		n.snapshots = map[string]struct{}{}
	}
	n.snapshots[id] = struct{}{}
	n.mutex.Unlock()
}
