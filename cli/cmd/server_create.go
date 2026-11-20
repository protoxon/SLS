package cmd

import (
	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/api"
	"protoxon.com/sls/cli/print"
)

func newServerCreateCommand() *cobra.Command {
	var (
		node, threads, software, version, image string
		snapshots                               []string
		persists, oom, tail, follow             bool
		cpu, memory, swap, disk                 int64
		ioWeight                                uint16
	)
	cmd := command("create [TYPE] BLUEPRINT", "Create a server from a blueprint. An optional leading type is ignored.", rangeArgs(1, 2), func(cmd *cobra.Command, args []string) error {
		req := api.CreateServerRequest{BlueprintID: args[len(args)-1]}
		if len(snapshots) > 0 {
			req.SnapshotIDs = snapshots
		}
		if cmd.Flags().Changed("node") {
			req.NodeId = node
		}
		var ov api.ServerOverrides
		var limits api.Limits
		changed := false
		limitsChanged := false
		if cmd.Flags().Changed("persists") {
			v := persists
			ov.Persists = &v
			changed = true
		}
		if cmd.Flags().Changed("cpu") {
			v := cpu
			limits.CpuLimit = &v
			limitsChanged = true
		}
		if cmd.Flags().Changed("memory") {
			v := memory
			limits.MemoryLimit = &v
			limitsChanged = true
		}
		if cmd.Flags().Changed("swap") {
			v := swap
			limits.Swap = &v
			limitsChanged = true
		}
		if cmd.Flags().Changed("io-weight") {
			v := ioWeight
			limits.IoWeight = &v
			limitsChanged = true
		}
		if cmd.Flags().Changed("disk") {
			v := disk
			limits.DiskSpace = &v
			limitsChanged = true
		}
		if cmd.Flags().Changed("threads") {
			v := threads
			limits.Threads = &v
			limitsChanged = true
		}
		if cmd.Flags().Changed("oom-disabled") {
			v := oom
			limits.OOMDisabled = &v
			limitsChanged = true
		}
		if limitsChanged {
			ov.Limits = &limits
			changed = true
		}
		if cmd.Flags().Changed("software") {
			v := software
			ov.Software = &v
			changed = true
		}
		if cmd.Flags().Changed("version") {
			v := version
			ov.Version = &v
			changed = true
		}
		if cmd.Flags().Changed("image") {
			v := image
			ov.Image = &v
			changed = true
		}
		if changed {
			req.Overrides = &ov
		}
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			server, err := c.CreateServer(cmdCtx(cmd), req)
			if err != nil {
				return err
			}
			if err := p.Write(server, serverFields(server)); err != nil {
				return err
			}
			if !tail && !follow {
				return nil
			}
			return streamServerLogs(cmdCtx(cmd), cmd, c, server.Id, 0)
		})
	})
	cmd.Flags().StringVar(&node, "node", "", "node id")
	cmd.Flags().StringArrayVar(&snapshots, "snapshot", nil, "snapshot id or tag to restore, highest precedence first; repeat for another layer")
	cmd.Flags().BoolVar(&persists, "persists", false, "keep the instance after it stops")
	cmd.Flags().BoolVar(&tail, "tail", false, "follow logs after the server is created")
	cmd.Flags().BoolVarP(&follow, "follow", "f", false, "follow logs after the server is created")
	cmd.Flags().Int64Var(&cpu, "cpu", 0, "CPU limit as a percentage of the host")
	cmd.Flags().Int64Var(&memory, "memory", 0, "memory limit in mebibytes")
	cmd.Flags().Int64Var(&swap, "swap", 0, "extra swap in mebibytes")
	cmd.Flags().Uint16Var(&ioWeight, "io-weight", 0, "relative I/O weight")
	cmd.Flags().Int64Var(&disk, "disk", 0, "disk allowance in megabytes")
	cmd.Flags().StringVar(&threads, "threads", "", "CPU threads the container may use")
	cmd.Flags().BoolVar(&oom, "oom-disabled", false, "disable the OOM killer for the container")
	cmd.Flags().StringVar(&software, "software", "", "software id")
	cmd.Flags().StringVar(&version, "version", "", "software version")
	cmd.Flags().StringVar(&image, "image", "", "container image")
	return cmd
}
