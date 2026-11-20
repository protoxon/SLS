package api

import (
	"bufio"
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"

	"protoxon.com/sls/internal/api"
)

type Snapshot = api.Snapshot
type CreateSnapshotRequest = api.CreateSnapshotRequest
type SnapshotProgress = api.SnapshotProgress

const (
	SnapshotPhaseReady  = api.SnapshotPhaseReady
	SnapshotPhaseFailed = api.SnapshotPhaseFailed
)

func (c *Client) ListSnapshots(ctx context.Context) ([]Snapshot, error) {
	var out []Snapshot
	if err := c.do(ctx, http.MethodGet, "/api/snapshots", nil, &out); err != nil {
		return nil, err
	}
	if out == nil {
		return []Snapshot{}, nil
	}
	return out, nil
}

func (c *Client) GetSnapshot(ctx context.Context, id string) (Snapshot, error) {
	var out Snapshot
	err := c.do(ctx, http.MethodGet, snapshotPath(id), nil, &out)
	return out, err
}

func (c *Client) DeleteSnapshot(ctx context.Context, id string, force bool) error {
	path := snapshotPath(id)
	if force {
		path += "?force=true"
	}
	return c.do(ctx, http.MethodDelete, path, nil, nil)
}

// CreateSnapshot asks Controller to capture a server. The call returns when
// the job is accepted.
func (c *Client) CreateSnapshot(ctx context.Context, serverID string, req CreateSnapshotRequest) (Snapshot, error) {
	var out Snapshot
	err := c.do(ctx, http.MethodPost, serverPath(serverID, "/snapshots"), req, &out)
	return out, err
}

// WatchCreateSnapshot posts the snapshot with watch=true and reads each
// newline-delimited progress event. Repeated phases are delivered as they
// arrive. The returned event is the ready or failed line. Closing the
// connection does not cancel the snapshot.
func (c *Client) WatchCreateSnapshot(ctx context.Context, serverID string, req CreateSnapshotRequest, onEvent func(SnapshotProgress) error) (SnapshotProgress, error) {
	res, err := c.open(ctx, http.MethodPost, serverPath(serverID, "/snapshots")+"?watch=true", req)
	if err != nil {
		return SnapshotProgress{}, err
	}
	defer res.Body.Close()
	if res.StatusCode >= 400 {
		data, readErr := io.ReadAll(res.Body)
		if readErr != nil {
			return SnapshotProgress{}, readErr
		}
		return SnapshotProgress{}, decodeAPIError(res.Status, data)
	}

	sc := bufio.NewScanner(res.Body)
	sc.Buffer(make([]byte, 0, 64*1024), 1024*1024)
	var last SnapshotProgress
	saw := false
	for sc.Scan() {
		line := bytes.TrimSpace(sc.Bytes())
		if len(line) == 0 {
			continue
		}
		var ev SnapshotProgress
		if err := json.Unmarshal(line, &ev); err != nil {
			return last, err
		}
		saw = true
		last = ev
		if onEvent != nil {
			if err := onEvent(ev); err != nil {
				return last, err
			}
		}
		if ev.Phase == SnapshotPhaseReady || ev.Phase == SnapshotPhaseFailed {
			return ev, nil
		}
	}
	if err := sc.Err(); err != nil {
		if ctx.Err() != nil {
			return last, ctx.Err()
		}
		return last, err
	}
	if ctx.Err() != nil {
		return last, ctx.Err()
	}
	if !saw {
		return last, fmt.Errorf("snapshot watch ended before the snapshot was ready or failed")
	}
	return last, fmt.Errorf("snapshot watch ended before the snapshot was ready or failed")
}

func (c *Client) open(ctx context.Context, method, path string, body any) (*http.Response, error) {
	var rdr io.Reader
	if body != nil {
		data, err := json.Marshal(body)
		if err != nil {
			return nil, err
		}
		rdr = bytes.NewReader(data)
	}
	req, err := http.NewRequestWithContext(ctx, method, c.baseURL+path, rdr)
	if err != nil {
		return nil, err
	}
	if body != nil {
		req.Header.Set("Content-Type", "application/json")
	}
	if !c.local && c.token != "" {
		req.Header.Set("Authorization", "Bearer "+c.token)
	}
	// Snapshot capture can outlast the default client timeout. Cancellation
	// still follows ctx.
	client := &http.Client{Transport: c.httpClient.Transport}
	res, err := client.Do(req)
	if err != nil {
		if c.local {
			return nil, wrapDialError(c.socket, err)
		}
		return nil, err
	}
	return res, nil
}

func snapshotPath(id string) string {
	return "/api/snapshots/" + url.PathEscape(id)
}
