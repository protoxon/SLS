package cmd

import (
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

func newNodeCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "node",
		Short: "Manage nodes",
	}
	cmd.GroupID = groupManage
	addAPIFlags(cmd)
	addOutputFlag(cmd)
	cmd.AddCommand(
		command("ls", "List nodes", noArgs, func(cmd *cobra.Command, _ []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				nodes, err := c.ListNodes(cmdCtx(cmd))
				if err != nil {
					return err
				}
				return p.Write(nodes, nodeTable(nodes))
			})
		}),
		command("inspect NODE", "Show node and host details", exactArgs(1), func(cmd *cobra.Command, args []string) error {
			return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
				node, err := c.InspectNode(cmdCtx(cmd), args[0])
				if err != nil {
					return err
				}
				return p.Write(node, nodeFields(node))
			})
		}),
		newNodeDrainCommand(),
	)
	return cmd
}

func newNodeDrainCommand() *cobra.Command {
	return command("drain NODE true|false", "Set whether a node accepts new servers", exactArgs(2), func(cmd *cobra.Command, args []string) error {
		drained, err := parseDrained(args[1])
		if err != nil {
			return err
		}
		return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
			if err := c.SetNodeDrained(cmdCtx(cmd), args[0], drained); err != nil {
				return err
			}
			raw := struct {
				Node    string `json:"node"`
				Drained bool   `json:"drained"`
			}{Node: args[0], Drained: drained}
			fields := print.Fields{Items: []print.Field{
				{Key: "Node", Value: args[0]},
				{Key: "Drained", Value: boolString(drained)},
			}}
			return p.Write(raw, fields)
		})
	})
}

func parseDrained(value string) (bool, error) {
	switch strings.ToLower(value) {
	case "true":
		return true, nil
	case "false":
		return false, nil
	default:
		return false, fmt.Errorf("drained state must be true or false")
	}
}

func boolString(v bool) string {
	if v {
		return "true"
	}
	return "false"
}

func init() {
	rootCmd.AddCommand(newNodeCommand())
}
