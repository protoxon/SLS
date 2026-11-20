package plugins

import (
	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/blueprint"
)

// CONTROLLER PLUGIN API

// SLS is the plugin context that gets passes to plugins for accessing data from controller
type SLS struct {
	Logger            *log.Entry
	BlueprintRegistry *blueprint.BlueprintRegistry
	Router            *gin.Engine
	PluginsDir        string
}

type Plugin interface {
	Name() string
	Authors() string
	Description() string
	Version() string

	OnEnable(sls *SLS) error
	OnDisable() error
}
