package cmd

import (
	"context"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/apex/log"
	"github.com/spf13/cobra"
	"protoxon.com/sls/daemon/api"
	"protoxon.com/sls/daemon/api/auth"
	"protoxon.com/sls/daemon/api/router"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/daemon/environment/docker"
	"protoxon.com/sls/daemon/internal/database"
	orasclient "protoxon.com/sls/daemon/oras/client"
	"protoxon.com/sls/daemon/remote"
	"protoxon.com/sls/daemon/server"
	"protoxon.com/sls/daemon/system"
)

// Running is a daemon that has bound its API and is talking to a controller.
type Running struct {
	cancel context.CancelFunc
	api    *api.Api
	client remote.Client
}

func run(cmd *cobra.Command, _ []string) {
	parent := cmd.Context()
	if parent == nil {
		parent = context.Background()
	}
	ctx, stop := signal.NotifyContext(parent, os.Interrupt, syscall.SIGTERM, syscall.SIGHUP)
	defer stop()

	running, err := Start(ctx)
	if err != nil {
		log.WithError(err).Fatal("failed to start daemon")
	}
	<-ctx.Done()
	if err := running.Stop(context.Background()); err != nil {
		log.WithError(err).Error("daemon shutdown failed")
	}
}

// Start builds the daemon and returns once its API is listening.
// Registration and heartbeats begin immediately. Start does not install a signal handler.
func Start(ctx context.Context) (*Running, error) {
	if ctx == nil {
		ctx = context.Background()
	}
	runCtx, cancel := context.WithCancel(ctx)

	log.Debug("running in debug mode")
	log.WithField("config_file", config.Path).Info("loading configuration from file")

	if err := config.EnsureSLSUser(); err != nil {
		cancel()
		log.WithField("error", err).Fatal("failed to create sls system user")
	}

	log.WithFields(log.Fields{
		"username": config.Get().System.Username,
		"uid":      config.Get().System.User.Uid,
		"gid":      config.Get().System.User.Gid,
	}).Info("configured system user successfully")
	if err := config.EnableLogRotation(); err != nil {
		cancel()
		log.WithField("error", err).Fatal("failed to configure log rotation on the system")
	}

	// =========================================================
	// create a client for making requests to the remote api
	// =========================================================
	client := remote.NewFromConfig()

	// create a server manager instance
	manager := server.NewManager(client)
	client.SetVolumeStore(manager.VolumeStore())
	sampler := system.NewSampler(config.Get().System.RootDirectory, manager.CgroupSamples)
	system.UseSampler(sampler)
	sampler.Sample()
	go sampler.Start(runCtx.Done())

	// Register the on connected callback
	// This is called when the node successfully connects to Controller
	// When connected sync server configurations
	orasclient.SetRefreshCredentials(func(ctx context.Context) error {
		return client.SyncRegistry(ctx)
	})
	client.SetOnConnected(func(ctx context.Context) {
		// Report the live process state before Sync rebuilds environments.
		// On first boot the manager is empty. On reconnect this clears unknown.
		manager.ReportStates(ctx)
		if err := client.SyncRegistry(ctx); err != nil {
			log.WithError(err).Error("failed to load registry credentials")
		}
		err := manager.Sync(runCtx)
		if err != nil {
			log.WithField("error", err).Fatal("failed to load server configurations")
			return
		}
	})
	client.Start()

	// Servers that failed to load during sync keep their containers, so keep
	// trying to load them.
	go manager.RetryUnloaded(runCtx)

	// Initialize the sqlite database
	err := database.Initialize()
	if err != nil {
		cancel()
		log.WithError(err).Fatal("failed to initialize database")
	}

	// Ensure the Docker network (e.g. sls_nw) exists before starting containers.
	if err := environment.ConfigureDocker(runCtx); err != nil {
		cancel()
		log.WithError(err).Fatal("failed to configure docker environment")
	}

	docker.StartScheduledImagePulls(runCtx)

	// =========================================================
	// Configure and run the api
	// =========================================================
	apiInstance := api.New(&router.Resources{
		ServerManager: manager,
		VerifyToken:   auth.Verify,
	})
	apiInstance.Run()

	ticker := time.NewTicker(time.Minute)
	// Every minute, write the current server states to the disk to allow for a more
	// seamless hard-reboot process in which the daemon will re-sync server states based
	// on its last tracked state.
	// Only servers that persist have their states saved
	go func() {
		defer ticker.Stop()
		for {
			select {
			case <-ticker.C:
				if err := manager.PersistStates(); err != nil {
					log.WithField("error", err).Warn("failed to persist server states to disk")
				}
				if err := manager.CollectVolumes(); err != nil {
					log.WithError(err).Warn("failed to clean unused volumes")
				}
			case <-runCtx.Done():
				return
			}
		}
	}()

	return &Running{
		cancel: cancel,
		api:    apiInstance,
		client: client,
	}, nil
}

// Stop disconnects from the controller and closes the API.
// A cancelled ctx still gets a short timeout so the disconnect request can finish.
func (r *Running) Stop(ctx context.Context) error {
	if r == nil {
		return nil
	}
	if r.cancel != nil {
		r.cancel()
	}
	log.Info("Shutting down.")
	if ctx == nil || ctx.Err() != nil {
		ctx = context.Background()
	}
	stopCtx, cancel := context.WithTimeout(ctx, 2*time.Second)
	defer cancel()
	if r.client != nil {
		r.client.Disconnect(stopCtx)
	}
	if r.api != nil {
		r.api.Stop()
	}
	return nil
}
