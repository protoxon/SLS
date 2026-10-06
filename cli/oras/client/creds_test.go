package client

import (
	"context"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
	"protoxon.com/config"
)

func TestInteractivePromptReturnsError(t *testing.T) {
	_, err := interactivePrompt(context.Background(), "protocube.sls.net:5620")
	if err == nil || !strings.Contains(err.Error(), "login required for protocube.sls.net:5620") {
		t.Fatal(err)
	}
}

func TestPromptingStoreUsesPrimaryThenFallbackThenPrompt(t *testing.T) {
	ctx := context.Background()
	primary := credentials.NewMemoryStore()
	fallback := credentials.NewMemoryStore()
	var prompted int
	store := newPromptingStore(primary, []credentials.Store{fallback}, func(context.Context, string) (auth.Credential, error) {
		prompted++
		return auth.Credential{Username: "prompt", Password: "pw"}, nil
	}, nil)

	if _, err := store.Get(ctx, "ghcr.io"); err != nil {
		t.Fatal(err)
	}
	if prompted != 1 {
		t.Fatalf("prompted = %d", prompted)
	}
	got, err := primary.Get(ctx, "ghcr.io")
	if err != nil {
		t.Fatal(err)
	}
	if got.Username != "prompt" {
		t.Fatalf("saved primary username = %q", got.Username)
	}

	if err := fallback.Put(ctx, "docker.io", auth.Credential{Username: "docker", Password: "hub"}); err != nil {
		t.Fatal(err)
	}
	got, err = store.Get(ctx, "docker.io")
	if err != nil {
		t.Fatal(err)
	}
	if got.Username != "docker" || prompted != 1 {
		t.Fatalf("fallback: %+v prompted=%d", got, prompted)
	}

	if err := primary.Put(ctx, "ghcr.io", auth.Credential{Username: "sls", Password: "file"}); err != nil {
		t.Fatal(err)
	}
	got, err = store.Get(ctx, "ghcr.io")
	if err != nil {
		t.Fatal(err)
	}
	if got.Username != "sls" || prompted != 1 {
		t.Fatalf("primary: %+v prompted=%d", got, prompted)
	}
}

func TestPromptingStorePutDoesNotWriteFallback(t *testing.T) {
	ctx := context.Background()
	primary := credentials.NewMemoryStore()
	fallback := credentials.NewMemoryStore()
	store := newPromptingStore(primary, []credentials.Store{fallback}, nil, nil)

	if err := store.Put(ctx, "ghcr.io", auth.Credential{Username: "a", Password: "b"}); err != nil {
		t.Fatal(err)
	}
	got, err := primary.Get(ctx, "ghcr.io")
	if err != nil || got.Username != "a" {
		t.Fatalf("primary: %+v %v", got, err)
	}
	got, err = fallback.Get(ctx, "ghcr.io")
	if err != nil || got != auth.EmptyCredential {
		t.Fatalf("fallback should be empty: %+v %v", got, err)
	}
}

func TestPromptingStoreSkipsEmptyPrompt(t *testing.T) {
	ctx := context.Background()
	primary := credentials.NewMemoryStore()
	store := newPromptingStore(primary, nil, func(context.Context, string) (auth.Credential, error) {
		return auth.EmptyCredential, nil
	}, func(context.Context, string, auth.Credential) error {
		t.Fatal("login should not run")
		return nil
	})
	got, err := store.Get(ctx, "localhost:5000")
	if err != nil || got != auth.EmptyCredential {
		t.Fatalf("got %+v %v", got, err)
	}
}

func TestPromptingStoreLoginError(t *testing.T) {
	ctx := context.Background()
	primary := credentials.NewMemoryStore()
	store := newPromptingStore(primary, nil, func(context.Context, string) (auth.Credential, error) {
		return auth.Credential{Username: "a", Password: "b"}, nil
	}, func(context.Context, string, auth.Credential) error {
		return errPasswordRequired
	})
	_, err := store.Get(ctx, "localhost:5000")
	if err == nil {
		t.Fatal("expected login error")
	}
	got, err := primary.Get(ctx, "localhost:5000")
	if err != nil || got != auth.EmptyCredential {
		t.Fatalf("should not save failed login: %+v %v", got, err)
	}
}

func TestRegistryFromServerAddress(t *testing.T) {
	if got := registryFromServerAddress("https://index.docker.io/v1/"); got != "docker.io" {
		t.Fatalf("got %q", got)
	}
	if got := registryFromServerAddress("ghcr.io"); got != "ghcr.io" {
		t.Fatalf("got %q", got)
	}
}

func TestPodmanAuthFiles(t *testing.T) {
	t.Setenv("XDG_RUNTIME_DIR", "/tmp/run")
	paths := podmanAuthFiles()
	if len(paths) == 0 {
		t.Fatal("expected paths")
	}
	if paths[0] != filepath.Join("/tmp/run", "containers", "auth.json") {
		t.Fatalf("runtime path = %q", paths[0])
	}
}

func TestDiscoverFallbacksSkipsMissingPodman(t *testing.T) {
	t.Setenv("XDG_RUNTIME_DIR", filepath.Join(t.TempDir(), "missing"))
	t.Setenv("HOME", t.TempDir())
	_ = discoverFallbacks()
}

func TestAPITokenStoreUsesLoginForMatchingHost(t *testing.T) {
	store := apiTokenStore{
		load: func() (config.File, error) {
			return config.File{API: config.API{
				URL:    "https://protocube.example:5620",
				Token:  "sls_live_admin",
				Scopes: []string{"app:admin"},
			}}, nil
		},
	}
	got, err := store.Get(context.Background(), "protocube.example:5620")
	if err != nil {
		t.Fatal(err)
	}
	if got.Username != "sls" || got.Password != "sls_live_admin" {
		t.Fatalf("got %+v", got)
	}
	got, err = store.Get(context.Background(), "ghcr.io")
	if err != nil || got != auth.EmptyCredential {
		t.Fatalf("other host: %+v %v", got, err)
	}
}

func TestAPITokenStoreRequiresRegistryScope(t *testing.T) {
	store := apiTokenStore{
		load: func() (config.File, error) {
			return config.File{API: config.API{
				URL:    "https://protocube.example:5620",
				Token:  "sls_live_reader",
				Scopes: []string{"servers:read"},
			}}, nil
		},
	}
	got, err := store.Get(context.Background(), "protocube.example:5620")
	if err != nil || got != auth.EmptyCredential {
		t.Fatalf("servers:read should not auth registry: %+v %v", got, err)
	}
}

func TestAPITokenStoreAcceptsRegistryScopes(t *testing.T) {
	cases := [][]string{
		{"registry:read"},
		{"registry:write"},
		{"registry:*"},
		{"node"},
	}
	for _, scopes := range cases {
		store := apiTokenStore{
			load: func() (config.File, error) {
				return config.File{API: config.API{
					URL:    "https://protocube.example:5620",
					Token:  "sls_live_x",
					Scopes: scopes,
				}}, nil
			},
		}
		got, err := store.Get(context.Background(), "protocube.example:5620")
		if err != nil || got.Password != "sls_live_x" {
			t.Fatalf("scopes %v: %+v %v", scopes, got, err)
		}
	}
}

func TestAPITokenStoreFetchesScopesWhenMissing(t *testing.T) {
	var fetched config.API
	store := apiTokenStore{
		load: func() (config.File, error) {
			return config.File{API: config.API{
				URL:   "https://protocube.example:5620",
				Token: "sls_live_env",
			}}, nil
		},
		auth: func(cfg config.API) ([]string, error) {
			fetched = cfg
			return []string{"registry:read"}, nil
		},
	}
	got, err := store.Get(context.Background(), "protocube.example:5620")
	if err != nil || got.Password != "sls_live_env" {
		t.Fatalf("got %+v %v", got, err)
	}
	if fetched.Token != "sls_live_env" {
		t.Fatalf("auth called with %+v", fetched)
	}
}

func TestPromptingStoreUsesAPITokenBeforePrompt(t *testing.T) {
	ctx := context.Background()
	primary := credentials.NewMemoryStore()
	api := apiTokenStore{
		load: func() (config.File, error) {
			return config.File{API: config.API{
				URL:    "https://protocube.example:5620",
				Token:  "sls_live_admin",
				Scopes: []string{"registry:read"},
			}}, nil
		},
	}
	store := newPromptingStore(primary, []credentials.Store{api}, func(context.Context, string) (auth.Credential, error) {
		t.Fatal("should not prompt when sls login can auth the registry")
		return auth.EmptyCredential, nil
	}, nil)
	got, err := store.Get(ctx, "protocube.example:5620")
	if err != nil {
		t.Fatal(err)
	}
	if got.Password != "sls_live_admin" {
		t.Fatalf("got %+v", got)
	}
}

func TestPromptingStorePrimaryWinsOverAPIToken(t *testing.T) {
	ctx := context.Background()
	primary := credentials.NewMemoryStore()
	if err := primary.Put(ctx, "protocube.example:5620", auth.Credential{Username: "override", Password: "other"}); err != nil {
		t.Fatal(err)
	}
	api := apiTokenStore{
		load: func() (config.File, error) {
			return config.File{API: config.API{
				URL:    "https://protocube.example:5620",
				Token:  "sls_live_admin",
				Scopes: []string{"app:admin"},
			}}, nil
		},
	}
	store := newPromptingStore(primary, []credentials.Store{api}, nil, nil)
	got, err := store.Get(ctx, "protocube.example:5620")
	if err != nil {
		t.Fatal(err)
	}
	if got.Username != "override" || got.Password != "other" {
		t.Fatalf("explicit registry login should win: %+v", got)
	}
}

func TestOpenPrimaryStoreMissingFile(t *testing.T) {
	path := filepath.Join(t.TempDir(), "sls", "credentials.json")
	t.Setenv("SLS_CREDENTIALS", path)
	store, err := openPrimaryStore()
	if err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(path); !os.IsNotExist(err) {
		t.Fatalf("store should not create the file until put: %v", err)
	}
	if err := store.Put(context.Background(), "localhost:5000", auth.Credential{Username: "u", Password: "p"}); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(path); err != nil {
		t.Fatal(err)
	}
}

func TestUsePlainHTTPFromDefaultRegistry(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	if err := config.Save(config.File{Registry: config.Registry{Default: "localhost:5000/sls", Insecure: true}}); err != nil {
		t.Fatal(err)
	}
	if !usePlainHTTPFromConfig("localhost:5000") {
		t.Fatal("insecure default host should use HTTP")
	}
	if usePlainHTTPFromConfig("ghcr.io") {
		t.Fatal("other hosts should stay HTTPS")
	}
	if err := config.Save(config.File{Registry: config.Registry{Default: "localhost:5000/sls"}}); err != nil {
		t.Fatal(err)
	}
	if usePlainHTTPFromConfig("localhost:5000") {
		t.Fatal("secure default should stay HTTPS")
	}
}
