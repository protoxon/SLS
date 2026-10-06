package cmd

import (
	"context"
	"fmt"
	"os"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/oras/client"
	"protoxon.com/progress"
	"protoxon.com/sls/daemon/oras/volume"
)

var (
	pushCompression string
	pushTarget      string
	pushMode        string
	pushRewrite     bool
)

var pushCmd = &cobra.Command{
	Use:   "push VOLUME[:TAG] [PATH]",
	Short: "Push a volume directory to a registry",
	Long: `Push a volume directory to a registry.

New layers are compressed with --compression (zstd by default; also gzip
or none). Each layer records its codec, so a later push can change
algorithm without recompressing unchanged files. Pull decodes each layer
with the codec stored on that layer.

--target and --mode set the default mount recorded on the artifact
(ro or cow). A later push without those flags keeps the previous
defaults. Daemon pull writes them to dest/.sls/mount.json.

Unchanged files stay on their old layers. After many incremental
pushes the artifact can accumulate many small layers. --rewrite
repacks everything into new layers. Push warns when that looks
worthwhile.`,
	Args:          rangeArgs(1, 2),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE: func(cmd *cobra.Command, args []string) error {
		path := "."
		if len(args) == 2 {
			path = args[1]
		}
		if _, err := os.Stat(path); err != nil {
			return err
		}
		mode, err := normalizePushMode(pushMode)
		if err != nil {
			return err
		}
		ref, err := resolveVolumeRef(cmd.Context(), args[0])
		if err != nil {
			return err
		}
		printer := progress.New(cmd.OutOrStdout(), progressMode)
		defer printer.Close()
		printer.Start("Pushing", ref)
		desc, err := client.Push(context.Background(), ref, path, printer.Handle, client.Options{
			PlainHTTP:   plainHTTP,
			Compression: pushCompression,
			Rewrite:     pushRewrite,
		}, volume.MountInfo{
			Target: strings.TrimSpace(pushTarget),
			Mode:   mode,
		})
		if err != nil {
			return err
		}
		printer.Finish("Pushed", desc.Digest)
		return nil
	},
}

func normalizePushMode(mode string) (string, error) {
	mode = strings.ToLower(strings.TrimSpace(mode))
	switch mode {
	case "", "ro", "cow":
		return mode, nil
	default:
		return "", fmt.Errorf("invalid mount mode %q (want ro or cow)", mode)
	}
}

func init() {
	pushCmd.Flags().StringVar(&pushCompression, "compression", "zstd", "compression algorithm: zstd, gzip, or none")
	pushCmd.Flags().StringVarP(&pushTarget, "target", "t", "", "default container mount path")
	pushCmd.Flags().StringVarP(&pushMode, "mode", "m", "", "default mount mode: ro or cow")
	pushCmd.Flags().BoolVar(&pushRewrite, "rewrite", false, "repack all files into new layers instead of reusing the previous tag")
	rootCmd.AddCommand(pushCmd)
}
