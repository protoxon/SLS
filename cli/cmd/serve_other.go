//go:build !linux

package cmd

import (
	"github.com/spf13/cobra"
	controllercmd "protoxon.com/sls/controller/cmd"
)

func init() {
	cmd := unsupportedRun()
	cmd.AddCommand(controllercmd.Command())
	cmd.AddCommand(unsupportedDaemon())
	addServerCommand(cmd)
}

func unsupportedDaemon() *cobra.Command {
	var configPath string
	var debug bool
	var initConfig bool
	cmd := &cobra.Command{
		Use:   "daemon",
		Short: "Run the SLS daemon.",
		RunE: func(*cobra.Command, []string) error {
			return linuxOnly("run daemon")
		},
	}
	cmd.PersistentFlags().StringVar(&configPath, "config", "/etc/sls/daemon/config.yml", "set the location for the configuration file")
	cmd.PersistentFlags().BoolVar(&debug, "debug", false, "pass in order to run sls in debug mode")
	cmd.PersistentFlags().BoolVar(&initConfig, "init-config", false, "write a default configuration file and exit")
	return cmd
}

func unsupportedRun() *cobra.Command {
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
	cmd := &cobra.Command{
		Use:   "run",
		Short: "Run the controller and a local daemon in one process.",
		RunE: func(*cobra.Command, []string) error {
			return linuxOnly("run")
		},
	}
	flags := cmd.Flags()
	flags.BoolVar(&dev, "dev", false, "run the controller and a local daemon with generated localhost config")
	flags.StringVar(&devDir, "dev-dir", "", "directory for --dev config and data (default ~/.sls/dev)")
	flags.BoolVar(&runController, "controller", true, "run the controller in this process")
	flags.BoolVar(&runDaemon, "daemon", true, "run a daemon in this process")
	flags.StringVar(&controllerConfig, "controller-config", "/etc/sls/controller/config.yml", "controller config file (ignored with --dev)")
	flags.StringVar(&daemonConfig, "daemon-config", "/etc/sls/daemon/config.yml", "daemon config file (ignored with --dev)")
	flags.BoolVar(&debug, "debug", false, "run in debug mode")
	flags.BoolVar(&disableTelemetry, "disable-telemetry", false, "disable outbound controller telemetry")
	flags.BoolVar(&initConfig, "init-config", false, "write default configuration files and exit")
	return cmd
}
