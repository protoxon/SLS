package client

import (
	"net/http"
	"strings"
	"time"

	"emperror.dev/errors"
	"github.com/google/go-containerregistry/pkg/name"
	"oras.land/oras-go/v2/registry/remote"
	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
	"oras.land/oras-go/v2/registry/remote/retry"
	"protoxon.com/sls/daemon/config"
)

const DefaultRegistry = "docker.io"
const DefaultNamespace = "library"

// ProbeTimeout is the HTTP deadline for a create-time tag resolve.
// The client does not retry, so a refused connection fails immediately.
const ProbeTimeout = 4 * time.Second

// NewRepository returns an oras repository client
func NewRepository(reference string) (*remote.Repository, error) {
	return newRepository(reference, retry.DefaultClient)
}

// NewProbeRepository returns a repository client for a tag/digest HEAD only.
// It uses a short timeout and no retry so create can fail fast.
func NewProbeRepository(reference string) (*remote.Repository, error) {
	return newRepository(reference, &http.Client{Timeout: ProbeTimeout})
}

func newRepository(reference string, httpClient *http.Client) (*remote.Repository, error) {
	ref, err := ParseReference(reference)
	if err != nil {
		return nil, errors.Wrap(err, "failed to parse reference")
	}

	repository, err := remote.NewRepository(repositoryName(ref))
	if err != nil {
		return nil, errors.Wrap(err, "failed to create oras repository client")
	}

	repository.Reference.Reference = ref.Identifier()
	if cfg := config.Get(); cfg != nil {
		repository.PlainHTTP = cfg.System.UsePlainHTTP(ref.Context().RegistryStr())
	}

	store, err := NewCredentialStore()
	if err != nil {
		return nil, err
	}

	repository.Client = &auth.Client{
		Client:     httpClient,
		Cache:      auth.DefaultCache,
		Credential: credentials.Credential(store),
		Header:     http.Header{"User-Agent": {"sls"}},
	}

	return repository, nil
}

func ParseReference(artifact string) (name.Reference, error) {
	return name.ParseReference(artifact, name.WithDefaultRegistry(DefaultRegistry), name.WithDefaultTag("latest"))
}

func repositoryName(ref name.Reference) string {
	registry := ref.Context().RegistryStr()
	repo := ref.Context().RepositoryStr()
	if !strings.Contains(repo, "/") {
		repo = DefaultNamespace + "/" + repo
	}
	return registry + "/" + repo
}
