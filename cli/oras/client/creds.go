package client

import (
	"bufio"
	"context"
	"fmt"
	"io"
	"net/url"
	"os"
	"path/filepath"
	"strings"
	"sync"

	"emperror.dev/errors"
	"golang.org/x/term"
	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
	"protoxon.com/api"
	"protoxon.com/config"
)

type promptFunc func(ctx context.Context, serverAddress string) (auth.Credential, error)

type loginFunc func(ctx context.Context, registry string, cred auth.Credential) error

// promptingStore checks the SLS file, then the saved Protocube token, then
// Docker and Podman. If none have credentials it returns an error instead of
// waiting for a username.
type promptingStore struct {
	primary   credentials.Store
	all       credentials.Store
	prompt    promptFunc
	login     loginFunc
	mu        sync.Mutex
	prompting bool
}

func NewCredentialStore(opts Options) (credentials.Store, error) {
	primary, err := openPrimaryStore()
	if err != nil {
		return nil, err
	}
	fallbacks := append([]credentials.Store{apiTokenStore{}}, discoverFallbacks()...)
	return newPromptingStore(primary, fallbacks, interactivePrompt, func(ctx context.Context, registry string, cred auth.Credential) error {
		return loginRegistry(ctx, primary, registry, cred, opts.PlainHTTP)
	}), nil
}

// apiTokenStore uses the saved sls login for Protocube's own registry host
// when the token has a registry scope.
type apiTokenStore struct {
	load func() (config.File, error)
	auth func(config.API) ([]string, error)
}

func (s apiTokenStore) Get(_ context.Context, serverAddress string) (auth.Credential, error) {
	cfg, err := s.loadConfig()
	if err != nil {
		return auth.EmptyCredential, nil
	}
	host := apiRegistryHost(cfg.API.URL)
	if host == "" || !strings.EqualFold(NormalizeRegistry(serverAddress), host) {
		return auth.EmptyCredential, nil
	}
	token := strings.TrimSpace(cfg.API.Token)
	if token == "" {
		return auth.EmptyCredential, nil
	}
	scopes := s.resolveScopes(cfg)
	if !registryScopesAllow(scopes) {
		return auth.EmptyCredential, nil
	}
	return auth.Credential{Username: "sls", Password: token}, nil
}

func (apiTokenStore) Put(context.Context, string, auth.Credential) error { return nil }

func (apiTokenStore) Delete(context.Context, string) error { return nil }

func (s apiTokenStore) loadConfig() (config.File, error) {
	if s.load != nil {
		return s.load()
	}
	return config.Load()
}

func (s apiTokenStore) resolveScopes(cfg config.File) []string {
	if len(cfg.API.Scopes) > 0 && os.Getenv("SLS_TOKEN") == "" {
		return cfg.API.Scopes
	}
	authFn := s.auth
	if authFn == nil {
		authFn = fetchAPIScopes
	}
	scopes, err := authFn(cfg.API)
	if err != nil {
		return nil
	}
	return scopes
}

func fetchAPIScopes(cfg config.API) ([]string, error) {
	c, err := api.New(cfg)
	if err != nil {
		return nil, err
	}
	info, err := c.Auth(context.Background())
	if err != nil {
		return nil, err
	}
	return info.Scopes, nil
}

func apiRegistryHost(rawURL string) string {
	rawURL = strings.TrimSpace(rawURL)
	if rawURL == "" {
		return ""
	}
	if !strings.Contains(rawURL, "://") {
		return strings.ToLower(NormalizeRegistry(rawURL))
	}
	u, err := url.Parse(rawURL)
	if err != nil || u.Host == "" {
		return strings.ToLower(NormalizeRegistry(rawURL))
	}
	return strings.ToLower(NormalizeRegistry(u.Host))
}

// localRegistrySocket is the admin socket when registry is this Protocube's
// embedded registry and the socket accepts connections. Requests on that
// socket are local admin and do not need a token.
func localRegistrySocket(registry string) (string, bool) {
	registry = NormalizeRegistry(registry)
	if registry == "" || !isEmbeddedRegistry(registry) {
		return "", false
	}
	cfg, err := config.Load()
	if err != nil {
		return "", false
	}
	socket := config.Socket(cfg, "")
	if err := api.ProbeLocal(socket); err != nil {
		return "", false
	}
	return socket, true
}

func isEmbeddedRegistry(registry string) bool {
	cfg, err := config.Load()
	if err != nil {
		return false
	}
	if host, _ := splitDefaultRegistry(cfg.Registry.Default); host != "" && strings.EqualFold(NormalizeRegistry(host), registry) {
		return true
	}
	return strings.EqualFold(apiRegistryHost(cfg.API.URL), registry) && apiRegistryHost(cfg.API.URL) != ""
}

func usePlainHTTPFromConfig(registry string) bool {
	cfg, err := config.Load()
	if err != nil {
		return false
	}
	if cfg.Registry.Insecure {
		if host, _ := splitDefaultRegistry(cfg.Registry.Default); host != "" &&
			strings.EqualFold(NormalizeRegistry(host), NormalizeRegistry(registry)) {
			return true
		}
	}
	if !strings.HasPrefix(strings.ToLower(strings.TrimSpace(cfg.API.URL)), "http://") {
		return false
	}
	host := apiRegistryHost(cfg.API.URL)
	return host != "" && strings.EqualFold(NormalizeRegistry(registry), host)
}

func registryScopesAllow(have []string) bool {
	return allowsAnyScope(have, "registry:read", "registry:write")
}

func allowsAnyScope(have []string, needs ...string) bool {
	for _, need := range needs {
		if allowsScope(have, need) {
			return true
		}
	}
	return false
}

func allowsScope(have []string, need string) bool {
	for _, s := range have {
		if s == "*" || s == need {
			return true
		}
		if s == "app:admin" && need != "node" {
			return true
		}
		if s == "node" && need == "registry:read" {
			return true
		}
		if strings.HasSuffix(s, ":*") {
			prefix := strings.TrimSuffix(s, "*")
			if strings.HasPrefix(need, prefix) {
				return true
			}
		}
	}
	return false
}

func openPrimaryStore() (credentials.Store, error) {
	path, err := config.CredentialsPath()
	if err != nil {
		return nil, errors.Wrap(err, "failed to resolve sls credentials path")
	}
	store, err := credentials.NewStore(path, credentials.StoreOptions{AllowPlaintextPut: true})
	if err != nil {
		return nil, errors.Wrap(err, "failed to load sls credentials")
	}
	return store, nil
}

func newPromptingStore(primary credentials.Store, fallbacks []credentials.Store, prompt promptFunc, login loginFunc) *promptingStore {
	return &promptingStore{
		primary: primary,
		all:     credentials.NewStoreWithFallbacks(primary, fallbacks...),
		prompt:  prompt,
		login:   login,
	}
}

func (s *promptingStore) Get(ctx context.Context, serverAddress string) (auth.Credential, error) {
	cred, err := s.all.Get(ctx, serverAddress)
	if err != nil || cred != auth.EmptyCredential {
		return cred, err
	}

	s.mu.Lock()
	defer s.mu.Unlock()
	if s.prompting {
		return auth.EmptyCredential, nil
	}

	cred, err = s.all.Get(ctx, serverAddress)
	if err != nil || cred != auth.EmptyCredential {
		return cred, err
	}
	if s.prompt == nil {
		return auth.EmptyCredential, nil
	}

	s.prompting = true
	cred, err = s.prompt(ctx, serverAddress)
	s.prompting = false
	if err != nil || cred == auth.EmptyCredential {
		return cred, err
	}

	registry := registryFromServerAddress(serverAddress)
	if s.login != nil {
		if err := s.login(ctx, registry, cred); err != nil {
			return auth.EmptyCredential, err
		}
		return cred, nil
	}
	if err := s.primary.Put(ctx, serverAddress, cred); err != nil {
		return auth.EmptyCredential, err
	}
	return cred, nil
}

func (s *promptingStore) Put(ctx context.Context, serverAddress string, cred auth.Credential) error {
	return s.primary.Put(ctx, serverAddress, cred)
}

func (s *promptingStore) Delete(ctx context.Context, serverAddress string) error {
	return s.primary.Delete(ctx, serverAddress)
}

func discoverFallbacks() []credentials.Store {
	var stores []credentials.Store
	if docker, err := credentials.NewStoreFromDocker(credentials.StoreOptions{}); err == nil {
		stores = append(stores, docker)
	}
	for _, path := range podmanAuthFiles() {
		if _, err := os.Stat(path); err != nil {
			continue
		}
		store, err := credentials.NewStore(path, credentials.StoreOptions{})
		if err != nil {
			continue
		}
		stores = append(stores, store)
	}
	return stores
}

func podmanAuthFiles() []string {
	var paths []string
	if dir := os.Getenv("XDG_RUNTIME_DIR"); dir != "" {
		paths = append(paths, filepath.Join(dir, "containers", "auth.json"))
	}
	if home, err := os.UserHomeDir(); err == nil {
		paths = append(paths, filepath.Join(home, ".config", "containers", "auth.json"))
	}
	return paths
}

func interactivePrompt(_ context.Context, serverAddress string) (auth.Credential, error) {
	registry := registryFromServerAddress(serverAddress)
	return auth.EmptyCredential, errors.Errorf("login required for %s; run sls login or sls registry login %s", registry, registry)
}

func readLine(in io.Reader) (string, error) {
	line, err := bufio.NewReader(in).ReadString('\n')
	if err != nil && !errors.Is(err, io.EOF) {
		return "", err
	}
	return strings.TrimRight(line, "\r\n"), nil
}

func readSecret(in io.Reader) (string, error) {
	if f, ok := in.(*os.File); ok && term.IsTerminal(int(f.Fd())) {
		secret, err := term.ReadPassword(int(f.Fd()))
		fmt.Fprintln(os.Stderr)
		if err != nil {
			return "", err
		}
		return string(secret), nil
	}
	return readLine(in)
}

func credentialFromUserPass(username, password string) auth.Credential {
	if username == "" {
		return auth.Credential{RefreshToken: password}
	}
	return auth.Credential{Username: username, Password: password}
}

func registryFromServerAddress(addr string) string {
	if addr == "https://index.docker.io/v1/" {
		return dockerHub
	}
	return addr
}
