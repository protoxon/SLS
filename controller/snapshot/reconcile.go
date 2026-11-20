package snapshot

import (
	"sync"

	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/internal/api"
)

// Hub fans snapshot progress out to watchers.
type Hub struct {
	mu   sync.Mutex
	subs map[string]map[chan api.SnapshotProgress]struct{}
}

func NewHub() *Hub {
	return &Hub{subs: map[string]map[chan api.SnapshotProgress]struct{}{}}
}

var progressHub = NewHub()

// Subscribe returns a channel of progress events for id.
func Subscribe(id string) chan api.SnapshotProgress {
	return progressHub.Subscribe(id)
}

// Unsubscribe removes ch.
func Unsubscribe(id string, ch chan api.SnapshotProgress) {
	progressHub.Unsubscribe(id, ch)
}

// Publish sends ev to the snapshot's watchers.
func Publish(ev api.SnapshotProgress) {
	progressHub.Publish(ev)
}

func (h *Hub) Subscribe(id string) chan api.SnapshotProgress {
	ch := make(chan api.SnapshotProgress, 8)
	h.mu.Lock()
	defer h.mu.Unlock()
	if h.subs[id] == nil {
		h.subs[id] = map[chan api.SnapshotProgress]struct{}{}
	}
	h.subs[id][ch] = struct{}{}
	return ch
}

func (h *Hub) Unsubscribe(id string, ch chan api.SnapshotProgress) {
	h.mu.Lock()
	defer h.mu.Unlock()
	if h.subs[id] == nil {
		return
	}
	delete(h.subs[id], ch)
	if len(h.subs[id]) == 0 {
		delete(h.subs, id)
	}
}

func (h *Hub) Publish(ev api.SnapshotProgress) {
	h.mu.Lock()
	defer h.mu.Unlock()
	for ch := range h.subs[ev.ID] {
		select {
		case ch <- ev:
		default:
		}
	}
}

// ApplyProgress stores a node progress report and notifies watchers.
// A late report for a snapshot that is already deleting does not resurrect the row.
func ApplyProgress(ev api.SnapshotProgress) (models.OverlaySnapshotRecord, error) {
	rec, err := Get(ev.ID)
	if err != nil {
		return models.OverlaySnapshotRecord{}, err
	}
	if rec.Status == models.SnapshotDeleting {
		if ev.Digest != "" {
			rec.Digest = ev.Digest
		}
		if ev.Reference != "" {
			rec.Reference = ev.Reference
		}
		if err := Save(&rec); err != nil {
			return models.OverlaySnapshotRecord{}, err
		}
		Publish(ev)
		return rec, nil
	}
	rec.Phase = ev.Phase
	switch ev.Phase {
	case api.SnapshotPhaseFailed:
		if ev.Digest != "" {
			rec.Digest = ev.Digest
		}
		if ev.Reference != "" {
			rec.Reference = ev.Reference
		}
		rec.Status = models.SnapshotFailed
		rec.Error = ev.Error
		// Nothing was published. Drop the row so failed creates do not stay in the list.
		// A digest means the registry may already have the manifest, so keep the row.
		if rec.Digest == "" {
			Publish(ev)
			if err := DeleteRecord(rec.ID); err != nil {
				return models.OverlaySnapshotRecord{}, err
			}
			return rec, nil
		}
	case api.SnapshotPhaseReady:
		rec.Status = models.SnapshotReady
		rec.Error = ev.Error
		if ev.Digest != "" {
			rec.Digest = ev.Digest
		}
		if ev.Reference != "" {
			rec.Reference = ev.Reference
		}
		if ev.Size > 0 {
			rec.Size = ev.Size
		}
		if ev.RegistrySize > 0 {
			rec.RegistrySize = ev.RegistrySize
		}
		if ev.SoftwareID != "" {
			rec.SoftwareID = ev.SoftwareID
		}
		if ev.SoftwareVersion != "" {
			rec.SoftwareVersion = ev.SoftwareVersion
		}
		if ev.ServerFolder != "" {
			rec.ServerFolder = ev.ServerFolder
		}
		if ev.Requires != nil {
			rec.Requires = ev.Requires
		}
		if ev.Targets != nil {
			rec.Targets = ev.Targets
		}
		if rec.OriginNode != "" {
			rec.CachedNodes = addNode(rec.CachedNodes, rec.OriginNode)
		}
	}
	if err := Save(&rec); err != nil {
		return models.OverlaySnapshotRecord{}, err
	}
	Publish(ev)
	return rec, nil
}

func addNode(nodes []string, id string) []string {
	for _, node := range nodes {
		if node == id {
			return nodes
		}
	}
	return append(nodes, id)
}

func dropNode(nodes []string, id string) []string {
	out := nodes[:0]
	for _, node := range nodes {
		if node != id {
			out = append(out, node)
		}
	}
	return out
}

// TombstonesFor returns snapshot ids this node should delete.
func TombstonesFor(nodeID string) []string {
	rows, err := Tombstones()
	if err != nil {
		return nil
	}
	var ids []string
	for _, row := range rows {
		for _, node := range row.Nodes {
			if node == nodeID {
				ids = append(ids, row.ID)
				break
			}
		}
	}
	return ids
}

// NoteReported updates locality and clears tombstones the node no longer has.
func NoteReported(nodeID string, ids []string) error {
	have := map[string]struct{}{}
	for _, id := range ids {
		have[id] = struct{}{}
	}
	rows, err := ListReady()
	if err != nil {
		return err
	}
	for i := range rows {
		row := &rows[i]
		_, present := have[row.ID]
		next := row.CachedNodes
		if present {
			next = addNode(next, nodeID)
		} else {
			next = dropNode(append([]string(nil), next...), nodeID)
		}
		if len(next) == len(row.CachedNodes) && sameNodes(next, row.CachedNodes) {
			continue
		}
		row.CachedNodes = next
		if err := Save(row); err != nil {
			return err
		}
	}
	tombs, err := Tombstones()
	if err != nil {
		return err
	}
	for _, tomb := range tombs {
		if _, present := have[tomb.ID]; present {
			continue
		}
		next := dropNode(append([]string(nil), tomb.Nodes...), nodeID)
		if len(next) == 0 {
			if err := DeleteTombstone(tomb.ID); err != nil {
				return err
			}
			continue
		}
		if err := SaveTombstone(tomb.ID, next); err != nil {
			return err
		}
	}
	return nil
}

func sameNodes(a, b []string) bool {
	if len(a) != len(b) {
		return false
	}
	for i := range a {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}
