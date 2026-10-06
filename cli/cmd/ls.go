package cmd

import (
	"context"

	"github.com/spf13/cobra"
	"protoxon.com/oras/client"
)

var volumeCmd = &cobra.Command{
	Use:   "volume",
	Short: "Manage volume artifacts in a registry",
}

var lsCmd = &cobra.Command{
	Use:     "ls [NAME]",
	Aliases: []string{"ps", "list"},
	Short:   "List volume tags in a registry, namespace, or repository",
	Long: `List volume artifacts in a registry, namespace, or repository.

With no NAME, lists the saved default registry (sls registry default).

NAME is a registry (localhost:5000), a namespace (localhost:5000/worlds),
or a repository (ghcr.io/jessefaler/slsmp3). Short names use the default
registry. A tag, if present, is ignored. Each tag is resolved and only
SLS volumes are printed; other artifacts are skipped.

A registry or namespace uses the OCI catalog API when the registry
enables it. Hosted registries often do not; pass a full repository
instead.

Use -o json or -o yaml for machine-readable output.`,
	Args:          maximumNArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runVolumeLS,
}

func init() {
	addOutputFlag(volumeCmd)
	volumeCmd.AddCommand(lsCmd)
	rootCmd.AddCommand(volumeCmd)
}

func runVolumeLS(cmd *cobra.Command, args []string) error {
	name := ""
	if len(args) == 1 {
		name = args[0]
	} else {
		def, err := currentDefaultRegistry(cmd.Context())
		if err != nil {
			return err
		}
		name = def
	}
	ref, err := resolveVolumeRef(cmd.Context(), name)
	if err != nil {
		return err
	}
	result, err := client.List(context.Background(), ref, client.Options{PlainHTTP: plainHTTP})
	if err != nil {
		return err
	}
	p, err := printer(cmd)
	if err != nil {
		return err
	}
	return p.Write(result, volumeTable(result.Volumes))
}
