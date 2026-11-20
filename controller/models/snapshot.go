package models

import (
	"time"

	"protoxon.com/sls/internal/api"
)

const (
	SnapshotCreating = api.SnapshotCreating
	SnapshotReady    = api.SnapshotReady
	SnapshotFailed   = api.SnapshotFailed
	SnapshotDeleting = api.SnapshotDeleting
)

// OverlaySnapshotRecord is the controller's snapshot row.
type OverlaySnapshotRecord struct {
	ID          string `gorm:"primaryKey" json:"id"`
	ServerID    string `gorm:"index" json:"server_id"`
	BlueprintID string `gorm:"index" json:"blueprint_id,omitempty"`
	// Tag is an optional alias. It is unique across every blueprint. NULL lets many rows stay untagged.
	Tag             *string              `gorm:"uniqueIndex" json:"tag,omitempty"`
	Status          string               `gorm:"index" json:"status"`
	Phase           string               `json:"phase,omitempty"`
	Error           string               `json:"error,omitempty"`
	Digest          string               `json:"digest,omitempty"`
	Reference       string               `json:"reference,omitempty"`
	Size            int64                `json:"size"`
	RegistrySize    int64                `json:"registry_size"`
	OriginNode      string               `json:"origin_node,omitempty"`
	CachedNodes     []string             `gorm:"serializer:json" json:"cached_nodes,omitempty"`
	SoftwareID      string               `json:"software_id,omitempty"`
	SoftwareVersion string               `json:"software_version,omitempty"`
	ServerFolder    string               `json:"server_folder,omitempty"`
	Requires        []string             `gorm:"serializer:json" json:"requires,omitempty"`
	Targets         []api.SnapshotTarget `gorm:"serializer:json" json:"targets,omitempty"`
	CreatedAt       time.Time            `json:"created_at"`
	UpdatedAt       time.Time            `json:"updated_at"`
}

// View converts the row into the public API document.
func (r OverlaySnapshotRecord) View() api.Snapshot {
	return api.Snapshot{
		ID:              r.ID,
		Tag:             tagString(r.Tag),
		ServerID:        r.ServerID,
		BlueprintID:     r.BlueprintID,
		Status:          r.Status,
		Phase:           r.Phase,
		Error:           r.Error,
		Digest:          r.Digest,
		Reference:       r.Reference,
		Size:            r.Size,
		RegistrySize:    r.RegistrySize,
		OriginNode:      r.OriginNode,
		SoftwareID:      r.SoftwareID,
		SoftwareVersion: r.SoftwareVersion,
		ServerFolder:    r.ServerFolder,
		Requires:        append([]string(nil), r.Requires...),
		Targets:         append([]api.SnapshotTarget(nil), r.Targets...),
		CreatedAt:       r.CreatedAt,
	}
}

func tagString(tag *string) string {
	if tag == nil {
		return ""
	}
	return *tag
}

// SnapshotTombstone is a deleted snapshot that nodes may still have cached.
type SnapshotTombstone struct {
	ID    string   `gorm:"primaryKey"`
	Nodes []string `gorm:"serializer:json"`
}
