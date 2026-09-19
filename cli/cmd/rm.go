package cmd

import (
	"context"
	"fmt"

	"github.com/spf13/cobra"
	"protoxon.com/oras/client"
)

var rmCmd = &cobra.Command{
	Use:     "rm VOLUME[:TAG]",
	Aliases: []string{"delete"},
	Short:   "Delete a volume artifact from a registry",
	Long: `Delete the volume manifest for VOLUME[:TAG] from the registry.

This removes the tag/manifest. Layer blobs may remain until the registry
runs garbage collection. The registry must allow manifest deletes
(for distribution: REGISTRY_STORAGE_DELETE_ENABLED=true).`,
	Args:          cobra.ExactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE: func(cmd *cobra.Command, args []string) error {
		desc, err := client.Delete(context.Background(), args[0], client.Options{PlainHTTP: plainHTTP})
		if err != nil {
			return err
		}
		fmt.Fprintf(cmd.OutOrStdout(), "Deleted %s %s\n", args[0], desc.Digest)
		return nil
	},
}

func init() {
	rootCmd.AddCommand(rmCmd)
}
