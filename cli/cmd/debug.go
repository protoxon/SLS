package cmd

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"

	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/api"
	"protoxon.com/sls/cli/print"
)

func newDebugCommand() *cobra.Command {
	cmd := command("debug", "Stream global events until interrupted", noArgs, func(cmd *cobra.Command, _ []string) error {
		return withAPI(cmd, func(c *api.Client, _ *print.Printer) error {
			if _, err := fmt.Fprintln(cmd.ErrOrStderr(), "Debug mode enabled. Streaming events until interrupted."); err != nil {
				return err
			}
			ctx, stop := signal.NotifyContext(cmdCtx(cmd), os.Interrupt, syscall.SIGTERM)
			defer stop()
			return c.FollowEvents(ctx, func(line string) error {
				_, err := fmt.Fprintln(cmd.OutOrStdout(), line)
				return err
			})
		})
	})
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	return cmd
}

func init() {
	rootCmd.AddCommand(newDebugCommand())
}
