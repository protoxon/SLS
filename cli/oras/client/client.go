package client

import (
	"context"
	"net"
	"net/http"
	"strconv"
	"strings"

	"emperror.dev/errors"
	"github.com/google/go-containerregistry/pkg/name"
	"oras.land/oras-go/v2/registry/remote"
	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
	"oras.land/oras-go/v2/registry/remote/retry"
)

// dockerHub is Docker Hub's canonical registry host. Other Docker Hub
// hostnames are rewritten to this name. It is not a default registry.
const dockerHub = "docker.io"

// Options controls how the CLI talks to a registry.
type Options struct {
	PlainHTTP   bool
	Delete      bool
	Compression string
	Rewrite     bool
}

// NewRepository returns an oras repository client
func NewRepository(reference string, opts Options) (*remote.Repository, error) {
	ref, err := ParseReference(reference)
	if err != nil {
		return nil, errors.Wrap(err, "failed to parse reference")
	}

	repository, err := remote.NewRepository(repositoryName(ref))
	if err != nil {
		return nil, errors.Wrap(err, "failed to create oras repository client")
	}

	socket, local := localRegistrySocket(ref.Context().RegistryStr())
	if local || (!opts.PlainHTTP && usePlainHTTPFromConfig(ref.Context().RegistryStr())) {
		opts.PlainHTTP = true
	}
	repository.PlainHTTP = opts.PlainHTTP
	repository.Reference.Reference = ref.Identifier()

	cli, err := newAuthClient(opts, socket)
	if err != nil {
		return nil, err
	}
	repository.Client = cli
	return repository, nil
}

// NewRegistry returns an oras registry client for catalog requests.
func NewRegistry(host string, opts Options) (*remote.Registry, error) {
	host = NormalizeRegistry(host)
	socket, local := localRegistrySocket(host)
	if local || (!opts.PlainHTTP && usePlainHTTPFromConfig(host)) {
		opts.PlainHTTP = true
	}
	reg, err := remote.NewRegistry(host)
	if err != nil {
		return nil, errors.Wrap(err, "failed to create oras registry client")
	}
	reg.PlainHTTP = opts.PlainHTTP
	cli, err := newAuthClient(opts, socket)
	if err != nil {
		return nil, err
	}
	reg.Client = cli
	return reg, nil
}

func newAuthClient(opts Options, socket string) (*auth.Client, error) {
	store, err := NewCredentialStore(opts)
	if err != nil {
		return nil, err
	}
	httpClient := retry.DefaultClient
	if socket != "" {
		httpClient = unixHTTPClient(socket)
	}
	return &auth.Client{
		Client:     httpClient,
		Cache:      auth.DefaultCache,
		Credential: credentials.Credential(store),
		Header:     http.Header{"User-Agent": {"sls-cli"}},
	}, nil
}

func unixHTTPClient(socket string) *http.Client {
	base := http.DefaultTransport.(*http.Transport).Clone()
	base.DialContext = func(ctx context.Context, _, _ string) (net.Conn, error) {
		var d net.Dialer
		return d.DialContext(ctx, "unix", socket)
	}
	return &http.Client{Transport: retry.NewTransport(base)}
}

// ErrDefaultRegistryRequired means the reference has no registry host.
var ErrDefaultRegistryRequired = errors.New("reference is missing a registry")

func ParseReference(artifact string) (name.Reference, error) {
	if !referenceNamesRegistry(artifact) {
		return nil, ErrDefaultRegistryRequired
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

// ExpandReference applies defaultReg (host or host/namespace) to a reference
// that does not name a registry. A reference that already has a registry, or
// a bare registry host, is returned unchanged. An empty defaultReg for a short
// name returns ErrDefaultRegistryRequired.
func ExpandReference(ref, defaultReg string) (string, error) {
	ref = strings.TrimSpace(ref)
	ref = strings.TrimPrefix(ref, "https://")
	ref = strings.TrimPrefix(ref, "http://")
	if ref == "" {
		return "", errors.New("reference is empty")
	}
	if host, ok := registryHost(ref); ok {
		return host, nil
	}

	digest := ""
	if i := strings.Index(ref, "@"); i >= 0 {
		digest = ref[i:]
		ref = ref[:i]
	}
	repo, tag := splitArtifactNameTag(ref)
	if repo == "" {
		return "", errors.New("reference is missing a repository name")
	}
	if referenceHasRegistry(repo) {
		return joinArtifact(repo, tag, digest), nil
	}

	host, namespace := splitDefaultRegistry(defaultReg)
	if host == "" {
		return "", ErrDefaultRegistryRequired
	}
	if !strings.Contains(repo, "/") && namespace != "" {
		repo = namespace + "/" + repo
	}
	return joinArtifact(host+"/"+repo, tag, digest), nil
}

func splitDefaultRegistry(s string) (host, namespace string) {
	s = strings.TrimSpace(s)
	s = strings.TrimPrefix(s, "https://")
	s = strings.TrimPrefix(s, "http://")
	s = strings.Trim(s, "/")
	if s == "" {
		return "", ""
	}
	host, namespace, ok := strings.Cut(s, "/")
	if !ok {
		return host, ""
	}
	return host, strings.Trim(namespace, "/")
}

func splitArtifactNameTag(ref string) (name, tag string) {
	i := strings.LastIndex(ref, ":")
	if i < 0 {
		return ref, ""
	}
	if strings.LastIndex(ref, "/") > i {
		return ref, ""
	}
	return ref[:i], ref[i+1:]
}

func referenceHasRegistry(repo string) bool {
	first, _, _ := strings.Cut(repo, "/")
	host, port, hasPort := splitRegistryHostPort(first)
	if hasPort && !isRegistryPort(port) {
		return false
	}
	return isRegistryHostname(host)
}

func joinArtifact(repo, tag, digest string) string {
	if tag != "" {
		repo += ":" + tag
	}
	return repo + digest
}

func repositoryName(ref name.Reference) string {
	return ref.Context().RegistryStr() + "/" + ref.Context().RepositoryStr()
}

// registryHost returns the host[:port] when s is only a registry, with no
// repository path. "localhost:5000" is a registry; ParseReference rejects it
// because it has no repository name.
func registryHost(s string) (string, bool) {
	host := NormalizeRegistry(s)
	if host == "" || strings.Contains(host, "/") {
		return "", false
	}
	name, port, hasPort := splitRegistryHostPort(host)
	if hasPort && !isRegistryPort(port) {
		return "", false
	}
	if !isRegistryHostname(name) {
		return "", false
	}
	return host, true
}

func splitRegistryHostPort(host string) (string, string, bool) {
	if h, p, err := net.SplitHostPort(host); err == nil {
		return h, p, true
	}
	return strings.Trim(host, "[]"), "", false
}

func isRegistryPort(port string) bool {
	n, err := strconv.Atoi(port)
	return err == nil && n > 0 && n <= 65535
}

func isRegistryHostname(host string) bool {
	if host == "" {
		return false
	}
	if strings.EqualFold(host, "localhost") {
		return true
	}
	if net.ParseIP(host) != nil {
		return true
	}
	return strings.Contains(host, ".")
}
