package router

import (
	"context"
	"net/http"
	"net/http/httptest"
	"path/filepath"
	"strings"
	"testing"

	"protoxon.com/sls/daemon/api/auth"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/daemon/remote"
	"protoxon.com/sls/daemon/server"
	"protoxon.com/sls/internal/process"
)

// listingClient answers the server list for Sync. Sync calls nothing else.
type listingClient struct {
	remote.Client
	servers []models.ServerConfiguration
}

func (c *listingClient) GetServers(context.Context, int) ([]models.ServerConfiguration, error) {
	return c.servers, nil
}

// A server that failed to load is not reported as missing, so the controller
// does not treat it as gone while its container may still run.
func TestUnloadedServerAnswersConflict(t *testing.T) {
	root := t.TempDir()
	config.Set(&config.Configuration{
		RemoteApi:   config.RemoteApi{Url: "http://controller"},
		RemoteQuery: config.RemoteQueryConfiguration{BootServersPerPage: 50},
		System: config.SystemConfiguration{
			RootDirectory: root,
			Data:          filepath.Join(root, "data"),
			Servers:       filepath.Join(root, "servers"),
		},
	})
	t.Cleanup(func() { config.Set(nil) })
	if err := auth.SetToken("test-token"); err != nil {
		t.Fatal(err)
	}
	manager := server.NewManager(&listingClient{servers: []models.ServerConfiguration{{
		Id:                   "broken",
		ServerFolder:         "missing",
		ProcessConfiguration: &process.ProcessConfiguration{},
	}}})
	if err := manager.Sync(context.Background()); err != nil {
		t.Fatal(err)
	}
	engine := New(&Resources{ServerManager: manager, VerifyToken: auth.Verify}).Configure()

	cases := []struct {
		path string
		want int
	}{
		{"/api/servers/broken/status", http.StatusConflict},
		{"/api/servers/unknown/status", http.StatusNotFound},
	}
	for _, tc := range cases {
		req := httptest.NewRequest(http.MethodGet, tc.path, nil)
		req.Header.Set("Authorization", "Bearer test-token")
		rec := httptest.NewRecorder()
		engine.ServeHTTP(rec, req)
		if rec.Code != tc.want {
			t.Fatalf("GET %s = %d, want %d: %s", tc.path, rec.Code, tc.want, rec.Body.String())
		}
		if tc.want == http.StatusConflict && !strings.Contains(rec.Body.String(), "server folder does not exist") {
			t.Fatalf("409 body does not carry the load error: %s", rec.Body.String())
		}
	}
}
