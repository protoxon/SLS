package cmd

import (
	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

var outputFormat = "table"

func addOutputFlag(cmd *cobra.Command) {
	cmd.PersistentFlags().StringVarP(&outputFormat, "output", "o", "table", "output format: table, json, or yaml")
}

func printer(cmd *cobra.Command) (*print.Printer, error) {
	return print.New(cmd.OutOrStdout(), outputFormat)
}

func withAPI(cmd *cobra.Command, fn func(*api.Client, *print.Printer) error) error {
	p, err := printer(cmd)
	if err != nil {
		return err
	}
	client, err := apiClient()
	if err != nil {
		return err
	}
	return fn(client, p)
}

func command(use, short string, args cobra.PositionalArgs, run func(*cobra.Command, []string) error) *cobra.Command {
	return &cobra.Command{
		Use:           use,
		Short:         short,
		Args:          args,
		SilenceUsage:  true,
		SilenceErrors: true,
		RunE:          run,
	}
}
