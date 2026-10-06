package cmd

import (
	"github.com/spf13/cobra"
)

var loginCmd = &cobra.Command{
	Use:   "login [url]",
	Short: "Log in to Protocube",
	Long: `Save a Protocube personal access token for API commands.

The token is stored in $XDG_CONFIG_HOME/sls/config.yaml (override with
SLS_CONFIG). On the Protocube host, sls token create talks to the Unix
socket and does not need a saved token.

If the token has registry:read, registry:write, or app:admin, the same
login is used for Protocube's embedded registry. sls registry login is
only needed for other registries, or to override this token.`,
	Args:          maximumNArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runAuthLogin,
}

func init() {
	loginCmd.Flags().StringVarP(&authToken, "token", "t", "", "API token")
	loginCmd.Flags().BoolVar(&authTokenStdin, "token-stdin", false, "read token from stdin")
	loginCmd.Flags().BoolVar(&authNoInteractive, "no-interactive", false, "disable prompts")
	rootCmd.AddCommand(loginCmd)
}
