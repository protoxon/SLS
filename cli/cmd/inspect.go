package cmd

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"strings"

	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"github.com/spf13/cobra"
	"protoxon.com/oras/client"
	"protoxon.com/sls/daemon/oras/volume"
)

var inspectJSON bool

var inspectCmd = &cobra.Command{
	Use:   "inspect VOLUME[:TAG]",
	Short: "Show volume artifact details",
	Long: `Inspect a volume artifact in a registry without downloading layers.

Prints mount defaults, layer count and compressed size, file count
and uncompressed size, and compression. Use --json for the OCI
manifest and volume config.`,
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE: func(cmd *cobra.Command, args []string) error {
		ref, err := resolveVolumeRef(cmd.Context(), args[0])
		if err != nil {
			return err
		}
		result, err := client.Inspect(context.Background(), ref, client.Options{PlainHTTP: plainHTTP})
		if err != nil {
			return err
		}
		return writeInspect(cmd.OutOrStdout(), result, inspectJSON)
	},
}

func init() {
	inspectCmd.Flags().BoolVar(&inspectJSON, "json", false, "print the OCI manifest and volume config as JSON")
	rootCmd.AddCommand(inspectCmd)
}

func writeInspect(w io.Writer, result client.InspectResult, asJSON bool) error {
	if asJSON {
		enc := json.NewEncoder(w)
		enc.SetIndent("", "  ")
		return enc.Encode(result)
	}
	return formatInspect(w, result)
}

func formatInspect(w io.Writer, result client.InspectResult) error {
	cfg := result.Config
	if result.Reference != "" {
		fmt.Fprintln(w, result.Reference)
	}
	kv(w, "Digest", result.Descriptor.Digest.String())
	if d := result.Manifest.Config.Digest.String(); d != "" {
		kv(w, "Config", d)
	}
	if created := result.Manifest.Annotations[ocispec.AnnotationCreated]; created != "" {
		kv(w, "Created", created)
	}
	artifact := result.Manifest.ArtifactType
	if artifact == "" {
		artifact = volume.ArtifactType
	}
	kv(w, "Artifact", artifact)
	kv(w, "Compression", dash(cfg.Compression))
	fmt.Fprintln(w)
	fmt.Fprintln(w, "Mount:")
	fmt.Fprintf(w, "  %-11s %s\n", "Target:", dash(cfg.MountInfo.Target))
	fmt.Fprintf(w, "  %-11s %s\n", "Mode:", dash(cfg.MountInfo.Mode))
	fmt.Fprintln(w)
	fmt.Fprintf(w, "%-13s %d  (%s compressed)\n", "Layers:", len(cfg.Layers), fmtBytes(cfg.LayerBytes()))
	for _, layer := range cfg.Layers {
		comp := layer.Compression
		if comp == "" {
			comp = cfg.Compression
		}
		fmt.Fprintf(w, "  %s  %s  %s\n", shortDigest(layer.Digest.String()), fmtBytes(layer.Size), dash(comp))
	}
	fmt.Fprintln(w)
	fmt.Fprintf(w, "%-13s %d  (%s uncompressed)\n", "Files:", len(cfg.Files), fmtBytes(cfg.FileBytes()))
	if cfg.Fragmented() {
		fmt.Fprintf(w, "\nVolume has %d small layers (avg %s). sls push --rewrite will repack them.\n",
			len(cfg.Layers), fmtBytes(cfg.LayerBytes()/int64(len(cfg.Layers))))
	}
	return nil
}

func kv(w io.Writer, key, value string) {
	fmt.Fprintf(w, "%-13s %s\n", key+":", value)
}

func dash(s string) string {
	if strings.TrimSpace(s) == "" {
		return "-"
	}
	return s
}

func shortDigest(d string) string {
	if strings.HasPrefix(d, "sha256:") && len(d) >= 19 {
		return d[:19]
	}
	return d
}

func fmtBytes(n int64) string {
	const unit = 1024
	if n < unit {
		return fmt.Sprintf("%dB", n)
	}
	div, exp := int64(unit), 0
	for n/div >= unit && exp < 3 {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.2f%cB", float64(n)/float64(div), "KMGT"[exp])
}
