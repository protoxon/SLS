package api

import (
	"context"
	"net/http"
)

func (c *Client) System(ctx context.Context) (SystemInformation, error) {
	var out SystemInformation
	err := c.do(ctx, "GET", "/api/system", nil, &out)
	return out, err
}

func (c *Client) ReloadBlueprints(ctx context.Context) error {
	return c.do(ctx, "POST", "/api/blueprints/reload", nil, nil)
}

func (c *Client) ReloadSoftware(ctx context.Context) error {
	return c.do(ctx, "POST", "/api/software/reload", nil, nil)
}

// DefaultRegistryInfo is Protocube's configured default registry.
type DefaultRegistryInfo struct {
	Default  string `json:"default"`
	Insecure bool   `json:"insecure"`
}

// DefaultRegistry is Protocube's configured default registry (host or host/namespace)
// and whether clients should use HTTP for it.
func (c *Client) DefaultRegistry(ctx context.Context) (DefaultRegistryInfo, error) {
	var out DefaultRegistryInfo
	err := c.do(ctx, http.MethodGet, "/api/registry", nil, &out)
	return out, err
}
