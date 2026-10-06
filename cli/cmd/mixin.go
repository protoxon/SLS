package cmd

import (
	"encoding/json"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

func newMixinCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "mixin",
		Short: "Manage mixins",
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(
		command("ls", "List mixins", noArgs, func(cmd *cobra.Command, _ []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				items, err := c.ListMixins(cmdCtx(cmd))
				if err != nil {
					return err
				}
				return p.Write(items, mixinTable(items))
			})
		}),
		command("inspect MIXIN", "Show a resolved mixin", exactArgs(1), func(cmd *cobra.Command, args []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				raw, err := c.GetMixin(cmdCtx(cmd), args[0])
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
	rootCmd.AddCommand(newMixinCommand())
}
