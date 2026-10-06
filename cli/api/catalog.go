package api

import (
	"context"
	"encoding/json"
	"fmt"
	"net/url"
)

// BlueprintSummary is the list view of a resolved blueprint.
type BlueprintSummary struct {
	Meta struct {
		ID   string `json:"id"`
		Name string `json:"name"`
		Type string `json:"type"`
	} `json:"metadata"`
}

// MixinSummary is the list view of a resolved mixin.
type MixinSummary struct {
	Meta struct {
		ID          string `json:"id"`
		Description string `json:"description"`
	} `json:"mixin"`
}

func (c *Client) ListBlueprints(ctx context.Context) ([]BlueprintSummary, error) {
	return listAll[BlueprintSummary](ctx, c, "/api/blueprints")
}

func (c *Client) GetBlueprint(ctx context.Context, id string) (json.RawMessage, error) {
	return c.getRaw(ctx, "/api/blueprints/"+url.PathEscape(id))
}

func (c *Client) ListMixins(ctx context.Context) ([]MixinSummary, error) {
	return listAll[MixinSummary](ctx, c, "/api/mixins")
}

func (c *Client) GetMixin(ctx context.Context, id string) (json.RawMessage, error) {
	return c.getRaw(ctx, "/api/mixins/"+url.PathEscape(id))
}

func (c *Client) getRaw(ctx context.Context, path string) (json.RawMessage, error) {
	var out json.RawMessage
	if err := c.do(ctx, "GET", path, nil, &out); err != nil {
		return nil, err
	}
	return out, nil
}

type pageResponse[T any] struct {
	Meta struct {
		Pagination Pagination `json:"pagination"`
	} `json:"meta"`
	Data []T `json:"data"`
}

func listAll[T any](ctx context.Context, c *Client, path string) ([]T, error) {
	var all []T
	for page := 1; page <= 1000; page++ {
		q := url.Values{}
		q.Set("page", fmt.Sprintf("%d", page))
		q.Set("per_page", "100")
		var out pageResponse[T]
		if err := c.do(ctx, "GET", path+"?"+q.Encode(), nil, &out); err != nil {
			return nil, err
		}
		all = append(all, out.Data...)
		if out.Meta.Pagination.TotalPages <= page {
			break
		}
	}
	if all == nil {
		return []T{}, nil
	}
	return all, nil
}
