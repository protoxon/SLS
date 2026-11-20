package remote

import (
	"bytes"
	"context"
	"encoding/json"
	"io"
	"net/http"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"protoxon.com/sls/daemon/api/auth"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/daemon/oras/store"
	"protoxon.com/sls/daemon/system"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/snapshot"
	"protoxon.com/sls/internal/version"
)

const heartbeatInterval = 10 * time.Second

var connected = system.NewAtomicBool(false)

// Register will send a single register request to controller
func (c *client) Register(ctx context.Context) error {
	proxy := config.Get().Api.ProxyConsole()
	req := NodeRegistration{
		Id:           config.Get().Uuid,
		Name:         config.Get().Name,
		Location:     config.Get().Location,
		Url:          config.Get().Api.Url,
		Socket:       config.Get().Api.Socket.ActivePath(),
		Version:      version.Version,
		Allocations:  config.Get().Allocations,
		ConsoleProxy: &proxy,
		Capacity:     nodeCapacity(),
	}
	bodyBytes, err := json.Marshal(req)
	if err != nil {
		return errors.Wrap(err, "failed to marshal register payload")
	}

	// Use requestOnce directly to avoid recursion
	nodeId := config.Get().Uuid
	resp, err := c.requestOnce(ctx, http.MethodPost, "/api/nodes/"+nodeId+"/register", bytes.NewReader(bodyBytes))
	if err != nil {
		return errors.Wrap(err, "failed to register")
	}
	defer resp.Body.Close()

	// Check HTTP status code before parsing response
	if resp.StatusCode < 200 || resp.StatusCode >= 300 {
		// Read error response body for better error message
		body, _ := io.ReadAll(resp.Body)
		var errorData map[string]interface{}
		if err := json.Unmarshal(body, &errorData); err == nil {
			if errorMsg, ok := errorData["error"].(string); ok {
				return errors.Errorf("registration failed (HTTP %d): %s", resp.StatusCode, errorMsg)
			}
		}
		return errors.Errorf("registration failed with HTTP status %d", resp.StatusCode)
	}

	// Read response body
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return errors.Wrap(err, "failed to read register response")
	}

	// Parse JSON
	var data struct {
		Token     string          `json:"token"`
		Artifacts json.RawMessage `json:"artifacts"`
	}
	if err := json.Unmarshal(body, &data); err != nil {
		return errors.Wrap(err, "failed to parse register response")
	}

	// Extract token
	if data.Token == "" {
		return errors.New("register response missing token field or wrong type")
	}

	// Set token in auth
	if err := auth.SetToken(data.Token); err != nil {
		return errors.Wrap(err, "failed to set auth token")
	}

	c.mu.RLock()
	volumes := c.volumes
	c.mu.RUnlock()
	if err := saveRegisterArtifacts(data.Artifacts, volumes); err != nil {
		return err
	}

	if connected.SwapIf(true) {
		log.Info("Successfully registered with controller.")
		c.notifyConnected(ctx)
	}

	return nil
}

func nodeCapacity() *api.NodeCapacity {
	cfg := config.Get()
	capacity := system.Capacity(cfg.System.RootDirectory, cfg.Scheduling.Role, cfg.Docker.Overhead.Policy())
	return &capacity
}

// saveRegisterArtifacts writes the blueprint artifact list when the register
// response includes it. A missing field or null leaves the previous list in place.
// An empty array is a real list.
func saveRegisterArtifacts(raw json.RawMessage, st *store.Store) error {
	if st == nil || len(raw) == 0 || string(raw) == "null" {
		return nil
	}
	var artifacts []string
	if err := json.Unmarshal(raw, &artifacts); err != nil {
		return errors.Wrap(err, "failed to parse volume artifacts")
	}
	if err := st.SaveRetain(artifacts); err != nil {
		return err
	}
	if err := st.GC(); err != nil {
		log.WithError(err).Warn("failed to clean unused volumes")
	}
	return nil
}

// Heartbeat sends a heartbeat request to controller.
// If the node is not connected it retries registration first.
func (c *client) Heartbeat(ctx context.Context) {
	if !connected.Load() {
		if err := c.Register(ctx); err != nil {
			log.WithError(err).Error("failed to connect to controller: register failed")
			return
		}
	}
	if !connected.Load() {
		return
	}
	heartbeat := system.CurrentMetrics()
	snapRoot := ""
	if cfg := config.Get(); cfg != nil {
		snapRoot = cfg.System.Snapshots
	}
	if ids, err := system.SnapshotIDs(snapRoot); err != nil {
		log.WithError(err).Warn("failed to list snapshots")
	} else {
		heartbeat.SnapshotHash = snapshot.Hash(ids)
	}
	if !heartbeat.Complete {
		log.WithField("missing", system.MetricsGap()).Warn("host metrics are incomplete; controller will not place servers on this node")
	} else if system.BusyUtilizationStale() {
		log.Warn("host cpu utilization unavailable; placement will ignore busy scoring on this node")
	}
	resp, err := Post[models.HeartbeatResponse](c, ctx, "/internal/heartbeat", heartbeat)
	if err != nil {
		connected.Store(false)
		log.WithError(err).Error("failed to connect to controller: heartbeat failed")
		return
	}
	if err := c.SyncRegistryIfChanged(ctx, resp.RegistryRevision); err != nil {
		log.WithError(err).Warn("failed to refresh registry credentials")
	}
	ids, err := system.DeleteSnapshots(snapRoot, resp.SnapshotTombstones)
	if err != nil {
		log.WithError(err).Warn("failed to delete snapshot tombstones")
		return
	}
	if resp.ReportSnapshots || len(resp.SnapshotTombstones) > 0 {
		if err := c.ReportSnapshotIDs(ctx, ids); err != nil {
			log.WithError(err).Warn("failed to report snapshot ids")
		}
	}
}

// Disconnect sends a disconnect request to controller if connected
// And cancels the sending of heartbeats
func (c *client) Disconnect(ctx context.Context) {
	c.cancel() // Cancel the clients main context to stop sending heartbeats
	if connected.Load() {
		_, _ = Post[d](c, ctx, "/internal/disconnect", nil)
	}
}

// StartHeartbeats starts a goroutine that sends heartbeats at the specified interval.
func (c *client) StartHeartbeats() {
	ctx := c.ctx
	go func() {
		c.Heartbeat(ctx)
		ticker := time.NewTicker(heartbeatInterval)
		defer ticker.Stop()
		for {
			select {
			case <-ctx.Done():
				return
			case <-ticker.C:
				c.Heartbeat(ctx)
			}
		}
	}()
}
