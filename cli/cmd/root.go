package cmd

import (
	"fmt"
	log2 "log"
	"os"

	"github.com/spf13/cobra"
)

const (
	groupRegistry = "registry"
	groupManage   = "manage"
	groupAlias    = "alias"
	groupServer   = "server"
)

var (
	plainHTTP    bool
	progressMode string
)

var rootCmd = &cobra.Command{
	Use:           "sls",
	Short:         "SLS CLI",
	SilenceUsage:  true,
	SilenceErrors: true,
}

func Execute() {
	assignGroups()
	cmd, err := rootCmd.ExecuteC()
	if err == nil {
		return
	}
	if msg, ok := cliUsageMessage(cmd, err); ok {
		fmt.Fprintln(os.Stderr, msg)
		os.Exit(1)
	}
	log2.Fatalf("failed to execute command: %s", err)
}

func init() {
	addAPIFlags(rootCmd)
	rootCmd.SetFlagErrorFunc(flagError)
	rootCmd.AddGroup(
		&cobra.Group{ID: groupRegistry, Title: "Registry:"},
		&cobra.Group{ID: groupManage, Title: "Management:"},
		&cobra.Group{ID: groupAlias, Title: "Aliases:"},
		&cobra.Group{ID: groupServer, Title: "Server:"},
	)
	rootCmd.PersistentFlags().BoolVar(&plainHTTP, "http", false, "use HTTP instead of HTTPS when talking to the registry")
	rootCmd.PersistentFlags().StringVar(&progressMode, "progress", "auto", "progress output: auto, tty, or plain")
}
