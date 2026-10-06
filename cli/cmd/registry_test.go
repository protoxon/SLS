package cmd

import (
	"bytes"
	"context"
	"encoding/base64"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"

	"github.com/spf13/cobra"
	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
	"protoxon.com/config"
)

func TestRegistryLoginCommand(t *testing.T) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != "/v2/" && r.URL.Path != "/v2" {
			http.NotFound(w, r)
			return
		}
		got := r.Header.Get("Authorization")
		want := "Basic " + base64.StdEncoding.EncodeToString([]byte("alice:secret"))
		if got != want {
			w.Header().Set("Www-Authenticate", `Basic realm="test"`)
			w.WriteHeader(http.StatusUnauthorized)
			return
		}
		w.WriteHeader(http.StatusOK)
	}))
	t.Cleanup(srv.Close)

	path := filepath.Join(t.TempDir(), "credentials.json")
	t.Setenv("SLS_CREDENTIALS", path)

	registryUsername = "alice"
	registryPassword = "secret"
	plainHTTP = true
	t.Cleanup(func() {
		registryUsername = ""
		registryPassword = ""
		registryPasswordStdin = false
		plainHTTP = false
	})

	var out bytes.Buffer
	registryLoginCmd.SetOut(&out)
	host := strings.TrimPrefix(srv.URL, "http://")
	if err := registryLoginCmd.RunE(registryLoginCmd, []string{host}); err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(out.String(), "Login succeeded") {
		t.Fatalf("output = %q", out.String())
	}

	store, err := credentials.NewStore(path, credentials.StoreOptions{})
	if err != nil {
		t.Fatal(err)
	}
	got, err := store.Get(t.Context(), host)
	if err != nil {
		t.Fatal(err)
	}
	if got != (auth.Credential{Username: "alice", Password: "secret"}) {
		t.Fatalf("saved %+v", got)
	}
}

func TestLoginTargetUsesDefaultHost(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	if err := config.Save(config.File{Registry: config.Registry{Default: "protocube.sls.net:5620/sls"}}); err != nil {
		t.Fatal(err)
	}
	got, err := loginTarget(context.Background(), nil)
	if err != nil {
		t.Fatal(err)
	}
	if got != "protocube.sls.net:5620" {
		t.Fatalf("got %q", got)
	}
	got, err = loginTarget(context.Background(), []string{"ghcr.io"})
	if err != nil {
		t.Fatal(err)
	}
	if got != "ghcr.io" {
		t.Fatalf("explicit registry %q", got)
	}
}

func TestResolveVolumeRefUsesDefault(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	if err := config.Save(config.File{Registry: config.Registry{Default: "protocube.sls.net:5620/sls"}}); err != nil {
		t.Fatal(err)
	}
	got, err := resolveVolumeRef(context.Background(), "slsmp3:latest")
	if err != nil {
		t.Fatal(err)
	}
	if got != "protocube.sls.net:5620/sls/slsmp3:latest" {
		t.Fatalf("got %q", got)
	}
	got, err = resolveVolumeRef(context.Background(), "ghcr.io/jessefaler/slsmp3:v1")
	if err != nil {
		t.Fatal(err)
	}
	if got != "ghcr.io/jessefaler/slsmp3:v1" {
		t.Fatalf("qualified ref %q", got)
	}
}

func TestRegistryDefaultSetAndShow(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")

	cmd := &cobra.Command{}
	var out bytes.Buffer
	cmd.SetOut(&out)
	cmd.SetContext(context.Background())
	registryDefaultInsecure = true
	t.Cleanup(func() { registryDefaultInsecure = false })
	if err := runRegistryDefault(cmd, []string{"https://localhost:5000/sls/"}); err != nil {
		t.Fatal(err)
	}
	if strings.TrimSpace(out.String()) != "localhost:5000/sls\tinsecure" {
		t.Fatalf("set output %q", out.String())
	}
	cfg, err := config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Registry.Default != "localhost:5000/sls" || !cfg.Registry.Insecure {
		t.Fatalf("saved %+v", cfg.Registry)
	}

	out.Reset()
	if err := runRegistryDefault(cmd, nil); err != nil {
		t.Fatal(err)
	}
	if strings.TrimSpace(out.String()) != "localhost:5000/sls\tinsecure" {
		t.Fatalf("show output %q", out.String())
	}

	out.Reset()
	registryDefaultInsecure = false
	if err := runRegistryDefault(cmd, []string{"ghcr.io/jessefaler"}); err != nil {
		t.Fatal(err)
	}
	if strings.TrimSpace(out.String()) != "ghcr.io/jessefaler" {
		t.Fatalf("secure set output %q", out.String())
	}
	cfg, err = config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Registry.Default != "ghcr.io/jessefaler" || cfg.Registry.Insecure {
		t.Fatalf("cleared insecure %+v", cfg.Registry)
	}
}

func TestRegistryDefaultFetchesFromProtocube(t *testing.T) {
	var hits int
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		hits++
		if r.URL.Path != "/api/registry" {
			http.NotFound(w, r)
			return
		}
		if r.Header.Get("Authorization") != "Bearer tok" {
			http.Error(w, `{"code":"401","status":"Unauthorized","detail":"missing"}`, http.StatusUnauthorized)
			return
		}
		_, _ = w.Write([]byte(`{"default":"https://localhost:5000/sls/","insecure":true}`))
	}))
	t.Cleanup(srv.Close)

	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	prevSocket := apiSocket
	apiSocket = filepath.Join(t.TempDir(), "missing.sock")
	t.Cleanup(func() { apiSocket = prevSocket })

	if err := config.Save(config.File{API: config.API{URL: srv.URL, Token: "tok"}}); err != nil {
		t.Fatal(err)
	}
	cmd := &cobra.Command{}
	var out bytes.Buffer
	cmd.SetOut(&out)
	cmd.SetContext(context.Background())
	if err := runRegistryDefault(cmd, nil); err != nil {
		t.Fatal(err)
	}
	if strings.TrimSpace(out.String()) != "localhost:5000/sls\tinsecure" {
		t.Fatalf("output %q", out.String())
	}
	cfg, err := config.Load()
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Registry.Default != "localhost:5000/sls" || !cfg.Registry.Insecure || cfg.API.Token != "tok" {
		t.Fatalf("config %+v", cfg)
	}

	out.Reset()
	if err := runRegistryDefault(cmd, nil); err != nil {
		t.Fatal(err)
	}
	if hits != 1 {
		t.Fatalf("fetched %d times", hits)
	}
}
