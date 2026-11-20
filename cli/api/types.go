package api

import "protoxon.com/sls/internal/api"

type ScopeInfo = api.ScopeInfo
type Auth = api.Auth
type Token = api.Token
type CreatedToken = api.CreatedToken
type CreateTokenRequest = api.CreateTokenRequest

type tokenListResponse struct {
	Data []Token `json:"data"`
}
