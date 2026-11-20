package api

import "time"

// CreateSnapshotRequest starts a snapshot of one server's overlay uppers.
// ID and Reference are set by Controller. Targets and excludes are optional.
// An exclude wins over a target. No targets snapshots every overlay.
// Tag is an optional alias, unique across every blueprint. A later snapshot
// with the same tag takes the alias. The previous snapshot keeps its id.
type CreateSnapshotRequest struct {
	ID        string   `json:"id"`
	Reference string   `json:"reference"`
	Tag       string   `json:"tag,omitempty"`
	Targets   []string `json:"targets,omitempty"`
	Excludes  []string `json:"excludes,omitempty"`
	// Pre is sent to the server stdin before the overlay copy. Post is sent
	// after the copy and before the registry push. Both require a running server.
	Pre  []string `json:"pre,omitempty"`
	Post []string `json:"post,omitempty"`
	// PreDelaySeconds waits after Pre succeeds and before the copy.
	// SendCommand only queues stdin, so this is how long to let the process
	// finish a command such as save-all.
	PreDelaySeconds int `json:"pre_delay_seconds,omitempty"`
}

// SnapshotMount is one snapshot layered onto a server, highest precedence first.
type SnapshotMount struct {
	ID        string `json:"id"`
	Digest    string `json:"digest,omitempty"`
	Reference string `json:"reference,omitempty"`
}

// SnapshotLower is one directory that was mounted under a snapshot diff.
type SnapshotLower struct {
	Kind       string `json:"kind"`
	Name       string `json:"name,omitempty"`
	Artifact   string `json:"artifact,omitempty"`
	Digest     string `json:"digest,omitempty"`
	Path       string `json:"path,omitempty"`
	Target     string `json:"target,omitempty"`
	SnapshotID string `json:"snapshot_id,omitempty"`
}

// SnapshotTarget is an overlay diff without its file payload.
type SnapshotTarget struct {
	Target string          `json:"target"`
	Name   string          `json:"name"`
	Lowers []SnapshotLower `json:"lowers,omitempty"`
}

// SnapshotProgress is a status report from the node that is creating a snapshot.
type SnapshotProgress struct {
	ID              string           `json:"id"`
	Phase           string           `json:"phase"`
	Error           string           `json:"error,omitempty"`
	Digest          string           `json:"digest,omitempty"`
	Reference       string           `json:"reference,omitempty"`
	Size            int64            `json:"size,omitempty"`
	RegistrySize    int64            `json:"registry_size,omitempty"`
	SoftwareID      string           `json:"software_id,omitempty"`
	SoftwareVersion string           `json:"software_version,omitempty"`
	ServerFolder    string           `json:"server_folder,omitempty"`
	Requires        []string         `json:"requires,omitempty"`
	Targets         []SnapshotTarget `json:"targets,omitempty"`
}

// Snapshot is the public description of an overlay snapshot.
type Snapshot struct {
	ID              string           `json:"id"`
	Tag             string           `json:"tag,omitempty"`
	ServerID        string           `json:"server_id"`
	BlueprintID     string           `json:"blueprint_id,omitempty"`
	Status          string           `json:"status"`
	Phase           string           `json:"phase,omitempty"`
	Error           string           `json:"error,omitempty"`
	Digest          string           `json:"digest,omitempty"`
	Reference       string           `json:"reference,omitempty"`
	Size            int64            `json:"size"`
	RegistrySize    int64            `json:"registry_size"`
	OriginNode      string           `json:"origin_node,omitempty"`
	SoftwareID      string           `json:"software_id,omitempty"`
	SoftwareVersion string           `json:"software_version,omitempty"`
	ServerFolder    string           `json:"server_folder,omitempty"`
	Requires        []string         `json:"requires,omitempty"`
	Targets         []SnapshotTarget `json:"targets,omitempty"`
	CreatedAt       time.Time        `json:"created_at,omitempty"`
}

// SnapshotIDs is the full list of snapshot ids cached on a node.
type SnapshotIDs struct {
	IDs []string `json:"ids"`
}

const (
	SnapshotCreating = "creating"
	SnapshotReady    = "ready"
	SnapshotFailed   = "failed"
	SnapshotDeleting = "deleting"

	SnapshotPhaseCopying = "copying"
	SnapshotPhasePacking = "packing"
	SnapshotPhasePushing = "pushing"
	SnapshotPhaseReady   = "ready"
	SnapshotPhaseFailed  = "failed"
)
