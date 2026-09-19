package cmd

import (
	log2 "log"

	"github.com/spf13/cobra"
)

var (
	plainHTTP    bool
	progressMode string
)

var rootCmd = &cobra.Command{
	Use:   "sls",
	Short: "SLS CLI",
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		log2.Fatalf("failed to execute command: %s", err)
	}
}

func init() {
	rootCmd.PersistentFlags().BoolVar(&plainHTTP, "http", false, "use HTTP instead of HTTPS when talking to the registry")
	rootCmd.PersistentFlags().StringVar(&progressMode, "progress", "auto", "progress output: auto, tty, or plain")
}
