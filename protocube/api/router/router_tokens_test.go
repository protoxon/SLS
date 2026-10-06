package router

import (
	"bytes"
	"context"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/grokify/coreforge/identity/apikey"
	"protoxon.com/sls/protocube/api/router/middleware"
	"protoxon.com/sls/protocube/auth"
	"protoxon.com/sls/protocube/auth/scope"
	"protoxon.com/sls/protocube/config"
)

func testTokenRouter(t *testing.T) (*Router, *auth.KeyService) {
	t.Helper()
	gin.SetMode(gin.TestMode)
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	t.Cleanup(func() { config.SetForTest(prev) })
	svc := auth.NewKeyServiceWithStore(auth.NewMemoryStore())
	rt := New(&Resources{KeyService: svc})
	return rt, svc
}

func createTestKey(t *testing.T, svc *auth.KeyService, name string, scopes []string, expires *time.Duration) *apikey.GeneratedKey {
	t.Helper()
	org := uuid.Nil
	req := apikey.CreateKeyRequest{
		Name:           name,
		OwnerID:        uuid.New(),
		OrganizationID: &org,
		Scopes:         scopes,
		Environment:    apikey.EnvLive,
		ExpiresIn:      expires,
	}
	generated, err := svc.Create(context.Background(), req)
	if err != nil {
		t.Fatal(err)
	}
	return generated
}

func doJSON(t *testing.T, h http.Handler, method, path, token string, body any, local bool) *httptest.ResponseRecorder {
	t.Helper()
	var rdr *bytes.Reader
	if body != nil {
		data, err := json.Marshal(body)
		if err != nil {
			t.Fatal(err)
		}
		rdr = bytes.NewReader(data)
	} else {
		rdr = bytes.NewReader(nil)
	}
	req := httptest.NewRequest(method, path, rdr)
	if body != nil {
		req.Header.Set("Content-Type", "application/json")
	}
	if token != "" {
		req.Header.Set("Authorization", "Bearer "+token)
	}
	if local {
		req = req.WithContext(middleware.WithLocalAdmin(req.Context()))
	}
	w := httptest.NewRecorder()
	h.ServeHTTP(w, req)
	return w
}

func TestDefaultRegistryRequiresRead(t *testing.T) {
	rt, svc := testTokenRouter(t)
	config.Get().Registry.Default = "ghcr.io/jessefaler/sls"

	w := doJSON(t, rt.Handler, http.MethodGet, "/api/registry", "", nil, false)
	if w.Code != http.StatusUnauthorized {
		t.Fatalf("unauthenticated status %d: %s", w.Code, w.Body.String())
	}

	limited := createTestKey(t, svc, "servers", []string{scope.ServersRead}, nil)
	w = doJSON(t, rt.Handler, http.MethodGet, "/api/registry", limited.Key, nil, false)
	if w.Code != http.StatusForbidden {
		t.Fatalf("servers:read status %d: %s", w.Code, w.Body.String())
	}

	reader := createTestKey(t, svc, "registry", []string{scope.RegistryRead}, nil)
	w = doJSON(t, rt.Handler, http.MethodGet, "/api/registry", reader.Key, nil, false)
	if w.Code != http.StatusOK {
		t.Fatalf("registry:read status %d: %s", w.Code, w.Body.String())
	}
	var body struct {
		Default  string `json:"default"`
		Insecure bool   `json:"insecure"`
	}
	if err := json.Unmarshal(w.Body.Bytes(), &body); err != nil {
		t.Fatal(err)
	}
	if body.Default != "ghcr.io/jessefaler/sls" {
		t.Fatalf("default %q", body.Default)
	}
	if body.Insecure {
		t.Fatal("expected insecure false")
	}
	if strings.Contains(w.Body.String(), "password") || strings.Contains(w.Body.String(), "credential") {
		t.Fatalf("response included credentials: %s", w.Body.String())
	}

	config.Get().Registry.Insecure = true
	w = doJSON(t, rt.Handler, http.MethodGet, "/api/registry", reader.Key, nil, false)
	if w.Code != http.StatusOK {
		t.Fatalf("insecure status %d: %s", w.Code, w.Body.String())
	}
	if err := json.Unmarshal(w.Body.Bytes(), &body); err != nil {
		t.Fatal(err)
	}
	if !body.Insecure {
		t.Fatal("expected insecure true")
	}
}

func TestAuthAndCreateTokenLocal(t *testing.T) {
	rt, _ := testTokenRouter(t)
	w := doJSON(t, rt.Handler, http.MethodGet, "/api/auth", "", nil, true)
	if w.Code != http.StatusOK {
		t.Fatalf("auth status %d: %s", w.Code, w.Body.String())
	}
	var info authView
	if err := json.Unmarshal(w.Body.Bytes(), &info); err != nil {
		t.Fatal(err)
	}
	if !info.Local || info.Name != "local" {
		t.Fatalf("auth %+v", info)
	}

	w = doJSON(t, rt.Handler, http.MethodPost, "/api/tokens", "", createTokenRequest{
		Name:   "ops",
		Scopes: []string{scope.AppAdmin},
	}, true)
	if w.Code != http.StatusCreated {
		t.Fatalf("create status %d: %s", w.Code, w.Body.String())
	}
	var created createdTokenView
	if err := json.Unmarshal(w.Body.Bytes(), &created); err != nil {
		t.Fatal(err)
	}
	if created.Token == "" || created.Name != "ops" {
		t.Fatalf("created %+v", created)
	}
}

func TestCreateTokenExpiryAndSecretOnce(t *testing.T) {
	rt, svc := testTokenRouter(t)
	admin := createTestKey(t, svc, "admin", []string{scope.AppAdmin}, nil)

	w := doJSON(t, rt.Handler, http.MethodPost, "/api/tokens", admin.Key, createTokenRequest{
		Name:      "temp",
		Scopes:    []string{scope.ServersRead},
		ExpiresIn: "24h",
	}, false)
	if w.Code != http.StatusCreated {
		t.Fatalf("create status %d: %s", w.Code, w.Body.String())
	}
	var created createdTokenView
	if err := json.Unmarshal(w.Body.Bytes(), &created); err != nil {
		t.Fatal(err)
	}
	if created.Token == "" || created.ExpiresAt == nil {
		t.Fatalf("created %+v", created)
	}

	w = doJSON(t, rt.Handler, http.MethodGet, "/api/tokens/"+created.ID.String(), admin.Key, nil, false)
	if w.Code != http.StatusOK {
		t.Fatalf("get status %d: %s", w.Code, w.Body.String())
	}
	if bytes.Contains(w.Body.Bytes(), []byte(created.Token)) {
		t.Fatal("secret should not be returned on get")
	}
}

func TestCreateTokenOverGrantForbidden(t *testing.T) {
	rt, svc := testTokenRouter(t)
	limited := createTestKey(t, svc, "limited", []string{scope.ServersRead, scope.TokensWrite}, nil)
	w := doJSON(t, rt.Handler, http.MethodPost, "/api/tokens", limited.Key, createTokenRequest{
		Name:   "nope",
		Scopes: []string{scope.AppAdmin},
	}, false)
	if w.Code != http.StatusForbidden {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
	w = doJSON(t, rt.Handler, http.MethodPost, "/api/tokens", limited.Key, createTokenRequest{
		Name:   "nope",
		Scopes: []string{scope.Node},
	}, false)
	if w.Code != http.StatusForbidden {
		t.Fatalf("node grant status %d: %s", w.Code, w.Body.String())
	}
}

func TestTokenVisibilityAndDelete(t *testing.T) {
	rt, svc := testTokenRouter(t)
	admin := createTestKey(t, svc, "admin", []string{scope.AppAdmin}, nil)
	reader := createTestKey(t, svc, "reader", []string{scope.ServersRead, scope.TokensRead, scope.TokensWrite}, nil)
	other := createTestKey(t, svc, "other", []string{scope.ServersWrite}, nil)

	w := doJSON(t, rt.Handler, http.MethodGet, "/api/tokens", reader.Key, nil, false)
	if w.Code != http.StatusOK {
		t.Fatalf("list status %d: %s", w.Code, w.Body.String())
	}
	var listed struct {
		Data []tokenView `json:"data"`
	}
	if err := json.Unmarshal(w.Body.Bytes(), &listed); err != nil {
		t.Fatal(err)
	}
	for _, tok := range listed.Data {
		if tok.ID == admin.APIKey.ID || tok.ID == other.APIKey.ID {
			t.Fatalf("reader should not see %s", tok.Name)
		}
	}

	w = doJSON(t, rt.Handler, http.MethodGet, "/api/tokens/"+admin.APIKey.ID.String(), reader.Key, nil, false)
	if w.Code != http.StatusNotFound {
		t.Fatalf("hidden get status %d", w.Code)
	}

	w = doJSON(t, rt.Handler, http.MethodPost, "/api/tokens/"+reader.APIKey.ID.String()+"/revoke", admin.Key, revokeTokenRequest{Reason: "test"}, false)
	if w.Code != http.StatusOK {
		t.Fatalf("revoke status %d: %s", w.Code, w.Body.String())
	}
	w = doJSON(t, rt.Handler, http.MethodDelete, "/api/tokens/"+reader.APIKey.ID.String(), admin.Key, nil, false)
	if w.Code != http.StatusNoContent {
		t.Fatalf("delete status %d: %s", w.Code, w.Body.String())
	}
}

func TestServersReadCannotWrite(t *testing.T) {
	rt, svc := testTokenRouter(t)
	reader := createTestKey(t, svc, "reader", []string{scope.ServersRead}, nil)
	w := doJSON(t, rt.Handler, http.MethodPost, "/api/servers", reader.Key, map[string]any{}, false)
	if w.Code != http.StatusForbidden {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
}

func TestNodeScopeDoesNotUseAdmin(t *testing.T) {
	rt, svc := testTokenRouter(t)
	admin := createTestKey(t, svc, "admin", []string{scope.AppAdmin}, nil)
	w := doJSON(t, rt.Handler, http.MethodPost, "/api/nodes/n1/register", admin.Key, map[string]any{}, false)
	if w.Code != http.StatusForbidden {
		t.Fatalf("admin should not satisfy node: %d %s", w.Code, w.Body.String())
	}
}

func TestBearerRequiredOnTCP(t *testing.T) {
	rt, _ := testTokenRouter(t)
	w := doJSON(t, rt.Handler, http.MethodGet, "/api/auth", "", nil, false)
	if w.Code != http.StatusUnauthorized {
		t.Fatalf("status %d", w.Code)
	}
}
