package client

import (
	"context"
	"net"
	"net/http"
	"path/filepath"
	"testing"

	"emperror.dev/errors"
	"oras.land/oras-go/v2/registry/remote/errcode"
	"protoxon.com/config"
)

func TestRepositoryName(t *testing.T) {
	tests := []struct {
		in, want string
	}{
		{"ghcr.io/jessefaler/slsmp3", "ghcr.io/jessefaler/slsmp3"},
		{"ghcr.io/jessefaler", "ghcr.io/jessefaler"},
		{"localhost:5000/world", "localhost:5000/world"},
	}
	for _, tt := range tests {
		ref, err := ParseReference(tt.in)
		if err != nil {
			t.Fatalf("parse %q: %v", tt.in, err)
		}
		if got := repositoryName(ref); got != tt.want {
			t.Fatalf("repositoryName(%q) = %q, want %q", tt.in, got, tt.want)
		}
	}
}

func TestParseReferenceRequiresRegistry(t *testing.T) {
	_, err := ParseReference("ubuntu")
	if !errors.Is(err, ErrDefaultRegistryRequired) {
		t.Fatalf("err = %v", err)
	}
	ref, err := ParseReference("ghcr.io/sls/chunk_runner")
	if err != nil {
		t.Fatal(err)
	}
	if got := ref.Identifier(); got != "latest" {
		t.Fatalf("default tag %q", got)
	}
}

func TestRepositoryUsesAdminSocketWithoutLogin(t *testing.T) {
	sock := filepath.Join(t.TempDir(), "sls.sock")
	ln, err := net.Listen("unix", sock)
	if err != nil {
		t.Fatal(err)
	}
	var hits int
	var authz string
	srv := &http.Server{Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		hits++
		authz = r.Header.Get("Authorization")
		w.Header().Set("Docker-Content-Digest", "sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
		w.WriteHeader(http.StatusOK)
	})}
	go func() { _ = srv.Serve(ln) }()
	t.Cleanup(func() { _ = srv.Close() })

	t.Setenv("SLS_SOCKET", sock)
	t.Setenv("SLS_CONFIG", filepath.Join(t.TempDir(), "config.yaml"))
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	if err := config.Save(config.File{Registry: config.Registry{Default: "protocube.sls.net:5620/sls"}}); err != nil {
		t.Fatal(err)
	}

	repo, err := NewRepository("protocube.sls.net:5620/sls/slsmp3:latest", Options{})
	if err != nil {
		t.Fatal(err)
	}
	if !repo.PlainHTTP {
		t.Fatal("expected plain HTTP over the admin socket")
	}
	_, _ = repo.Resolve(context.Background(), "latest")
	if hits == 0 {
		t.Fatal("registry was not contacted through the socket")
	}
	if authz != "" {
		t.Fatalf("authorization %q", authz)
	}

	other, err := NewRepository("ghcr.io/jessefaler/slsmp3:latest", Options{})
	if err != nil {
		t.Fatal(err)
	}
	if other.PlainHTTP {
		t.Fatal("ghcr should not use the admin socket")
	}
}

func TestExpandReference(t *testing.T) {
	const def = "protocube.sls.net:5620/sls"
	tests := []struct {
		in, def, want string
		needDefault   bool
	}{
		{"slsmp3:latest", def, "protocube.sls.net:5620/sls/slsmp3:latest", false},
		{"slsmp3", def, "protocube.sls.net:5620/sls/slsmp3", false},
		{"other/repo:tag", def, "protocube.sls.net:5620/other/repo:tag", false},
		{"ghcr.io/jessefaler/slsmp3:v1", def, "ghcr.io/jessefaler/slsmp3:v1", false},
		{"localhost:5000", def, "localhost:5000", false},
		{"localhost:5000/world", "", "localhost:5000/world", false},
		{"slsmp3:latest", "", "", true},
	}
	for _, tt := range tests {
		got, err := ExpandReference(tt.in, tt.def)
		if tt.needDefault {
			if !errors.Is(err, ErrDefaultRegistryRequired) {
				t.Fatalf("ExpandReference(%q) err = %v", tt.in, err)
			}
			continue
		}
		if err != nil {
			t.Fatalf("ExpandReference(%q): %v", tt.in, err)
		}
		if got != tt.want {
			t.Fatalf("ExpandReference(%q) = %q, want %q", tt.in, got, tt.want)
		}
	}
}

func TestRegistryHost(t *testing.T) {
	tests := []struct {
		in   string
		host string
		ok   bool
	}{
		{"localhost:5000", "localhost:5000", true},
		{"http://localhost:5000", "localhost:5000", true},
		{"127.0.0.1:5000", "127.0.0.1:5000", true},
		{"ghcr.io", "ghcr.io", true},
		{"docker.io", "docker.io", true},
		{"ghcr.io/jessefaler", "", false},
		{"localhost:5000/world", "", false},
		{"ubuntu", "", false},
		{"ubuntu:latest", "", false},
	}
	for _, tt := range tests {
		host, ok := registryHost(tt.in)
		if ok != tt.ok || host != tt.host {
			t.Fatalf("registryHost(%q) = %q, %v; want %q, %v", tt.in, host, ok, tt.host, tt.ok)
		}
	}
}

func TestIsNamespaceCandidate(t *testing.T) {
	ns, err := ParseReference("ghcr.io/jessefaler")
	if err != nil {
		t.Fatal(err)
	}
	if !isNamespaceCandidate(ns) {
		t.Fatal("ghcr.io/jessefaler should be a namespace candidate")
	}
	repo, err := ParseReference("ghcr.io/jessefaler/slsmp3")
	if err != nil {
		t.Fatal(err)
	}
	if isNamespaceCandidate(repo) {
		t.Fatal("ghcr.io/jessefaler/slsmp3 should not be a namespace candidate")
	}
}

func TestIsMissingRepository(t *testing.T) {
	unknown := errors.Wrap(&errcode.ErrorResponse{
		StatusCode: http.StatusNotFound,
		Errors:     errcode.Errors{{Code: errcode.ErrorCodeNameUnknown, Message: "repository name not known to registry"}},
	}, "failed to list tags")
	invalid := errors.Wrap(&errcode.ErrorResponse{
		StatusCode: http.StatusBadRequest,
		Errors:     errcode.Errors{{Code: errcode.ErrorCodeNameInvalid, Message: "invalid repository name"}},
	}, "failed to list tags")
	denied := errors.Wrap(&errcode.ErrorResponse{
		StatusCode: http.StatusUnauthorized,
		Errors:     errcode.Errors{{Code: errcode.ErrorCodeUnauthorized, Message: "unauthorized"}},
	}, "failed to list tags")
	if !isMissingRepository(unknown) || !isMissingRepository(invalid) {
		t.Fatal("unknown and invalid names should fall back to namespace listing")
	}
	if isMissingRepository(denied) {
		t.Fatal("unauthorized should not fall back")
	}
}
