package cmd

import (
	"bytes"
	"strings"
	"testing"

	"github.com/spf13/pflag"
	"protoxon.com/sls/cli/config"
)

func TestProfileListAndSwitch(t *testing.T) {
	t.Setenv("SLS_CONFIG", t.TempDir()+"/config.yaml")
	t.Setenv("SLS_PROFILE", "")
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	if err := config.Save(config.File{
		Current: config.LocalProfile,
		Profiles: map[string]config.Profile{
			"prod": {
				URL:      "https://controller.example:5620",
				Token:    "secret",
				Registry: config.Registry{Default: "controller.example:5620"},
			},
			config.LocalProfile: {Registry: config.Registry{Default: "controller.sls.net:5620"}},
		},
	}); err != nil {
		t.Fatal(err)
	}

	var out bytes.Buffer
	profileCmd.SetOut(&out)
	t.Cleanup(func() { profileCmd.SetOut(nil) })
	if err := profileCmd.RunE(profileCmd, nil); err != nil {
		t.Fatal(err)
	}
	text := out.String()
	for _, want := range []string{"NAME", "ENDPOINT", "* local", "prod", "socket " + config.DefaultSocket, "https://controller.example:5620"} {
		if !strings.Contains(text, want) {
			t.Fatalf("list missing %q in %q", want, text)
		}
	}

	out.Reset()
	if err := profileCmd.RunE(profileCmd, []string{"prod"}); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(out.String(), "Switched to profile prod. Use sls profile local to switch back.") {
		t.Fatalf("switch %q", out.String())
	}
	cfg, err := config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" || cfg.UsesLocalSocket() {
		t.Fatalf("current %s socket %v", cfg.Current, cfg.UsesLocalSocket())
	}

	out.Reset()
	if err := profileCmd.RunE(profileCmd, []string{"local"}); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(out.String(), "Switched to profile local. Use sls profile prod to switch back.") {
		t.Fatalf("switch back %q", out.String())
	}
}

func TestProfileSet(t *testing.T) {
	path := t.TempDir() + "/config.yaml"
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_PROFILE", "")
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	if err := config.Save(config.File{
		Current: "prod",
		Profiles: map[string]config.Profile{
			"prod": {
				URL:      "https://prod.example",
				Token:    "prod-token",
				Scopes:   []string{"registry:read"},
				Registry: config.Registry{Default: "prod.example"},
			},
			"dev": {
				URL:    "https://dev.example",
				Token:  "dev-token",
				Scopes: []string{"servers:read"},
			},
		},
	}); err != nil {
		t.Fatal(err)
	}

	out, err := execProfileSet(t, "", "dev", "--url", "https://dev.example:5620/")
	if err != nil {
		t.Fatal(err)
	}
	if out != "Updated profile dev\n" {
		t.Fatalf("output %q", out)
	}
	cfg, err := config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" {
		t.Fatalf("current %s", cfg.Current)
	}
	dev := cfg.Profiles["dev"]
	if dev.URL != "https://dev.example:5620" || dev.Token != "dev-token" || len(dev.Scopes) != 1 {
		t.Fatalf("dev %+v", dev)
	}

	out, err = execProfileSet(t, "  stdin-token\n", "--url", "https://prod.example:5620", "--token-stdin")
	if err != nil {
		t.Fatal(err)
	}
	if out != "Updated profile prod\n" {
		t.Fatalf("output %q", out)
	}
	cfg, err = config.Load()
	if err != nil {
		t.Fatal(err)
	}
	prod := cfg.Profiles["prod"]
	if prod.URL != "https://prod.example:5620" || prod.Token != "stdin-token" || prod.Scopes != nil || prod.Registry.Default != "prod.example" {
		t.Fatalf("prod %+v", prod)
	}
	if cfg.API.URL != prod.URL || cfg.API.Token != prod.Token || len(cfg.API.Scopes) != 0 {
		t.Fatalf("api %+v", cfg.API)
	}

	if _, err := execProfileSet(t, "", "local", "--url", "https://controller.example:5620"); err == nil || !strings.Contains(err.Error(), "admin socket") {
		t.Fatalf("local err = %v", err)
	}
	if _, err := execProfileSet(t, "", "missing", "--token", "x"); err == nil || !strings.Contains(err.Error(), `unknown profile "missing"`) {
		t.Fatalf("missing err = %v", err)
	}
	if _, err := execProfileSet(t, "", "--token", "x", "--token-stdin"); err == nil || !strings.Contains(err.Error(), "only one of --token and --token-stdin") {
		t.Fatalf("both tokens err = %v", err)
	}
	resetProfileSetFlags()
	err = execRoot(t, []string{"profile", "set"})
	if err == nil || !strings.Contains(err.Error(), "url or token is required") {
		t.Fatalf("no flags err = %v", err)
	}
	cfg, err = config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" || cfg.Profiles["prod"].Token != "stdin-token" || cfg.Profiles["dev"].Token != "dev-token" {
		t.Fatalf("rejected update changed config %+v", cfg.Profiles)
	}
}

func TestProfileRm(t *testing.T) {
	path := t.TempDir() + "/config.yaml"
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_PROFILE", "")
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	if err := config.Save(config.File{
		Current: "prod",
		Profiles: map[string]config.Profile{
			"prod":              {URL: "https://prod.example", Token: "prod-token"},
			"dev":               {URL: "https://dev.example", Token: "dev-token"},
			config.LocalProfile: {Registry: config.Registry{Default: "controller.sls.net:5620"}},
		},
	}); err != nil {
		t.Fatal(err)
	}

	out, err := execProfileRm(t, "remove", "dev")
	if err != nil {
		t.Fatal(err)
	}
	if out != "Removed profile dev\n" {
		t.Fatalf("output %q", out)
	}
	cfg, err := config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" {
		t.Fatalf("current %s", cfg.Current)
	}
	if _, ok := cfg.Profiles["dev"]; ok {
		t.Fatal("dev profile still present")
	}

	out, err = execProfileRm(t, "rm", "prod")
	if err != nil {
		t.Fatal(err)
	}
	if out != "Removed profile prod\nSwitched to profile local\n" {
		t.Fatalf("output %q", out)
	}
	cfg, err = config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != config.LocalProfile {
		t.Fatalf("current %s", cfg.Current)
	}
	if _, ok := cfg.Profiles["prod"]; ok {
		t.Fatal("prod profile still present")
	}
	if cfg.Profiles[config.LocalProfile].Registry.Default != "controller.sls.net:5620" {
		t.Fatalf("local %+v", cfg.Profiles[config.LocalProfile])
	}

	if _, err := execProfileRm(t, "rm", "local"); err == nil || !strings.Contains(err.Error(), "cannot be removed") {
		t.Fatalf("local err = %v", err)
	}
	if _, err := execProfileRm(t, "rm", "missing"); err == nil || !strings.Contains(err.Error(), `unknown profile "missing"`) {
		t.Fatalf("missing err = %v", err)
	}
	err = execRoot(t, []string{"profile", "rm"})
	if err == nil || !strings.Contains(err.Error(), "'sls profile rm' requires 1 argument") {
		t.Fatalf("no args err = %v", err)
	}
	cfg, err = config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != config.LocalProfile || cfg.Profiles[config.LocalProfile].Registry.Default != "controller.sls.net:5620" {
		t.Fatalf("rejected remove changed config current %s local %+v", cfg.Current, cfg.Profiles[config.LocalProfile])
	}
}

func execProfileRm(t *testing.T, command, name string) (string, error) {
	t.Helper()
	var out bytes.Buffer
	rootCmd.SetArgs([]string{"profile", command, name})
	profileRmCmd.SetOut(&out)
	profileRmCmd.SetErr(&out)
	t.Cleanup(func() {
		rootCmd.SetArgs(nil)
		profileRmCmd.SetOut(nil)
		profileRmCmd.SetErr(nil)
	})
	err := rootCmd.Execute()
	return out.String(), err
}

func execProfileSet(t *testing.T, in string, args ...string) (string, error) {
	t.Helper()
	resetProfileSetFlags()
	var out bytes.Buffer
	rootCmd.SetArgs(append([]string{"profile", "set"}, args...))
	profileSetCmd.SetOut(&out)
	profileSetCmd.SetErr(&out)
	profileSetCmd.SetIn(strings.NewReader(in))
	t.Cleanup(func() {
		resetProfileSetFlags()
		rootCmd.SetArgs(nil)
		profileSetCmd.SetOut(nil)
		profileSetCmd.SetErr(nil)
		profileSetCmd.SetIn(nil)
	})
	err := rootCmd.Execute()
	return out.String(), err
}

func resetProfileSetFlags() {
	profileSetURL = ""
	profileSetToken = ""
	profileSetTokenStdin = false
	profileSetCmd.Flags().VisitAll(func(f *pflag.Flag) {
		f.Changed = false
		_ = f.Value.Set(f.DefValue)
	})
}
