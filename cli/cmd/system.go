package cmd

import (
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/api"
	"protoxon.com/sls/cli/print"
)

func newSystemCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "system",
		Short: "Show Controller host information",
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(newSystemInfoCommand(), newReloadCommand())
	return cmd
}

func newSystemInfoCommand() *cobra.Command {
	return command("info", "Show Controller version and host information", noArgs, func(cmd *cobra.Command, _ []string) error {
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
			var errors []api.LoadError
			if mode == "all" || mode == "blueprints" {
				result, err := c.ReloadBlueprints(cmdCtx(cmd))
				if err != nil {
					return err
				}
				reloaded = append(reloaded, "blueprints")
				errors = append(errors, result.Errors...)
			}
			if mode == "all" || mode == "software" {
				result, err := c.ReloadSoftware(cmdCtx(cmd))
				if err != nil {
					return err
				}
				reloaded = append(reloaded, "software")
				errors = append(errors, result.Errors...)
			}
			if errors == nil {
				errors = []api.LoadError{}
			}
			raw := struct {
				Reloaded []string        `json:"reloaded"`
				Errors   []api.LoadError `json:"errors"`
			}{Reloaded: reloaded, Errors: errors}
			fields := print.Fields{Items: []print.Field{
				{Key: "Reloaded", Value: strings.Join(reloaded, ", ")},
			}}
			for _, failure := range errors {
				fields.Items = append(fields.Items, print.Field{
					Key:   "Error",
					Value: formatReloadError(failure),
				})
			}
			return p.Write(raw, fields)
		})
	})
}

func formatReloadError(failure api.LoadError) string {
	kind := failure.Kind
	if kind == "" {
		kind = "file"
	}
	var line strings.Builder
	line.WriteString("Failed to load ")
	line.WriteString(kind)
	if failure.Path != "" {
		line.WriteByte(' ')
		line.WriteString(failure.Path)
	}
	if failure.ID != "" {
		line.WriteString(" (")
		line.WriteString(failure.ID)
		line.WriteByte(')')
	}
	line.WriteString(": ")
	line.WriteString(failure.Error)
	return line.String()
}

func init() {
	rootCmd.AddCommand(newSystemCommand())
}
