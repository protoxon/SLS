package cmd

import (
	"fmt"
	log2 "log"
	"os"
	"strings"

	"github.com/mitchellh/colorstring"
	"github.com/spf13/cobra"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/log"
	"protoxon.com/sls/daemon/system"
	"protoxon.com/sls/internal/message"
)

var (
	debug      = false
	initConfig = false
)

func init() {

	// Configure command-line flags
	rootCommand.PersistentFlags().StringVar(&config.Path, "config", config.Path, "set the location for the configuration file")
	rootCommand.PersistentFlags().BoolVar(&debug, "debug", false, "pass in order to run sls in debug mode")
	rootCommand.PersistentFlags().BoolVar(&initConfig, "init-config", false, "write a default configuration file and exit")
}

// Command is the sls run daemon subcommand.
func Command() *cobra.Command {
	return rootCommand
}

// CheckCapabilities exits unless the process can create mount namespaces.
// CAP_SYS_ADMIN is required for the daemon's overlay mounts.
// command is the sls subcommand the user ran.
func CheckCapabilities(command string) {
	admin, err := system.HasCapSysAdmin()
	if err != nil {
		log2.Fatalf("Failed to check CAP_SYS_ADMIN capability: %v", err)
	}
	if admin {
		return
	}
	if strings.TrimSpace(command) == "" {
		command = "run daemon"
	}
	fmt.Print(colorPrivilegeNotice(privilegeNotice(command)))
	os.Exit(1)
}

func privilegeNotice(command string) string {
	return fmt.Sprintf(`
Error: Insufficient Privileges

SLS does not have the CAP_SYS_ADMIN capability, and therefore is not able to
complete its boot process. The daemon needs it to create mount namespaces.

Run with sudo or grant the CAP_SYS_ADMIN capability: sudo sls %s
`, command)
}

func colorPrivilegeNotice(notice string) string {
	return strings.Replace(notice, "Error: Insufficient Privileges",
		colorstring.Color("[_red_][white][bold]Error: Insufficient Privileges[reset]"), 1)
}

// PrepareOptions controls config load for standalone and combined startup.
type PrepareOptions struct {
	// Debug, when set, overrides the debug value from the config file.
	Debug *bool
	// InitLogging installs this process's logger. sls run skips it
	// and attaches the daemon log file to a shared logger instead.
	InitLogging bool
}

// Prepare loads the daemon configuration. Call it before Start.
func Prepare(opts PrepareOptions) error {
	if err := config.InitConfig(); err != nil {
		return err
	}
	if opts.Debug != nil {
		config.Get().Debug = *opts.Debug
	}
	if opts.InitLogging {
		log.InitLogging()
	}
	return nil
}

var rootCommand = &cobra.Command{
	Use:           "daemon",
	Short:         "Run the SLS daemon.",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runDaemon,
}

func runDaemon(cmd *cobra.Command, _ []string) error {
	if initConfig {
		path, err := config.WriteDefaultConfig(config.Path)
		if err != nil {
			return err
		}
		fmt.Printf("created default config at %s\n", path)
		return nil
	}

	message.Start("Daemon")
	CheckCapabilities("run daemon")
	opts := PrepareOptions{InitLogging: true}
	if cmd.Flags().Changed("debug") {
		opts.Debug = &debug
	}
	if err := Prepare(opts); err != nil {
		config.ExitOnMissingConfig(err, "run daemon")
		return err
	}
	run(cmd, nil)
	return nil
}
