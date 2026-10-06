package cmd

import (
	"context"
	"errors"
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/config"
	"protoxon.com/oras/client"
)

var (
	registryUsername        string
	registryPassword        string
	registryPasswordStdin   bool
	registryDefaultInsecure bool
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
Protocube's default (requires registry:read) and save it, including
whether that registry uses HTTP (insecure).

REGISTRY is a host or host/namespace, for example ghcr.io/jessefaler.
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
saved CLI default, or Protocube's default when none is saved (requires
registry:read). The command fails when there is no default. When push
or pull needs credentials and none are stored, the command fails and
tells you to log in.

Protocube's own registry does not need this if you already ran sls login
with a token that has registry:read, registry:write, or app:admin. Use
this command for other registries, or to store a different token for
the Protocube host.`,
	Args:          maximumNArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runRegistryLogin,
}

func init() {
	registryLoginCmd.Flags().StringVarP(&registryUsername, "username", "u", "", "registry username")
	registryLoginCmd.Flags().StringVarP(&registryPassword, "password", "p", "", "registry password or identity token")
	registryLoginCmd.Flags().BoolVar(&registryPasswordStdin, "password-stdin", false, "read password or identity token from stdin")
	registryDefaultCmd.Flags().BoolVar(&registryDefaultInsecure, "insecure", false, "use HTTP instead of HTTPS for the default registry")
	addAPIFlags(registryDefaultCmd)
	registryCmd.AddCommand(registryLoginCmd, registryDefaultCmd)
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
		return "", false, fmt.Errorf("Protocube has no default registry")
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
