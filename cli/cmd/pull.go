package cmd

import (
	"context"

	"github.com/spf13/cobra"
	"protoxon.com/oras/client"
	"protoxon.com/progress"
)

var pullDelete bool

var pullCmd = &cobra.Command{
	Use:   "pull VOLUME[:TAG] [PATH]",
	Short: "Pull a volume artifact from a registry",
	Long: `Pull a volume into PATH (default: the current directory).

Files on disk are compared to the artifact. A matching size and mtime
skips the hash; otherwise the file is hashed. Matching files are left
untouched, including local files that are not in the artifact. Files
that differ or are missing are fetched (Range requests when the registry
supports them). Use --delete to also remove dest files that are not in
the artifact.

Progress is a live TTY view by default. Use --progress=plain
for append-only logs (also used when stdout is not a terminal).`,
	Args:          rangeArgs(1, 2),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE: func(cmd *cobra.Command, args []string) error {
		path := "."
		if len(args) == 2 {
			path = args[1]
		}
		ref, err := resolveVolumeRef(cmd.Context(), args[0])
		if err != nil {
			return err
		}
		printer := progress.New(cmd.OutOrStdout(), progressMode)
		defer printer.Close()
		printer.Start("Pulling", ref)
		desc, err := client.Pull(context.Background(), ref, path, printer.Handle, client.Options{PlainHTTP: plainHTTP, Delete: pullDelete})
		if err != nil {
			return err
		}
		printer.Finish("Pulled", desc.Digest)
		return nil
	},
}

func init() {
	pullCmd.Flags().BoolVar(&pullDelete, "delete", false, "remove dest files that are not in the artifact")
	rootCmd.AddCommand(pullCmd)
}
