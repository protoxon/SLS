package cmd

import (
	"encoding/json"
	"fmt"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

func newServerCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "server",
		Short: "Manage servers",
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(
		newServerLsCommand(),
		newServerCreateCommand(),
		newServerInspectCommand(),
		newServerRmCommand(),
		newServerResetCommand(),
		newPowerCommand("start", "start", "Start a server"),
		newPowerCommand("stop", "stop", "Stop a server"),
		newPowerCommand("restart", "restart", "Restart a server"),
		newPowerCommand("pause", "pause", "Pause a server"),
		newPowerCommand("unpause", "unpause", "Resume a paused server"),
		newPowerCommand("kill", "kill", "Kill a server"),
		newServerLogsCommand(),
		newServerExecCommand(),
		newServerStatsCommand(),
		newServerStatusCommand(),
		newInstallCommand(),
	)
	return cmd
}

func init() {
	rootCmd.AddCommand(newServerCommand())
}

func newServerLsCommand() *cobra.Command {
	cmd := command("ls", "List servers", noArgs, func(cmd *cobra.Command, _ []string) error {
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			servers, err := c.ListServers(cmdCtx(cmd))
			if err != nil {
				return err
			}
			return p.Write(servers, serverTable(servers))
		})
	})
	cmd.Aliases = []string{"list"}
	return cmd
}

func newServerInspectCommand() *cobra.Command {
	return command("inspect SERVER", "Show server details", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withEachServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			info, err := loadServerInfo(cmd, c, server)
			if err != nil {
				return err
			}
			return p.Write(info, infoView(info))
		})
	})
}

func loadServerInfo(cmd *cobra.Command, c *api.Client, server api.Server) (serverInfo, error) {
	ctx := cmdCtx(cmd)
	st, err := c.ServerStatus(ctx, server.ID)
	if err != nil {
		return serverInfo{}, err
	}
	stats, err := c.ServerStats(ctx, server.ID)
	if err != nil {
		return serverInfo{}, err
	}
	name, typ := server.BlueprintID, ""
	if server.BlueprintID != "" {
		if raw, err := c.GetBlueprint(ctx, server.BlueprintID); err == nil {
			n, t := blueprintNameType(raw)
			if n != "" {
				name = n
			}
			typ = t
		}
	}
	software := softwareLabel(server.SoftwareID, server.SoftwareVersion)
	if software == "" {
		software = "Unknown"
	}
	return serverInfo{
		ID:          server.ID,
		Status:      st.Status,
		Blueprint:   name,
		BlueprintID: server.BlueprintID,
		Type:        typ,
		Server:      software,
		Node:        nodeInfoLabel(server.NodeName, server.NodeID),
		CPU:         formatPercent(stats.CPUAbsolute),
		Memory:      memoryPercent(stats.Memory, stats.MemoryLimit),
		Uptime:      formatUptime(stats.Uptime),
	}, nil
}

func blueprintNameType(raw json.RawMessage) (string, string) {
	var doc struct {
		Meta struct {
			Name string `json:"name"`
			Type string `json:"type"`
		} `json:"metadata"`
	}
	if json.Unmarshal(raw, &doc) != nil {
		return "", ""
	}
	return doc.Meta.Name, doc.Meta.Type
}

func newServerRmCommand() *cobra.Command {
	var force bool
	cmd := command("rm SERVER", "Delete a server", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			if err := c.DeleteServer(cmdCtx(cmd), server.ID, force); err != nil {
				return err
			}
			raw := actionResult{Server: server.ID, Action: "delete", Force: force}
			return p.Write(raw, actionFields(server.ID, "delete"))
		})
	})
	cmd.Aliases = []string{"delete"}
	cmd.Flags().BoolVar(&force, "force", false, "remove the server record even if the daemon delete fails")
	return cmd
}

func newServerResetCommand() *cobra.Command {
	return command("reset SERVER", "Wipe saved data and start the server again", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			if err := c.ResetServer(cmdCtx(cmd), server.ID); err != nil {
				return err
			}
			raw := actionResult{Server: server.ID, Action: "reset"}
			return p.Write(raw, actionFields(server.ID, "reset"))
		})
	})
}

func checkPage(page, tail int) error {
	if page < 1 {
		return fmt.Errorf("page must be at least 1")
	}
	if tail < 1 || tail > 100 {
		return fmt.Errorf("tail must be between 1 and 100")
	}
	return nil
}
