package cmd

import (
	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

func newPowerCommand(use, action, short string) *cobra.Command {
	return command(use+" SERVER", short, exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			if err := c.Power(cmdCtx(cmd), server.ID, action); err != nil {
				return err
			}
			raw := actionResult{Server: server.ID, Action: action}
			return p.Write(raw, actionFields(server.ID, action))
		})
	})
}
