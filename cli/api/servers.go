package api

import (
	"context"
	"encoding/json"
	"fmt"
	"net/url"
	"time"
)

// Server is the public server record returned by Protocube.
type Server struct {
	ID              string          `json:"id"`
	BlueprintID     string          `json:"blueprint_id"`
	NodeName        string          `json:"node_name"`
	NodeID          string          `json:"node_id"`
	Allocations     json.RawMessage `json:"allocations,omitempty"`
	Overrides       json.RawMessage `json:"overrides,omitempty"`
	SoftwareID      string          `json:"software_id"`
	SoftwareVersion string          `json:"software_version"`
	Image           string          `json:"image"`
	Limits          json.RawMessage `json:"limits,omitempty"`
}

// CreateServerRequest asks Protocube to provision a server from a blueprint.
type CreateServerRequest struct {
	BlueprintID string           `json:"blueprint_id"`
	NodeID      string           `json:"node_id,omitempty"`
	Overrides   *ServerOverrides `json:"overrides,omitempty"`
}

// ServerOverrides patches the blueprint for one instance.
type ServerOverrides struct {
	Save     *bool   `json:"save,omitempty"`
	Limits   *Limits `json:"limits,omitempty"`
	Software *string `json:"software,omitempty"`
	Version  *string `json:"version,omitempty"`
	Image    *string `json:"image,omitempty"`
}

// Limits overrides container resource limits.
type Limits struct {
	MemoryLimit *int64  `json:"memory_limit,omitempty"`
	Swap        *int64  `json:"swap,omitempty"`
	IoWeight    *uint16 `json:"io_weight,omitempty"`
	CpuLimit    *int64  `json:"cpu_limit,omitempty"`
	DiskSpace   *int64  `json:"disk_space,omitempty"`
	Threads     *string `json:"threads,omitempty"`
	OOMDisabled *bool   `json:"oom_disabled,omitempty"`
}

// Status is a server lifecycle state.
type Status struct {
	Status string `json:"status"`
}

// Stats is a resource snapshot for one server.
type Stats struct {
	Memory           uint64  `json:"memory_bytes"`
	MemoryLimit      uint64  `json:"memory_limit_bytes"`
	CPUAbsolute      float64 `json:"cpu_absolute"`
	CPUAbsoluteLimit float64 `json:"cpu_absolute_limit"`
	Network          struct {
		RxBytes uint64 `json:"rx_bytes"`
		TxBytes uint64 `json:"tx_bytes"`
	} `json:"network"`
	Uptime  int64  `json:"uptime"`
	State   string `json:"state"`
	Disk    int64  `json:"disk_bytes"`
	MaxDisk int64  `json:"disk_max"`
	Overlay int64  `json:"overlay_bytes"`
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

// LogPage is one page of console or install log lines.
type LogPage struct {
	Meta struct {
		Pagination Pagination `json:"pagination"`
	} `json:"meta"`
	Data []string `json:"data"`
}

// Pagination describes a paged API response.
type Pagination struct {
	Total       int `json:"total"`
	PerPage     int `json:"per_page"`
	CurrentPage int `json:"current_page"`
	TotalPages  int `json:"total_pages"`
}

func (c *Client) ListServers(ctx context.Context) ([]Server, error) {
	var out []Server
	if err := c.do(ctx, "GET", "/api/servers", nil, &out); err != nil {
		return nil, err
	}
	if out == nil {
		return []Server{}, nil
	}
	return out, nil
}

func (c *Client) GetServer(ctx context.Context, id string) (Server, error) {
	var out Server
	err := c.do(ctx, "GET", serverPath(id, ""), nil, &out)
	return out, err
}

func (c *Client) CreateServer(ctx context.Context, req CreateServerRequest) (Server, error) {
	var out Server
	err := c.do(ctx, "POST", "/api/servers", req, &out)
	return out, err
}

func (c *Client) DeleteServer(ctx context.Context, id string, force bool) error {
	path := serverPath(id, "")
	if force {
		path += "?force=true"
	}
	return c.do(ctx, "DELETE", path, nil, nil)
}

func (c *Client) Power(ctx context.Context, id, action string) error {
	return c.do(ctx, "POST", serverPath(id, "/power"), map[string]string{"action": action}, nil)
}

func (c *Client) ResetServer(ctx context.Context, id string) error {
	return c.do(ctx, "POST", serverPath(id, "/reset"), nil, nil)
}

func (c *Client) ServerStatus(ctx context.Context, id string) (Status, error) {
	var out Status
	err := c.do(ctx, "GET", serverPath(id, "/status"), nil, &out)
	return out, err
}

func (c *Client) ServerStats(ctx context.Context, id string) (Stats, error) {
	var out Stats
	err := c.do(ctx, "GET", serverPath(id, "/stats"), nil, &out)
	return out, err
}

func (c *Client) Exec(ctx context.Context, id string, commands []string) error {
	body := map[string][]string{"commands": commands}
	return c.do(ctx, "POST", serverPath(id, "/commands"), body, nil)
}

func (c *Client) ServerLogs(ctx context.Context, id string, page, perPage int) (LogPage, error) {
	return c.logs(ctx, serverPath(id, "/logs"), page, perPage)
}

func (c *Client) InstallInfo(ctx context.Context, id string) (InstallInfo, error) {
	var out InstallInfo
	err := c.do(ctx, "GET", serverPath(id, "/install"), nil, &out)
	return out, err
}

func (c *Client) InstallLogs(ctx context.Context, id string, page, perPage int) (LogPage, error) {
	return c.logs(ctx, serverPath(id, "/install/logs"), page, perPage)
}

func (c *Client) Reinstall(ctx context.Context, id string) error {
	return c.do(ctx, "POST", serverPath(id, "/reinstall"), nil, nil)
}

func (c *Client) logs(ctx context.Context, path string, page, perPage int) (LogPage, error) {
	q := url.Values{}
	q.Set("page", fmt.Sprintf("%d", page))
	q.Set("per_page", fmt.Sprintf("%d", perPage))
	var out LogPage
	if err := c.do(ctx, "GET", path+"?"+q.Encode(), nil, &out); err != nil {
		return LogPage{}, err
	}
	if out.Data == nil {
		out.Data = []string{}
	}
	return out, nil
}

func serverPath(id, rest string) string {
	return "/api/servers/" + url.PathEscape(id) + rest
}
