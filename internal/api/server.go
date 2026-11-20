package api

import (
	"time"

	"protoxon.com/sls/internal/stats"
)

// ServerData is the public API representation of a managed server.
type ServerData struct {
	Id              string           `json:"id"`
	BlueprintId     string           `json:"blueprint_id"`
	NodeName        string           `json:"node_name"`
	NodeId          string           `json:"node_id"`
	Allocations     *PortAllocations `json:"allocations"`
	Overrides       *ServerOverrides `json:"overrides,omitempty"`
	SoftwareId      string           `json:"software_id"`
	SoftwareVersion string           `json:"software_version"`
	Image           string           `json:"image"`
	Limits          *LimitOverrides  `json:"limits"`
}

// PortAllocations is the JSON form of a server's port mappings.
type PortAllocations struct {
	ForceOutgoingIP bool `json:"force_outgoing_ip"`
	DefaultMapping  struct {
		Ip   string `json:"ip"`
		Port int    `json:"port"`
	} `json:"default"`
	Alias    string           `json:"alias"`
	Mappings map[string][]int `json:"mappings"`
}

// ServerOverrides patches the blueprint for one instance.
type ServerOverrides struct {
	Persists *bool                 `json:"persists,omitempty"`
	Limits   *LimitOverrides       `json:"limits,omitempty"`
	Configs  map[string]ConfigFile `json:"configs,omitempty"`
	Software *string               `json:"software,omitempty"`
	Version  *string               `json:"version,omitempty"`
	Image    *string               `json:"image,omitempty"`
	Env      map[string]string     `json:"env,omitempty"`
}

// CreateServerRequest asks Controller to provision a server from a blueprint.
type CreateServerRequest struct {
	BlueprintID string           `json:"blueprint_id"`
	NodeId      string           `json:"node_id,omitempty"`
	Overrides   *ServerOverrides `json:"overrides,omitempty"`
	// SnapshotIDs are overlay snapshots layered on the new server, highest
	// precedence first.
	SnapshotIDs []string `json:"snapshot_ids,omitempty"`
}

// Status is a server lifecycle state.
type Status struct {
	Status string `json:"status"`
}

// ServerDeleted is the payload of a server deleted event. Reason is set when
// the node removed the server on its own, such as a non-persistent server
// whose start failed.
type ServerDeleted struct {
	Reason string `json:"reason,omitempty"`
}

// InstallInfo describes a server's software install job.
type InstallInfo struct {
	Phase         string     `json:"phase"`
	ContainerID   string     `json:"container_id,omitempty"`
	ContainerName string     `json:"container_name,omitempty"`
	Status        string     `json:"status,omitempty"`
	ExitCode      *int64     `json:"exit_code,omitempty"`
	StartedAt     *time.Time `json:"started_at,omitempty"`
	FinishedAt    *time.Time `json:"finished_at,omitempty"`
	FailureReason string     `json:"failure_reason,omitempty"`
}

// ResourceUsage is a resource snapshot for one server.
type ResourceUsage struct {
	stats.Stats
	State   string `json:"state"`
	Disk    int64  `json:"disk_bytes"`
	MaxDisk int64  `json:"disk_max"`
	Overlay int64  `json:"overlay_bytes"`
}
