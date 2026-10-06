package cmd

import "github.com/spf13/cobra"

func init() {
	ps := newServerLsCommand()
	mountAlias(ps, "ps", "server ls")
	mountAlias(newServerLsCommand(), "list", "server ls")
	mountAlias(newServerLsCommand(), "ls", "server ls")

	mountAlias(newPowerCommand("start", "start", "Start a server"), "", "server start")
	mountAlias(newPowerCommand("stop", "stop", "Stop a server"), "", "server stop")
	mountAlias(newPowerCommand("kill", "kill", "Kill a server"), "", "server kill")
	mountAlias(newPowerCommand("pause", "pause", "Pause a server"), "", "server pause")
	mountAlias(newPowerCommand("restart", "restart", "Restart a server"), "", "server restart")
	mountAlias(newPowerCommand("resume", "unpause", "Resume a paused server"), "", "server unpause")
	mountAlias(newServerResetCommand(), "", "server reset")
	mountAlias(newServerLogsCommand(), "", "server logs")
	mountAlias(newServerStatsCommand(), "", "server stats")
	mountAlias(newServerStatusCommand(), "", "server status")

	mountAlias(newServerRmCommand(), "delete SERVER", "server rm")
	mountAlias(newServerExecCommand(), "console SERVER COMMAND...", "server exec")
	mountAlias(newServerInspectCommand(), "info SERVER", "server inspect")
	mountAlias(newServerCreateCommand(), "", "server create")
	mountAlias(newInstallCommand(), "", "server install")
	mountAlias(newReloadCommand(), "", "system reload")
}

func mountAlias(cmd *cobra.Command, use, canonical string) {
	if use != "" {
		cmd.Use = use
	}
	cmd.Aliases = nil
	cmd.GroupID = groupAlias
	if cmd.Annotations == nil {
		cmd.Annotations = map[string]string{}
	}
	cmd.Annotations["canonical"] = canonical
	note := "Alias of sls " + canonical + "."
	if cmd.Long == "" {
		cmd.Long = note
	} else {
		cmd.Long += "\n\n" + note
	}
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	rootCmd.AddCommand(cmd)
}

func assignGroups() {
	for _, c := range rootCmd.Commands() {
		if c.GroupID != "" || c.Name() == "completion" || c.Name() == "help" {
			continue
		}
		c.GroupID = groupRegistry
	}
}
