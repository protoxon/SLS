package router

import (
	"context"
	"net/http"

	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/protocube/api/router/httperror"
	"protoxon.com/sls/protocube/api/router/middleware"
	"protoxon.com/sls/protocube/auth/scope"
	"protoxon.com/sls/protocube/config"
	ociregistry "protoxon.com/sls/protocube/registry"
)

// Configure configures the routing infrastructure.
func (r *Router) Configure() *gin.Engine {
	gin.SetMode("release")

	router := gin.New()
	router.Use(gin.Recovery())
	router.Use(middleware.AttachRequestID(), middleware.CaptureErrors(), middleware.SetAccessControlHeaders())
	router.Use(middleware.RateLimiter(), middleware.Timeout())
	router.GET("", postBanner)
	router.GET("/nodes", r.getNodes)

	reg := r.embeddedRegistry()
	v2 := []gin.HandlerFunc{
		middleware.AuthenticateRegistry(r.KeyService),
		middleware.RequireRegistryAccess(),
		gin.WrapH(reg),
	}
	router.Any("/v2", v2...)
	router.Any("/v2/*path", v2...)

	api := router.Group("/api")
	api.Use(middleware.Authenticate(r.KeyService))
	{
		api.GET("/auth", r.getAuth)

		tokens := api.Group("/tokens")
		{
			tokens.GET("", middleware.RequireScope(scope.TokensRead), r.listTokens)
			tokens.POST("", middleware.RequireScope(scope.TokensWrite), r.createToken)
			tokens.GET("/:id", middleware.RequireScope(scope.TokensRead), r.getToken)
			tokens.POST("/:id/revoke", middleware.RequireScope(scope.TokensWrite), r.revokeToken)
			tokens.DELETE("/:id", middleware.RequireScope(scope.TokensWrite), r.deleteToken)
		}

		api.GET("/registry", middleware.RequireScope(scope.RegistryRead), getDefaultRegistry)
		api.GET("/system", middleware.RequireScope(scope.AppAdmin), getSystemInformation)
		api.GET("/servers", middleware.RequireScope(scope.ServersRead), r.getAllServers)
		api.POST("/servers", middleware.RequireScope(scope.ServersWrite), r.postCreateServer)
		api.GET("/blueprints", middleware.RequireScope(scope.BlueprintsRead), r.getAllBlueprints)
		api.POST("/blueprints/reload", middleware.RequireScope(scope.BlueprintsWrite), r.postReloadBlueprints)
		api.GET("/mixins", middleware.RequireScope(scope.BlueprintsRead), r.getAllMixins)
		api.POST("/software/reload", middleware.RequireScope(scope.BlueprintsWrite), r.postReloadSoftware)
		api.GET("/events", middleware.RequireScope(scope.EventsRead), r.getEventStream)
		api.GET("/events/ws", middleware.RequireScope(scope.EventsRead), r.getServerWebsocket)
		api.GET("/nodes", middleware.RequireScope(scope.NodesRead), r.getAllNodes)
	}

	blueprintGroup := router.Group("/api/blueprints/:blueprint")
	blueprintGroup.Use(
		middleware.Authenticate(r.KeyService),
		middleware.RequireAnyScope(scope.Node, scope.BlueprintsRead),
		middleware.BlueprintExists(r.BlueprintRegistry),
	)
	{
		blueprintGroup.GET("", getBlueprint)
	}

	mixinGroup := router.Group("/api/mixins/:mixin")
	mixinGroup.Use(
		middleware.Authenticate(r.KeyService),
		middleware.RequireAnyScope(scope.Node, scope.BlueprintsRead),
		middleware.MixinExists(r.MixinRegistry),
	)
	{
		mixinGroup.GET("", getMixin)
	}

	server := router.Group("/api/servers/:server")
	server.Use(middleware.Authenticate(r.KeyService), middleware.ServerExists(r.ServerManager))
	{
		server.GET("", middleware.RequireScope(scope.ServersRead), getServer)
		server.DELETE("", middleware.RequireScope(scope.ServersWrite), deleteServer)
		server.GET("/logs", middleware.RequireScope(scope.ServersRead), getServerLogs)
		server.POST("/power", middleware.RequireScope(scope.ServersWrite), postServerPower)
		server.GET("/status", middleware.RequireScope(scope.ServersRead), getServerStatus)
		server.GET("/stats", middleware.RequireScope(scope.ServersRead), getServerStats)
		server.POST("/commands", middleware.RequireScope(scope.ServersWrite), postServerCommands)
		server.POST("/reset", middleware.RequireScope(scope.ServersWrite), postServerReset)
		server.GET("/install/logs", middleware.RequireScope(scope.ServersRead), getServerInstallLogs)
		server.GET("/install", middleware.RequireScope(scope.ServersRead), getServerInstallInfo)
		server.POST("/reinstall", middleware.RequireScope(scope.ServersWrite), postServerReinstall)
	}

	registration := router.Group("/api/nodes/:node")
	registration.Use(middleware.Authenticate(r.KeyService), middleware.RequireScope(scope.Node))
	registration.POST("/register", r.postNodeRegister)

	node := router.Group("/api/nodes/:node")
	node.Use(middleware.Authenticate(r.KeyService), middleware.NodeExists(r.NodeManager))
	{
		node.GET("", middleware.RequireScope(scope.NodesRead), getNode)
		node.GET("/system", middleware.RequireScope(scope.NodesRead), getNodeSystemInfo)
		node.PATCH("/drained", middleware.RequireScope(scope.NodesWrite), toggleNodeDrained)
	}

	internal := router.Group("/api/nodes/:node/internal")
	internal.Use(middleware.Authenticate(r.KeyService), middleware.RequireScope(scope.Node), middleware.NodeExists(r.NodeManager))
	internal.POST("/heartbeat", postNodeHeartbeat)
	internal.POST("/disconnect", r.postNodeDisconnect)
	internal.GET("/registry", getNodeRegistry)
	internal.GET("/servers", r.getAllServerConfigurations)

	nodeServer := internal.Group("/servers/:server")
	nodeServer.Use(middleware.ServerExists(r.ServerManager))
	nodeServer.GET("", r.getServerConfiguration)
	nodeServer.GET("/install", r.getInstallInfo)

	event := internal.Group("/event/servers/:server")
	event.Use(middleware.ServerExists(r.ServerManager))
	{
		event.POST("/status", postNodeServerStatus)
		event.POST("/install-status", postNodeServerInstallStatus)
		event.POST("/crash", postEventServerCrash)
		event.POST("/deleted", postEventServerDeleted)
	}

	router.NoRoute(func(c *gin.Context) {
		httperror.JSON(c, http.StatusNotFound, "no matching route", "The requested resource does not exist.")
	})
	router.NoMethod(func(c *gin.Context) {
		httperror.JSON(c, http.StatusMethodNotAllowed, "method not allowed for route", "Method not allowed.")
	})

	return router
}

func (r *Router) embeddedRegistry() http.Handler {
	root := ""
	if cfg := config.Get(); cfg != nil {
		root = cfg.Registry.StoragePath()
	}
	reg, err := ociregistry.New(context.Background(), root)
	if err != nil {
		log.WithError(err).Error("failed to start embedded registry")
		panic(err)
	}
	return reg
}
