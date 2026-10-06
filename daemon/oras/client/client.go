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
	registry := ref.Context().RegistryStr()
	repository.PlainHTTP = usePlainHTTP(registry)

	store, err := NewCredentialStore()
	if err != nil {
		return nil, err
	}

	repository.Client = &auth.Client{
		Client:     httpClient,
		Cache:      auth.NewCache(),
		Credential: credentials.Credential(store),
		Header:     http.Header{"User-Agent": {"sls"}},
	}

	return repository, nil
}

func ParseReference(artifact string) (name.Reference, error) {
	if !referenceNamesRegistry(artifact) {
		return nil, errors.New("reference is missing a registry")
	}
	return name.ParseReference(artifact, name.WithDefaultTag("latest"))
}

// referenceNamesRegistry reports whether artifact includes a registry host.
// A missing host must not fall through to name.ParseReference, which defaults
// to Docker Hub.
func referenceNamesRegistry(artifact string) bool {
	ref := artifact
	if i := strings.Index(ref, "@"); i >= 0 {
		ref = ref[:i]
	}
	if i := strings.LastIndex(ref, ":"); i >= 0 && strings.LastIndex(ref, "/") < i {
		ref = ref[:i]
	}
	first, rest, ok := strings.Cut(ref, "/")
	if !ok || rest == "" {
		return false
	}
	return first == "localhost" || strings.ContainsAny(first, ".:")
}

func repositoryName(ref name.Reference) string {
	return ref.Context().RegistryStr() + "/" + ref.Context().RepositoryStr()
}

func usePlainHTTP(registry string) bool {
	if cfg := config.Get(); cfg != nil {
		if cfg.System.UsePlainHTTP(registry) {
			return true
		}
		if remoteRegistryPlainHTTP(cfg.RemoteApi.Url, registry) {
			return true
		}
	}
	return RegistryInsecure(registry)
}
