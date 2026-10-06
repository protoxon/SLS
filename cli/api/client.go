package api

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net"
	"net/http"
	"os"
	"strings"
	"time"

	"emperror.dev/errors"
	"protoxon.com/config"
)

var ErrNotLoggedIn = errors.New("not logged in; run sls login, or sls token create on the Protocube host")

type Client struct {
	baseURL    string
	token      string
	httpClient *http.Client
	local      bool
	socket     string
}

func New(cfg config.API) (*Client, error) {
	if strings.TrimSpace(cfg.URL) == "" || strings.TrimSpace(cfg.Token) == "" {
		return nil, ErrNotLoggedIn
	}
	return &Client{
		baseURL:    strings.TrimRight(strings.TrimSpace(cfg.URL), "/"),
		token:      strings.TrimSpace(cfg.Token),
		httpClient: &http.Client{Timeout: 15 * time.Second},
	}, nil
}

func NewLocal(socket string) (*Client, error) {
	if socket == "" {
		socket = config.DefaultSocket
	}
	dialer := &net.Dialer{Timeout: 5 * time.Second}
	return &Client{
		baseURL: "http://localhost",
		local:   true,
		socket:  socket,
		httpClient: &http.Client{
			Timeout: 15 * time.Second,
			Transport: &http.Transport{
				DialContext: func(ctx context.Context, _, _ string) (net.Conn, error) {
					conn, err := dialer.DialContext(ctx, "unix", socket)
					if err != nil {
						return nil, wrapDialError(socket, err)
					}
					return conn, nil
				},
			},
		},
	}, nil
}

// ProbeLocal reports whether the Unix admin socket accepts a connection.
func ProbeLocal(socket string) error {
	if socket == "" {
		socket = config.DefaultSocket
	}
	conn, err := net.DialTimeout("unix", socket, time.Second)
	if err != nil {
		return wrapDialError(socket, err)
	}
	return conn.Close()
}

func wrapDialError(socket string, err error) error {
	if errors.Is(err, os.ErrPermission) || isPermission(err) {
		return errors.Wrapf(err, "cannot connect to %s: permission denied (try sudo sls token create)", socket)
	}
	if errors.Is(err, os.ErrNotExist) || isConnectError(err) {
		return errors.Wrapf(err, "cannot connect to %s: is Protocube running?", socket)
	}
	return errors.Wrapf(err, "cannot connect to %s", socket)
}

func isConnectError(err error) bool {
	var op *net.OpError
	return errors.As(err, &op)
}

func isPermission(err error) bool {
	return err != nil && (errors.Is(err, os.ErrPermission) || strings.Contains(err.Error(), "permission denied"))
}

func IsPermission(err error) bool {
	return isPermission(err)
}

func (c *Client) Auth(ctx context.Context) (Auth, error) {
	var out Auth
	err := c.do(ctx, http.MethodGet, "/api/auth", nil, &out)
	return out, err
}

func (c *Client) ListTokens(ctx context.Context) ([]Token, error) {
	var out tokenListResponse
	if err := c.do(ctx, http.MethodGet, "/api/tokens", nil, &out); err != nil {
		return nil, err
	}
	if out.Data == nil {
		return []Token{}, nil
	}
	return out.Data, nil
}

func (c *Client) GetToken(ctx context.Context, id string) (Token, error) {
	var out Token
	err := c.do(ctx, http.MethodGet, "/api/tokens/"+id, nil, &out)
	return out, err
}

func (c *Client) CreateToken(ctx context.Context, req CreateTokenRequest) (CreatedToken, error) {
	var out CreatedToken
	err := c.do(ctx, http.MethodPost, "/api/tokens", req, &out)
	return out, err
}

func (c *Client) RevokeToken(ctx context.Context, id, reason string) (Token, error) {
	var out Token
	body := map[string]string{}
	if reason != "" {
		body["reason"] = reason
	}
	err := c.do(ctx, http.MethodPost, "/api/tokens/"+id+"/revoke", body, &out)
	return out, err
}

func (c *Client) DeleteToken(ctx context.Context, id string) error {
	return c.do(ctx, http.MethodDelete, "/api/tokens/"+id, nil, nil)
}

type apiError struct {
	Code   string `json:"code"`
	Status string `json:"status"`
	Detail string `json:"detail"`
	Hint   string `json:"hint"`
}

// IsNotFound reports whether err is a Protocube 404 response.
func IsNotFound(err error) bool {
	var apiErr apiError
	return errors.As(err, &apiErr) && apiErr.Code == "404"
}

func (e apiError) Error() string {
	if e.Hint != "" && e.Detail != "" && e.Hint != e.Detail {
		return e.Hint + ": " + e.Detail
	}
	if e.Hint != "" {
		return e.Hint
	}
	if e.Detail != "" {
		return e.Detail
	}
	if e.Status != "" {
		return e.Status
	}
	return "request failed"
}

func (c *Client) do(ctx context.Context, method, path string, body any, out any) error {
	var rdr io.Reader
	if body != nil {
		data, err := json.Marshal(body)
		if err != nil {
			return err
		}
		rdr = bytes.NewReader(data)
	}
	req, err := http.NewRequestWithContext(ctx, method, c.baseURL+path, rdr)
	if err != nil {
		return err
	}
	if body != nil {
		req.Header.Set("Content-Type", "application/json")
	}
	if !c.local && c.token != "" {
		req.Header.Set("Authorization", "Bearer "+c.token)
	}
	res, err := c.httpClient.Do(req)
	if err != nil {
		if c.local {
			return wrapDialError(c.socket, err)
		}
		return err
	}
	defer res.Body.Close()
	data, err := io.ReadAll(res.Body)
	if err != nil {
		return err
	}
	if res.StatusCode >= 400 {
		var apiErr apiError
		if json.Unmarshal(data, &apiErr) == nil && (apiErr.Detail != "" || apiErr.Hint != "" || apiErr.Status != "") {
			return apiErr
		}
		return fmt.Errorf("%s: %s", res.Status, strings.TrimSpace(string(data)))
	}
	if out == nil || res.StatusCode == http.StatusNoContent || len(data) == 0 {
		return nil
	}
	if err := json.Unmarshal(data, out); err != nil {
		return errors.Wrap(err, "failed to decode response")
	}
	return nil
}
