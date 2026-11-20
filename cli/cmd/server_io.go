package cmd

import (
	"context"
	"fmt"
	"os"
	"os/signal"
	"strings"
	"syscall"

	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/api"
	"protoxon.com/sls/cli/print"
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
			return c.Exec(cmdCtx(cmd), server.Id, []string{line})
		})
	})
}

func newServerStatsCommand() *cobra.Command {
	return command("stats SERVER", "Show server resource usage", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withEachServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			stats, err := c.ServerStats(cmdCtx(cmd), server.Id)
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
			st, err := c.ServerStatus(cmdCtx(cmd), server.Id)
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
				info, err := c.InstallInfo(cmdCtx(cmd), server.Id)
				if err != nil {
					return err
				}
				return p.Write(info, installFields(info))
			})
		}),
		newLogsCommand("logs SERVER", "Show install logs", true),
		command("reinstall SERVER", "Run the install again", exactArgs(1), func(cmd *cobra.Command, args []string) error {
			return withServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
				if err := c.Reinstall(cmdCtx(cmd), server.Id); err != nil {
					return err
				}
				raw := actionResult{Server: server.Id, Action: "reinstall"}
				return p.Write(raw, actionFields(server.Id, "reinstall"))
			})
		}),
	)
	return cmd
}

func newTailCommand() *cobra.Command {
	var tail int
	cmd := command("tail SERVER", "Follow server logs", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		history := 0
		if cmd.Flags().Changed("tail") {
			if err := checkPage(1, tail); err != nil {
				return err
			}
			history = tail
		}
		return followServerLogs(cmd, args[0], history)
	})
	cmd.Flags().IntVar(&tail, "tail", 100, "print this many recent lines before following")
	return cmd
}

func newLogsCommand(use, short string, install bool) *cobra.Command {
	var page, tail int
	var follow bool
	cmd := command(use, short, exactArgs(1), func(cmd *cobra.Command, args []string) error {
		if follow && !install {
			history := 0
			if cmd.Flags().Changed("tail") {
				if err := checkPage(1, tail); err != nil {
					return err
				}
				history = tail
			}
			return followServerLogs(cmd, args[0], history)
		}
		if err := checkPage(page, tail); err != nil {
			return err
		}
		return withEachServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			var (
				logs api.LogPage
				err  error
			)
			if install {
				logs, err = c.InstallLogs(cmdCtx(cmd), server.Id, page, tail)
			} else {
				logs, err = c.ServerLogs(cmdCtx(cmd), server.Id, page, tail)
			}
			if err != nil {
				return err
			}
			return p.Write(logs, print.Lines{Text: logs.Data})
		})
	})
	cmd.Flags().IntVar(&page, "page", 1, "page number")
	cmd.Flags().IntVar(&tail, "tail", 100, "lines per page (maximum 100)")
	if !install {
		cmd.Flags().BoolVarP(&follow, "follow", "f", false, "follow new log lines until interrupted")
	}
	return cmd
}

func followServerLogs(cmd *cobra.Command, query string, history int) error {
	return withServer(cmd, query, func(c *api.Client, _ *print.Printer, server api.Server) error {
		return streamServerLogs(cmdCtx(cmd), cmd, c, server.Id, history)
	})
}

func streamServerLogs(ctx context.Context, cmd *cobra.Command, c *api.Client, id string, history int) error {
	if ctx == nil {
		ctx = context.Background()
	}
	ctx, stop := signal.NotifyContext(ctx, os.Interrupt, syscall.SIGTERM)
	defer stop()
	if history > 0 {
		logs, err := c.ServerLogs(ctx, id, 1, history)
		if err != nil {
			return err
		}
		for _, line := range logs.Data {
			if _, err := fmt.Fprintln(cmd.OutOrStdout(), line); err != nil {
				return err
			}
		}
	}
	return c.FollowLogs(ctx, id, func(line string) error {
		_, err := fmt.Fprintln(cmd.OutOrStdout(), line)
		return err
	})
}
