package api

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"strings"
	"time"

	"github.com/gorilla/websocket"
)

type consoleTicket struct {
	Token  string `json:"token"`
	Socket string `json:"socket"`
}

// FollowLogs dials the daemon console socket and prints console and install
// lines until ctx is canceled. A short-lived JWT from Controller is refreshed
// on the open socket when the daemon says it is expiring.
func (c *Client) FollowLogs(ctx context.Context, id string, emit func(string) error) error {
	ticket, err := c.consoleTicket(ctx, id)
	if err != nil {
		return err
	}
	conn, resp, err := dialDaemonSocket(ctx, ticket.Socket)
	if err != nil {
		if resp != nil && resp.Body != nil {
			defer resp.Body.Close()
			data, _ := io.ReadAll(resp.Body)
			if msg := strings.TrimSpace(string(data)); msg != "" {
				return fmtError(resp.Status, msg)
			}
			return fmtError(resp.Status, "websocket upgrade failed")
		}
		return err
	}
	defer conn.Close()

	if err := writeAuth(conn, ticket.Token); err != nil {
		return err
	}

	done := make(chan struct{})
	go func() {
		select {
		case <-ctx.Done():
			_ = conn.Close()
		case <-done:
		}
	}()
	defer close(done)

	for {
		_, payload, err := conn.ReadMessage()
		if err != nil {
			if ctx.Err() != nil {
				return nil
			}
			return err
		}
		if renewEvent(payload) {
			ticket, err = c.consoleTicket(ctx, id)
			if err != nil {
				return err
			}
			if err := writeAuth(conn, ticket.Token); err != nil {
				return err
			}
			continue
		}
		line, ok := consoleLine(payload)
		if !ok {
			continue
		}
		if err := emit(line); err != nil {
			return err
		}
	}
}

func (c *Client) consoleTicket(ctx context.Context, id string) (consoleTicket, error) {
	var out consoleTicket
	if err := c.do(ctx, http.MethodGet, serverPath(id, "/websocket"), nil, &out); err != nil {
		return consoleTicket{}, err
	}
	if out.Token == "" || out.Socket == "" {
		return consoleTicket{}, fmt.Errorf("console ticket missing token or socket")
	}
	return out, nil
}

func dialDaemonSocket(ctx context.Context, rawURL string) (*websocket.Conn, *http.Response, error) {
	dialer := websocket.Dialer{HandshakeTimeout: 15 * time.Second}
	return dialer.DialContext(ctx, rawURL, nil)
}

func writeAuth(conn *websocket.Conn, token string) error {
	return conn.WriteJSON(map[string]any{"event": "auth", "args": []string{token}})
}

func renewEvent(payload []byte) bool {
	var msg struct {
		Event string `json:"event"`
	}
	if err := json.Unmarshal(payload, &msg); err != nil {
		return false
	}
	switch msg.Event {
	case "token expiring", "token expired", "jwt error":
		return true
	default:
		return false
	}
}

// FollowEvents reads the global event websocket until ctx is canceled.
func (c *Client) FollowEvents(ctx context.Context, emit func(string) error) error {
	return c.streamSocket(ctx, "/api/events/ws", func(payload []byte) error {
		line := formatGlobalEvent(payload)
		if line == "" {
			return nil
		}
		return emit(line)
	})
}

func (c *Client) streamSocket(ctx context.Context, path string, emit func([]byte) error) error {
	conn, resp, err := c.dialSocket(ctx, path)
	if err != nil {
		if resp != nil && resp.Body != nil {
			defer resp.Body.Close()
			data, _ := io.ReadAll(resp.Body)
			if msg := strings.TrimSpace(string(data)); msg != "" {
				return fmtError(resp.Status, msg)
			}
			return fmtError(resp.Status, "websocket upgrade failed")
		}
		if c.local {
			return wrapDialError(c.socket, err)
		}
		return err
	}
	defer conn.Close()

	done := make(chan struct{})
	go func() {
		select {
		case <-ctx.Done():
			_ = conn.Close()
		case <-done:
		}
	}()
	defer close(done)

	for {
		_, payload, err := conn.ReadMessage()
		if err != nil {
			if ctx.Err() != nil {
				return nil
			}
			return err
		}
		if err := emit(payload); err != nil {
			return err
		}
	}
}

func (c *Client) dialSocket(ctx context.Context, path string) (*websocket.Conn, *http.Response, error) {
	wsURL, err := websocketURL(c.baseURL, path)
	if err != nil {
		return nil, nil, err
	}
	header := http.Header{}
	if !c.local && c.token != "" {
		header.Set("Authorization", "Bearer "+c.token)
	}
	dialer := websocket.Dialer{HandshakeTimeout: 15 * time.Second}
	if c.local {
		if transport, ok := c.httpClient.Transport.(*http.Transport); ok && transport.DialContext != nil {
			dialer.NetDialContext = transport.DialContext
		}
	}
	return dialer.DialContext(ctx, wsURL, header)
}

func websocketURL(base, path string) (string, error) {
	u, err := url.Parse(base)
	if err != nil {
		return "", err
	}
	switch u.Scheme {
	case "http":
		u.Scheme = "ws"
	case "https":
		u.Scheme = "wss"
	case "ws", "wss":
	default:
		return "", fmtError(u.Scheme, "unsupported API url scheme")
	}
	u.Path = path
	u.RawQuery = ""
	u.Fragment = ""
	return u.String(), nil
}

func consoleLine(payload []byte) (string, bool) {
	var msg struct {
		Event string   `json:"event"`
		Args  []string `json:"args"`
	}
	if err := json.Unmarshal(payload, &msg); err != nil {
		return "", false
	}
	if msg.Event != "console output" && msg.Event != "install output" {
		return "", false
	}
	return strings.TrimRight(strings.Join(msg.Args, ""), "\r\n"), true
}

func fmtError(status, msg string) error {
	return &plainError{status: status, msg: msg}
}

type plainError struct {
	status string
	msg    string
}

func (e *plainError) Error() string {
	if e.status == "" {
		return e.msg
	}
	return e.status + ": " + e.msg
}
