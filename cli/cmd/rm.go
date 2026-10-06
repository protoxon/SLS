package cmd

import (
	"context"
	"fmt"

	"github.com/spf13/cobra"
	"protoxon.com/oras/client"
)

var rmCmd = &cobra.Command{
	Use:   "rm VOLUME[:TAG]",
	Short: "Delete a volume artifact from a registry",
	Long: `Delete the volume manifest for VOLUME[:TAG] from the registry.

This removes the tag/manifest. On Protocube's embedded registry, orphaned
layer blobs are reclaimed by a debounced garbage collection after deletes
and overwrites. Other registries may leave blobs until their own GC runs.
The registry must allow manifest deletes (for distribution:
REGISTRY_STORAGE_DELETE_ENABLED=true).`,
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE: func(cmd *cobra.Command, args []string) error {
		ref, err := resolveVolumeRef(cmd.Context(), args[0])
		if err != nil {
			return err
		}
		desc, err := client.Delete(context.Background(), ref, client.Options{PlainHTTP: plainHTTP})
		if err != nil {
			return err
		}
		fmt.Fprintf(cmd.OutOrStdout(), "Deleted %s %s\n", ref, desc.Digest)
		return nil
	},
}

func init() {
	rootCmd.AddCommand(rmCmd)
}
