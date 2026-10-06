package cmd

import (
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

func newSystemCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "system",
		Short: "Show Protocube host information",
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(newSystemInfoCommand(), newReloadCommand())
	return cmd
}

func newSystemInfoCommand() *cobra.Command {
	return command("info", "Show Protocube version and host information", noArgs, func(cmd *cobra.Command, _ []string) error {
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			info, err := c.System(cmdCtx(cmd))
			if err != nil {
				return err
			}
			return p.Write(info, systemFields(info))
		})
	})
}

func newReloadCommand() *cobra.Command {
	return command("reload [all|blueprints|software]", "Reload blueprints and software", maximumNArgs(1), func(cmd *cobra.Command, args []string) error {
		mode := "all"
		if len(args) == 1 {
			mode = args[0]
		}
		switch mode {
		case "all", "blueprints", "software":
		default:
			return fmt.Errorf("unknown reload target %q (want all, blueprints, or software)", mode)
		}
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			var reloaded []string
			if mode == "all" || mode == "blueprints" {
				if err := c.ReloadBlueprints(cmdCtx(cmd)); err != nil {
					return err
				}
				reloaded = append(reloaded, "blueprints")
			}
			if mode == "all" || mode == "software" {
				if err := c.ReloadSoftware(cmdCtx(cmd)); err != nil {
					return err
				}
				reloaded = append(reloaded, "software")
			}
			raw := struct {
				Reloaded []string `json:"reloaded"`
			}{Reloaded: reloaded}
			fields := print.Fields{Items: []print.Field{
				{Key: "Reloaded", Value: strings.Join(reloaded, ", ")},
			}}
			return p.Write(raw, fields)
		})
	})
}

func init() {
	rootCmd.AddCommand(newSystemCommand())
}
