package cmd

import (
	"context"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/apex/log"
	"github.com/spf13/cobra"
	"protoxon.com/sls/controller/api"
	"protoxon.com/sls/controller/api/router"
	"protoxon.com/sls/controller/auth"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/plugins"
	"protoxon.com/sls/controller/server"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/controller/telemetry"
)

// StartOptions controls controller startup after Prepare has loaded config.
type StartOptions struct {
	// TelemetryEnabled reports whether outbound telemetry should run.
	TelemetryEnabled bool
}

// Running is a controller that has bound its API and is ready for nodes.
type Running struct {
	Keys *auth.KeyService

	cancel  context.CancelFunc
	api     *api.Api
	servers *server.Manager
}

func run(cmd *cobra.Command, _ []string) {
	parent := cmd.Context()
	if parent == nil {
		parent = context.Background()
	}
	ctx, stop := signal.NotifyContext(parent, os.Interrupt, syscall.SIGTERM, syscall.SIGHUP)
	defer stop()

	running, err := Start(ctx, StartOptions{
		TelemetryEnabled: ResolveTelemetryEnabled(cmd),
	})
	if err != nil {
		log.WithError(err).Fatal("failed to start controller")
	}
	<-ctx.Done()
	if err := running.Stop(context.Background()); err != nil {
		log.WithError(err).Error("controller shutdown failed")
	}
}

// Start builds the controller and returns once its API is listening.
// The returned Running is stopped with Stop. Start does not install a signal handler.
func Start(ctx context.Context, opts StartOptions) (*Running, error) {
	if ctx == nil {
		ctx = context.Background()
	}
	runCtx, cancel := context.WithCancel(ctx)

	log.Debug("running in debug mode")
	log.WithField("config_file", config.Path).Info("loading configuration from file")

	if err := config.ConfigureDirectories(); err != nil {
		cancel()
		log.WithError(err).Fatal("failed to configure directories")
	}

	// Initialize the internal sqlite database
	err := database.Initialize()
	if err != nil {
		cancel()
		log.WithError(err).Fatal("failed to initialize database")
	}

	// Create the remote client
	remoteClient := client.New()
	// Create the node manager
	nodeManager := node.NewManager(remoteClient)
	// Create the server manager
	serverManager, err := server.NewManager(nodeManager)
	if err != nil {
		cancel()
		log.Fatal(err.Error())
	}

	// Wire up node connection callbacks to attach/detach node clients on servers
	nodeManager.SetOnNodeRegistered(func(nodeId string, node *node.Node) {
		serverManager.AttachNodeClientToServers(nodeId, node)
	})
	nodeManager.SetOnNodeDisconnected(func(nodeId string, timedOut bool) {
		// A heartbeat timeout already waited. A clean close keeps the last
		// status briefly so a daemon restart does not block joins.
		if timedOut {
			serverManager.DetachNodeClientFromServers(nodeId)
			return
		}
		serverManager.DeferUnknownStatus(nodeId)
	})

	// Initialize the api key service
	keyService := auth.NewKeyService()

	// =========================================================
	// Initialize the software configurations
	// =========================================================
	softwareRegistry := software.NewRegistry()
	sw, err := software.LoadAllSoftware(config.Get().System.Software)
	if err != nil {
		cancel()
		log.WithError(err).Fatal("failed to load software configurations")
	}
	softwareRegistry.RegisterAll(sw.Software)
	log.WithField("root", config.Get().System.Software).Infof("Loaded %d software configurations.", len(sw.Software))

	// =========================================================
	// Initialize blueprint and mixin registries
	// =========================================================
	mixinRegistry := blueprint.NewMixinRegistry()
	blueprintRegistry := blueprint.NewBlueprintRegistry()
	loaded, err := blueprint.SyncAndLoadConfigured(false, softwareRegistry)
	if err != nil {
		cancel()
		log.WithError(err).Fatal("failed to load blueprints")
	}
	mixinRegistry.RegisterAll(loaded.Mixins)
	blueprintRegistry.RegisterAll(loaded.Blueprints)
	log.WithField("root", config.Get().System.Blueprints).
		Infof("Initialized registries. Loaded %d blueprints and %d mixins", len(loaded.Blueprints), len(loaded.Mixins))

	// =========================================================
	// Configure the api
	// =========================================================
	apiInstance := api.New(&router.Resources{
		ServerManager:     serverManager,
		BlueprintRegistry: blueprintRegistry,
		MixinRegistry:     mixinRegistry,
		SoftwareRegistry:  softwareRegistry,
		NodeManager:       nodeManager,
		Client:            remoteClient,
		KeyService:        keyService,
	})

	// =========================================================
	// Load Plugins
	// =========================================================
	err = plugins.LoadPlugins(&plugins.SLS{
		BlueprintRegistry: blueprintRegistry,
		Router:            apiInstance.Router.Handler,
		PluginsDir:        config.Get().System.Plugins,
	})
	if err != nil {
		log.Error("Failed to load plugins")
	}

	if opts.TelemetryEnabled {
		telemetry.Start(runCtx, serverManager, nodeManager, 5*time.Minute)
	} else {
		log.Info("Outbound telemetry is disabled.")
	}

	apiInstance.Run() // returns once the listener is bound
	return &Running{
		Keys:    keyService,
		cancel:  cancel,
		api:     apiInstance,
		servers: serverManager,
	}, nil
}

// Stop halts telemetry, plugins, the API, and background server work. It does
// not wait for a signal.
func (r *Running) Stop(context.Context) error {
	if r == nil {
		return nil
	}
	log.Info("Shutting down.")
	if r.cancel != nil {
		r.cancel()
	}
	plugins.DisableAll()
	if r.api != nil {
		r.api.Stop()
	}
	if r.servers != nil {
		r.servers.Close()
	}
	return nil
}
