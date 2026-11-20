package api

import "emperror.dev/errors"

// NodeData is a daemon registered with Controller.
type NodeData struct {
	ID       string `json:"id"`
	Name     string `json:"name"`
	Location string `json:"location"`
	URL      string `json:"url"`
	Drained  bool   `json:"drained"`
}

// Allocation is a node port pool entry. JSON field names follow the Go names
// because the registration payload has never used json tags.
type Allocation struct {
	Address         string `yaml:"address" default:"0.0.0.0"`
	Alias           string `yaml:"alias" default:"127.0.0.1"`
	ForceOutgoingIP bool   `yaml:"force_outgoing_ip"`
	Ports           string `yaml:"ports" default:"40000-45000"`
}

// NodeRegistration is the payload a daemon sends when it joins Controller.
type NodeRegistration struct {
	Id          string       `json:"id"`
	Name        string       `json:"name"`
	Location    string       `json:"location"`
	Url         string       `json:"url"`
	Socket      string       `json:"socket,omitempty"`
	Version     string       `json:"version"`
	Allocations []Allocation `json:"allocations"`
	// ConsoleProxy is proxied when the field is omitted.
	ConsoleProxy *bool `json:"console_proxy"`
	// Capacity is the static host size and scheduling policy. Heartbeats carry
	// the changing pressure sample.
	Capacity *NodeCapacity `json:"capacity,omitempty"`
}

// ProxyConsole reports whether clients should open the console through Controller.
// A missing field means proxied.
func (r NodeRegistration) ProxyConsole() bool {
	if r.ConsoleProxy == nil {
		return true
	}
	return *r.ConsoleProxy
}

func (r *NodeRegistration) Validate() error {
	if r.Id == "" {
		return errors.New("Node ID cannot be blank")
	}
	if r.Name == "" {
		return errors.New("Node url cannot be blank")
	}
	return nil
}

// NodeRegistrationResponse is the session token returned to a registering daemon.
type NodeRegistrationResponse struct {
	SessionToken string `json:"token"`
}

// HeartbeatResponse is returned to a node after a successful heartbeat.
type HeartbeatResponse struct {
	RegistryRevision string `json:"registry_revision"`
	// SnapshotTombstones are snapshot ids this node should delete.
	SnapshotTombstones []string `json:"snapshot_tombstones,omitempty"`
	// ReportSnapshots asks the node to POST its snapshot id list.
	ReportSnapshots bool `json:"report_snapshots,omitempty"`
}

// DockerInformation is a daemon's Docker engine snapshot.
type DockerInformation struct {
	Version    string           `json:"version"`
	Cgroups    DockerCgroups    `json:"cgroups"`
	Containers DockerContainers `json:"containers"`
	Storage    DockerStorage    `json:"storage"`
	Runc       DockerRunc       `json:"runc"`
}

type DockerCgroups struct {
	Driver  string `json:"driver"`
	Version string `json:"version"`
}

type DockerContainers struct {
	Total   int `json:"total"`
	Running int `json:"running"`
	Paused  int `json:"paused"`
	Stopped int `json:"stopped"`
}

type DockerStorage struct {
	Driver     string `json:"driver"`
	Filesystem string `json:"filesystem"`
}

type DockerRunc struct {
	Version string `json:"version"`
}

// System is host hardware and OS information.
type System struct {
	Architecture  string `json:"architecture"`
	CPUThreads    int    `json:"cpu_threads"`
	MemoryBytes   int64  `json:"memory_bytes"`
	KernelVersion string `json:"kernel_version"`
	OS            string `json:"os"`
	OSType        string `json:"os_type"`
}

// HostInformation is the daemon system payload, including Docker.
type HostInformation struct {
	Version string            `json:"version"`
	Docker  DockerInformation `json:"docker"`
	System  System            `json:"system"`
}
