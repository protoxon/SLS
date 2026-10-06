package cmd

import (
	"encoding/json"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

func newBlueprintCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "blueprint",
		Short: "Manage blueprints",
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(
		command("ls", "List blueprints", noArgs, func(cmd *cobra.Command, _ []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				items, err := c.ListBlueprints(cmdCtx(cmd))
				if err != nil {
					return err
				}
				return p.Write(items, blueprintTable(items))
			})
		}),
		command("inspect BLUEPRINT", "Show a resolved blueprint", exactArgs(1), func(cmd *cobra.Command, args []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				raw, err := c.GetBlueprint(cmdCtx(cmd), args[0])
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
	rootCmd.AddCommand(newBlueprintCommand())
}
