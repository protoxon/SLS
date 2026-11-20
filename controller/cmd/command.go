package cmd

import (
	"fmt"
	"os"
	"strings"

	apexlog "github.com/apex/log"
	"github.com/spf13/cobra"
	"protoxon.com/sls/controller/config"
	protolog "protoxon.com/sls/controller/log"
	"protoxon.com/sls/internal/message"
)

var (
	debug            = false
	disableTelemetry = false
	initConfig       = false
)

func init() {
	// Configure command-line flags
	rootCommand.PersistentFlags().StringVar(&config.Path, "config", config.Path, "set the location for the configuration file")
	rootCommand.PersistentFlags().BoolVar(&debug, "debug", false, "pass in order to run sls in debug mode")
	rootCommand.PersistentFlags().BoolVar(&disableTelemetry, "disable-telemetry", false, "disable outbound telemetry (overrides config and SLS_CONTROLLER_TELEMETRY_ENABLED)")
	rootCommand.PersistentFlags().BoolVar(&initConfig, "init-config", false, "write a default configuration file and exit")
}

// Command is the sls run controller subcommand.
func Command() *cobra.Command {
	return rootCommand
}

// PrepareOptions controls config load for standalone and combined startup.
type PrepareOptions struct {
	// Debug, when set, overrides the debug value from the config file.
	Debug *bool
	// InitLogging installs this process's logger. sls run skips it
	// and attaches the controller log file to a shared logger instead.
	InitLogging bool
}

// Prepare loads the controller configuration. Call it before Start.
func Prepare(opts PrepareOptions) error {
	if err := config.InitConfig(); err != nil {
		return err
	}
	if opts.Debug != nil {
		config.Get().Debug = *opts.Debug
	}
	if opts.InitLogging {
		protolog.InitLogging()
	}
	return nil
}

// ResolveTelemetryEnabled returns whether telemetry should run.
// Precedence: --disable-telemetry > SLS_CONTROLLER_TELEMETRY_ENABLED (true or false) > config telemetry_enabled (default true).
func ResolveTelemetryEnabled(cmd *cobra.Command) bool {
	return TelemetryEnabled(cmd.Flags().Changed("disable-telemetry"), disableTelemetry)
}

// TelemetryEnabled applies the same precedence as ResolveTelemetryEnabled for
// callers that are not the standalone controller command.
func TelemetryEnabled(disableFlagSet, disableFlag bool) bool {
	if disableFlagSet {
		return !disableFlag
	}
	if v, ok := os.LookupEnv("SLS_CONTROLLER_TELEMETRY_ENABLED"); ok {
		if b, ok := parseTelemetryEnvBool(v); ok {
			return b
		}
		apexlog.WithField("value", v).Warn("invalid SLS_CONTROLLER_TELEMETRY_ENABLED; falling back to config")
	}
	return config.Get().IsTelemetryEnabled()
}

func parseTelemetryEnvBool(s string) (bool, bool) {
	s = strings.TrimSpace(s)
	switch {
	case strings.EqualFold(s, "true"):
		return true, true
	case strings.EqualFold(s, "false"):
		return false, true
	default:
		return false, false
	}
}

var rootCommand = &cobra.Command{
	Use:           "controller",
	Short:         "Run the SLS controller.",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runController,
}

func runController(cmd *cobra.Command, _ []string) error {
	if initConfig {
		path, err := config.WriteDefaultConfig(config.Path)
		if err != nil {
			return err
		}
		fmt.Printf("created default config at %s\n", path)
		return nil
	}

	message.Start("Controller")
	opts := PrepareOptions{InitLogging: true}
	if cmd.Flags().Changed("debug") {
		opts.Debug = &debug
	}
	if err := Prepare(opts); err != nil {
		config.ExitOnMissingConfig(err, "run controller")
		return err
	}
	run(cmd, nil)
	return nil
}
