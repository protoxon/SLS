package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

func linuxOnly(command string) error {
	return fmt.Errorf("sls %s runs on Linux", command)
}

func addServerCommand(cmd *cobra.Command) {
	cmd.GroupID = groupServer
	cmd.SilenceUsage = true
	cmd.SilenceErrors = true
	rootCmd.AddCommand(cmd)
}
