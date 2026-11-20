package router

import (
	"net/http"
	"sort"
	"strconv"
	"strings"

	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/api/router/middleware"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/controller/system"
	"protoxon.com/sls/internal/events"
	"protoxon.com/sls/internal/httperror"
)

func (r *Router) getAllBlueprints(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	perPage, _ := strconv.Atoi(c.DefaultQuery("per_page", "50"))

	if page < 1 {
		page = 1
	}
	if perPage < 1 {
		perPage = 20
	}

	// If only meta requested, paginate meta list
	items := make([]*blueprint.Blueprint, 0)
	if c.Query("meta") == "true" {
		//items = r.BlueprintRegistry.AllMeta()
	} else {
		items = r.BlueprintRegistry.All()
	}

	total := len(items)
	start := (page - 1) * perPage
	end := start + perPage
	if start > total {
		start = total
	}
	if end > total {
		end = total
	}

	paged := items[start:end]

	totalPages := 0
	if perPage > 0 && total > 0 {
		totalPages = (total + perPage - 1) / perPage
	}

	c.JSON(http.StatusOK, gin.H{
		"meta": gin.H{
			"pagination": gin.H{
				"total":        total,
				"per_page":     perPage,
				"current_page": page,
				"total_pages":  totalPages,
			},
		},
		"data": paged,
	})
}

func getBlueprint(c *gin.Context) {
	bp := middleware.ExtractBlueprint(c)
	c.JSON(http.StatusOK, bp)
}

func (r *Router) getAllMixins(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	perPage, _ := strconv.Atoi(c.DefaultQuery("per_page", "50"))

	if page < 1 {
		page = 1
	}
	if perPage < 1 {
		perPage = 20
	}

	items := make([]*blueprint.Mixin, 0)
	if c.Query("meta") == "true" {
		// items = r.MixinRegistry.AllMeta()
	} else if r.MixinRegistry != nil {
		items = r.MixinRegistry.All()
	}

	total := len(items)
	start := (page - 1) * perPage
	end := start + perPage
	if start > total {
		start = total
	}
	if end > total {
		end = total
	}

	paged := items[start:end]

	totalPages := 0
	if perPage > 0 && total > 0 {
		totalPages = (total + perPage - 1) / perPage
	}

	c.JSON(http.StatusOK, gin.H{
		"meta": gin.H{
			"pagination": gin.H{
				"total":        total,
				"per_page":     perPage,
				"current_page": page,
				"total_pages":  totalPages,
			},
		},
		"data": paged,
	})
}

func getMixin(c *gin.Context) {
	m := middleware.ExtractMixin(c)
	c.JSON(http.StatusOK, m)
}

func (r *Router) getAllSoftware(c *gin.Context) {
	page, _ := strconv.Atoi(c.DefaultQuery("page", "1"))
	perPage, _ := strconv.Atoi(c.DefaultQuery("per_page", "50"))

	if page < 1 {
		page = 1
	}
	if perPage < 1 {
		perPage = 20
	}

	items := make([]*software.Software, 0)
	if r.SoftwareRegistry != nil {
		items = r.SoftwareRegistry.All()
	}
	sort.Slice(items, func(i, j int) bool {
		return items[i].Id < items[j].Id
	})

	total := len(items)
	start := (page - 1) * perPage
	end := start + perPage
	if start > total {
		start = total
	}
	if end > total {
		end = total
	}

	paged := items[start:end]

	totalPages := 0
	if perPage > 0 && total > 0 {
		totalPages = (total + perPage - 1) / perPage
	}

	c.JSON(http.StatusOK, gin.H{
		"meta": gin.H{
			"pagination": gin.H{
				"total":        total,
				"per_page":     perPage,
				"current_page": page,
				"total_pages":  totalPages,
			},
		},
		"data": paged,
	})
}

func getSoftware(c *gin.Context) {
	s := middleware.ExtractSoftware(c)
	c.JSON(http.StatusOK, s)
}

func (r *Router) getInstallationScript(c *gin.Context) {
	s := middleware.ExtractServer(c)
	if s.InstallScript == nil {
		httperror.AbortWithJSON(c, http.StatusInternalServerError, "install script is missing", "Server install script is missing.")
		return
	}
	c.JSON(http.StatusOK, s.InstallScript)
}

// Returns all servers. node_id limits the list to one node.
func (r *Router) getAllServers(c *gin.Context) {
	servers := r.ServerManager.All()
	if nodeID := strings.TrimSpace(c.Query("node_id")); nodeID != "" {
		if _, ok := r.NodeManager.Get(nodeID); !ok {
			httperror.AbortWithJSON(c, http.StatusNotFound, "resource not found", "The requested resource does not exist on this instance.")
			return
		}
		servers = r.ServerManager.ServersByNode(nodeID)
	}

	// If ids_only query parameter is set, return only the IDs
	if c.Query("ids_only") == "true" {
		ids := make([]string, len(servers))
		for i, v := range servers {
			ids[i] = v.Id()
		}
		c.JSON(http.StatusOK, ids)
		return
	}

	out := make([]models.ServerData, len(servers))
	for i, v := range servers {
		out[i] = v.ServerData()
	}
	c.JSON(http.StatusOK, out)
}

func (r *Router) getAllNodes(c *gin.Context) {
	nodes := r.NodeManager.GetNodes()

	// If ids_only query parameter is set, return only the IDs
	if c.Query("ids_only") == "true" {
		ids := make([]string, len(nodes))
		for i, v := range nodes {
			ids[i] = v.Id()
		}
		c.JSON(http.StatusOK, ids)
		return
	}

	out := make([]models.NodeData, len(nodes))
	for i, n := range nodes {
		out[i] = models.NodeData{
			ID:       n.Id(),
			Name:     n.Name(),
			Location: n.Location(),
			URL:      n.Url(),
			Drained:  n.Drained(),
		}
	}
	c.JSON(http.StatusOK, out)
}

// getDefaultRegistry returns the configured default registry host or host/namespace
// and whether clients should use HTTP for it. It does not include pull credentials.
func getDefaultRegistry(c *gin.Context) {
	def := ""
	insecure := false
	if cfg := config.Get(); cfg != nil {
		def = cfg.Registry.Default
		insecure = cfg.Registry.Insecure
	}
	c.JSON(http.StatusOK, gin.H{"default": def, "insecure": insecure})
}

// Returns information about the system that controller is running on.
func getSystemInformation(c *gin.Context) {
	i, err := system.GetSystemInformation()
	if err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}
	c.JSON(http.StatusOK, i)
}

type blueprintReloadResponse struct {
	Blueprints int                   `json:"blueprints"`
	Mixins     int                   `json:"mixins"`
	Errors     []blueprint.LoadError `json:"errors"`
}

type softwareReloadResponse struct {
	Software int                  `json:"software"`
	Errors   []software.LoadError `json:"errors"`
}

// reloadErrors returns errs, or an empty slice when errs is nil, so the JSON
// body always contains "errors": [] rather than null.
func reloadErrors[T any](errs []T) []T {
	if errs == nil {
		return []T{}
	}
	return errs
}

func (r *Router) postReloadSoftware(c *gin.Context) {
	loaded, err := software.LoadAllSoftware(config.Get().System.Software)
	if err != nil {
		log.WithError(err).Error("failed to load software configurations")
		httperror.AbortWithJSON(c, http.StatusInternalServerError, err.Error(), "Failed to reload software.")
		return
	}
	r.SoftwareRegistry.ReplaceAll(loaded.Software)
	log.WithField("root", config.Get().System.Software).Infof("Loaded %d software configurations.", len(loaded.Software))
	r.pushVolumeRetain(c.Request.Context())
	c.JSON(http.StatusOK, softwareReloadResponse{
		Software: len(loaded.Software),
		Errors:   reloadErrors(loaded.Errors),
	})
}

func (r *Router) postReloadBlueprints(c *gin.Context) {
	loaded, err := blueprint.SyncAndLoadConfigured(true, r.SoftwareRegistry)
	if err != nil {
		log.WithError(err).Error("failed to reload blueprints")
		httperror.AbortWithJSON(c, http.StatusInternalServerError, err.Error(), "Failed to reload blueprints.")
		return
	}
	if r.MixinRegistry != nil {
		r.MixinRegistry.ReplaceAll(loaded.Mixins)
	}
	r.BlueprintRegistry.ReplaceAll(loaded.Blueprints)
	log.WithField("root", config.Get().System.Blueprints).
		Infof("Reloaded registries. Loaded %d blueprints and %d mixins", len(loaded.Blueprints), len(loaded.Mixins))
	r.pushVolumeRetain(c.Request.Context())
	c.JSON(http.StatusOK, blueprintReloadResponse{
		Blueprints: len(loaded.Blueprints),
		Mixins:     len(loaded.Mixins),
		Errors:     reloadErrors(loaded.Errors),
	})
}

// The event stream streams global events for all server events
func (r *Router) getEventStream(c *gin.Context) {
	log.Info("opened event stream")
	// SSE headers
	c.Writer.Header().Set("Content-Type", "text/event-stream")
	c.Writer.Header().Set("Cache-Control", "no-cache")
	c.Writer.Header().Set("Connection", "keep-alive")
	c.Writer.Header().Set("Access-Control-Allow-Origin", "*")

	flusher, ok := c.Writer.(http.Flusher)
	if !ok {
		c.String(http.StatusInternalServerError, "Streaming unsupported")
		return
	}

	// Create a sink channel for this client
	// Allow 32 buffered events
	// If the buffer is full the sink pool
	// will drop the oldest message
	ch := make(chan []byte, 32)

	// Subscribe to the global event bus
	r.ServerManager.Events().On(ch)

	// Unsubscribe when client disconnects
	defer r.ServerManager.Events().Off(ch)

	// Stream events until client closes connection
	for {
		select {
		case <-c.Request.Context().Done():
			log.Info("stream closed")
			return

		case data := <-ch:
			// Decode event
			ev := events.MustDecode(data)

			// Write SSE payload
			_, _ = c.Writer.Write([]byte("event: " + ev.Topic + "\n"))
			_, _ = c.Writer.Write([]byte("data: " + string(data) + "\n\n"))

			flusher.Flush()
		}
	}
}
