package cmd

import (
	"context"
	"fmt"
	"io"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/api"
	"protoxon.com/sls/cli/config"
	"protoxon.com/sls/cli/print"
)

var (
	authToken         string
	authTokenStdin    bool
	authNoInteractive bool
	apiLocal          bool
	apiSocket         string
	loginProfile      string
)

var authCmd = &cobra.Command{
	Use:   "auth",
	Short: "Manage the saved Controller login",
}

var authLogoutCmd = &cobra.Command{
	Use:           "logout",
	Short:         "Remove the saved Controller token",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runAuthLogout,
}

var authStatusCmd = &cobra.Command{
	Use:           "status",
	Short:         "Show the current Controller login",
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
	// Register once on the root command so `sls --socket` works for every
	// subcommand. Child commands used to declare the same flags locally.
	target := rootCmd
	if cmd != nil && cmd.Root() != nil && cmd.Root() != cmd {
		target = cmd.Root()
	}
	if target.PersistentFlags().Lookup("socket") != nil {
		return
	}
	target.PersistentFlags().BoolVar(&apiLocal, "local", false, "use the Controller Unix socket")
	target.PersistentFlags().StringVar(&apiSocket, "socket", "", "Controller Unix socket path")
}

func runAuthLogin(cmd *cobra.Command, args []string) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	name, err := loginProfileName(cmd)
	if err != nil {
		return err
	}
	url, err := loginURL(cmd, args, name, cfg)
	if err != nil {
		return err
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

	prev := cfg.Current
	if err := cfg.SetLogin(name, url, token, info.Scopes); err != nil {
		return err
	}
	cfg.PersistCurrent()
	if err := config.Save(cfg); err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Logged in as %s (%s)\n", info.Name, info.Prefix)
	if prev != cfg.Current {
		fmt.Fprintln(cmd.OutOrStdout(), print.SwitchMessage(cmd.OutOrStdout(), cfg.Current, prev))
	}
	return nil
}

func runAuthLogout(cmd *cobra.Command, _ []string) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	cfg.ClearToken()
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
	fmt.Fprintf(cmd.OutOrStdout(), "Profile: %s\n", cfg.Current)
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

func loginProfileName(cmd *cobra.Command) (string, error) {
	name := strings.TrimSpace(loginProfile)
	if name == "" && loginCanPrompt(cmd) {
		var err error
		name, err = promptLine(cmd.InOrStdin(), cmd.ErrOrStderr(), "Profile", "")
		if err != nil {
			return "", err
		}
		name = strings.TrimSpace(name)
	}
	if name == "" {
		return "", fmt.Errorf("profile is required")
	}
	if name == config.LocalProfile {
		return "", fmt.Errorf("profile local uses the admin socket; choose another profile name")
	}
	if err := config.ValidateProfileName(name); err != nil {
		return "", err
	}
	return name, nil
}

func loginURL(cmd *cobra.Command, args []string, name string, cfg config.File) (string, error) {
	url := ""
	if len(args) == 1 {
		url = args[0]
	}
	if strings.TrimSpace(url) == "" && loginCanPrompt(cmd) {
		def := config.DefaultAPIURL
		if p, ok := cfg.Profiles[name]; ok && strings.TrimSpace(p.URL) != "" {
			def = p.URL
		}
		var err error
		url, err = promptLine(cmd.InOrStdin(), cmd.ErrOrStderr(), "Controller URL", def)
		if err != nil {
			return "", err
		}
	}
	url = strings.TrimSpace(url)
	if url == "" {
		return "", fmt.Errorf("Controller URL is required")
	}
	return url, nil
}

func loginCanPrompt(cmd *cobra.Command) bool {
	return !authNoInteractive && !authTokenStdin && canPrompt(cmd.InOrStdin(), cmd.ErrOrStderr())
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

// apiClient talks to the admin socket for the local profile.
// A profile with a URL is reached over HTTP. A failed socket dial is returned.
func apiClient() (*api.Client, error) {
	cfg, err := config.Load()
	if err != nil {
		return nil, err
	}
	if apiLocal || cfg.UsesLocalSocket() {
		socket := config.Socket(cfg, apiSocket)
		if err := api.ProbeLocal(socket); err != nil {
			return nil, err
		}
		return api.NewLocal(socket)
	}
	if strings.TrimSpace(cfg.API.URL) == "" {
		return nil, fmt.Errorf("profile %s has no Controller URL", cfg.Current)
	}
	return api.New(cfg.API)
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
