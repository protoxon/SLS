package api

import (
	"context"
	"net/url"
)

// Node is a daemon registered with Protocube.
type Node struct {
	ID       string `json:"id"`
	Name     string `json:"name"`
	Location string `json:"location"`
	URL      string `json:"url"`
	Drained  bool   `json:"drained"`
}

// NodeDetails is a node plus the daemon's host information.
type NodeDetails struct {
	Node
	Version string             `json:"version,omitempty"`
	System  SystemInfo         `json:"system"`
	Docker  *DockerInformation `json:"docker,omitempty"`
}

// SystemInfo is host hardware and OS information.
type SystemInfo struct {
	Architecture  string `json:"architecture"`
	CPUThreads    int    `json:"cpu_threads"`
	MemoryBytes   int64  `json:"memory_bytes"`
	KernelVersion string `json:"kernel_version"`
	OS            string `json:"os"`
	OSType        string `json:"os_type"`
}

// DockerInformation is the daemon's Docker engine snapshot.
type DockerInformation struct {
	Version string `json:"version"`
	Cgroups struct {
		Driver  string `json:"driver"`
		Version string `json:"version"`
	} `json:"cgroups"`
	Containers struct {
		Total   int `json:"total"`
		Running int `json:"running"`
		Paused  int `json:"paused"`
		Stopped int `json:"stopped"`
	} `json:"containers"`
	Storage struct {
		Driver     string `json:"driver"`
		Filesystem string `json:"filesystem"`
	} `json:"storage"`
	Runc struct {
		Version string `json:"version"`
	} `json:"runc"`
}

// SystemInformation is Protocube or a node's reported host info.
type SystemInformation struct {
	Version string             `json:"version"`
	System  SystemInfo         `json:"system"`
	Docker  *DockerInformation `json:"docker,omitempty"`
}

func (c *Client) ListNodes(ctx context.Context) ([]Node, error) {
	var out []Node
	if err := c.do(ctx, "GET", "/api/nodes", nil, &out); err != nil {
		return nil, err
	}
	if out == nil {
		return []Node{}, nil
	}
	return out, nil
}

func (c *Client) GetNode(ctx context.Context, id string) (Node, error) {
	var out Node
	err := c.do(ctx, "GET", nodePath(id), nil, &out)
	return out, err
}

func (c *Client) GetNodeSystem(ctx context.Context, id string) (SystemInformation, error) {
	var out SystemInformation
	err := c.do(ctx, "GET", nodePath(id)+"/system", nil, &out)
	return out, err
}

func (c *Client) InspectNode(ctx context.Context, id string) (NodeDetails, error) {
	node, err := c.GetNode(ctx, id)
	if err != nil {
		return NodeDetails{}, err
	}
	sys, err := c.GetNodeSystem(ctx, id)
	if err != nil {
		return NodeDetails{}, err
	}
	return NodeDetails{
		Node:    node,
		Version: sys.Version,
		System:  sys.System,
		Docker:  sys.Docker,
	}, nil
}

func (c *Client) SetNodeDrained(ctx context.Context, id string, drained bool) error {
	body := map[string]bool{"drained": drained}
	return c.do(ctx, "PATCH", nodePath(id)+"/drained", body, nil)
}

func nodePath(id string) string {
	return "/api/nodes/" + url.PathEscape(id)
}
