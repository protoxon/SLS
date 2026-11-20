package api

import "protoxon.com/sls/internal/process"

// ServerConfiguration is the resolved runtime configuration Controller stores
// and the daemon runs. Controller is the source of truth: a daemon that loses
// its copy can recover by fetching this document again.
type ServerConfiguration struct {
	Id                   string                        `json:"id"`
	ProcessConfiguration *process.ProcessConfiguration `json:"process-configuration"`
	Image                string                        `json:"image"`
	Invocation           string                        `json:"invocation"`
	State                State                         `json:"state"`
	Limits               Limits                        `json:"limits"`
	Persists             bool                          `json:"persists"`
	Allocations          Allocations                   `json:"allocations"`
	SoftwareId           string                        `json:"software-id"`
	ServerFolder         string                        `json:"server-folder"`
	SoftwareVersion      string                        `json:"software-version"`
	HasInstallScript     bool                          `json:"has-install-script"`
	SkipInstallScript    bool                          `json:"skip-install-script"`
	// Snapshots are overlay diffs mounted above the server's volumes, highest
	// precedence first.
	Snapshots []SnapshotMount `json:"snapshots,omitempty"`
}

// State is the resolved data layout for one server instance.
type State struct {
	Volumes []Volume          `json:"volumes,omitempty"`
	Mounts  []Mount           `json:"mounts,omitempty"`
	Copy    []Copy            `json:"copy,omitempty"`
	Env     map[string]string `json:"env,omitempty"`
}

// Copy is a file copied into the server filesystem at start.
type Copy struct {
	Source string `json:"source"`
	Target string `json:"target"`
}

// Mount is a host directory bind. The daemon's runtime mount adds a Default
// flag that is not part of this document.
type Mount struct {
	Target   string `json:"target"`
	Source   string `json:"source"`
	ReadOnly bool   `json:"read_only"`
}

// Volume is a pulled artifact (cow/ro) or a local directory under the volumes
// root. Path mounts a directory inside the volume instead of the volume root.
type Volume struct {
	Name     string     `json:"name,omitempty"`
	Artifact string     `json:"artifact,omitempty"`
	Source   string     `json:"source,omitempty"`
	Path     string     `json:"path,omitempty"`
	Target   string     `json:"target,omitempty"`
	Mode     VolumeMode `json:"mode,omitempty"`
}

// VolumeMode is how a volume is attached to the server container.
type VolumeMode string

const (
	VolumeModeCOW VolumeMode = "cow" // copy-on-write overlay
	VolumeModeRO  VolumeMode = "ro"  // read-only bind
	VolumeModeRW  VolumeMode = "rw"  // read-write bind
)

// Limits is a fully resolved resource limit. Blueprint and override documents
// use LimitOverrides, whose nil fields mean "leave unchanged".
type Limits struct {
	MemoryLimit int64  `json:"memory_limit"`
	Swap        int64  `json:"swap"`
	IoWeight    uint16 `json:"io_weight"`
	CpuLimit    int64  `json:"cpu_limit"`
	DiskSpace   int64  `json:"disk_space"`
	Threads     string `json:"threads"`
	OOMDisabled bool   `json:"oom_disabled"`

	// MemoryReservation, MemoryMax, and CpuRequest are stamped by the controller
	// at admission. Blueprints do not set them. Values are megabytes, except
	// CpuRequest, which uses the same unit as CpuLimit (100 = one core).
	// CpuRequest is an accounting debit and is not installed as a CPU quota.
	MemoryReservation int64 `json:"memory_reservation,omitempty"`
	MemoryMax         int64 `json:"memory_max,omitempty"`
	CpuRequest        int64 `json:"cpu_request,omitempty"`
}

// Allocations is the port mapping for one server. Release of a claimed port
// stays on the controller server; it is not part of this document.
type Allocations struct {
	// ForceOutgoingIP causes a dedicated bridge network to be created for the
	// server with a special option, causing Docker to SNAT outgoing traffic to
	// the DefaultMapping's IP.
	ForceOutgoingIP bool `json:"force_outgoing_ip"`
	// DefaultMapping is the address used for {SERVER_IP} and {SERVER_PORT}.
	DefaultMapping struct {
		Ip   string `json:"ip"`
		Port int    `json:"port"`
	} `json:"default"`
	Alias    string           `json:"alias"`
	Mappings map[string][]int `json:"mappings"`
}
