package client

import (
	"context"
	"strings"
	"sync"

	"oras.land/oras-go/v2/registry/remote/auth"
	"protoxon.com/sls/daemon/models"
)

var remoteCredentials = newSnapshotStore()

var refreshCredentials func(context.Context) error

// ApplySnapshot replaces the in-memory Protocube pull credentials.
func ApplySnapshot(snap models.RegistrySnapshot) {
	remoteCredentials.Replace(snap)
}

// SnapshotRevision is the last applied Protocube snapshot revision.
func SnapshotRevision() string {
	return remoteCredentials.Revision()
}

// SetRefreshCredentials sets the hook used after a registry 401.
func SetRefreshCredentials(fn func(context.Context) error) {
	refreshCredentials = fn
}

// RefreshCredentials reloads the Protocube snapshot when a hook is set.
func RefreshCredentials(ctx context.Context) error {
	if refreshCredentials == nil {
		return nil
	}
	return refreshCredentials(ctx)
}

// RegistryInsecure reports whether Protocube marked host as HTTP.
func RegistryInsecure(host string) bool {
	return remoteCredentials.Insecure(host)
}

type snapshotStore struct {
	mu       sync.RWMutex
	byHost   map[string]models.RegistryCredential
	insecure map[string]bool
	revision string
}

func newSnapshotStore() *snapshotStore {
	return &snapshotStore{
		byHost:   map[string]models.RegistryCredential{},
		insecure: map[string]bool{},
	}
}

func (s *snapshotStore) Replace(snap models.RegistrySnapshot) {
	s.mu.Lock()
	defer s.mu.Unlock()
	s.byHost = make(map[string]models.RegistryCredential, len(snap.Credentials))
	s.insecure = make(map[string]bool, len(snap.Credentials)+len(snap.Insecure))
	for _, cred := range snap.Credentials {
		host := strings.ToLower(NormalizeRegistryHost(cred.Host))
		if host == "" {
			continue
		}
		s.byHost[host] = cred
		if cred.Insecure {
			s.insecure[host] = true
		}
	}
	for _, host := range snap.Insecure {
		host = strings.ToLower(NormalizeRegistryHost(host))
		if host == "" {
			continue
		}
		s.insecure[host] = true
	}
	s.revision = snap.Revision
}

func (s *snapshotStore) Revision() string {
	s.mu.RLock()
	defer s.mu.RUnlock()
	return s.revision
}

func (s *snapshotStore) Insecure(host string) bool {
	host = strings.ToLower(NormalizeRegistryHost(host))
	s.mu.RLock()
	defer s.mu.RUnlock()
	return s.insecure[host]
}

func (s *snapshotStore) Get(_ context.Context, serverAddress string) (auth.Credential, error) {
	host := strings.ToLower(NormalizeRegistryHost(serverAddress))
	s.mu.RLock()
	cred, ok := s.byHost[host]
	s.mu.RUnlock()
	if !ok {
		return auth.EmptyCredential, nil
	}
	return credentialFromUserPass(cred.Username, cred.Password), nil
}

func (s *snapshotStore) Put(context.Context, string, auth.Credential) error { return nil }

func (s *snapshotStore) Delete(context.Context, string) error { return nil }

func credentialFromUserPass(username, password string) auth.Credential {
	if username == "" {
		return auth.Credential{RefreshToken: password}
	}
	return auth.Credential{Username: username, Password: password}
}
