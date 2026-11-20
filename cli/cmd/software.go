package cmd

import (
	"encoding/json"

	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/api"
	"protoxon.com/sls/cli/print"
)

func newSoftwareCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "software",
		Short: "Manage software",
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(
		command("ls", "List software", noArgs, func(cmd *cobra.Command, _ []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				items, err := c.ListSoftware(cmdCtx(cmd))
				if err != nil {
					return err
				}
				return p.Write(items, softwareTable(items))
			})
		}),
		command("inspect SOFTWARE", "Show a software definition", exactArgs(1), func(cmd *cobra.Command, args []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				raw, err := c.GetSoftware(cmdCtx(cmd), args[0])
				if err != nil {
					return err
				}
				return p.Write(json.RawMessage(raw), print.AsYAML(json.RawMessage(raw)))
			})
		}),
	)
	return cmd
}

func init() {
	rootCmd.AddCommand(newSoftwareCommand())
}
