package cmd

import (
	"github.com/spf13/cobra"
	"protoxon.com/sls/internal/version"
)

func newVersionCommand() *cobra.Command {
	return command("version", "Print the version and build information", noArgs, func(cmd *cobra.Command, _ []string) error {
		return version.Fprint(cmd.OutOrStdout())
	})
}

func init() {
	rootCmd.AddCommand(newVersionCommand())
}
