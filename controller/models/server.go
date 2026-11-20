package models

import (
	"errors"

	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/controller/system"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/stats"
)

type ServerData = api.ServerData
type ServerOverrides = api.ServerOverrides
type CreateServerRequest = api.CreateServerRequest
type InstallInfo = api.InstallInfo
type StatusResponse = api.Status

type PowerAction struct {
	Action      string `json:"action"`
	WaitSeconds int    `json:"wait_seconds"`
}

// ServerRecord is the database representation of a server.
type ServerRecord struct {
	Id            string                       `gorm:"primaryKey"`
	NodeName      string                       `gorm:"index"`
	NodeId        string                       `gorm:"index"`
	BlueprintId   string                       `gorm:"index"`
	Overrides     *ServerOverrides             `gorm:"serializer:json"`
	Configuration *ServerConfiguration         `gorm:"serializer:json"`
	InstallScript *software.InstallationScript `gorm:"serializer:json"`
	Usage         *ServerUsage                 `gorm:"serializer:json"`
}

// ServerUsage is what the controller has learned about a server's memory:
// the highest use it has seen and how long it has watched the server run.
type ServerUsage struct {
	PeakBytes       uint64  `json:"peak_bytes"`
	ObservedSeconds float64 `json:"observed_seconds"`
}

// Validate reports whether the server record has the required fields.
func (r *ServerRecord) Validate() error {
	if r == nil {
		return errors.New("server record is nil")
	}
	if r.Configuration == nil {
		return errors.New("server configuration is missing")
	}
	if r.InstallScript == nil {
		return errors.New("server install script is missing")
	}
	return nil
}

// ServerConfiguration is the resolved runtime document stored for a server
// and sent to the daemon that runs it.
type ServerConfiguration = api.ServerConfiguration

// ResourceUsage defines the current resource usage for a given server instance. If a server is offline you
// should obviously expect memory and CPU usage to be 0. However, disk will always be returned
// since that is not dependent on the server being running to collect that data.
type ResourceUsage struct {

	// Embed the current environment stats into this server specific resource usage struct.
	stats.Stats

	// The current server status.
	State *system.AtomicString `json:"state"`

	// The current disk space being used by the server. This value is not guaranteed to be accurate
	// at all times. It is "manually" set whenever server.Proc() is called. This is kind of just a
	// hacky solution for now to avoid passing events all over the place.
	Disk int64 `json:"disk_bytes"`
	// Max size of the file system
	MaxDisk int64 `json:"disk_max"`
	// The disk usage of the overlay filesystem
	// The represents the actual disk space this server takes up
	Overlay int64 `json:"overlay_bytes"`
}

type CreateServerResponse struct {
	Allocation environment.Allocations `json:"allocations"`
}
