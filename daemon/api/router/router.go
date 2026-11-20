package router

import (
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/daemon/api/router/middleware"
)

// Configure configures the routing infrastructure.
func (r *Router) Configure() *gin.Engine {
	gin.SetMode("release")

	router := gin.New()
	router.Use(gin.Recovery())

	router.Use(middleware.AttachRequestID(), middleware.CaptureErrors(), middleware.SetAccessControlHeaders())

	router.GET("/", postBanner)

	// The console socket is not behind the node bearer token. The caller sends
	// a short-lived JWT as the first auth frame, and a session slot is taken
	// only after that token is accepted.
	router.GET("/api/servers/:server/ws", middleware.ServerExists(r.ServerManager), getServerWebsocket)

	// All the routes beyond this mount will use an authorization middleware
	// and will not be accessible without the correct Authorization header provided.
	protected := router.Use(middleware.RequireAuthorization(r.VerifyToken))

	protected.GET("/api/system", getSystemInformation)
	protected.POST("/api/sync", r.postSync)
	protected.POST("/api/volumes/retain", r.postVolumeRetain)
	protected.GET("/api/servers", r.getAllServers)
	protected.POST("/api/servers", r.postCreateServer)
	protected.DELETE("/api/servers/:server", middleware.ServerForDelete(r.ServerManager), r.deleteServer)

	// These are server specific routes, and require that the request be authorized, and
	// that the server exist on the Daemon.
	server := router.Group("/api/servers/:server")
	server.Use(middleware.RequireAuthorization(r.VerifyToken), middleware.ServerExists(r.ServerManager))
	{
		server.GET("/logs", getServerLogs)
		server.POST("/power", postServerPower)
		server.GET("/status", getServerStatus)
		server.GET("/stats", getServerStats)
		server.POST("/commands", postServerCommands)
		server.POST("/reset", postServerReset)
		server.GET("/install/logs", getServerInstallLogs)
		server.GET("/install", getServerInstallInfo)
		server.POST("/reinstall", postServerReinstall)
		server.POST("/snapshots", postServerSnapshot)
		//server.POST("/sync", postServerSync)
		//server.POST("/ws/deny", postServerDenyWSTokens)
	}

	return router
}
