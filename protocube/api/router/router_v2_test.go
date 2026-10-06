package router

import (
	"context"
	"encoding/base64"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	oras "oras.land/oras-go/v2"
	"oras.land/oras-go/v2/content/memory"
	"oras.land/oras-go/v2/registry/remote"
	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/retry"
	"protoxon.com/sls/protocube/api/router/middleware"
	"protoxon.com/sls/protocube/auth/scope"
)

func doV2(t *testing.T, h http.Handler, path, authorization string, local bool) *httptest.ResponseRecorder {
	t.Helper()
	req := httptest.NewRequest(http.MethodGet, path, nil)
	if authorization != "" {
		req.Header.Set("Authorization", authorization)
	}
	if local {
		req = req.WithContext(middleware.WithLocalAdmin(req.Context()))
	}
	w := httptest.NewRecorder()
	h.ServeHTTP(w, req)
	return w
}

func basicAuth(user, pass string) string {
	return "Basic " + base64.StdEncoding.EncodeToString([]byte(user+":"+pass))
}

func assertRegistryChallenge(t *testing.T, w *httptest.ResponseRecorder) {
	t.Helper()
	if w.Code != http.StatusUnauthorized {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
	got := w.Header().Get("WWW-Authenticate")
	if got != `Basic realm="SLS Registry"` {
		t.Fatalf("WWW-Authenticate %q", got)
	}
	if w.Header().Get("Docker-Distribution-Api-Version") != middleware.DockerDistributionAPIVersion {
		t.Fatalf("missing distribution API version: %v", w.Header())
	}
}

func TestRegistryPingUnauthorized(t *testing.T) {
	rt, _ := testTokenRouter(t)
	w := doV2(t, rt.Handler, "/v2/", "", false)
	assertRegistryChallenge(t, w)
	w = doV2(t, rt.Handler, "/v2", "", false)
	assertRegistryChallenge(t, w)
}

func TestRegistryPingInvalidToken(t *testing.T) {
	rt, _ := testTokenRouter(t)
	w := doV2(t, rt.Handler, "/v2/", basicAuth("user", "sls_live_nope"), false)
	assertRegistryChallenge(t, w)
}

func TestRegistryPingServersReadForbidden(t *testing.T) {
	rt, svc := testTokenRouter(t)
	key := createTestKey(t, svc, "reader", []string{scope.ServersRead}, nil)
	w := doV2(t, rt.Handler, "/v2/", basicAuth("user", key.Key), false)
	if w.Code != http.StatusForbidden {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
}

func TestRegistryPingAuthorized(t *testing.T) {
	rt, svc := testTokenRouter(t)
	cases := []struct {
		name   string
		scopes []string
	}{
		{"read", []string{scope.RegistryRead}},
		{"write", []string{scope.RegistryWrite}},
		{"node", []string{scope.Node}},
		{"admin", []string{scope.AppAdmin}},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			key := createTestKey(t, svc, tc.name, tc.scopes, nil)
			w := doV2(t, rt.Handler, "/v2/", basicAuth("anyone", key.Key), false)
			if w.Code != http.StatusOK {
				t.Fatalf("status %d: %s", w.Code, w.Body.String())
			}
			if w.Header().Get("Docker-Distribution-Api-Version") != middleware.DockerDistributionAPIVersion {
				t.Fatalf("missing distribution API version")
			}
		})
	}
}

func TestRegistryPingBearer(t *testing.T) {
	rt, svc := testTokenRouter(t)
	key := createTestKey(t, svc, "read", []string{scope.RegistryRead}, nil)
	w := doV2(t, rt.Handler, "/v2/", "Bearer "+key.Key, false)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
}

func TestRegistryPingLocalAdmin(t *testing.T) {
	rt, _ := testTokenRouter(t)
	w := doV2(t, rt.Handler, "/v2/", "", true)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
}

func TestRegistryPingChallengeUsesBasicNotBearer(t *testing.T) {
	rt, _ := testTokenRouter(t)
	w := doV2(t, rt.Handler, "/v2/", "", false)
	if strings.Contains(strings.ToLower(w.Header().Get("WWW-Authenticate")), "bearer") {
		t.Fatalf("registry challenge should be Basic: %q", w.Header().Get("WWW-Authenticate"))
	}
}

func doV2Method(t *testing.T, h http.Handler, method, path, authorization string) *httptest.ResponseRecorder {
	t.Helper()
	req := httptest.NewRequest(method, path, nil)
	if authorization != "" {
		req.Header.Set("Authorization", authorization)
	}
	w := httptest.NewRecorder()
	h.ServeHTTP(w, req)
	return w
}

func TestRegistryCatalogRequiresRead(t *testing.T) {
	rt, svc := testTokenRouter(t)
	write := createTestKey(t, svc, "write", []string{scope.RegistryWrite}, nil)
	w := doV2Method(t, rt.Handler, http.MethodGet, "/v2/_catalog", basicAuth("u", write.Key))
	if w.Code != http.StatusForbidden {
		t.Fatalf("write-only catalog status %d: %s", w.Code, w.Body.String())
	}
	read := createTestKey(t, svc, "read", []string{scope.RegistryRead}, nil)
	w = doV2Method(t, rt.Handler, http.MethodGet, "/v2/_catalog", basicAuth("u", read.Key))
	if w.Code != http.StatusOK {
		t.Fatalf("read catalog status %d: %s", w.Code, w.Body.String())
	}
}

func TestRegistryPushRequiresWrite(t *testing.T) {
	rt, svc := testTokenRouter(t)
	read := createTestKey(t, svc, "read", []string{scope.RegistryRead}, nil)
	w := doV2Method(t, rt.Handler, http.MethodPost, "/v2/sls/demo/blobs/uploads/", basicAuth("u", read.Key))
	if w.Code != http.StatusForbidden {
		t.Fatalf("read-only upload status %d: %s", w.Code, w.Body.String())
	}
	nodeKey := createTestKey(t, svc, "node", []string{scope.Node}, nil)
	w = doV2Method(t, rt.Handler, http.MethodPost, "/v2/sls/demo/blobs/uploads/", basicAuth("u", nodeKey.Key))
	if w.Code != http.StatusForbidden {
		t.Fatalf("node upload status %d: %s", w.Code, w.Body.String())
	}
}

func TestRegistryOrasPushPull(t *testing.T) {
	rt, svc := testTokenRouter(t)
	writer := createTestKey(t, svc, "writer", []string{scope.RegistryWrite}, nil)
	reader := createTestKey(t, svc, "reader", []string{scope.RegistryRead}, nil)
	ts := httptest.NewServer(rt.Handler)
	t.Cleanup(ts.Close)

	ref := strings.TrimPrefix(ts.URL, "http://") + "/sls/volume"
	ctx := context.Background()

	src := memory.New()
	layerDesc, err := oras.PushBytes(ctx, src, "application/vnd.sls.volume.layer.v1", []byte("hello-volume"))
	if err != nil {
		t.Fatal(err)
	}
	desc, err := oras.PackManifest(ctx, src, oras.PackManifestVersion1_1, "application/vnd.sls.volume.v1", oras.PackManifestOptions{
		Layers: []ocispec.Descriptor{layerDesc},
	})
	if err != nil {
		t.Fatal(err)
	}
	if err := src.Tag(ctx, desc, "latest"); err != nil {
		t.Fatal(err)
	}

	writeRepo := newTestRepository(t, ref, writer.Key)
	if _, err := oras.Copy(ctx, src, "latest", writeRepo, "latest", oras.DefaultCopyOptions); err != nil {
		t.Fatalf("push: %v", err)
	}
	w := doV2Method(t, rt.Handler, http.MethodGet, "/v2/sls/volume/manifests/latest", basicAuth("u", writer.Key))
	if w.Code != http.StatusForbidden {
		t.Fatalf("write-only GET manifest status %d: %s", w.Code, w.Body.String())
	}

	readRepo := newTestRepository(t, ref, reader.Key)
	got, err := readRepo.Resolve(ctx, "latest")
	if err != nil {
		t.Fatalf("resolve: %v", err)
	}
	if got.ArtifactType != "" && got.ArtifactType != "application/vnd.sls.volume.v1" {
		t.Fatalf("artifact type %q", got.ArtifactType)
	}
	dst := memory.New()
	pulled, err := oras.Copy(ctx, readRepo, "latest", dst, "latest", oras.DefaultCopyOptions)
	if err != nil {
		t.Fatalf("pull: %v", err)
	}
	if pulled.Digest != desc.Digest {
		t.Fatalf("pulled %s want %s", pulled.Digest, desc.Digest)
	}

	w = doV2Method(t, rt.Handler, http.MethodGet, "/v2/_catalog", basicAuth("u", reader.Key))
	if w.Code != http.StatusOK || !strings.Contains(w.Body.String(), "sls/volume") {
		t.Fatalf("catalog %d %s", w.Code, w.Body.String())
	}
	w = doV2Method(t, rt.Handler, http.MethodGet, "/v2/sls/volume/tags/list", basicAuth("u", reader.Key))
	if w.Code != http.StatusOK || !strings.Contains(w.Body.String(), "latest") {
		t.Fatalf("tags %d %s", w.Code, w.Body.String())
	}

	nodeKey := createTestKey(t, svc, "node", []string{scope.Node}, nil)
	nodeRepo := newTestRepository(t, ref, nodeKey.Key)
	if _, err := nodeRepo.Resolve(ctx, "latest"); err != nil {
		t.Fatalf("node pull: %v", err)
	}
}

func TestHTTPServerReadTimeoutDisabled(t *testing.T) {
	rt, _ := testTokenRouter(t)
	if rt.HTTPServer.ReadTimeout != 0 {
		t.Fatalf("ReadTimeout %s", rt.HTTPServer.ReadTimeout)
	}
	if rt.HTTPServer.ReadHeaderTimeout == 0 {
		t.Fatal("ReadHeaderTimeout should stay set")
	}
}

func newTestRepository(t *testing.T, ref, token string) *remote.Repository {
	t.Helper()
	repo, err := remote.NewRepository(ref)
	if err != nil {
		t.Fatal(err)
	}
	repo.PlainHTTP = true
	host, _, _ := strings.Cut(ref, "/")
	repo.Client = &auth.Client{
		Client: retry.DefaultClient,
		Cache:  auth.NewCache(),
		Credential: auth.StaticCredential(host, auth.Credential{
			Username: "sls",
			Password: token,
		}),
	}
	return repo
}
