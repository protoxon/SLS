package cmd

import (
	"context"
	"fmt"
	log2 "log"
	"os"
	"os/signal"
	"path/filepath"
	"syscall"

	"github.com/apex/log"
	"github.com/spf13/cobra"
	controllercmd "protoxon.com/sls/controller/cmd"
	controllerconfig "protoxon.com/sls/controller/config"
	controllerlog "protoxon.com/sls/controller/log"
	controllercli "protoxon.com/sls/controller/log/cli"
	daemoncmd "protoxon.com/sls/daemon/cmd"
	daemonconfig "protoxon.com/sls/daemon/config"
	daemonlog "protoxon.com/sls/daemon/log"
	daemoncli "protoxon.com/sls/daemon/log/cli"
	"protoxon.com/sls/internal/logcomponent"
	"protoxon.com/sls/internal/message"
	"protoxon.com/sls/run/devconfig"
	"protoxon.com/sls/run/logsplit"
	"protoxon.com/sls/run/supervisor"
	"protoxon.com/sls/run/token"
)

var (
	dev              bool
	devDir           string
	runController    = true
	runDaemon        = true
	controllerConfig string
	daemonConfig     string
	debug            bool
	disableTelemetry bool
	initConfig       bool
)

func init() {
	flags := rootCommand.Flags()
	flags.BoolVar(&dev, "dev", false, "run the controller and a local daemon with generated localhost config")
	flags.StringVar(&devDir, "dev-dir", "", "directory for --dev config and data (default ~/.sls/dev)")
	flags.BoolVar(&runController, "controller", true, "run the controller in this process")
	flags.BoolVar(&runDaemon, "daemon", true, "run a daemon in this process")
	flags.StringVar(&controllerConfig, "controller-config", controllerconfig.Path, "controller config file (ignored with --dev)")
	flags.StringVar(&daemonConfig, "daemon-config", daemonconfig.Path, "daemon config file (ignored with --dev)")
	flags.BoolVar(&debug, "debug", false, "run in debug mode")
	flags.BoolVar(&disableTelemetry, "disable-telemetry", false, "disable outbound controller telemetry")
	flags.BoolVar(&initConfig, "init-config", false, "write default configuration files and exit")
}

// Command is the sls run command. With no subcommand it runs the controller
// and a local daemon together. controller and daemon run one application.
func Command() *cobra.Command {
	return rootCommand
}

var rootCommand = &cobra.Command{
	Use:           "run",
	Short:         "Run the controller and a local daemon in one process.",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          run,
}

func run(cmd *cobra.Command, _ []string) error {
	if dev && (!runController || !runDaemon) {
		log2.Fatal("--dev runs the controller and the daemon together")
	}
	if !runController && !runDaemon {
		log2.Fatal("enable --controller, --daemon, or both")
	}
	if initConfig {
		if dev {
			return fmt.Errorf("--init-config writes the production config files; do not combine it with --dev")
		}
		return writeProductionConfigs()
	}

	var layout devconfig.Layout
	if dev {
		dir := devDir
		if dir == "" {
			var err error
			dir, err = devconfig.DefaultDir()
			if err != nil {
				log2.Fatal(err)
			}
		}
		var err error
		layout, err = devconfig.Ensure(dir)
		if err != nil {
			log2.Fatal(err)
		}
		controllerconfig.Path = layout.ControllerConfig
		daemonconfig.Path = layout.DaemonConfig
	} else {
		if controllerConfig != "" {
			controllerconfig.Path = controllerConfig
		}
		if daemonConfig != "" {
			daemonconfig.Path = daemonConfig
		}
	}

	controllerPrepare, daemonPrepare := prepareOptions(cmd)
	message.Start("")
	if runController {
		if err := controllercmd.Prepare(controllerPrepare); err != nil {
			controllerconfig.ExitOnMissingConfig(err, "run")
			log2.Fatal(err)
		}
	}
	if runDaemon {
		if err := daemoncmd.Prepare(daemonPrepare); err != nil {
			daemonconfig.ExitOnMissingConfig(err, "run")
			log2.Fatal(err)
		}
		// creasty/defaults treats false as unset, so the dev file's
		// enable_log_rotate: false would otherwise load as enabled.
		if dev {
			daemonconfig.Update(func(cfg *daemonconfig.Configuration) {
				cfg.System.EnableLogRotate = false
			})
		}
		daemoncmd.CheckCapabilities("run")
	}
	if runController && runDaemon {
		applyPeerSockets(layout)
	}
	if err := initLogging(runController, runDaemon); err != nil {
		log2.Fatal(err)
	}
	if runDaemon && !dev && remoteTokenRequired() {
		if err := token.RequireConfigured(daemonconfig.Get().RemoteApi.Token); err != nil {
			log2.Fatal(err)
		}
	}

	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM, syscall.SIGHUP)
	defer stop()

	opts := supervisor.Options{}
	if runController {
		telemetry := controllercmd.TelemetryEnabled(cmd.Flags().Changed("disable-telemetry"), disableTelemetry)
		opts.StartController = func(ctx context.Context) (supervisor.Running, error) {
			return controllercmd.Start(ctx, controllercmd.StartOptions{TelemetryEnabled: telemetry})
		}
		opts.AfterController = func(ctx context.Context, running supervisor.Running) error {
			return afterController(ctx, running, layout)
		}
	}
	if runDaemon {
		opts.StartDaemon = func(ctx context.Context) (supervisor.Running, error) {
			return daemoncmd.Start(ctx)
		}
	}
	if err := supervisor.Run(ctx, opts); err != nil {
		log.WithError(err).Fatal("run stopped")
	}
	return nil
}

func writeProductionConfigs() error {
	if runController {
		path, err := controllerconfig.WriteDefaultConfig(controllerConfig)
		if err != nil {
			return err
		}
		fmt.Printf("created default config at %s\n", path)
	}
	if runDaemon {
		path, err := daemonconfig.WriteDefaultConfig(daemonConfig)
		if err != nil {
			return err
		}
		fmt.Printf("created default config at %s\n", path)
	}
	return nil
}

// remoteTokenRequired reports whether the daemon must have a real node token.
// An enabled controller API socket is the credential, so the placeholder is allowed.
func remoteTokenRequired() bool {
	cfg := daemonconfig.Get()
	return cfg == nil || cfg.RemoteApi.Socket.ActivePath() == ""
}

// applyPeerSockets points the co-located controller and daemon at Unix sockets
// in the controller data directory's run folder. The admin socket is placed
// there too. Request URLs stay on TCP origins. A single side keeps today's
// TCP listeners and the configured admin socket.
func applyPeerSockets(layout devconfig.Layout) {
	if !runController || !runDaemon {
		return
	}
	adminSocket, controllerSocket, daemonSocket := peerSocketPaths(layout)
	controllerconfig.Update(func(cfg *controllerconfig.Configuration) {
		cfg.Api.AdminSocket = adminSocket
		cfg.Api.Socket.Enable(controllerSocket)
	})
	daemonconfig.Update(func(cfg *daemonconfig.Configuration) {
		cfg.Api.Socket.Enable(daemonSocket)
		cfg.RemoteApi.Socket.Enable(controllerSocket)
	})
}

func peerSocketPaths(layout devconfig.Layout) (adminSocket, controllerSocket, daemonSocket string) {
	if dev {
		return filepath.Join(layout.Root, "sls.sock"),
			filepath.Join(layout.Root, "controller.sock"),
			filepath.Join(layout.Root, "daemon.sock")
	}
	root := "/var/lib/controller"
	if cfg := controllerconfig.Get(); cfg != nil && cfg.System.RootDirectory != "" {
		root = cfg.System.RootDirectory
	}
	dir := filepath.Join(root, "run")
	return filepath.Join(dir, "sls.sock"),
		filepath.Join(dir, "controller.sock"),
		filepath.Join(dir, "daemon.sock")
}

func prepareOptions(cmd *cobra.Command) (controllercmd.PrepareOptions, daemoncmd.PrepareOptions) {
	controllerOpts := controllercmd.PrepareOptions{InitLogging: false}
	daemonOpts := daemoncmd.PrepareOptions{InitLogging: false}
	if cmd.Flags().Changed("debug") {
		controllerOpts.Debug = &debug
		daemonOpts.Debug = &debug
	}
	return controllerOpts, daemonOpts
}

func afterController(ctx context.Context, running supervisor.Running, layout devconfig.Layout) error {
	if !dev {
		return nil
	}
	started, ok := running.(*controllercmd.Running)
	if !ok || started == nil || started.Keys == nil {
		return fmt.Errorf("dev mode: controller key service is unavailable")
	}
	nodeToken, err := token.Ensure(ctx, started.Keys, layout.DaemonConfig)
	if err != nil {
		return err
	}
	daemonconfig.Update(func(cfg *daemonconfig.Configuration) {
		cfg.RemoteApi.Token = nodeToken
		cfg.System.EnableLogRotate = false
	})
	return nil
}

func initLogging(controllerOn, daemonOn bool) error {
	level := log.InfoLevel
	if controllerOn && controllerconfig.Get() != nil && controllerconfig.Get().Debug {
		level = log.DebugLevel
	}
	if daemonOn && daemonconfig.Get() != nil && daemonconfig.Get().Debug {
		level = log.DebugLevel
	}
	log.SetLevel(level)

	split := &logsplit.Handler{}
	if daemonOn {
		daemoncli.Default.LabelComponents = true
		split.Console = daemoncli.Default
	} else {
		controllercli.Default.LabelComponents = true
		split.Console = controllercli.Default
	}
	if controllerOn {
		handler, err := controllerlog.FileHandler()
		if err != nil {
			return err
		}
		split.Controller = handler
	}
	if daemonOn {
		handler, err := daemonlog.FileHandler()
		if err != nil {
			return err
		}
		split.Daemon = handler
	}
	log.SetHandler(split)
	if controllerOn {
		log.WithField("component", logcomponent.Controller).WithField("path", controllerlog.LogPath()).Info("writing log files to disk")
	}
	if daemonOn {
		log.WithField("component", logcomponent.Daemon).WithField("path", daemonlog.LogPath()).Info("writing log files to disk")
	}
	return nil
}
