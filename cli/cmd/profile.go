package cmd

import (
	"fmt"
	"io"
	"strings"

	"github.com/spf13/cobra"

	"protoxon.com/sls/cli/config"
	"protoxon.com/sls/cli/print"
)

var (
	profileSetURL        string
	profileSetToken      string
	profileSetTokenStdin bool
)

var profileCmd = &cobra.Command{
	Use:     "profile [name]",
	Short:   "List Controller profiles or switch the current one",
	GroupID: groupManage,
	Args:    cobra.MaximumNArgs(1),
	RunE: func(cmd *cobra.Command, args []string) error {
		if len(args) == 0 {
			return printProfiles(cmd.OutOrStdout())
		}
		return switchProfile(cmd.OutOrStdout(), args[0])
	},
}

var profileRmCmd = &cobra.Command{
	Use:     "rm NAME",
	Aliases: []string{"remove"},
	Short:   "Remove a Controller profile",
	Long: `Remove a saved Controller profile.

The built-in local profile cannot be removed. Removing the saved current
profile switches to local.`,
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runProfileRm,
}

var profileSetCmd = &cobra.Command{
	Use:   "set [name]",
	Short: "Update a profile's Controller URL or token",
	Long: `Change the saved Controller URL, token, or both for a profile.

The profile defaults to the current one. At least one of --url, --token,
or --token-stdin is required. A new token clears the saved scopes; run
login again to store them. The current profile stays the same.
The local profile uses the admin socket and cannot be updated.`,
	Args:          maximumNArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runProfileSet,
}

func init() {
	profileSetCmd.Flags().StringVar(&profileSetURL, "url", "", "Controller URL")
	profileSetCmd.Flags().StringVarP(&profileSetToken, "token", "t", "", "API token")
	profileSetCmd.Flags().BoolVar(&profileSetTokenStdin, "token-stdin", false, "read token from stdin")
	profileCmd.AddCommand(profileSetCmd, profileRmCmd)
	rootCmd.AddCommand(profileCmd)
}

func printProfiles(w io.Writer) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	p, err := print.New(w, "table")
	if err != nil {
		return err
	}
	return p.Write(nil, profileTable(cfg))
}

func profileTable(cfg config.File) print.Table {
	t := print.Table{Columns: []print.Column{
		{Header: "NAME"},
		{Header: "ENDPOINT"},
	}}
	for _, name := range cfg.Names() {
		p := cfg.Profiles[name]
		label := name
		if name == cfg.Current {
			label = "* " + name
		}
		t.Rows = append(t.Rows, []string{label, profileEndpoint(p)})
	}
	return t
}

func switchProfile(w io.Writer, name string) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	prev := cfg.Current
	if err := cfg.Use(name); err != nil {
		return err
	}
	if err := config.Save(cfg); err != nil {
		return err
	}
	if prev == name {
		fmt.Fprintf(w, "Already using profile %s\n", name)
		return nil
	}
	fmt.Fprintln(w, print.SwitchMessage(w, name, prev))
	return nil
}

func runProfileSet(cmd *cobra.Command, args []string) error {
	urlSet := cmd.Flags().Changed("url")
	tokenSet := cmd.Flags().Changed("token")
	if !urlSet && !tokenSet && !profileSetTokenStdin {
		return usageErrorf(cmd, "url or token is required")
	}
	if tokenSet && profileSetTokenStdin {
		return fmt.Errorf("only one of --token and --token-stdin can be used")
	}

	cfg, err := config.Load()
	if err != nil {
		return err
	}
	name := cfg.Current
	if len(args) == 1 {
		name = args[0]
	}

	var url, token *string
	if urlSet {
		v := profileSetURL
		url = &v
	}
	if profileSetTokenStdin {
		body, err := io.ReadAll(cmd.InOrStdin())
		if err != nil {
			return err
		}
		v := string(body)
		token = &v
	} else if tokenSet {
		v := profileSetToken
		token = &v
	}
	if err := cfg.UpdateProfile(name, url, token); err != nil {
		return err
	}
	if err := config.Save(cfg); err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Updated profile %s\n", name)
	return nil
}

func runProfileRm(cmd *cobra.Command, args []string) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	switched, err := cfg.RemoveProfile(args[0])
	if err != nil {
		return err
	}
	if err := config.Save(cfg); err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Removed profile %s\n", args[0])
	if switched {
		fmt.Fprintln(cmd.OutOrStdout(), "Switched to profile local")
	}
	return nil
}

func profileEndpoint(p config.Profile) string {
	if url := strings.TrimSpace(p.URL); url != "" {
		return url
	}
	socket := p.Socket
	if socket == "" {
		socket = config.DefaultSocket
	}
	return "socket " + socket
}
