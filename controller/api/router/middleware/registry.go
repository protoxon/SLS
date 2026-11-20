package middleware

import (
	"encoding/base64"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/auth"
	"protoxon.com/sls/controller/auth/scope"
	"protoxon.com/sls/controller/config"
)

const (
	DockerDistributionAPIVersion = "registry/2.0"
	registryBasicChallenge       = `Basic realm="SLS Registry"`
)

// AuthenticateRegistry accepts Unix-local admin, Basic (password = SLS token),
// or Bearer token. The advertised challenge is always Basic.
func AuthenticateRegistry(service *auth.KeyService) gin.HandlerFunc {
	return func(c *gin.Context) {
		setRegistryHeaders(c)
		if IsLocalAdmin(c.Request.Context()) {
			c.Set("localAdmin", true)
			c.Set("apiKey", localAdminKey)
			c.Next()
			return
		}
		if IsLocalNode(c.Request.Context()) {
			c.Set("apiKey", localNodeKey)
			c.Next()
			return
		}

		token, ok := parseRegistryToken(c.GetHeader("Authorization"))
		if !ok {
			registryUnauthorized(c)
			return
		}

		key, err := service.Validate(c.Request.Context(), token)
		if err != nil {
			registryUnauthorized(c)
			return
		}
		c.Set("apiKey", key)
		c.Next()
	}
}

// RequireRegistryRead allows pull, list, and other read operations.
func RequireRegistryRead() gin.HandlerFunc {
	return requireRegistryScope(scope.RegistryRead)
}

// RequireRegistryWrite allows push and delete.
func RequireRegistryWrite() gin.HandlerFunc {
	return requireRegistryScope(scope.RegistryWrite)
}

// RequireRegistryPing allows GET /v2 when the token can read or write.
func RequireRegistryPing() gin.HandlerFunc {
	return func(c *gin.Context) {
		key := GetAPIKey(c)
		if key == nil {
			registryUnauthorized(c)
			return
		}
		if !scope.AllowsAny(key.Scopes, scope.RegistryRead, scope.RegistryWrite) {
			c.AbortWithStatus(http.StatusForbidden)
			return
		}
		c.Next()
	}
}

// RequireRegistryAccess authorizes /v2 by method: ping on GET /v2,
// read or write on HEAD, read on other GET, write on mutating methods.
// registry:snapshot may push to the snapshot repository and may not delete.
func RequireRegistryAccess() gin.HandlerFunc {
	ping := RequireRegistryPing()
	read := RequireRegistryRead()
	write := RequireRegistryWrite()
	return func(c *gin.Context) {
		switch c.Request.Method {
		case http.MethodHead:
			// ORAS/Docker probe existence with HEAD during push.
			ping(c)
		case http.MethodGet:
			if isRegistryPingPath(c.Request.URL.Path) {
				ping(c)
				return
			}
			read(c)
		default:
			if c.Request.Method != http.MethodDelete && isSnapshotRepository(c.Request.URL.Path) {
				key := GetAPIKey(c)
				if key != nil && scope.Allows(key.Scopes, scope.RegistrySnapshot) {
					c.Next()
					return
				}
			}
			write(c)
		}
	}
}

// isSnapshotRepository reports whether path is a mutating route under the
// configured snapshot repository, such as /v2/snapshots/blobs/uploads/.
func isSnapshotRepository(path string) bool {
	cfg := config.Get()
	if cfg == nil {
		return false
	}
	repo := cfg.Registry.SnapshotRepository()
	if repo == "" {
		return false
	}
	got, ok := registryRepository(path)
	return ok && got == repo
}

func registryRepository(path string) (string, bool) {
	path = strings.Trim(path, "/")
	rest, ok := strings.CutPrefix(path, "v2/")
	if !ok || rest == "" {
		return "", false
	}
	for _, marker := range []string{"/blobs/", "/manifests/", "/tags/"} {
		if i := strings.Index(rest, marker); i > 0 {
			return rest[:i], true
		}
	}
	return "", false
}

func isRegistryPingPath(path string) bool {
	return path == "/v2" || path == "/v2/"
}

func requireRegistryScope(need string) gin.HandlerFunc {
	return func(c *gin.Context) {
		key := GetAPIKey(c)
		if key == nil {
			registryUnauthorized(c)
			return
		}
		if !scope.Allows(key.Scopes, need) {
			c.AbortWithStatus(http.StatusForbidden)
			return
		}
		c.Next()
	}
}

func parseRegistryToken(header string) (string, bool) {
	switch {
	case strings.HasPrefix(header, "Bearer "):
		token := strings.TrimSpace(strings.TrimPrefix(header, "Bearer "))
		return token, token != ""
	case strings.HasPrefix(header, "Basic "):
		raw := strings.TrimSpace(strings.TrimPrefix(header, "Basic "))
		decoded, err := base64.StdEncoding.DecodeString(raw)
		if err != nil {
			return "", false
		}
		_, password, found := strings.Cut(string(decoded), ":")
		if !found || password == "" {
			return "", false
		}
		return password, true
	default:
		return "", false
	}
}

func setRegistryHeaders(c *gin.Context) {
	c.Header("Docker-Distribution-Api-Version", DockerDistributionAPIVersion)
}

func registryUnauthorized(c *gin.Context) {
	setRegistryHeaders(c)
	c.Header("WWW-Authenticate", registryBasicChallenge)
	c.AbortWithStatus(http.StatusUnauthorized)
}

// IsRegistryPath reports whether path is under the OCI /v2 API.
func IsRegistryPath(path string) bool {
	return path == "/v2" || strings.HasPrefix(path, "/v2/")
}
