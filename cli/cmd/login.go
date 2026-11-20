package cmd

import (
	"github.com/spf13/cobra"
)

var loginCmd = &cobra.Command{
	Use:   "login [url]",
	Short: "Log in to Controller",
	Long: `Save a Controller personal access token for API commands.

Asks for the profile name, Controller URL, and token, and stores them
in $XDG_CONFIG_HOME/sls/config.yaml (override with SLS_CONFIG). Run
login again with the same profile name to replace that profile's URL
and token. The built-in local profile uses the admin socket and is not
a login target.

On the Controller host, sls token create talks to the Unix socket and
does not need a saved token.

If the token has registry:read, registry:write, or app:admin, the same
login is used for the embedded registry at the Controller URL's host.
Save another hostname with sls registry host add. sls registry login
is for other registries.`,
	Args:          maximumNArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runAuthLogin,
}

func init() {
	loginCmd.Flags().StringVar(&loginProfile, "profile", "", "profile to create or update")
	loginCmd.Flags().StringVarP(&authToken, "token", "t", "", "API token")
	loginCmd.Flags().BoolVar(&authTokenStdin, "token-stdin", false, "read token from stdin")
	loginCmd.Flags().BoolVar(&authNoInteractive, "no-interactive", false, "disable prompts")
	rootCmd.AddCommand(loginCmd)
}
