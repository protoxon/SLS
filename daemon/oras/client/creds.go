package client

import (
	"context"
	"net/url"
	"strings"

	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
	"protoxon.com/sls/daemon/config"
)

// NewCredentialStore returns the node token for Protocube's own host, then
// Protocube snapshot creds, then daemon docker.registries, then Docker config.
func NewCredentialStore() (credentials.Store, error) {
	stores := []credentials.Store{remoteAPIStore{}, remoteCredentials, yamlRegistryStore{}}
	if docker, err := credentials.NewStoreFromDocker(credentials.StoreOptions{}); err == nil {
		stores = append(stores, docker)
	}
	if len(stores) == 1 {
		return stores[0], nil
	}
	return credentials.NewStoreWithFallbacks(stores[0], stores[1:]...), nil
}

type remoteAPIStore struct{}

func (remoteAPIStore) Get(_ context.Context, serverAddress string) (auth.Credential, error) {
	cfg := config.Get()
	if cfg == nil {
		return auth.EmptyCredential, nil
	}
	host := remoteRegistryHost(cfg.RemoteApi.Url)
	if host == "" || !strings.EqualFold(NormalizeRegistryHost(serverAddress), host) {
		return auth.EmptyCredential, nil
	}
	token := strings.TrimSpace(cfg.RemoteApi.Token)
	if token == "" {
		return auth.EmptyCredential, nil
	}
	return auth.Credential{Username: "node", Password: token}, nil
}

func (remoteAPIStore) Put(context.Context, string, auth.Credential) error { return nil }

func (remoteAPIStore) Delete(context.Context, string) error { return nil }

func remoteRegistryHost(rawURL string) string {
	rawURL = strings.TrimSpace(rawURL)
	if rawURL == "" {
		return ""
	}
	if !strings.Contains(rawURL, "://") {
		return strings.ToLower(NormalizeRegistryHost(rawURL))
	}
	u, err := url.Parse(rawURL)
	if err != nil || u.Host == "" {
		return strings.ToLower(NormalizeRegistryHost(rawURL))
	}
	return strings.ToLower(NormalizeRegistryHost(u.Host))
}

func remoteRegistryPlainHTTP(rawURL, registry string) bool {
	if !strings.HasPrefix(strings.ToLower(strings.TrimSpace(rawURL)), "http://") {
		return false
	}
	host := remoteRegistryHost(rawURL)
	return host != "" && strings.EqualFold(NormalizeRegistryHost(registry), host)
}

type yamlRegistryStore struct{}

func (yamlRegistryStore) Get(_ context.Context, serverAddress string) (auth.Credential, error) {
	host := NormalizeRegistryHost(serverAddress)
	cfg := config.Get()
	if cfg == nil {
		return auth.EmptyCredential, nil
	}
	for key, cred := range cfg.Docker.Registries {
		if !strings.EqualFold(NormalizeRegistryHost(key), host) {
			continue
		}
		return credentialFromUserPass(cred.Username, cred.Password), nil
	}
	return auth.EmptyCredential, nil
}

func (yamlRegistryStore) Put(context.Context, string, auth.Credential) error { return nil }

func (yamlRegistryStore) Delete(context.Context, string) error { return nil }
