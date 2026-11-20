package router

import (
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"strings"
	"sync"
	"time"

	"emperror.dev/errors"
	"github.com/gbrlsnchs/jwt/v3"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	ws "github.com/gorilla/websocket"
	"protoxon.com/sls/controller/api/router/middleware"
	"protoxon.com/sls/controller/api/router/websocket"
	"protoxon.com/sls/controller/auth/scope"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/internal/httpunix"
)

const websocketTokenTTL = 10 * time.Minute

const consoleAuthReadLimit = 4096

// consoleAuthTimeout closes a proxy socket that does not present a console
// token. The daemon is not dialed until that token verifies.
var consoleAuthTimeout = 10 * time.Second

const (
	permConnect = "websocket.connect"
	permCommand = "control.console"
	permStart   = "control.start"
	permStop    = "control.stop"
	permRestart = "control.restart"
)

var errUnsupportedScheme = errors.New("unsupported node url scheme")

type websocketClaims struct {
	jwt.Payload
	Scope       string   `json:"scope"`
	UserUUID    string   `json:"user_uuid"`
	ServerUUID  string   `json:"server_uuid"`
	Permissions []string `json:"permissions"`
}

type websocketTicket struct {
	Token  string `json:"token"`
	Socket string `json:"socket"`
}

// getServerWebsocketTicket returns a short-lived JWT and the socket URL.
// A proxied node points the socket at Controller. A direct node points it at the daemon.
func (r *Router) getServerWebsocketTicket(c *gin.Context) {
	s := middleware.ExtractServer(c)
	nodeClient, err := s.Client().Node()
	if err != nil {
		client.HandleError(c, err)
		return
	}

	socketURL, err := r.consoleSocketURL(c, s.Id(), s.NodeId(), nodeClient.BaseURL())
	if err != nil {
		client.HandleError(c, err)
		return
	}
	secret := nodeClient.GetToken()
	if secret == "" {
		client.HandleError(c, errors.New("node token is empty"))
		return
	}

	key := middleware.GetAPIKey(c)
	userID := "local"
	if key != nil && !middleware.IsLocal(c) {
		userID = key.ID.String()
	}
	allowWrite := key != nil && scope.Allows(key.Scopes, scope.ServersWrite)
	token, err := signWebsocketToken(secret, s.Id(), userID, allowWrite)
	if err != nil {
		client.HandleError(c, err)
		return
	}

	c.JSON(http.StatusOK, websocketTicket{Token: string(token), Socket: socketURL})
}

func signWebsocketToken(secret, serverID, userID string, allowWrite bool) ([]byte, error) {
	now := time.Now()
	permissions := []string{permConnect}
	if allowWrite {
		permissions = append(permissions, permCommand, permStart, permStop, permRestart)
	}
	claims := websocketClaims{
		Payload: jwt.Payload{
			ExpirationTime: jwt.NumericDate(now.Add(websocketTokenTTL)),
			IssuedAt:       jwt.NumericDate(now),
			JWTID:          uuid.NewString(),
		},
		Scope:       "websocket",
		UserUUID:    userID,
		ServerUUID:  serverID,
		Permissions: permissions,
	}
	return jwt.Sign(claims, jwt.NewHS256([]byte(secret)))
}

func (r *Router) consoleSocketURL(c *gin.Context, serverID, nodeID, nodeBase string) (string, error) {
	if !r.nodeProxiesConsole(nodeID) {
		return nodeWebsocketURL(nodeBase, serverID)
	}
	return controllerWebsocketURL(c, serverID)
}

func (r *Router) nodeProxiesConsole(nodeID string) bool {
	if r.NodeManager == nil {
		return true
	}
	n, ok := r.NodeManager.Get(nodeID)
	if !ok {
		return true
	}
	return n.ConsoleProxy()
}

func controllerWebsocketURL(c *gin.Context, serverID string) (string, error) {
	path := "/api/servers/" + url.PathEscape(serverID) + "/ws"
	if middleware.IsLocal(c) {
		cfg := config.Get().Api
		scheme := "ws"
		if cfg.Tls.Enabled {
			scheme = "wss"
		}
		port := cfg.Port
		if port == 0 {
			port = 8080
		}
		return fmt.Sprintf("%s://127.0.0.1:%d%s", scheme, port, path), nil
	}
	scheme := "ws"
	if c.Request.TLS != nil || forwardedHTTPS(c.GetHeader("X-Forwarded-Proto")) {
		scheme = "wss"
	}
	host := c.Request.Host
	if host == "" {
		return "", errors.New("request host is empty")
	}
	return scheme + "://" + host + path, nil
}

func forwardedHTTPS(header string) bool {
	if header == "" {
		return false
	}
	proto := strings.TrimSpace(strings.Split(header, ",")[0])
	return strings.EqualFold(proto, "https")
}

// plainSocketWebsocketURL uses ws on the daemon socket. The socket is plain HTTP,
// so wss would start TLS on that connection.
func plainSocketWebsocketURL(raw string) string {
	u, err := url.Parse(raw)
	if err != nil || u.Scheme != "wss" {
		return raw
	}
	u.Scheme = "ws"
	return u.String()
}

func upstreamWebsocketDialer(socket string) *ws.Dialer {
	if strings.TrimSpace(socket) == "" {
		return ws.DefaultDialer
	}
	dialer := *ws.DefaultDialer
	dialer.NetDialContext = httpunix.Transport(socket).DialContext
	return &dialer
}

func nodeWebsocketURL(base, serverID string) (string, error) {
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
		return "", errUnsupportedScheme
	}
	u.Path = "/api/servers/" + url.PathEscape(serverID) + "/ws"
	u.RawQuery = ""
	u.Fragment = ""
	return u.String(), nil
}

// getServerConsoleProxy copies console frames after the client presents a valid
// console JWT. The route has no API key check, matching local tail. The daemon
// is dialed only after that token verifies, so an open socket does not take a
// daemon session slot.
func getServerConsoleProxy(c *gin.Context) {
	s := middleware.ExtractServer(c)
	nodeClient, err := s.Client().Node()
	if err != nil {
		client.HandleError(c, err)
		return
	}
	secret := nodeClient.GetToken()
	if secret == "" {
		client.HandleError(c, errors.New("node token is empty"))
		return
	}
	wsURL, err := nodeWebsocketURL(nodeClient.BaseURL(), s.Id())
	if err != nil {
		client.HandleError(c, err)
		return
	}
	if nodeClient.Socket() != "" {
		wsURL = plainSocketWebsocketURL(wsURL)
	}

	handler, err := websocket.GetHandler(c.Writer, c.Request, c)
	if err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}
	clientConn := handler.Connection

	payload, err := readConsoleAuth(clientConn, secret, s.Id())
	if err != nil {
		rejectConsoleSocket(clientConn)
		return
	}

	upstreamConn, resp, err := upstreamWebsocketDialer(nodeClient.Socket()).Dial(wsURL, nil)
	if err != nil {
		_ = clientConn.Close()
		if resp != nil && resp.Body != nil {
			_ = resp.Body.Close()
		}
		return
	}
	if err := upstreamConn.WriteMessage(ws.TextMessage, payload); err != nil {
		_ = upstreamConn.Close()
		_ = clientConn.Close()
		return
	}
	proxyConsoleFrames(clientConn, upstreamConn)
}

func rejectConsoleSocket(conn *ws.Conn) {
	_ = conn.WriteMessage(ws.CloseMessage, ws.FormatCloseMessage(ws.ClosePolicyViolation, "invalid auth"))
	_ = conn.Close()
}

func readConsoleAuth(conn *ws.Conn, secret, serverID string) ([]byte, error) {
	conn.SetReadLimit(consoleAuthReadLimit)
	if err := conn.SetReadDeadline(time.Now().Add(consoleAuthTimeout)); err != nil {
		return nil, err
	}
	messageType, payload, err := conn.ReadMessage()
	if err != nil {
		return nil, err
	}
	if err := conn.SetReadDeadline(time.Time{}); err != nil {
		return nil, err
	}
	if messageType != ws.TextMessage {
		return nil, errors.New("console auth must be a text frame")
	}
	var msg struct {
		Event string   `json:"event"`
		Args  []string `json:"args"`
	}
	if err := json.Unmarshal(payload, &msg); err != nil {
		return nil, err
	}
	if msg.Event != "auth" {
		return nil, errors.New("expected auth frame")
	}
	if err := verifyConsoleToken(strings.Join(msg.Args, ""), secret, serverID); err != nil {
		return nil, err
	}
	return payload, nil
}

func verifyConsoleToken(token, secret, serverID string) error {
	if strings.TrimSpace(secret) == "" || strings.TrimSpace(token) == "" {
		return errors.New("console token rejected")
	}
	var claims websocketClaims
	_, err := jwt.Verify(
		[]byte(token),
		jwt.NewHS256([]byte(secret)),
		&claims,
		jwt.ValidatePayload(&claims.Payload, jwt.ExpirationTimeValidator(time.Now())),
	)
	if err != nil {
		return err
	}
	if claims.Scope != "websocket" || claims.ServerUUID != serverID || !hasConsolePermission(claims, permConnect) {
		return errors.New("console token rejected")
	}
	return nil
}

func hasConsolePermission(claims websocketClaims, permission string) bool {
	for _, got := range claims.Permissions {
		if got == permission {
			return true
		}
	}
	return false
}

type lockedConn struct {
	mu   sync.Mutex
	conn *ws.Conn
}

func (c *lockedConn) write(messageType int, payload []byte) error {
	c.mu.Lock()
	defer c.mu.Unlock()
	return c.conn.WriteMessage(messageType, payload)
}

func armProxyConn(c *lockedConn) {
	_ = c.conn.SetReadDeadline(time.Time{})
	_ = c.conn.SetWriteDeadline(time.Time{})
	c.conn.SetPingHandler(func(data string) error {
		c.mu.Lock()
		defer c.mu.Unlock()
		return c.conn.WriteControl(ws.PongMessage, []byte(data), time.Now().Add(time.Second))
	})
}

func proxyConsoleFrames(clientConn, upstreamConn *ws.Conn) {
	clientSide := &lockedConn{conn: clientConn}
	upstream := &lockedConn{conn: upstreamConn}
	armProxyConn(clientSide)
	armProxyConn(upstream)

	var once sync.Once
	done := make(chan struct{})
	stop := func() {
		once.Do(func() {
			_ = clientConn.Close()
			_ = upstreamConn.Close()
			close(done)
		})
	}
	go func() {
		copyConsoleFrames(clientSide, upstream)
		stop()
	}()
	go func() {
		copyConsoleFrames(upstream, clientSide)
		stop()
	}()
	<-done
}

func copyConsoleFrames(dst, src *lockedConn) {
	for {
		messageType, payload, err := src.conn.ReadMessage()
		if err != nil {
			return
		}
		if messageType != ws.TextMessage && messageType != ws.BinaryMessage {
			continue
		}
		if err := dst.write(messageType, payload); err != nil {
			return
		}
	}
}
