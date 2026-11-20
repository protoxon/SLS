package config

import (
	"os"
	"path/filepath"
	"strings"
	"testing"
)

func TestCredentialsPathDefault(t *testing.T) {
	t.Setenv("SLS_CREDENTIALS", "")
	path, err := CredentialsPath()
	if err != nil {
		t.Fatal(err)
	}
	if filepath.Base(path) != "credentials.json" {
		t.Fatalf("path = %q", path)
	}
	if filepath.Base(filepath.Dir(path)) != "sls" {
		t.Fatalf("dir = %q", filepath.Dir(path))
	}
}

func TestCredentialsPathOverride(t *testing.T) {
	want := filepath.Join(t.TempDir(), "custom.json")
	t.Setenv("SLS_CREDENTIALS", want)
	path, err := CredentialsPath()
	if err != nil {
		t.Fatal(err)
	}
	if path != want {
		t.Fatalf("path = %q, want %q", path, want)
	}
}

func TestConfigPathOverride(t *testing.T) {
	want := filepath.Join(t.TempDir(), "cfg.yaml")
	t.Setenv("SLS_CONFIG", want)
	path, err := ConfigPath()
	if err != nil {
		t.Fatal(err)
	}
	if path != want {
		t.Fatalf("path = %q, want %q", path, want)
	}
}

func TestSaveLoadAndEnvOverride(t *testing.T) {
	path := filepath.Join(t.TempDir(), "sls", "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	t.Setenv("SLS_PROFILE", "")

	cfg := File{
		Current: "prod",
		Profiles: map[string]Profile{
			"prod": {
				URL:      "https://pc.example",
				Token:    "sls_live_abc",
				Scopes:   []string{"registry:read"},
				Socket:   "/tmp/p.sock",
				Registry: Registry{Default: "ghcr.io/example", Insecure: true},
			},
		},
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	st, err := os.Stat(path)
	if err != nil {
		t.Fatal(err)
	}
	if st.Mode().Perm() != 0o600 {
		t.Fatalf("perm %o", st.Mode().Perm())
	}
	raw, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	text := string(raw)
	if !strings.Contains(text, "profiles:") || strings.Contains(text, "\napi:") {
		t.Fatalf("config =\n%s", text)
	}

	got, err := Load()
	if err != nil {
		t.Fatal(err)
	}
	if got.Current != "prod" {
		t.Fatalf("current %q", got.Current)
	}
	if got.API.URL != "https://pc.example" || got.API.Token != "sls_live_abc" || got.API.Socket != "/tmp/p.sock" {
		t.Fatalf("got %+v", got.API)
	}
	if len(got.API.Scopes) != 1 || got.API.Scopes[0] != "registry:read" {
		t.Fatalf("scopes %+v", got.API.Scopes)
	}
	if got.Registry.Default != "ghcr.io/example" || !got.Registry.Insecure {
		t.Fatalf("registry %+v", got.Registry)
	}

	t.Setenv("SLS_API_URL", "https://other")
	t.Setenv("SLS_TOKEN", "env-token")
	got, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if got.API.URL != "https://other" || got.API.Token != "env-token" {
		t.Fatalf("env overlay %+v", got.API)
	}
	if err := Save(got); err != nil {
		t.Fatal(err)
	}
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	got, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if got.API.URL != "https://pc.example" || got.API.Token != "sls_live_abc" {
		t.Fatalf("env persisted %+v", got.API)
	}
}

func TestProfileSelectDoesNotPersist(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	t.Setenv("SLS_PROFILE", "")
	if err := Save(File{Current: "prod", Profiles: map[string]Profile{
		"prod": {URL: "https://pc.example", Token: "secret"},
	}}); err != nil {
		t.Fatal(err)
	}
	t.Setenv("SLS_PROFILE", "local")
	got, err := Load()
	if err != nil {
		t.Fatal(err)
	}
	if got.Current != LocalProfile || !got.UsesLocalSocket() {
		t.Fatalf("effective %+v socket %v", got.Current, got.UsesLocalSocket())
	}
	got.Registry.Default = "localhost:5000/sls"
	if err := Save(got); err != nil {
		t.Fatal(err)
	}
	t.Setenv("SLS_PROFILE", "")
	got, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if got.Current != "prod" || got.API.Token != "secret" {
		t.Fatalf("current changed %+v", got)
	}
	if got.Profiles[LocalProfile].Registry.Default != "localhost:5000/sls" {
		t.Fatalf("local registry %+v", got.Profiles[LocalProfile])
	}
}

func TestUpdateProfile(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	t.Setenv("SLS_PROFILE", "")
	if err := Save(File{
		Current: "prod",
		Profiles: map[string]Profile{
			"prod": {
				URL:      "https://prod.example",
				Token:    "prod-token",
				Scopes:   []string{"registry:read"},
				Registry: Registry{Default: "prod.example"},
			},
			"dev": {
				URL:      "https://dev.example",
				Token:    "dev-token",
				Scopes:   []string{"servers:read"},
				Registry: Registry{Default: "dev.example"},
			},
		},
	}); err != nil {
		t.Fatal(err)
	}

	cfg, err := Load()
	if err != nil {
		t.Fatal(err)
	}
	url := "https://dev.example:5620/"
	if err := cfg.UpdateProfile("dev", &url, nil); err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" {
		t.Fatalf("current %s", cfg.Current)
	}
	dev := cfg.Profiles["dev"]
	if dev.URL != "https://dev.example:5620" || dev.Token != "dev-token" || len(dev.Scopes) != 1 || dev.Scopes[0] != "servers:read" || dev.Registry.Default != "dev.example" {
		t.Fatalf("dev %+v", dev)
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}

	token := "new-token"
	if err := cfg.UpdateProfile("prod", nil, &token); err != nil {
		t.Fatal(err)
	}
	prod := cfg.Profiles["prod"]
	if prod.Token != "new-token" || prod.URL != "https://prod.example" || prod.Scopes != nil || prod.Registry.Default != "prod.example" {
		t.Fatalf("prod %+v", prod)
	}
	if cfg.API.Token != "new-token" || cfg.API.URL != "https://prod.example" || len(cfg.API.Scopes) != 0 {
		t.Fatalf("api %+v", cfg.API)
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}

	t.Setenv("SLS_API_URL", "https://overlay.example")
	t.Setenv("SLS_TOKEN", "overlay-token")
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	next := "https://moved.example"
	if err := cfg.UpdateProfile("prod", &next, nil); err != nil {
		t.Fatal(err)
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" || cfg.API.URL != "https://moved.example" || cfg.API.Token != "new-token" {
		t.Fatalf("persisted current %s api %+v", cfg.Current, cfg.API)
	}
	if cfg.Profiles["dev"].URL != "https://dev.example:5620" || cfg.Profiles["dev"].Token != "dev-token" {
		t.Fatalf("dev changed %+v", cfg.Profiles["dev"])
	}

	t.Setenv("SLS_PROFILE", "local")
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != LocalProfile {
		t.Fatalf("effective current %s", cfg.Current)
	}
	moved := "https://prod-2.example"
	if err := cfg.UpdateProfile("prod", &moved, nil); err != nil {
		t.Fatal(err)
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	t.Setenv("SLS_PROFILE", "")
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" || cfg.API.URL != "https://prod-2.example" || cfg.API.Token != "new-token" {
		t.Fatalf("switch persisted current %s api %+v", cfg.Current, cfg.API)
	}
}

func TestUpdateProfileRejects(t *testing.T) {
	cfg := File{Current: "prod", Profiles: map[string]Profile{
		"prod": {URL: "https://prod.example", Token: "secret", Scopes: []string{"registry:read"}},
	}}
	url := "https://ok.example"
	empty := "  "
	cases := []struct {
		profile string
		url     *string
		token   *string
		want    string
	}{
		{profile: LocalProfile, url: &url, want: "admin socket"},
		{profile: "missing", url: &url, want: `unknown profile "missing"`},
		{profile: "bad name", url: &url, want: "invalid profile name"},
		{profile: "prod", url: &empty, want: "Controller URL is required"},
		{profile: "prod", token: &empty, want: "token is required"},
		{profile: "prod", want: "url or token is required"},
	}
	for _, tc := range cases {
		err := cfg.UpdateProfile(tc.profile, tc.url, tc.token)
		if err == nil || !strings.Contains(err.Error(), tc.want) {
			t.Fatalf("UpdateProfile(%q) err = %v, want %q", tc.profile, err, tc.want)
		}
	}
	prod := cfg.Profiles["prod"]
	if prod.URL != "https://prod.example" || prod.Token != "secret" || len(prod.Scopes) != 1 {
		t.Fatalf("prod changed %+v", prod)
	}
}

func TestRemoveProfile(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	t.Setenv("SLS_PROFILE", "")

	saved := File{
		Current: "prod",
		Profiles: map[string]Profile{
			"prod": {
				URL:      "https://prod.example",
				Token:    "prod-token",
				Scopes:   []string{"registry:read"},
				Registry: Registry{Default: "prod.example"},
				Hosts:    []RegistryHost{{Host: "registry.example", Insecure: true}},
			},
			"dev":        {URL: "https://dev.example", Token: "dev-token"},
			LocalProfile: {Registry: Registry{Default: "controller.sls.net:5620"}},
		},
	}
	if err := Save(saved); err != nil {
		t.Fatal(err)
	}
	cfg, err := Load()
	if err != nil {
		t.Fatal(err)
	}
	switched, err := cfg.RemoveProfile("dev")
	if err != nil {
		t.Fatal(err)
	}
	if switched {
		t.Fatal("removing another profile switched the current one")
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" {
		t.Fatalf("current %s", cfg.Current)
	}
	if _, ok := cfg.Profiles["dev"]; ok {
		t.Fatal("dev profile still present")
	}
	prod := cfg.Profiles["prod"]
	if prod.URL != "https://prod.example" || prod.Token != "prod-token" || len(prod.Scopes) != 1 || prod.Registry.Default != "prod.example" || len(prod.Hosts) != 1 || prod.Hosts[0].Host != "registry.example" {
		t.Fatalf("prod %+v", prod)
	}
	if cfg.Profiles[LocalProfile].Registry.Default != "controller.sls.net:5620" {
		t.Fatalf("local %+v", cfg.Profiles[LocalProfile])
	}

	switched, err = cfg.RemoveProfile("prod")
	if err != nil {
		t.Fatal(err)
	}
	if !switched {
		t.Fatal("removing the current profile did not switch")
	}
	if cfg.Current != LocalProfile {
		t.Fatalf("current %s", cfg.Current)
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != LocalProfile {
		t.Fatalf("saved current %s", cfg.Current)
	}
	if _, ok := cfg.Profiles["prod"]; ok {
		t.Fatal("prod profile still present")
	}
	if cfg.Profiles[LocalProfile].Registry.Default != "controller.sls.net:5620" {
		t.Fatalf("local %+v", cfg.Profiles[LocalProfile])
	}

	if _, err := cfg.RemoveProfile(LocalProfile); err == nil || !strings.Contains(err.Error(), "cannot be removed") {
		t.Fatalf("local err = %v", err)
	}
	if _, err := cfg.RemoveProfile("missing"); err == nil || !strings.Contains(err.Error(), `unknown profile "missing"`) {
		t.Fatalf("missing err = %v", err)
	}
	if _, err := cfg.RemoveProfile("bad name"); err == nil || !strings.Contains(err.Error(), "invalid profile name") {
		t.Fatalf("name err = %v", err)
	}
}

func TestRemoveProfileEnvOverride(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	t.Setenv("SLS_PROFILE", "")
	if err := Save(File{
		Current: "prod",
		Profiles: map[string]Profile{
			"prod": {URL: "https://prod.example", Token: "prod-token"},
			"dev":  {URL: "https://dev.example", Token: "dev-token"},
		},
	}); err != nil {
		t.Fatal(err)
	}

	t.Setenv("SLS_PROFILE", "dev")
	cfg, err := Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "dev" {
		t.Fatalf("effective current %s", cfg.Current)
	}
	switched, err := cfg.RemoveProfile("dev")
	if err != nil {
		t.Fatal(err)
	}
	if switched {
		t.Fatal("removing the env-selected profile switched the saved current")
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	t.Setenv("SLS_PROFILE", "")
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != "prod" || cfg.API.Token != "prod-token" {
		t.Fatalf("current %s api %+v", cfg.Current, cfg.API)
	}
	if _, ok := cfg.Profiles["dev"]; ok {
		t.Fatal("dev profile still present")
	}

	t.Setenv("SLS_PROFILE", "local")
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	switched, err = cfg.RemoveProfile("prod")
	if err != nil {
		t.Fatal(err)
	}
	if !switched || cfg.Current != LocalProfile {
		t.Fatalf("switched %v current %s", switched, cfg.Current)
	}
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	t.Setenv("SLS_PROFILE", "")
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Current != LocalProfile {
		t.Fatalf("saved current %s", cfg.Current)
	}
	if _, ok := cfg.Profiles["prod"]; ok {
		t.Fatal("prod profile still present")
	}
}

func TestRememberRegistryHostSurvivesDefaultChange(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	t.Setenv("SLS_PROFILE", "")
	if err := Save(File{
		Current: "test",
		Profiles: map[string]Profile{
			"test": {URL: "http://localhost:5620", Token: "sls_live_admin"},
		},
	}); err != nil {
		t.Fatal(err)
	}
	cfg, err := Load()
	if err != nil {
		t.Fatal(err)
	}
	cfg.RememberRegistryHost("controller.sls.net:5620", true)
	cfg.RememberRegistryHost("localhost:5620", true)
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if len(cfg.Hosts) != 1 || cfg.Hosts[0].Host != "controller.sls.net:5620" || !cfg.Hosts[0].Insecure {
		t.Fatalf("hosts %+v", cfg.Hosts)
	}
	cfg.Registry.Default = "ghcr.io/jessefaler"
	if err := Save(cfg); err != nil {
		t.Fatal(err)
	}
	cfg, err = Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Registry.Default != "ghcr.io/jessefaler" || len(cfg.Hosts) != 1 || cfg.Hosts[0].Host != "controller.sls.net:5620" {
		t.Fatalf("registry %+v hosts %+v", cfg.Registry, cfg.Hosts)
	}
}

func TestSudoUserConfigDir(t *testing.T) {
	if sudoUserXDG("/home/user") != "/home/user/.config" {
		t.Fatal(sudoUserXDG("/home/user"))
	}
}

func TestSocketFallback(t *testing.T) {
	t.Setenv("SLS_SOCKET", "")
	if Socket(File{}, "") != DefaultSocket {
		t.Fatal(Socket(File{}, ""))
	}
	if Socket(File{API: API{Socket: "/tmp/a.sock"}}, "") != "/tmp/a.sock" {
		t.Fatal("file socket")
	}
	if Socket(File{API: API{Socket: "/tmp/a.sock"}}, "/tmp/b.sock") != "/tmp/b.sock" {
		t.Fatal("flag socket")
	}
}
