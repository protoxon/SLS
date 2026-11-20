package cmd

import (
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/api"
	"protoxon.com/sls/cli/print"
)

func newSnapshotCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:           "snapshot",
		Short:         "Manage snapshots",
		SilenceUsage:  true,
		SilenceErrors: true,
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(
		newSnapshotLsCommand(),
		newSnapshotInspectCommand(),
		newSnapshotRmCommand(),
		newSnapshotCreateCommand(),
		newSnapshotRestoreCommand(),
	)
	return cmd
}

func init() {
	rootCmd.AddCommand(newSnapshotCommand())
}

func newSnapshotLsCommand() *cobra.Command {
	cmd := command("ls", "List snapshots", noArgs, func(cmd *cobra.Command, _ []string) error {
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			items, err := c.ListSnapshots(cmdCtx(cmd))
			if err != nil {
				return err
			}
			return p.Write(items, snapshotTable(items))
		})
	})
	cmd.Aliases = []string{"list"}
	return cmd
}

func newSnapshotInspectCommand() *cobra.Command {
	cmd := command("inspect SNAPSHOT", "Show snapshot details", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			item, err := c.GetSnapshot(cmdCtx(cmd), args[0])
			if err != nil {
				return err
			}
			return p.Write(item, snapshotFields(item))
		})
	})
	cmd.Aliases = []string{"info"}
	return cmd
}

func newSnapshotRmCommand() *cobra.Command {
	var force bool
	cmd := command("rm SNAPSHOT", "Delete a snapshot", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			if args[0] == "all" {
				return deleteAllSnapshots(cmd, c, p, force)
			}
			if err := c.DeleteSnapshot(cmdCtx(cmd), args[0], force); err != nil {
				return err
			}
			raw := snapshotDeleteResult{ID: args[0], Action: "delete", Force: force}
			return p.Write(raw, snapshotDeleteFields(args[0]))
		})
	})
	cmd.Aliases = []string{"delete"}
	cmd.Long = "SNAPSHOT may be an id, a tag, or all."
	cmd.Flags().BoolVar(&force, "force", false, "delete the snapshot record even if a server is using it or it is still being created")
	return cmd
}

func newSnapshotCreateCommand() *cobra.Command {
	var (
		targets, excludes, pre, post []string
		preDelay                     int
		tag                          string
		noSave, detach               bool
	)
	cmd := command("create SERVER", "Create a snapshot of a server", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withServer(cmd, args[0], func(c *api.Client, p *print.Printer, server api.Server) error {
			req, err := snapshotCreateRequest(cmd, c, server, tag, targets, excludes, pre, post, preDelay, noSave)
			if err != nil {
				return err
			}
			ctx := cmdCtx(cmd)
			if detach {
				created, err := c.CreateSnapshot(ctx, server.Id, req)
				if err != nil {
					return err
				}
				return p.Write(created, snapshotFields(created))
			}
			var lastPhase string
			done, err := c.WatchCreateSnapshot(ctx, server.Id, req, func(ev api.SnapshotProgress) error {
				return writeSnapshotPhase(cmd, &lastPhase, ev)
			})
			if err != nil {
				return err
			}
			if done.Phase == api.SnapshotPhaseFailed {
				if done.Error != "" {
					return fmt.Errorf("snapshot %s failed: %s", snapshotEventID(done), done.Error)
				}
				return fmt.Errorf("snapshot %s failed", snapshotEventID(done))
			}
			if done.ID == "" {
				return fmt.Errorf("snapshot watch ended without an id")
			}
			item, err := c.GetSnapshot(ctx, done.ID)
			if err != nil {
				return err
			}
			return p.Write(item, snapshotFields(item))
		})
	})
	cmd.Long = "A running server is told to save-off and save-all before the copy, then save-on after it, unless --pre, --post, or --no-save is set. The command waits until the snapshot is ready. --detach returns when Controller accepts the job."
	cmd.Flags().StringVar(&tag, "tag", "", "alias for this snapshot; creating again with the same tag moves the alias")
	cmd.Flags().StringSliceVar(&targets, "target", nil, "overlay path to include; repeat or separate paths with commas")
	cmd.Flags().StringSliceVar(&excludes, "exclude", nil, "overlay path to leave out; an exclude wins over a target")
	cmd.Flags().StringArrayVar(&pre, "pre", nil, "stdin command to send before the copy; repeat for another command")
	cmd.Flags().StringArrayVar(&post, "post", nil, "stdin command to send after the copy; repeat for another command")
	cmd.Flags().IntVar(&preDelay, "pre-delay", 0, "seconds to wait after the pre commands before copying")
	cmd.Flags().BoolVar(&noSave, "no-save", false, "do not send save-off, save-all, and save-on when the server is running")
	cmd.Flags().BoolVar(&detach, "detach", false, "return when the snapshot is accepted instead of waiting until it is ready")
	return cmd
}

func newSnapshotRestoreCommand() *cobra.Command {
	var node string
	cmd := command("restore SNAPSHOT", "Create a server from a snapshot", exactArgs(1), func(cmd *cobra.Command, args []string) error {
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			item, err := c.GetSnapshot(cmdCtx(cmd), args[0])
			if err != nil {
				return err
			}
			if item.BlueprintID == "" {
				return fmt.Errorf("snapshot %s has no blueprint", args[0])
			}
			req := api.CreateServerRequest{
				BlueprintID: item.BlueprintID,
				SnapshotIDs: []string{item.ID},
			}
			if cmd.Flags().Changed("node") {
				req.NodeId = node
			}
			server, err := c.CreateServer(cmdCtx(cmd), req)
			if err != nil {
				return err
			}
			return p.Write(server, serverFields(server))
		})
	})
	cmd.Flags().StringVar(&node, "node", "", "node id")
	return cmd
}

type snapshotDeleteResult struct {
	ID     string `json:"id"`
	Action string `json:"action"`
	Force  bool   `json:"force,omitempty"`
}

func deleteAllSnapshots(cmd *cobra.Command, c *api.Client, p *print.Printer, force bool) error {
	items, err := c.ListSnapshots(cmdCtx(cmd))
	if err != nil {
		return err
	}
	if len(items) == 0 {
		if outputFormat == "json" || outputFormat == "yaml" {
			return p.Write([]snapshotDeleteResult{}, print.Lines{Text: nil})
		}
		_, err := fmt.Fprintln(cmd.OutOrStdout(), "No snapshots")
		return err
	}
	var deleted []snapshotDeleteResult
	var failed []string
	for _, item := range items {
		if item.ID == "" {
			continue
		}
		if err := c.DeleteSnapshot(cmdCtx(cmd), item.ID, force); err != nil {
			failed = append(failed, item.ID+": "+err.Error())
			continue
		}
		deleted = append(deleted, snapshotDeleteResult{ID: item.ID, Action: "delete", Force: force})
	}
	if len(deleted) > 0 {
		if err := p.Write(deleted, snapshotDeleteTable(deleted)); err != nil {
			return err
		}
	}
	if len(failed) > 0 {
		return fmt.Errorf("%s", strings.Join(failed, "; "))
	}
	return nil
}

func snapshotCreateRequest(cmd *cobra.Command, c *api.Client, server api.Server, tag string, targets, excludes, pre, post []string, preDelay int, noSave bool) (api.CreateSnapshotRequest, error) {
	req := api.CreateSnapshotRequest{
		Tag:      strings.TrimSpace(tag),
		Targets:  splitPaths(targets),
		Excludes: splitPaths(excludes),
		Pre:      cleanCommands(pre),
		Post:     cleanCommands(post),
	}
	if cmd.Flags().Changed("pre-delay") {
		req.PreDelaySeconds = preDelay
	}
	if noSave || len(req.Pre) > 0 || len(req.Post) > 0 {
		return req, nil
	}
	st, err := c.ServerStatus(cmdCtx(cmd), server.Id)
	if err != nil {
		return api.CreateSnapshotRequest{}, err
	}
	if st.Status != "running" {
		return req, nil
	}
	req.Pre = []string{"save-off", "save-all"}
	req.Post = []string{"save-on"}
	if !cmd.Flags().Changed("pre-delay") {
		req.PreDelaySeconds = 5
	}
	return req, nil
}

func splitPaths(values []string) []string {
	var out []string
	for _, value := range values {
		for _, part := range strings.Split(value, ",") {
			part = strings.TrimSpace(part)
			if part != "" {
				out = append(out, part)
			}
		}
	}
	return out
}

func cleanCommands(values []string) []string {
	var out []string
	for _, value := range values {
		value = strings.TrimSpace(value)
		if value != "" {
			out = append(out, value)
		}
	}
	return out
}

func writeSnapshotPhase(cmd *cobra.Command, last *string, ev api.SnapshotProgress) error {
	if outputFormat != "" && outputFormat != "table" {
		return nil
	}
	if ev.Phase == "" || ev.Phase == *last {
		return nil
	}
	*last = ev.Phase
	_, err := fmt.Fprintf(cmd.ErrOrStderr(), "Snapshot %s: %s\n", snapshotEventID(ev), ev.Phase)
	return err
}

func snapshotEventID(ev api.SnapshotProgress) string {
	if ev.ID == "" {
		return "-"
	}
	return ev.ID
}
