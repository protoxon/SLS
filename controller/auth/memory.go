package auth

import (
	"context"
	"sync"
	"time"

	"github.com/google/uuid"
	"github.com/grokify/coreforge/identity/apikey"
	"github.com/pkg/errors"
)

// MemoryStore is an in-memory apikey.Store used by tests.
type MemoryStore struct {
	mu    sync.RWMutex
	keys  map[uuid.UUID]*apikey.APIKey
	hash  map[uuid.UUID]string
	byPre map[string]uuid.UUID
}

func NewMemoryStore() *MemoryStore {
	return &MemoryStore{
		keys:  make(map[uuid.UUID]*apikey.APIKey),
		hash:  make(map[uuid.UUID]string),
		byPre: make(map[string]uuid.UUID),
	}
}

func (m *MemoryStore) Create(_ context.Context, key *apikey.APIKey, keyHash string) error {
	m.mu.Lock()
	defer m.mu.Unlock()
	cp := cloneKey(key)
	m.keys[key.ID] = cp
	m.hash[key.ID] = keyHash
	m.byPre[key.Prefix] = key.ID
	return nil
}

func (m *MemoryStore) GetByPrefix(_ context.Context, prefix string) (*apikey.APIKey, string, error) {
	m.mu.RLock()
	defer m.mu.RUnlock()
	id, ok := m.byPre[prefix]
	if !ok {
		return nil, "", errors.New("API key not found")
	}
	return cloneKey(m.keys[id]), m.hash[id], nil
}

func (m *MemoryStore) GetByID(_ context.Context, id uuid.UUID) (*apikey.APIKey, error) {
	m.mu.RLock()
	defer m.mu.RUnlock()
	key, ok := m.keys[id]
	if !ok {
		return nil, errors.New("API key not found")
	}
	return cloneKey(key), nil
}

func (m *MemoryStore) ListByOwner(_ context.Context, ownerID uuid.UUID) ([]*apikey.APIKey, error) {
	m.mu.RLock()
	defer m.mu.RUnlock()
	var out []*apikey.APIKey
	for _, key := range m.keys {
		if key.OwnerID == ownerID {
			out = append(out, cloneKey(key))
		}
	}
	return out, nil
}

func (m *MemoryStore) ListByOrganization(_ context.Context, orgID uuid.UUID) ([]*apikey.APIKey, error) {
	m.mu.RLock()
	defer m.mu.RUnlock()
	var out []*apikey.APIKey
	for _, key := range m.keys {
		if key.OrganizationID != nil && *key.OrganizationID == orgID {
			out = append(out, cloneKey(key))
		}
	}
	return out, nil
}

func (m *MemoryStore) ListAll(_ context.Context) ([]*apikey.APIKey, error) {
	m.mu.RLock()
	defer m.mu.RUnlock()
	out := make([]*apikey.APIKey, 0, len(m.keys))
	for _, key := range m.keys {
		out = append(out, cloneKey(key))
	}
	return out, nil
}

func (m *MemoryStore) Update(_ context.Context, key *apikey.APIKey) error {
	m.mu.Lock()
	defer m.mu.Unlock()
	if _, ok := m.keys[key.ID]; !ok {
		return errors.New("API key not found")
	}
	m.keys[key.ID] = cloneKey(key)
	m.byPre[key.Prefix] = key.ID
	return nil
}

func (m *MemoryStore) Delete(_ context.Context, id uuid.UUID) error {
	m.mu.Lock()
	defer m.mu.Unlock()
	key, ok := m.keys[id]
	if !ok {
		return nil
	}
	delete(m.byPre, key.Prefix)
	delete(m.keys, id)
	delete(m.hash, id)
	return nil
}

func (m *MemoryStore) UpdateLastUsed(_ context.Context, id uuid.UUID, ip string) error {
	m.mu.Lock()
	defer m.mu.Unlock()
	key, ok := m.keys[id]
	if !ok {
		return errors.New("API key not found")
	}
	now := time.Now()
	key.LastUsedAt = &now
	key.LastUsedIP = ip
	return nil
}

func cloneKey(key *apikey.APIKey) *apikey.APIKey {
	if key == nil {
		return nil
	}
	cp := *key
	if key.Scopes != nil {
		cp.Scopes = append([]string(nil), key.Scopes...)
	}
	if key.ExpiresAt != nil {
		t := *key.ExpiresAt
		cp.ExpiresAt = &t
	}
	if key.LastUsedAt != nil {
		t := *key.LastUsedAt
		cp.LastUsedAt = &t
	}
	if key.RevokedAt != nil {
		t := *key.RevokedAt
		cp.RevokedAt = &t
	}
	if key.OrganizationID != nil {
		id := *key.OrganizationID
		cp.OrganizationID = &id
	}
	if key.Metadata != nil {
		cp.Metadata = make(map[string]string, len(key.Metadata))
		for k, v := range key.Metadata {
			cp.Metadata[k] = v
		}
	}
	return &cp
}
