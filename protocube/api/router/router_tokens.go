package router

import (
	"net/http"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/grokify/coreforge/identity/apikey"
	"protoxon.com/sls/protocube/api/router/httperror"
	"protoxon.com/sls/protocube/api/router/middleware"
	"protoxon.com/sls/protocube/auth"
	"protoxon.com/sls/protocube/auth/scope"
)

type createTokenRequest struct {
	Name        string   `json:"name"`
	Description string   `json:"description"`
	Scopes      []string `json:"scopes"`
	ExpiresIn   string   `json:"expires_in"`
}

type revokeTokenRequest struct {
	Reason string `json:"reason"`
}

type tokenView struct {
	ID          uuid.UUID  `json:"id"`
	Name        string     `json:"name"`
	Prefix      string     `json:"prefix"`
	Scopes      []string   `json:"scopes"`
	Description string     `json:"description"`
	ExpiresAt   *time.Time `json:"expires_at"`
	Revoked     bool       `json:"revoked"`
	RevokedAt   *time.Time `json:"revoked_at,omitempty"`
	CreatedAt   time.Time  `json:"created_at"`
	LastUsedAt  *time.Time `json:"last_used_at,omitempty"`
}

type createdTokenView struct {
	tokenView
	Token string `json:"token"`
}

type authView struct {
	ID        uuid.UUID    `json:"id"`
	Name      string       `json:"name"`
	Prefix    string       `json:"prefix"`
	Scopes    []string     `json:"scopes"`
	ExpiresAt *time.Time   `json:"expires_at"`
	Local     bool         `json:"local"`
	Grantable []scope.Info `json:"grantable"`
}

func tokenFromKey(key *apikey.APIKey) tokenView {
	scopes := key.Scopes
	if scopes == nil {
		scopes = []string{}
	}
	return tokenView{
		ID:          key.ID,
		Name:        key.Name,
		Prefix:      key.Prefix,
		Scopes:      scopes,
		Description: key.Description,
		ExpiresAt:   key.ExpiresAt,
		Revoked:     key.Revoked,
		RevokedAt:   key.RevokedAt,
		CreatedAt:   key.CreatedAt,
		LastUsedAt:  key.LastUsedAt,
	}
}

func callerScopes(c *gin.Context) []string {
	key := middleware.GetAPIKey(c)
	if key == nil {
		return nil
	}
	return key.Scopes
}

func (r *Router) getAuth(c *gin.Context) {
	key := middleware.GetAPIKey(c)
	if key == nil {
		httperror.AbortWithJSON(c, http.StatusUnauthorized, "", "You are not authorized to access this endpoint.")
		return
	}
	local := middleware.IsLocal(c)
	scopes := key.Scopes
	if scopes == nil {
		scopes = []string{}
	}
	c.JSON(http.StatusOK, authView{
		ID:        key.ID,
		Name:      key.Name,
		Prefix:    key.Prefix,
		Scopes:    scopes,
		ExpiresAt: key.ExpiresAt,
		Local:     local,
		Grantable: scope.Grantable(scopes, local),
	})
}

func (r *Router) listTokens(c *gin.Context) {
	keys, err := r.KeyService.ListAll(c.Request.Context())
	if err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}
	local := middleware.IsLocal(c)
	have := callerScopes(c)
	views := make([]tokenView, 0, len(keys))
	for _, key := range keys {
		if scope.CanManage(have, key.Scopes, local) {
			views = append(views, tokenFromKey(key))
		}
	}
	c.JSON(http.StatusOK, gin.H{"data": views})
}

func (r *Router) getToken(c *gin.Context) {
	key, ok := r.loadManagedToken(c)
	if !ok {
		return
	}
	c.JSON(http.StatusOK, tokenFromKey(key))
}

func (r *Router) createToken(c *gin.Context) {
	var req createTokenRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		httperror.AbortWithJSON(c, http.StatusUnprocessableEntity, err.Error(), "The data passed in the request was not in a parsable format.")
		return
	}
	if req.Name == "" {
		httperror.AbortWithJSON(c, http.StatusUnprocessableEntity, "name is required", "A token name is required.")
		return
	}
	if len(req.Scopes) == 0 {
		httperror.AbortWithJSON(c, http.StatusUnprocessableEntity, "scopes are required", "Select at least one scope.")
		return
	}
	local := middleware.IsLocal(c)
	if err := scope.CanGrant(callerScopes(c), req.Scopes, local); err != nil {
		httperror.AbortWithJSON(c, http.StatusForbidden, err.Error(), "Insufficient privileges")
		return
	}

	create := apikey.CreateKeyRequest{
		Name:           req.Name,
		OwnerID:        uuid.New(),
		OrganizationID: &uuid.Nil,
		Scopes:         req.Scopes,
		Description:    req.Description,
		Environment:    apikey.EnvLive,
	}
	if req.ExpiresIn != "" && !equalFoldNever(req.ExpiresIn) {
		d, err := auth.ParseExpiresIn(req.ExpiresIn)
		if err != nil {
			httperror.AbortWithJSON(c, http.StatusUnprocessableEntity, err.Error(), "Expiration must be a duration such as 24h, 7d, or 30d.")
			return
		}
		create.ExpiresIn = &d
	}

	generated, err := r.KeyService.Create(c.Request.Context(), create)
	if err != nil {
		httperror.AbortWithJSON(c, http.StatusBadRequest, err.Error(), "The token could not be created.")
		return
	}
	c.JSON(http.StatusCreated, createdTokenView{
		tokenView: tokenFromKey(generated.APIKey),
		Token:     generated.Key,
	})
}

func (r *Router) revokeToken(c *gin.Context) {
	key, ok := r.loadManagedToken(c)
	if !ok {
		return
	}
	var req revokeTokenRequest
	_ = c.ShouldBindJSON(&req)
	if err := r.KeyService.Revoke(c.Request.Context(), key.ID, req.Reason); err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}
	updated, err := r.KeyService.Get(c.Request.Context(), key.ID)
	if err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}
	c.JSON(http.StatusOK, tokenFromKey(updated))
}

func (r *Router) deleteToken(c *gin.Context) {
	key, ok := r.loadManagedToken(c)
	if !ok {
		return
	}
	if err := r.KeyService.Delete(c.Request.Context(), key.ID); err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}
	c.Status(http.StatusNoContent)
}

func (r *Router) loadManagedToken(c *gin.Context) (*apikey.APIKey, bool) {
	id, err := uuid.Parse(c.Param("id"))
	if err != nil {
		httperror.AbortWithJSON(c, http.StatusNotFound, "resource not found", "The requested resource does not exist on this instance.")
		return nil, false
	}
	key, err := r.KeyService.Get(c.Request.Context(), id)
	if err != nil {
		httperror.AbortWithJSON(c, http.StatusNotFound, "resource not found", "The requested resource does not exist on this instance.")
		return nil, false
	}
	if !scope.CanManage(callerScopes(c), key.Scopes, middleware.IsLocal(c)) {
		httperror.AbortWithJSON(c, http.StatusNotFound, "resource not found", "The requested resource does not exist on this instance.")
		return nil, false
	}
	return key, true
}

func equalFoldNever(s string) bool {
	return strings.EqualFold(strings.TrimSpace(s), "never")
}
