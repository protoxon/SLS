package api

import (
	"context"
	"fmt"
	"net/url"

	"protoxon.com/sls/internal/api"
)

type Server = api.ServerData
type CreateServerRequest = api.CreateServerRequest
type ServerOverrides = api.ServerOverrides
type Limits = api.LimitOverrides
type Status = api.Status
type Stats = api.ResourceUsage
type InstallInfo = api.InstallInfo

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
	return c.listServers(ctx, "")
}

// ListServersByNode lists servers placed on nodeID. An empty id lists every server.
func (c *Client) ListServersByNode(ctx context.Context, nodeID string) ([]Server, error) {
	return c.listServers(ctx, nodeID)
}

func (c *Client) listServers(ctx context.Context, nodeID string) ([]Server, error) {
	path := "/api/servers"
	if nodeID != "" {
		q := url.Values{}
		q.Set("node_id", nodeID)
		path += "?" + q.Encode()
	}
	var out []Server
	if err := c.do(ctx, "GET", path, nil, &out); err != nil {
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
