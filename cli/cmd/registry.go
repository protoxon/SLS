package cmd

import (
	"context"
	"errors"
	"fmt"
	"net/url"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/sls/cli/config"
	"protoxon.com/sls/cli/oras/client"
)

var (
	registryUsername        string
	registryPassword        string
	registryPasswordStdin   bool
	registryDefaultInsecure bool
	registryHostInsecure    bool
)

var registryCmd = &cobra.Command{
	Use:   "registry",
	Short: "Manage registry credentials and the default registry",
}

var registryDefaultCmd = &cobra.Command{
	Use:   "default [REGISTRY]",
	Short: "Show or set the default registry",
	Long: `Show or set the default registry stored in the CLI config.

With no argument, print the saved registry. If none is saved, fetch
Controller's default (requires registry:read) and save it, including
whether that registry uses HTTP (insecure).

REGISTRY is a host or host/namespace, for example ghcr.io/example.
Use --insecure when the registry speaks plain HTTP.`,
	Args:          maximumNArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runRegistryDefault,
}

var registryLoginCmd = &cobra.Command{
	Use:   "login [REGISTRY]",
	Short: "Log in to a registry",
	Long: `Log in to a registry and store credentials for later push and pull.

Credentials are saved to $XDG_CONFIG_HOME/sls/credentials.json (override
with SLS_CREDENTIALS) and take priority over Docker and Podman.

If REGISTRY is omitted, the host of the default registry is used: the
saved CLI default, or Controller's default when none is saved (requires
registry:read). The command fails when there is no default. When push
or pull needs credentials and none are stored, the command fails and
tells you to log in.

Controller's embedded registry uses the sls login token. It has no
separate username or password. The token is sent for the host in the
Controller URL. Save another hostname with sls registry host add.
This command is for other registries.`,
	Args:          maximumNArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runRegistryLogin,
}

var registryHostCmd = &cobra.Command{
	Use:   "host",
	Short: "Hostnames for Controller's embedded registry",
	Long: `List extra hostnames for the Controller you are logged into.

The embedded registry uses the sls login token. It does not take a
registry username or password. The token is sent for the Controller
URL's host and for every hostname listed here. On the local profile,
the admin socket is dialed for those hostnames.`,
	Args:          maximumNArgs(0),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runRegistryHostList,
}

var registryHostAddCmd = &cobra.Command{
	Use:   "add HOST",
	Short: "Remember a hostname for Controller's embedded registry",
	Long: `Save HOST as another name for this Controller's embedded registry.

Push and pull to HOST use the Controller token from sls login. On the
local profile, the admin socket is used for HOST. HOST is a host or
host:port, for example controller.sls.net:5620. Use --insecure when
that host speaks plain HTTP.`,
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runRegistryHostAdd,
}

var registryHostRemoveCmd = &cobra.Command{
	Use:           "remove HOST",
	Short:         "Forget a hostname for Controller's embedded registry",
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runRegistryHostRemove,
}

func init() {
	registryLoginCmd.Flags().StringVarP(&registryUsername, "username", "u", "", "registry username")
	registryLoginCmd.Flags().StringVarP(&registryPassword, "password", "p", "", "registry password or identity token")
	registryLoginCmd.Flags().BoolVar(&registryPasswordStdin, "password-stdin", false, "read password or identity token from stdin")
	registryDefaultCmd.Flags().BoolVar(&registryDefaultInsecure, "insecure", false, "use HTTP instead of HTTPS for the default registry")
	registryHostAddCmd.Flags().BoolVar(&registryHostInsecure, "insecure", false, "use HTTP instead of HTTPS for this host")
	addAPIFlags(registryDefaultCmd)
	registryHostCmd.AddCommand(registryHostAddCmd, registryHostRemoveCmd)
	registryCmd.AddCommand(registryLoginCmd, registryDefaultCmd, registryHostCmd)
	rootCmd.AddCommand(registryCmd)
}

func resolveVolumeRef(ctx context.Context, ref string) (string, error) {
	expanded, err := client.ExpandReference(ref, "")
	if err == nil {
		return expanded, nil
	}
	if !errors.Is(err, client.ErrDefaultRegistryRequired) {
		return "", err
	}
	def, err := currentDefaultRegistry(ctx)
	if err != nil {
		return "", err
	}
	return client.ExpandReference(ref, def)
}

func runRegistryDefault(cmd *cobra.Command, args []string) error {
	if len(args) == 1 {
		reg, err := normalizeDefaultRegistry(args[0])
		if err != nil {
			return err
		}
		if err := saveDefaultRegistry(reg, registryDefaultInsecure); err != nil {
			return err
		}
		printDefaultRegistry(cmd, reg, registryDefaultInsecure)
		return nil
	}
	reg, insecure, err := currentDefaultRegistryInfo(cmd.Context())
	if err != nil {
		return err
	}
	printDefaultRegistry(cmd, reg, insecure)
	return nil
}

func printDefaultRegistry(cmd *cobra.Command, reg string, insecure bool) {
	if insecure {
		fmt.Fprintf(cmd.OutOrStdout(), "%s\tinsecure\n", reg)
		return
	}
	fmt.Fprintln(cmd.OutOrStdout(), reg)
}

func currentDefaultRegistry(ctx context.Context) (string, error) {
	reg, _, err := currentDefaultRegistryInfo(ctx)
	return reg, err
}

func currentDefaultRegistryInfo(ctx context.Context) (string, bool, error) {
	cfg, err := config.Load()
	if err != nil {
		return "", false, err
	}
	if reg := strings.TrimSpace(cfg.Registry.Default); reg != "" {
		return reg, cfg.Registry.Insecure, nil
	}
	client, err := apiClient()
	if err != nil {
		return "", false, err
	}
	if ctx == nil {
		ctx = context.Background()
	}
	info, err := client.DefaultRegistry(ctx)
	if err != nil {
		return "", false, err
	}
	reg, err := normalizeDefaultRegistry(info.Default)
	if err != nil {
		return "", false, fmt.Errorf("Controller has no default registry")
	}
	if err := saveDefaultRegistry(reg, info.Insecure); err != nil {
		return "", false, err
	}
	return reg, info.Insecure, nil
}

func saveDefaultRegistry(reg string, insecure bool) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	cfg.Registry.Default = reg
	cfg.Registry.Insecure = insecure
	return config.Save(cfg)
}

func loginTarget(ctx context.Context, args []string) (string, error) {
	if len(args) == 1 {
		return args[0], nil
	}
	def, err := currentDefaultRegistry(ctx)
	if err != nil {
		return "", err
	}
	host, _, _ := strings.Cut(def, "/")
	return host, nil
}

func normalizeDefaultRegistry(registry string) (string, error) {
	registry = strings.TrimSpace(registry)
	registry = strings.TrimPrefix(registry, "https://")
	registry = strings.TrimPrefix(registry, "http://")
	registry = strings.Trim(registry, "/")
	if registry == "" {
		return "", fmt.Errorf("registry is required")
	}
	return registry, nil
}

func runRegistryLogin(cmd *cobra.Command, args []string) error {
	registry, err := loginTarget(cmd.Context(), args)
	if err != nil {
		return err
	}
	cred, err := client.ReadCredential(registryUsername, registryPassword, registryPasswordStdin, cmd.InOrStdin(), cmd.ErrOrStderr())
	if err != nil {
		return err
	}
	if err := client.Login(context.Background(), registry, cred, client.Options{PlainHTTP: plainHTTP}); err != nil {
		return err
	}
	fmt.Fprintln(cmd.OutOrStdout(), "Login succeeded")
	return nil
}

func runRegistryHostList(cmd *cobra.Command, _ []string) error {
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	if len(cfg.Hosts) == 0 {
		fmt.Fprintln(cmd.OutOrStdout(), "No embedded registry hostnames saved")
		return nil
	}
	for _, host := range cfg.Hosts {
		printDefaultRegistry(cmd, host.Host, host.Insecure)
	}
	return nil
}

func runRegistryHostAdd(cmd *cobra.Command, args []string) error {
	host, err := normalizeRegistryHost(args[0])
	if err != nil {
		return err
	}
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	if apiHost := registryHostOf(cfg.API.URL); apiHost != "" && strings.EqualFold(apiHost, host) {
		fmt.Fprintf(cmd.OutOrStdout(), "%s is already the Controller URL host\n", host)
		return nil
	}
	cfg.RememberRegistryHost(host, registryHostInsecure || plainHTTP)
	if err := config.Save(cfg); err != nil {
		return err
	}
	printDefaultRegistry(cmd, host, registryHostInsecure || plainHTTP)
	return nil
}

func registryHostOf(rawURL string) string {
	rawURL = strings.TrimSpace(rawURL)
	if rawURL == "" {
		return ""
	}
	if !strings.Contains(rawURL, "://") {
		return strings.TrimRight(rawURL, "/")
	}
	u, err := url.Parse(rawURL)
	if err != nil || u.Host == "" {
		return strings.TrimRight(rawURL, "/")
	}
	return u.Host
}

func runRegistryHostRemove(cmd *cobra.Command, args []string) error {
	host, err := normalizeRegistryHost(args[0])
	if err != nil {
		return err
	}
	cfg, err := config.Load()
	if err != nil {
		return err
	}
	if !cfg.ForgetRegistryHost(host) {
		return fmt.Errorf("hostname %s is not saved", host)
	}
	if err := config.Save(cfg); err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Removed %s\n", host)
	return nil
}

func normalizeRegistryHost(host string) (string, error) {
	host = client.NormalizeRegistry(host)
	if host == "" || strings.Contains(host, "/") {
		return "", fmt.Errorf("hostname must be a host or host:port")
	}
	return host, nil
}
