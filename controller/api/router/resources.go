package router

import (
	"protoxon.com/sls/controller/auth"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/server"
	"protoxon.com/sls/controller/software"
)

// Resources holds shared dependencies for an API server.
type Resources struct {
	ServerManager     *server.Manager
	BlueprintRegistry *blueprint.BlueprintRegistry
	MixinRegistry     *blueprint.MixinRegistry
	SoftwareRegistry  *software.Registry
	NodeManager       *node.Manager
	Client            *client.Client
	KeyService        *auth.KeyService
}
