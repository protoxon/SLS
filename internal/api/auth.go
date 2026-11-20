package api

import "time"

// ScopeInfo describes a grantable scope.
type ScopeInfo struct {
	Scope       string `json:"scope"`
	Description string `json:"description"`
	Group       string `json:"group"`
}

// Auth is the caller identity returned by the auth endpoint.
type Auth struct {
	ID        string      `json:"id"`
	Name      string      `json:"name"`
	Prefix    string      `json:"prefix"`
	Scopes    []string    `json:"scopes"`
	ExpiresAt *time.Time  `json:"expires_at"`
	Local     bool        `json:"local"`
	Grantable []ScopeInfo `json:"grantable"`
}

// Token is an API key record.
type Token struct {
	ID          string     `json:"id"`
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

// CreatedToken is a token plus the secret returned once at creation.
type CreatedToken struct {
	Token
	TokenValue string `json:"token"`
}

// CreateTokenRequest asks Controller to mint an API token.
type CreateTokenRequest struct {
	Name        string   `json:"name"`
	Description string   `json:"description,omitempty"`
	Scopes      []string `json:"scopes"`
	ExpiresIn   string   `json:"expires_in,omitempty"`
}
