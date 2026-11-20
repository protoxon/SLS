package server

import (
	"context"
	"net/http"

	"emperror.dev/errors"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/models"
	snaps "protoxon.com/sls/controller/snapshot"
	"protoxon.com/sls/controller/system/id"
	"protoxon.com/sls/internal/api"
)

// CreateSnapshot records a snapshot and asks the server's node to capture it.
func (m *Manager) CreateSnapshot(ctx context.Context, serverID string, req api.CreateSnapshotRequest) (models.OverlaySnapshotRecord, error) {
	s := m.GetServer(serverID)
	if s == nil {
		return models.OverlaySnapshotRecord{}, &PlaceError{
			Status: http.StatusNotFound,
			Code:   "server not found",
			Hint:   "No server with that id exists.",
		}
	}
	if m.nodes == nil {
		return models.OverlaySnapshotRecord{}, errors.New("node manager is not configured")
	}
	n, ok := m.nodes.Get(s.NodeId())
	if !ok || n == nil || n.IsOffline() || n.Client() == nil {
		return models.OverlaySnapshotRecord{}, &PlaceError{
			Status: http.StatusServiceUnavailable,
			Code:   "node offline",
			Hint:   "The server's node is not connected.",
		}
	}
	cfg := config.Get()
	if cfg == nil {
		return models.OverlaySnapshotRecord{}, errors.New("controller configuration is not loaded")
	}
	tag, err := snaps.NormalizeTag(req.Tag)
	if err != nil {
		return models.OverlaySnapshotRecord{}, &PlaceError{
			Status: http.StatusBadRequest,
			Code:   "invalid snapshot tag",
			Hint:   "Tags are lowercase letters, digits, hyphens, and underscores, up to 63 characters.",
		}
	}
	snapID := id.New()
	ref, err := cfg.Registry.ResolveSnapshot(snapID)
	if err != nil {
		return models.OverlaySnapshotRecord{}, errors.Wrap(err, "failed to resolve snapshot reference")
	}
	rec := models.OverlaySnapshotRecord{
		ID:          snapID,
		Tag:         snaps.TagPtr(tag),
		ServerID:    serverID,
		BlueprintID: s.BlueprintId(),
		Status:      models.SnapshotCreating,
		Phase:       api.SnapshotPhaseCopying,
		Reference:   ref,
		OriginNode:  n.Id(),
	}
	if err := snaps.SaveClaimingTag(&rec); err != nil {
		return models.OverlaySnapshotRecord{}, err
	}
	req.ID = snapID
	req.Reference = ref
	if err := n.Client().StartSnapshot(ctx, serverID, req); err != nil {
		rec.Status = models.SnapshotFailed
		rec.Phase = api.SnapshotPhaseFailed
		rec.Error = err.Error()
		_ = snaps.Save(&rec)
		return rec, err
	}
	return rec, nil
}

// resolveSnapshotRefs turns ids and tags into snapshot ids.
func resolveSnapshotRefs(refs []string) ([]string, error) {
	ids, err := snaps.ResolveAll(refs)
	if err == nil {
		return ids, nil
	}
	if errors.Is(err, snaps.ErrNotFound) {
		return nil, &PlaceError{
			Status: http.StatusNotFound,
			Code:   "snapshot not found",
			Hint:   "No snapshot with that id or tag exists.",
		}
	}
	return nil, &PlaceError{Status: http.StatusConflict, Code: err.Error(), Hint: "The snapshot could not be restored."}
}

// SnapshotInUse reports whether a live server mounts id.
func (m *Manager) SnapshotInUse(id string) bool {
	if m == nil || id == "" {
		return false
	}
	for _, s := range m.All() {
		cfg := s.GetServerConfiguration()
		if cfg == nil {
			continue
		}
		for _, mount := range cfg.Snapshots {
			if mount.ID == id {
				return true
			}
		}
	}
	return false
}
