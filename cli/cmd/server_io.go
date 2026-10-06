package cmd

import (
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

func newServerLogsCommand() *cobra.Command {
	return newLogsCommand("logs SERVER", "Show server logs", false)
}

func newServerExecCommand() *cobra.Command {
	return command("exec SERVER COMMAND...", "Run a console command", minimumNArgs(2), func(cmd *cobra.Command, args []string) error {
		line := strings.TrimPrefix(strings.Join(args[1:], " "), "/")
		if strings.TrimSpace(line) == "" {
			return fmt.Errorf("command is required")
		}
		return withServer(cmd, args[0], func(c *api.Client, _ *print.Printer, server api.Server) error {
			return c.Exec(cmdCtx(cmd), server.ID, []string{line})
		})
	})
}

func newServerStatsCommand() *cobra.Command {
	return command("stats SERVER", "Show server resource usage", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withEachServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			stats, err := c.ServerStats(cmdCtx(cmd), server.ID)
			if err != nil {
				return err
			}
			return p.Write(stats, statsFields(stats))
		})
	})
}

func newServerStatusCommand() *cobra.Command {
	return command("status SERVER", "Show server status", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withEachServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			st, err := c.ServerStatus(cmdCtx(cmd), server.ID)
			if err != nil {
				return err
			}
			return p.Write(st, statusFields(st))
		})
	})
}

func newInstallCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "install",
		Short: "Inspect or rerun a server install",
	}
	cmd.AddCommand(
		command("info SERVER", "Show install status", exactArgs(1), func(cmd *cobra.Command, args []string) error {
			return withEachServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
				info, err := c.InstallInfo(cmdCtx(cmd), server.ID)
				if err != nil {
					return err
				}
				return p.Write(info, installFields(info))
			})
		}),
		newLogsCommand("logs SERVER", "Show install logs", true),
		command("reinstall SERVER", "Run the install again", exactArgs(1), func(cmd *cobra.Command, args []string) error {
			return withServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
				if err := c.Reinstall(cmdCtx(cmd), server.ID); err != nil {
					return err
				}
				raw := actionResult{Server: server.ID, Action: "reinstall"}
				return p.Write(raw, actionFields(server.ID, "reinstall"))
			})
		}),
	)
	return cmd
}

func newLogsCommand(use, short string, install bool) *cobra.Command {
	var page, tail int
	cmd := command(use, short, exactArgs(1), func(cmd *cobra.Command, args []string) error {
		if err := checkPage(page, tail); err != nil {
			return err
		}
		return withEachServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			var (
				logs api.LogPage
				err  error
			)
			if install {
				logs, err = c.InstallLogs(cmdCtx(cmd), server.ID, page, tail)
			} else {
				logs, err = c.ServerLogs(cmdCtx(cmd), server.ID, page, tail)
			}
			if err != nil {
				return err
			}
			return p.Write(logs, print.Lines{Text: logs.Data})
		})
	})
	cmd.Flags().IntVar(&page, "page", 1, "page number")
	cmd.Flags().IntVar(&tail, "tail", 100, "lines per page (maximum 100)")
	return cmd
}
