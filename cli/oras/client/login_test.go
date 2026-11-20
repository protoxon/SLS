package client

import (
	"context"
	"encoding/base64"
	"io"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"

	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
)

func newBasicAuthRegistry(t *testing.T, user, pass string) *httptest.Server {
	t.Helper()
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != "/v2/" && r.URL.Path != "/v2" {
			http.NotFound(w, r)
			return
		}
		got := r.Header.Get("Authorization")
		want := "Basic " + base64.StdEncoding.EncodeToString([]byte(user+":"+pass))
		if got != want {
			w.Header().Set("Www-Authenticate", `Basic realm="test"`)
			w.WriteHeader(http.StatusUnauthorized)
			return
		}
		w.WriteHeader(http.StatusOK)
	}))
	t.Cleanup(srv.Close)
	return srv
}

func TestNormalizeRegistry(t *testing.T) {
	tests := []struct {
		in, want string
	}{
		{"", ""},
		{"https://index.docker.io", "docker.io"},
		{"http://registry-1.docker.io/", "docker.io"},
		{"https://ghcr.io/", "ghcr.io"},
		{"localhost:5000", "localhost:5000"},
	}
	for _, tt := range tests {
		if got := NormalizeRegistry(tt.in); got != tt.want {
			t.Fatalf("NormalizeRegistry(%q) = %q, want %q", tt.in, got, tt.want)
		}
	}
}

func TestReadCredentialFlags(t *testing.T) {
	cred, err := ReadCredential("alice", "secret", false, strings.NewReader(""), io.Discard)
	if err != nil {
		t.Fatal(err)
	}
	if cred.Username != "alice" || cred.Password != "secret" {
		t.Fatalf("got %+v", cred)
	}

	cred, err = ReadCredential("alice", "", true, strings.NewReader("from-stdin\n"), io.Discard)
	if err != nil {
		t.Fatal(err)
	}
	if cred.Password != "from-stdin" {
		t.Fatalf("got %+v", cred)
	}

	cred, err = ReadCredential("", "", true, strings.NewReader("token"), io.Discard)
	if err != nil {
		t.Fatal(err)
	}
	if cred.RefreshToken != "token" || cred.Username != "" {
		t.Fatalf("token cred: %+v", cred)
	}

	if _, err := ReadCredential("alice", "x", true, strings.NewReader("y"), io.Discard); err == nil {
		t.Fatal("expected password conflict")
	}
	if _, err := ReadCredential("", "", false, strings.NewReader(""), io.Discard); err == nil {
		t.Fatal("expected username required")
	}
}

func TestLoginSavesCredentials(t *testing.T) {
	srv := newBasicAuthRegistry(t, "alice", "secret")

	store := credentials.NewMemoryStore()
	host := strings.TrimPrefix(srv.URL, "http://")
	cred := auth.Credential{Username: "alice", Password: "secret"}
	if err := loginRegistry(context.Background(), store, host, cred, true); err != nil {
		t.Fatal(err)
	}
	got, err := store.Get(context.Background(), host)
	if err != nil {
		t.Fatal(err)
	}
	if got != cred {
		t.Fatalf("saved %+v", got)
	}
}

func TestLoginWritesCredentialsFile(t *testing.T) {
	srv := newBasicAuthRegistry(t, "alice", "secret")
	path := filepath.Join(t.TempDir(), "credentials.json")
	t.Setenv("SLS_CREDENTIALS", path)
	host := strings.TrimPrefix(srv.URL, "http://")
	if err := Login(context.Background(), host, auth.Credential{Username: "alice", Password: "secret"}, Options{PlainHTTP: true}); err != nil {
		t.Fatal(err)
	}
	store, err := credentials.NewStore(path, credentials.StoreOptions{})
	if err != nil {
		t.Fatal(err)
	}
	got, err := store.Get(context.Background(), host)
	if err != nil {
		t.Fatal(err)
	}
	if got.Username != "alice" || got.Password != "secret" {
		t.Fatalf("file creds: %+v", got)
	}
}

func TestLoginRejectsBadPassword(t *testing.T) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Www-Authenticate", `Basic realm="test"`)
		w.WriteHeader(http.StatusUnauthorized)
	}))
	t.Cleanup(srv.Close)

	store := credentials.NewMemoryStore()
	host := strings.TrimPrefix(srv.URL, "http://")
	err := loginRegistry(context.Background(), store, host, auth.Credential{Username: "alice", Password: "nope"}, true)
	if err == nil {
		t.Fatal("expected error")
	}
	got, err := store.Get(context.Background(), host)
	if err != nil || got != auth.EmptyCredential {
		t.Fatalf("should not save: %+v %v", got, err)
	}
}

func TestCredentialFromUserPass(t *testing.T) {
	cred := credentialFromUserPass("u", "p")
	if cred.Username != "u" || cred.Password != "p" {
		t.Fatalf("got %+v", cred)
	}
	cred = credentialFromUserPass("", "token")
	if cred.RefreshToken != "token" || cred.Username != "" {
		t.Fatalf("got %+v", cred)
	}
}
