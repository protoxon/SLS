package api

import (
	"io"
	"net/http"
	"path/filepath"
	"testing"
	"time"

	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/api/router"
	"protoxon.com/sls/controller/auth"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/internal/httpunix"
)

func TestAPISocketTrustsLocalNode(t *testing.T) {
	gin.SetMode(gin.TestMode)
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	rt := router.New(&router.Resources{KeyService: auth.NewKeyServiceWithStore(auth.NewMemoryStore())})
	dir := t.TempDir()
	peerPath := filepath.Join(dir, "peer.sock")
	adminPath := filepath.Join(dir, "admin.sock")
	peerLis, err := httpunix.Listen(peerPath)
	if err != nil {
		t.Fatal(err)
	}
	adminLis, err := httpunix.Listen(adminPath)
	if err != nil {
		t.Fatal(err)
	}
	peerSrv := newUnixHTTPServer(rt.Handler, unixTrustNode)
	adminSrv := newUnixHTTPServer(rt.Handler, unixTrustAdmin)
	go func() { _ = peerSrv.Serve(peerLis) }()
	go func() { _ = adminSrv.Serve(adminLis) }()
	t.Cleanup(func() {
		shutdownHTTP(peerSrv)
		shutdownHTTP(adminSrv)
	})

	if code := unixStatus(t, peerPath, http.MethodGet, "/api/registry"); code != http.StatusOK {
		t.Fatalf("api socket registry status %d, want 200", code)
	}
	if code := unixStatus(t, peerPath, http.MethodGet, "/v2/"); code != http.StatusOK {
		t.Fatalf("api socket registry ping %d, want 200", code)
	}
	if code := unixStatus(t, peerPath, http.MethodPost, "/v2/sls/demo/blobs/uploads/"); code != http.StatusForbidden {
		t.Fatalf("api socket registry write %d, want 403", code)
	}
	if code := unixStatus(t, peerPath, http.MethodPost, "/api/nodes/local/register"); code != http.StatusBadRequest {
		t.Fatalf("api socket register %d, want 400", code)
	}
	if code := unixStatus(t, peerPath, http.MethodGet, "/api/tokens"); code != http.StatusForbidden {
		t.Fatalf("api socket tokens %d, want 403", code)
	}
	if code := unixStatus(t, adminPath, http.MethodGet, "/api/registry"); code != http.StatusOK {
		t.Fatalf("admin registry status %d", code)
	}
	if code := unixStatus(t, adminPath, http.MethodPost, "/api/nodes/local/register"); code != http.StatusForbidden {
		t.Fatalf("admin register %d, want 403", code)
	}
}

func unixStatus(t *testing.T, socket, method, path string) int {
	t.Helper()
	req, err := http.NewRequest(method, "http://localhost"+path, nil)
	if err != nil {
		t.Fatal(err)
	}
	resp, err := httpunix.Client(socket, time.Second).Do(req)
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()
	_, _ = io.Copy(io.Discard, resp.Body)
	return resp.StatusCode
}
