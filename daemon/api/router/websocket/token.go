package websocket

import (
	"context"
	"strings"
	"time"

	"emperror.dev/errors"
	"github.com/gbrlsnchs/jwt/v3"
	"github.com/google/uuid"
	"protoxon.com/sls/daemon/server"
)

const (
	PermissionConnect          = "websocket.connect"
	PermissionSendCommand      = "control.console"
	PermissionSendPowerStart   = "control.start"
	PermissionSendPowerStop    = "control.stop"
	PermissionSendPowerRestart = "control.restart"
)

var (
	ErrJwtNotPresent    = errors.New("jwt: no jwt present")
	ErrJwtNoConnectPerm = errors.New("jwt: missing connect permission")
	ErrJwtUuidMismatch  = errors.New("jwt: server uuid mismatch")
)

// Claims is the short-lived console token Controller signs with the node token.
type Claims struct {
	jwt.Payload
	Scope       string   `json:"scope"`
	UserUUID    string   `json:"user_uuid"`
	ServerUUID  string   `json:"server_uuid"`
	Permissions []string `json:"permissions"`
}

// Sign builds a console JWT. Tests and Controller use the same claim shape.
func Sign(secret, serverID, userID string, permissions []string, expires time.Time) (string, error) {
	now := time.Now()
	claims := Claims{
		Payload: jwt.Payload{
			ExpirationTime: jwt.NumericDate(expires),
			IssuedAt:       jwt.NumericDate(now),
			JWTID:          uuid.NewString(),
		},
		Scope:       "websocket",
		UserUUID:    userID,
		ServerUUID:  serverID,
		Permissions: permissions,
	}
	raw, err := jwt.Sign(claims, jwt.NewHS256([]byte(secret)))
	if err != nil {
		return "", err
	}
	return string(raw), nil
}

func parseToken(token, secret string) (*Claims, error) {
	if strings.TrimSpace(secret) == "" {
		return nil, errors.New("jwt: verifier secret is empty")
	}
	var claims Claims
	_, err := jwt.Verify(
		[]byte(token),
		jwt.NewHS256([]byte(secret)),
		&claims,
		jwt.ValidatePayload(&claims.Payload, jwt.ExpirationTimeValidator(time.Now())),
	)
	if err != nil {
		return nil, err
	}
	if claims.Scope != "websocket" || !claims.Has(PermissionConnect) {
		return nil, ErrJwtNoConnectPerm
	}
	return &claims, nil
}

// Has reports whether the token grants permission.
func (c *Claims) Has(permission string) bool {
	if c == nil {
		return false
	}
	for _, got := range c.Permissions {
		if got == permission || got == "*" {
			return true
		}
	}
	return false
}

func (h *Handler) setClaims(claims *Claims) (first bool) {
	h.Lock()
	defer h.Unlock()
	first = h.claims == nil
	h.claims = claims
	return first
}

func (h *Handler) getClaims() *Claims {
	h.RLock()
	defer h.RUnlock()
	return h.claims
}

// TokenValid reports whether the socket has a current, unexpired connect token.
func (h *Handler) TokenValid() error {
	claims := h.getClaims()
	if claims == nil {
		return ErrJwtNotPresent
	}
	if err := jwt.ExpirationTimeValidator(time.Now())(&claims.Payload); err != nil {
		return err
	}
	if claims.ServerUUID != h.server.ID() {
		return ErrJwtUuidMismatch
	}
	if claims.Scope != "websocket" || !claims.Has(PermissionConnect) {
		return ErrJwtNoConnectPerm
	}
	return nil
}

func (h *Handler) authenticate(ctx context.Context, token, secret string) {
	claims, err := parseToken(token, secret)
	if err != nil {
		_ = h.unsafeSendJson(Message{Event: JwtErrorEvent, Args: []string{err.Error()}})
		return
	}
	if claims.ServerUUID != h.server.ID() {
		_ = h.unsafeSendJson(Message{Event: JwtErrorEvent, Args: []string{ErrJwtUuidMismatch.Error()}})
		return
	}
	if h.reserve != nil {
		if err := h.reserve(); err != nil {
			_ = h.unsafeSendJson(Message{Event: JwtErrorEvent, Args: []string{err.Error()}})
			return
		}
	}

	first := h.setClaims(claims)
	_ = h.Connection.SetReadDeadline(time.Time{})
	if underlying := h.Connection.UnderlyingConn(); underlying != nil {
		_ = underlying.SetReadDeadline(time.Time{})
	}
	_ = h.unsafeSendJson(Message{Event: AuthenticationSuccessEvent})
	if !first {
		return
	}

	h.listeners.Do(func() {
		h.RegisterListenerEvents(ctx)
		go h.listenForExpiration(ctx)
	})
	h.publishInitialState()
}

func (h *Handler) listenForExpiration(ctx context.Context) {
	ticker := time.NewTicker(30 * time.Second)
	defer ticker.Stop()
	for {
		select {
		case <-ctx.Done():
			return
		case <-ticker.C:
			claims := h.getClaims()
			if claims == nil || claims.ExpirationTime == nil {
				continue
			}
			remaining := time.Until(claims.ExpirationTime.Time)
			if remaining <= 0 {
				_ = h.SendJson(Message{Event: TokenExpiredEvent})
			} else if remaining <= 60*time.Second {
				_ = h.SendJson(Message{Event: TokenExpiringEvent})
			}
		}
	}
}

func powerPermission(action server.PowerAction) (string, bool) {
	switch action {
	case server.PowerActionStart:
		return PermissionSendPowerStart, true
	case server.PowerActionStop, server.PowerActionTerminate, server.PowerActionPause, server.PowerActionUnpause:
		return PermissionSendPowerStop, true
	case server.PowerActionRestart:
		return PermissionSendPowerRestart, true
	default:
		return "", false
	}
}
