package api

import (
	"context"
	"net/http"

	"protoxon.com/sls/internal/api"
)

type LoadError = api.LoadError
type ReloadResult = api.ReloadResult
type DefaultRegistryInfo = api.DefaultRegistryInfo

func (c *Client) System(ctx context.Context) (SystemInformation, error) {
	var out SystemInformation
	err := c.do(ctx, "GET", "/api/system", nil, &out)
	return out, err
}

func (c *Client) ReloadBlueprints(ctx context.Context) (ReloadResult, error) {
	var out ReloadResult
	err := c.do(ctx, "POST", "/api/blueprints/reload", nil, &out)
	out.Errors = nonNilErrors(out.Errors)
	return out, err
}

func (c *Client) ReloadSoftware(ctx context.Context) (ReloadResult, error) {
	var out ReloadResult
	err := c.do(ctx, "POST", "/api/software/reload", nil, &out)
	out.Errors = nonNilErrors(out.Errors)
	return out, err
}

func nonNilErrors(errs []LoadError) []LoadError {
	if errs == nil {
		return []LoadError{}
	}
	return errs
}

// DefaultRegistry is Controller's configured default registry (host or host/namespace)
// and whether clients should use HTTP for it.
func (c *Client) DefaultRegistry(ctx context.Context) (DefaultRegistryInfo, error) {
	var out DefaultRegistryInfo
	err := c.do(ctx, http.MethodGet, "/api/registry", nil, &out)
	return out, err
}
