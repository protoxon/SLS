package auth

import (
	"context"

	"github.com/grokify/coreforge/identity/apikey"
	"protoxon.com/sls/protocube/auth/scope"
)

type allLister interface {
	ListAll(ctx context.Context) ([]*apikey.APIKey, error)
}

type KeyService struct {
	*apikey.Service
	store apikey.Store
}

// NewKeyService configures and creates a new API key service.
func NewKeyService() *KeyService {
	return NewKeyServiceWithStore(NewCachedStore(CachedKeyTTL))
}

// NewKeyServiceWithStore builds a key service on the given store.
func NewKeyServiceWithStore(store apikey.Store) *KeyService {
	config := apikey.ServiceConfig{
		Store:         store,
		Prefix:        "sls",
		AllowedScopes: scope.All(),
	}
	return &KeyService{
		Service: apikey.NewService(config),
		store:   store,
	}
}

// ListAll returns every stored API key.
func (s *KeyService) ListAll(ctx context.Context) ([]*apikey.APIKey, error) {
	if lister, ok := s.store.(allLister); ok {
		return lister.ListAll(ctx)
	}
	return ListAll()
}
