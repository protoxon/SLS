package router

import (
	"context"
	"encoding/json"
	"net/http"
	"sync"
	"sync/atomic"
	"time"

	"emperror.dev/errors"
	"github.com/gin-gonic/gin"
	ws "github.com/gorilla/websocket"
	"golang.org/x/time/rate"
	"protoxon.com/sls/daemon/api/router/middleware"
	"protoxon.com/sls/daemon/api/router/websocket"
	"protoxon.com/sls/daemon/server"
)

const websocketSlotLimit = 30

// websocketAuthTimeout closes a socket that never sends a valid console token.
// The session slot is taken only after that token is accepted.
var websocketAuthTimeout = 10 * time.Second

var expectedCloseCodes = []int{
	ws.CloseGoingAway,
	ws.CloseAbnormalClosure,
	ws.CloseNormalClosure,
	ws.CloseNoStatusReceived,
	ws.CloseServiceRestart,
}

// getServerWebsocket upgrades a connection. Listeners start after the client
// sends a valid auth frame. The route is not behind the node bearer token.
func getServerWebsocket(c *gin.Context) {
	s := middleware.ExtractServer(c)

	// Authenticated sessions are capped per server. The count does not include
	// sockets that have not presented a valid console token yet.
	if s.Websockets().Len() >= websocketSlotLimit {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{
			"error": "Too many open websocket connections.",
		})

		return
	}

	c.Header("Content-Security-Policy", "default-src 'self'")
	c.Header("X-Frame-Options", "DENY")

	// Create a context that can be canceled when the user disconnects from this
	// socket that will also cancel listeners running in separate threads. If the
	// connection itself is terminated listeners using this context will also be
	// closed.
	ctx, cancel := context.WithCancel(c.Request.Context())
	defer cancel()

	handler, err := websocket.GetHandler(s, c.Writer, c.Request, c)
	if err != nil {
		middleware.CaptureAndAbort(c, err)
		return
	}

	// Reserve a session slot only after the console token is accepted, so an
	// unauthenticated connection cannot fill the per-server limit.
	var reserved atomic.Bool
	var reserveOnce sync.Once
	var reserveErr error
	handler.SetReserve(func() error {
		reserveOnce.Do(func() {
			if !s.Websockets().TryPush(handler.Uuid(), &cancel, websocketSlotLimit) {
				reserveErr = errors.New("too many open websocket connections")
				return
			}
			reserved.Store(true)
		})
		return reserveErr
	})
	handler.Logger().Debug("opening connection to server websocket")
	defer func() {
		if reserved.Load() {
			s.Websockets().Remove(handler.Uuid())
		}
	}()

	go func() {
		select {
		// When the main context is canceled (through disconnect, server deletion, or server
		// suspension) close the connection itself.
		case <-ctx.Done():
			handler.Logger().Debug("closing connection to server websocket")
			if err := handler.Connection.Close(); err != nil {
				handler.Logger().WithError(err).Error("failed to close websocket connection")
			}
		}
	}()

	go func() {
		select {
		case <-ctx.Done():
			return
		// If the server is deleted we need to send a close message to the connected client
		// so that they disconnect since there will be no more events sent along. Listen for
		// the request context being closed to break this loop, otherwise this routine will
		// be left hanging in the background.
		case <-s.Context().Done():
			cancel()
		}
	}()

	// Due to how websockets are handled we need to connect to the socket
	// and _then_ abort it if the server is suspended. You cannot capture
	// the HTTP response in the websocket client, thus we connect and then
	// immediately close with failure.
	if s.IsSuspended() {
		_ = handler.Connection.WriteMessage(ws.CloseMessage, ws.FormatCloseMessage(4409, "server is suspended"))

		return
	}

	// There is a separate rate limiter that applies to individual message types
	// within the actual websocket logic handler. _This_ rate limiter just exists
	// to avoid enormous floods of data through the socket since we need to parse
	// JSON each time. This rate limit realistically should never be hit since this
	// would require sending 50+ messages a second over the websocket (no more than
	// 10 per 200ms).
	var throttled bool
	rl := rate.NewLimiter(rate.Every(time.Millisecond*200), 10)
	_ = handler.Connection.SetReadDeadline(time.Now().Add(websocketAuthTimeout))

	for {
		t, p, err := handler.Connection.ReadMessage()
		if err != nil {
			if ws.IsUnexpectedCloseError(err, expectedCloseCodes...) {
				handler.Logger().WithField("error", err).Warn("error handling websocket message for server")
			}
			break
		}

		if !rl.Allow() {
			if !throttled {
				throttled = true
				_ = handler.SendJson(websocket.Message{Event: websocket.ThrottledEvent, Args: []string{"global"}})
			}
			continue
		}

		throttled = false

		// If the message isn't a format we expect, or the length of the message is far larger
		// than we'd ever expect, drop it. The websocket upgrader logic does enforce a maximum
		// _compressed_ message size of 4Kb but that could decompress to a much larger amount
		// of data.
		if t != ws.TextMessage || len(p) > 32_768 {
			continue
		}

		// Discard and JSON parse errors into the void and don't continue processing this
		// specific socket request. If we did a break here the client would get disconnected
		// from the socket, which is NOT what we want to do.
		var j websocket.Message
		if err := json.Unmarshal(p, &j); err != nil {
			continue
		}

		go func(msg websocket.Message) {
			if err := handler.HandleInbound(ctx, msg); err != nil {
				if errors.Is(err, server.ErrSuspended) {
					cancel()
				} else {
					_ = handler.SendErrorJson(msg, err)
				}
			}
		}(j)
	}
}
