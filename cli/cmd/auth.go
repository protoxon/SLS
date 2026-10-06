package cmd

import (
	"context"
	"fmt"
	"io"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/config"
)

var (
	authToken         string
	authTokenStdin    bool
	authNoInteractive bool
	apiLocal          bool
	apiSocket         string
)

var authCmd = &cobra.Command{
	Use:   "auth",
	Short: "Manage the saved Protocube login",
}

var authLogoutCmd = &cobra.Command{
	Use:           "logout",
	Short:         "Remove the saved Protocube token",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runAuthLogout,
}

var authStatusCmd = &cobra.Command{
	Use:           "status",
	Short:         "Show the current Protocube login",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runAuthStatus,
}

func init() {
	addAPIFlags(authCmd)
	authCmd.AddCommand(authLogoutCmd, authStatusCmd)
	rootCmd.AddCommand(authCmd)
}

func addAPIFlags(cmd *cobra.Command) {
	cmd.PersistentFlags().BoolVar(&apiLocal, "local", false, "use the Protocube Unix socket")
	cmd.PersistentFlags().StringVar(&apiSocket, "socket", "", "Protocube Unix socket path")
}

func runAuthLogin(cmd *cobra.Command, args []string) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	url := cfg.API.URL
	if len(args) == 1 {
		url = args[0]
	}
	if url == "" && !authNoInteractive && canPrompt(cmd.InOrStdin(), cmd.ErrOrStderr()) {
		url, err = promptLine(cmd.InOrStdin(), cmd.ErrOrStderr(), "Protocube URL", config.DefaultAPIURL)
		if err != nil {
			return err
		}
	}
	if strings.TrimSpace(url) == "" {
		return fmt.Errorf("Protocube URL is required")
	}

	token, err := readAuthToken(cmd)
	if err != nil {
		return err
	}
	client, err := api.New(config.API{URL: url, Token: token})
	if err != nil {
		return err
	}
	info, err := client.Auth(cmdCtx(cmd))
	if err != nil {
		return err
	}

	cfg.API.URL = strings.TrimRight(url, "/")
	cfg.API.Token = token
	cfg.API.Scopes = info.Scopes
	if err := config.Save(cfg); err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Logged in as %s (%s)\n", info.Name, info.Prefix)
	return nil
}

func runAuthLogout(cmd *cobra.Command, _ []string) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	cfg.API.Token = ""
	cfg.API.Scopes = nil
	if err := config.Save(cfg); err != nil {
		return err
	}
	fmt.Fprintln(cmd.OutOrStdout(), "Logged out")
	return nil
}

func runAuthStatus(cmd *cobra.Command, _ []string) error {
	client, err := apiClient()
	if err != nil {
		return err
	}
	info, err := client.Auth(cmdCtx(cmd))
	if err != nil {
		return err
	}
	cfg, _ := config.Load()
	if info.Local {
		fmt.Fprintf(cmd.OutOrStdout(), "Via:     unix socket (%s)\n", config.Socket(cfg, apiSocket))
	} else {
		fmt.Fprintf(cmd.OutOrStdout(), "URL:     %s\n", cfg.API.URL)
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Name:    %s\n", info.Name)
	fmt.Fprintf(cmd.OutOrStdout(), "Prefix:  %s\n", info.Prefix)
	fmt.Fprintf(cmd.OutOrStdout(), "Scopes:  %s\n", strings.Join(info.Scopes, ", "))
	if info.ExpiresAt != nil {
		fmt.Fprintf(cmd.OutOrStdout(), "Expires: %s\n", info.ExpiresAt.Format("2006-01-02 15:04"))
	} else {
		fmt.Fprintln(cmd.OutOrStdout(), "Expires: never")
	}
	return nil
}

func readAuthToken(cmd *cobra.Command) (string, error) {
	if authToken != "" && authTokenStdin {
		return "", fmt.Errorf("only one of --token and --token-stdin can be used")
	}
	if authTokenStdin {
		body, err := io.ReadAll(cmd.InOrStdin())
		if err != nil {
			return "", err
		}
		token := strings.TrimSpace(string(body))
		if token == "" {
			return "", fmt.Errorf("token is required")
		}
		return token, nil
	}
	if authToken != "" {
		return authToken, nil
	}
	if authNoInteractive || !canPrompt(cmd.InOrStdin(), cmd.ErrOrStderr()) {
		return "", fmt.Errorf("token is required")
	}
	return promptSecret(cmd.InOrStdin(), cmd.ErrOrStderr(), "Token")
}

func cmdCtx(cmd *cobra.Command) context.Context {
	if cmd != nil && cmd.Context() != nil {
		return cmd.Context()
	}
	return context.Background()
}

// apiClient uses the Unix socket when it is reachable (or --local is set).
// Otherwise it uses the saved Protocube URL and token.
func apiClient() (*api.Client, error) {
	cfg, err := config.Load()
	if err != nil {
		return nil, err
	}
	socket := config.Socket(cfg, apiSocket)
	probeErr := api.ProbeLocal(socket)
	if probeErr == nil {
		return api.NewLocal(socket)
	}
	if apiLocal {
		return nil, probeErr
	}
	remote, remErr := api.New(cfg.API)
	if remErr == nil {
		return remote, nil
	}
	if api.IsPermission(probeErr) {
		return nil, probeErr
	}
	return nil, fmt.Errorf("%w\n%v", remErr, probeErr)
}

func defaultString(v, def string) string {
	if strings.TrimSpace(v) == "" {
		return def
	}
	return v
}

func normalizeExpires(s string) string {
	s = strings.TrimSpace(s)
	if s == "" || strings.EqualFold(s, "never") {
		return ""
	}
	return s
}
