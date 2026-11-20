package router

import (
	"encoding/json"
	"errors"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
	"protoxon.com/sls/controller/api/router/middleware"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/server"
	snaps "protoxon.com/sls/controller/snapshot"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/httperror"
)

func (r *Router) postCreateServer(c *gin.Context) {
	var req models.CreateServerRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		httperror.AbortWithJSON(c, http.StatusUnprocessableEntity, err.Error(), "The data provided in the request could not be validated.")
		return
	}

	bp := r.BlueprintRegistry.Get(req.BlueprintID)
	if bp == nil {
		httperror.AbortWithJSON(c, http.StatusNotFound, "no blueprint with id "+req.BlueprintID, "Blueprint not found.")
		return
	}

	created, err := r.ServerManager.CreateServer(c.Request.Context(), bp, r.SoftwareRegistry, req.NodeId, req.Overrides, req.SnapshotIDs)
	if err != nil {
		var place *server.PlaceError
		if errors.As(err, &place) {
			httperror.JSON(c, place.Status, place.Error(), place.Hint)
			return
		}
		client.HandleError(c, err)
		return
	}
	c.JSON(http.StatusAccepted, created.ServerData())
}

func (r *Router) postCreateSnapshot(c *gin.Context) {
	s := middleware.ExtractServer(c)
	var req api.CreateSnapshotRequest
	if c.Request.ContentLength > 0 {
		if err := c.ShouldBindJSON(&req); err != nil {
			httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
			return
		}
	}
	watch := c.Query("watch") == "true"
	rec, err := r.ServerManager.CreateSnapshot(c.Request.Context(), s.Id(), req)
	if err != nil && rec.ID == "" {
		writeSnapshotError(c, err)
		return
	}
	if watch {
		r.watchSnapshot(c, rec)
		return
	}
	if err != nil {
		writeSnapshotError(c, err)
		return
	}
	c.JSON(http.StatusAccepted, rec.View())
}

func (r *Router) listSnapshots(c *gin.Context) {
	rows, err := snaps.List()
	if err != nil {
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "Failed to list snapshots.")
		return
	}
	out := make([]api.Snapshot, 0, len(rows))
	for i := range rows {
		out = append(out, rows[i].View())
	}
	c.JSON(http.StatusOK, out)
}

func (r *Router) getSnapshot(c *gin.Context) {
	rec, err := snaps.Resolve(c.Param("snapshot"))
	if snapshotResolveError(c, err) {
		return
	}
	c.JSON(http.StatusOK, rec.View())
}

func (r *Router) deleteSnapshot(c *gin.Context) {
	rec, err := snaps.Resolve(c.Param("snapshot"))
	if snapshotResolveError(c, err) {
		return
	}
	id := rec.ID
	force := c.Query("force") == "true"
	err = snaps.Remove(r.registry, id, force, r.ServerManager.SnapshotInUse(id))
	if err != nil {
		switch {
		case errors.Is(err, snaps.ErrInUse):
			httperror.JSON(c, http.StatusConflict, err.Error(), "Stop or delete servers that use this snapshot first.")
		case errors.Is(err, snaps.ErrStillCreating):
			httperror.JSON(c, http.StatusConflict, err.Error(), "Wait until the snapshot finishes, or force-delete it.")
		case errors.Is(err, gorm.ErrRecordNotFound):
			httperror.JSON(c, http.StatusNotFound, "snapshot not found", "No snapshot with that id exists.")
		default:
			httperror.JSON(c, http.StatusBadGateway, err.Error(), "Failed to delete the snapshot from the registry.")
		}
		return
	}
	c.Status(http.StatusNoContent)
}

func (r *Router) postSnapshotProgress(c *gin.Context) {
	var ev api.SnapshotProgress
	if err := c.ShouldBindJSON(&ev); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}
	if ev.ID == "" {
		ev.ID = c.Param("snapshot")
	}
	rec, err := snaps.ApplyProgress(ev)
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			httperror.JSON(c, http.StatusNotFound, "snapshot not found", "No snapshot with that id exists.")
			return
		}
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "Failed to record snapshot progress.")
		return
	}
	if rec.Status == models.SnapshotReady {
		if node := middleware.ExtractNode(c); node != nil && rec.OriginNode == node.Id() {
			node.AddSnapshot(rec.ID)
		}
	}
	if rec.Status == models.SnapshotDeleting && ev.Phase == api.SnapshotPhaseReady {
		_ = snaps.Remove(r.registry, rec.ID, true, false)
	}
	c.JSON(http.StatusOK, gin.H{"status": rec.Status})
}

func (r *Router) postNodeSnapshots(c *gin.Context) {
	var body api.SnapshotIDs
	if err := c.ShouldBindJSON(&body); err != nil {
		httperror.JSON(c, http.StatusBadRequest, err.Error(), "Invalid request body.")
		return
	}
	node := middleware.ExtractNode(c)
	node.SetSnapshotIDs(body.IDs)
	if err := snaps.NoteReported(node.Id(), body.IDs); err != nil {
		httperror.JSON(c, http.StatusInternalServerError, err.Error(), "Failed to record snapshot cache.")
		return
	}
	c.Status(http.StatusOK)
}

func (r *Router) watchSnapshot(c *gin.Context, rec models.OverlaySnapshotRecord) {
	sub := snaps.Subscribe(rec.ID)
	defer snaps.Unsubscribe(rec.ID, sub)
	c.Header("Content-Type", "application/x-ndjson")
	c.Header("X-Content-Type-Options", "nosniff")
	c.Header("Transfer-Encoding", "chunked")
	c.Status(http.StatusOK)
	flush := func(ev api.SnapshotProgress) bool {
		if ev.ID == "" {
			ev.ID = rec.ID
		}
		if err := json.NewEncoder(c.Writer).Encode(ev); err != nil {
			return false
		}
		c.Writer.Flush()
		return ev.Phase != api.SnapshotPhaseReady && ev.Phase != api.SnapshotPhaseFailed
	}
	current := rec
	if latest, err := snaps.Get(rec.ID); err == nil {
		current = latest
	}
	ev := api.SnapshotProgress{ID: current.ID, Phase: current.Phase, Error: current.Error}
	if current.Status == models.SnapshotFailed {
		ev.Phase = api.SnapshotPhaseFailed
	}
	if current.Status == models.SnapshotReady {
		ev.Phase = api.SnapshotPhaseReady
	}
	if !flush(ev) {
		return
	}
	ticker := time.NewTicker(15 * time.Second)
	defer ticker.Stop()
	for {
		select {
		case <-c.Request.Context().Done():
			return
		case ev := <-sub:
			if !flush(ev) {
				return
			}
		case <-ticker.C:
			current, err := snaps.Get(rec.ID)
			if err != nil {
				return
			}
			ev := api.SnapshotProgress{ID: current.ID, Phase: current.Phase, Error: current.Error}
			if current.Status == models.SnapshotFailed {
				ev.Phase = api.SnapshotPhaseFailed
			}
			if !flush(ev) {
				return
			}
		}
	}
}

func snapshotResolveError(c *gin.Context, err error) bool {
	if err == nil {
		return false
	}
	if errors.Is(err, snaps.ErrNotFound) {
		httperror.JSON(c, http.StatusNotFound, "snapshot not found", "No snapshot with that id or tag exists.")
		return true
	}
	httperror.JSON(c, http.StatusInternalServerError, err.Error(), "Failed to load snapshot.")
	return true
}

func writeSnapshotError(c *gin.Context, err error) {
	var place *server.PlaceError
	if errors.As(err, &place) {
		httperror.JSON(c, place.Status, place.Error(), place.Hint)
		return
	}
	client.HandleError(c, err)
}
