package router

import (
	"context"
	"net/http"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/daemon/api/router/middleware"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/daemon/oras/store"
	"protoxon.com/sls/daemon/server"
	"protoxon.com/sls/daemon/system"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/httperror"
)

func (r *Router) postCreateServer(c *gin.Context) {
	// Parse incoming JSON body
	var req models.ServerConfiguration
	if err := c.ShouldBindJSON(&req); err != nil {
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "Invalid request body.")
		return
	}

	// create the server
	s, err := r.ServerManager.InitServer(c.Request.Context(), req)
	if err != nil {
		log.WithError(err).WithField("server_id", req.Id).Error("failed to create server")
		if errors.Is(err, store.ErrNotFound) {
			httperror.JSON(c, http.StatusConflict, err.Error(), "volume reference not found")
			return
		}
		if code, ok := store.RegistryStatus(err); ok {
			hint := ""
			if code >= http.StatusInternalServerError {
				hint = "volume registry unreachable"
			}
			httperror.JSON(c, code, err.Error(), hint)
			return
		}
		if errors.Is(err, store.ErrUnauthorized) {
			httperror.JSON(c, http.StatusUnauthorized, err.Error(), "registry authentication failed")
			return
		}
		if errors.Is(err, store.ErrResolve) {
			httperror.JSON(c, http.StatusBadGateway, err.Error(), "volume registry unreachable")
			return
		}
		if errors.Is(err, server.ErrServerFolderNotFound) {
			httperror.JSON(c, http.StatusConflict, err.Error(), "The specified path to the server directory does not exist on this node.")
			return
		}
		if errors.Is(err, server.ErrInvalidServerConfig) {
			httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid server configuration.")
			return
		}
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "")
		return
	}

	c.Status(http.StatusOK)

	// Pass the actual heavy processing off to a separate thread to handle so that
	// we can immediately return a response from the server. Some of these actions
	// can take quite some time, especially stopping or restarting.
	go startNewServer(s)
}

// startNewServer starts a server that was just created. If the controller no
// longer knows the server, the create reached this node after the controller
// gave up on it, so nothing owns this copy and it is deleted.
func startNewServer(s *server.Server) {
	action := server.PowerAction(server.PowerActionStart)
	err := s.HandlePowerAction(action, 0)
	switch {
	case err == nil, errors.Is(err, server.ErrIsRunning):
	case errors.Is(err, context.DeadlineExceeded):
		s.Log().WithField("action", action).WithField("error", err).Warn("could not process server power action")
	case server.IsServerDoesNotExistError(err):
		s.Log().Warn("server was removed from the controller before it started, deleting it")
		if err := s.Delete(); err != nil {
			s.Log().WithField("error", err).Error("failed to delete server the controller does not know")
		}
	default:
		s.Log().WithFields(log.Fields{"action": action, "wait_seconds": 0, "error": err}).
			Error("encountered error processing a server power action in the background")
	}
}

func postServerSnapshot(c *gin.Context) {
	s := middleware.ExtractServer(c)
	var req api.CreateSnapshotRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}
	if err := s.StartSnapshot(req); err != nil {
		switch {
		case errors.Is(err, server.ErrSnapshotCommands):
			httperror.JSON(c, http.StatusConflict, err.Error(), "Start the server before using snapshot commands.")
		case errors.Is(err, server.ErrSnapshotRunning):
			httperror.JSON(c, http.StatusConflict, err.Error(), "A snapshot of this server is already in progress.")
		default:
			httperror.JSON(c, http.StatusInternalServerError, err.Error(), "Failed to start snapshot.")
		}
		return
	}
	c.JSON(http.StatusAccepted, gin.H{"id": req.ID, "status": api.SnapshotCreating})
}

// Returns all the servers that are registered and configured correctly on
// this daemon instance.
func (r *Router) getAllServers(c *gin.Context) {
	servers := r.ServerManager.All()
	out := make([]server.APIResponse, len(servers), len(servers))
	for i, v := range servers {
		out[i] = v.ToAPIResponse()
	}
	c.JSON(http.StatusOK, out)
}

// Returns information about the system that the daemon is running on.
func getSystemInformation(c *gin.Context) {
	i, err := system.GetSystemInformation()
	if err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}
	c.JSON(http.StatusOK, i)
}

// Syncs the daemons servers with Controller
func (r *Router) postSync(c *gin.Context) {
	err := r.ServerManager.Sync(c.Request.Context())
	if err != nil {
		log.WithError(err).Error("failed to sync server configurations")
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "failed to sync server configurations")
		return
	}
	c.Status(http.StatusOK)
}

// postVolumeRetain saves the blueprint artifact list and runs volume cleanup.
func (r *Router) postVolumeRetain(c *gin.Context) {
	var req struct {
		Artifacts []string `json:"artifacts"`
	}
	if err := c.ShouldBindJSON(&req); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}
	if req.Artifacts == nil {
		req.Artifacts = []string{}
	}
	st := r.ServerManager.VolumeStore()
	if st == nil {
		httperror.JSON(c, http.StatusInternalServerError, "volume store is not configured", "failed to save volume retain list")
		return
	}
	if err := st.SaveRetain(req.Artifacts); err != nil {
		log.WithError(err).Error("failed to save volume retain list")
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "failed to save volume retain list")
		return
	}
	if err := st.GC(); err != nil {
		log.WithError(err).Warn("failed to clean unused volumes")
	}
	c.Status(http.StatusNoContent)
}
