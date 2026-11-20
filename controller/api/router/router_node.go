package router

import (
	"context"
	"net/http"
	"strconv"
	"sync"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/api/router/middleware"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/node/allocator"
	"protoxon.com/sls/controller/server"
	snaps "protoxon.com/sls/controller/snapshot"
	"protoxon.com/sls/controller/system"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/httperror"
)

var registerMutex sync.Mutex

func (r *Router) postNodeRegister(c *gin.Context) {
	var req models.NodeRegistration
	if err := c.ShouldBindJSON(&req); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}

	// Validate the request fields
	if err := req.Validate(); err != nil {
		httperror.JSON(c, http.StatusBadRequest, errors.Wrap(err, "invalid field").Error(), "Invalid field in request.")
		return
	}

	registerMutex.Lock()
	defer registerMutex.Unlock()

	// Check if the node is already registered
	node, exists := r.NodeManager.Get(req.Id)
	if exists {
		node.SetConsoleProxy(req.ProxyConsole())
		r.NodeManager.SetEndpoint(node, req.Url, req.Socket)
		// Build the new pool, then publish it only once existing servers have
		// claimed their ports. Assignment before the claim lets placement take
		// a port a restored server still holds.
		alloc, err := allocator.NewAllocator(req.Allocations)
		if err != nil {
			log.WithError(err).Errorf("failed to update allocator for existing node %s", node.Id())
			wrapped := errors.Wrap(err, "failed to update allocator")
			httperror.JSON(c, http.StatusInternalServerError, wrapped.Error(), "")
			return
		}
		if r.ServerManager != nil {
			r.ServerManager.InstallAllocator(node, alloc)
		} else {
			node.Allocator = alloc
		}
		if req.Capacity != nil {
			node.SetCapacity(*req.Capacity)
		}
		// Invoke the callback to attach node clients to existing servers
		// This ensures existing allocations are claimed in the new allocator
		r.NodeManager.TriggerNodeRegistered(req.Id, node)
		// Node is already registered return the current token
		c.JSON(http.StatusOK, r.registerPayload(node.Client().GetToken()))
		return
	}

	// Generate a key the node will use to authenticate future requests from Controller
	token, err := system.GenerateKey()
	if err != nil {
		wrapped := errors.Wrap(err, "failed to generate auth token")
		httperror.JSON(c, http.StatusInternalServerError, wrapped.Error(), "")
		return
	}

	// Create the allocator before registering the node (so it's available when the callback is invoked)
	alloc, err := allocator.NewAllocator(req.Allocations)
	if err != nil {
		log.WithError(err).Errorf("failed to create allocator for node %s", req.Id)
		wrapped := errors.Wrap(err, "failed to create allocator")
		httperror.JSON(c, http.StatusInternalServerError, wrapped.Error(), "")
		return
	}

	// Connect the node in the node manager
	r.NodeManager.Register(c.Request.Context(), req.Id, req.Name, req.Url, req.Location, token, alloc, req.ProxyConsole(), req.Socket, req.Capacity)

	c.JSON(http.StatusOK, r.registerPayload(token))
}

type nodeRegisterResponse struct {
	Token     string   `json:"token"`
	Artifacts []string `json:"artifacts"`
}

func (r *Router) volumeArtifacts() []string {
	if r.BlueprintRegistry == nil {
		return []string{}
	}
	return blueprint.ArtifactRefs(r.BlueprintRegistry.All())
}

func (r *Router) registerPayload(token string) nodeRegisterResponse {
	return nodeRegisterResponse{Token: token, Artifacts: r.volumeArtifacts()}
}

// pushVolumeRetain sends the current blueprint artifact list to each online node.
func (r *Router) pushVolumeRetain(ctx context.Context) {
	if r.NodeManager == nil {
		return
	}
	artifacts := r.volumeArtifacts()
	for _, n := range r.NodeManager.GetNodes() {
		if n == nil || n.IsOffline() || n.Client() == nil {
			continue
		}
		if err := n.Client().RetainVolumes(ctx, artifacts); err != nil {
			log.WithError(err).WithField("node", n.Id()).Warn("failed to push volume retain list")
		}
	}
}

func (r *Router) postNodeHeartbeat(c *gin.Context) {
	node := middleware.ExtractNode(c)
	var metrics api.NodeMetrics
	if c.Request.ContentLength != 0 {
		if err := c.ShouldBindJSON(&metrics); err != nil {
			httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
			return
		}
		if metrics.Timestamp != 0 {
			node.SetMetrics(metrics)
			if r.ServerManager != nil {
				r.ServerManager.ObserveUsage(node.Id(), metrics.Servers, time.Now())
			}
		}
	}
	node.OnHeartBeat()
	resp := models.HeartbeatResponse{
		RegistryRevision: config.RegistrySnapshot().Revision,
	}
	if len(metrics.SnapshotHash) == 64 && metrics.SnapshotHash != node.SnapshotHash() {
		resp.ReportSnapshots = true
	}
	resp.SnapshotTombstones = snaps.TombstonesFor(node.Id())
	c.JSON(http.StatusOK, resp)
}

func getNodeRegistry(c *gin.Context) {
	c.JSON(http.StatusOK, config.RegistrySnapshot())
}

func (r *Router) postNodeDisconnect(c *gin.Context) {
	node := middleware.ExtractNode(c)
	r.NodeManager.Disconnect(node)
	log.WithField("node", node.Id()).Infof("Node disconnected. Reason: %s", "Node closed the connection.")
	c.Status(http.StatusOK)
}

func postNodeServerStatus(c *gin.Context) {
	// Declare a variable to hold the JSON data
	var status server.Status
	// Bind the JSON to the status variable
	if err := c.ShouldBindJSON(&status); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}

	// Process the status change
	s := middleware.ExtractServer(c)
	log.WithFields(log.Fields{
		"server": system.Red(s.Id()),
		"status": system.Red(status),
	}).Debug("Server Status Update.")
	s.SetStatus(status)
	c.Status(http.StatusOK)
}

func postNodeServerInstallStatus(c *gin.Context) {
	var phase string
	if err := c.ShouldBindJSON(&phase); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}
	s := middleware.ExtractServer(c)
	log.WithFields(log.Fields{
		"server": system.Red(s.Id()),
		"phase":  system.Red(phase),
	}).Debug("Server install status update.")
	s.HandleInstallStatus(phase)
	if phase == server.InstallStatusCompleted || phase == server.InstallStatusFailed {
		// After install the server process is offline.
		s.SetStatus(server.ProcessOfflineState)
	}
	c.Status(http.StatusOK)
}

func postEventServerCrash(c *gin.Context) {
	var crash server.CrashData
	if err := c.ShouldBindJSON(&crash); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}

	// Process the crash
	s := middleware.ExtractServer(c)
	s.HandleServerCrash(crash)
	c.Status(http.StatusOK)
}

func postEventServerDeleted(c *gin.Context) {
	s := middleware.ExtractServer(c)
	// Older nodes send no body, so a missing or unreadable reason is not an error.
	var body api.ServerDeleted
	_ = c.ShouldBindJSON(&body)
	if body.Reason != "" {
		s.Log().WithField("reason", body.Reason).Warn("node deleted the server")
	}
	s.CleanupDeletedByNode(body.Reason)
	c.Status(http.StatusOK)
}

func getNode(c *gin.Context) {
	node := middleware.ExtractNode(c)
	c.JSON(http.StatusOK, models.NodeData{
		ID:       node.Id(),
		Name:     node.Name(),
		Location: node.Location(),
		URL:      node.Url(),
		Drained:  node.Drained(),
	})
}

func getNodeSystemInfo(c *gin.Context) {
	node := middleware.ExtractNode(c)
	info, err := node.GetSystemInformation(c.Request.Context())
	if err != nil {
		client.HandleError(c, err)
		return
	}
	c.JSON(http.StatusOK, info)
}

func toggleNodeDrained(c *gin.Context) {
	node := middleware.ExtractNode(c)

	var req struct {
		Drained bool `json:"drained"`
	}

	if err := c.ShouldBindJSON(&req); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}

	err := node.SetDrained(req.Drained)
	if err != nil {
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "Failed to update node drained state.")
		log.Errorf("failed to update drained state for node %s: %v", node.Id(), err)
		return
	}
	c.Status(http.StatusOK)
}

func (r *Router) getServerConfiguration(c *gin.Context) {
	s := middleware.ExtractServer(c)
	c.JSON(http.StatusOK, s.GetServerConfiguration())
}

func (r *Router) getAllServerConfigurations(c *gin.Context) {
	// Extract the node from the context
	n := middleware.ExtractNode(c)
	nodeId := n.Id()

	// Parse pagination query parameters
	// The daemon uses "page" and "per_page" query parameters
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	perPage, _ := strconv.Atoi(c.DefaultQuery("per_page", "50"))

	// Validate and set defaults
	if page < 1 {
		page = 1
	}
	if perPage < 1 {
		perPage = 50
	}

	// Get all servers for this node
	servers := r.ServerManager.ServersByNode(nodeId)

	// Build configurations for all servers
	configurations := make([]*models.ServerConfiguration, 0, len(servers))
	for _, s := range servers {
		configurations = append(configurations, s.GetServerConfiguration())
	}

	// Calculate pagination
	total := len(configurations)
	start := (page - 1) * perPage
	end := start + perPage

	if start > total {
		start = total
	}
	if end > total {
		end = total
	}

	// Get the paged slice
	var paged []*models.ServerConfiguration
	if start < total {
		paged = configurations[start:end]
	} else {
		paged = []*models.ServerConfiguration{}
	}

	// Calculate pagination metadata
	totalPages := 0
	if perPage > 0 && total > 0 {
		totalPages = (total + perPage - 1) / perPage
	}

	from := uint(0)
	to := uint(0)
	if total > 0 {
		from = uint(start + 1)
		to = uint(end)
	}

	// Return paginated response
	c.JSON(http.StatusOK, gin.H{
		"data": paged,
		"meta": gin.H{
			"current_page": uint(page),
			"from":         from,
			"last_page":    uint(totalPages),
			"per_page":     uint(perPage),
			"to":           to,
			"total":        uint(total),
		},
	})
}
