package websocket

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"strings"
	"sync"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/gorilla/websocket"
	"protoxon.com/sls/daemon/api/auth"
	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/daemon/environment/docker"
	"protoxon.com/sls/daemon/server"
	"protoxon.com/sls/daemon/system"
)

// websocketLogCount is the number of historical console lines returned for a
// "send logs" request. It matches the default page size used by the logs API.
const websocketLogCount = 100

type Handler struct {
	sync.RWMutex `json:"-"`
	Connection   *websocket.Conn `json:"-"`
	server       *server.Server
	uuid         uuid.UUID
	limiter      *LimiterBucket
	claims       *Claims
	listeners    sync.Once
	// reserve runs when the first console token is accepted. It reports
	// whether this connection may take a session slot.
	reserve func() error
}

// SetReserve installs the callback that accepts the session slot.
func (h *Handler) SetReserve(fn func() error) {
	h.reserve = fn
}

// GetHandler upgrades the request and returns a handler for the server socket.
// The upgrade is unauthenticated. The first auth frame carries the JWT.
func GetHandler(s *server.Server, w http.ResponseWriter, r *http.Request, _ *gin.Context) (*Handler, error) {
	upgrader := websocket.Upgrader{
		EnableCompression: true,
		// Console clients are not browsers. Authorization is the JWT on the
		// first auth frame, signed with the node token.
		CheckOrigin: func(r *http.Request) bool {
			return true
		},
	}

	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		return nil, err
	}

	// The HTTP server applies read and write deadlines to the connection before
	// the handler runs. Hijacking does not clear them, so a live socket would
	// be closed by ReadTimeout/WriteTimeout unless they are removed here.
	clearDeadlines(conn)

	u, err := uuid.NewRandom()
	if err != nil {
		_ = conn.Close()
		return nil, err
	}

	conn.SetReadLimit(4096)
	_ = conn.SetCompressionLevel(5)

	return &Handler{
		Connection: conn,
		server:     s,
		uuid:       u,
		limiter:    NewLimiter(),
	}, nil
}

func clearDeadlines(conn *websocket.Conn) {
	_ = conn.SetReadDeadline(time.Time{})
	_ = conn.SetWriteDeadline(time.Time{})
	if underlying := conn.UnderlyingConn(); underlying != nil {
		_ = underlying.SetReadDeadline(time.Time{})
		_ = underlying.SetWriteDeadline(time.Time{})
	}
}

func (h *Handler) Uuid() uuid.UUID {
	return h.uuid
}

func (h *Handler) Logger() *log.Entry {
	return log.WithField("subsystem", "websocket").
		WithField("connection", h.Uuid().String()).
		WithField("server", h.server.ID())
}

func (h *Handler) SendJson(v Message) error {
	if err := h.unsafeSendJson(v); err != nil {
		// Not entirely sure how this happens (likely just when there is a ton of console spam)
		// but I don't care to fix it right now, so just mask the error and throw a warning into
		// the logs for us to look into later.
		if errors.Is(err, websocket.ErrCloseSent) {
			if h.server != nil {
				h.server.Log().WithField("subsystem", "websocket").
					WithField("event", v.Event).
					Warn("failed to send event to websocket: close already sent")
			}
			return nil
		}

		return err
	}

	return nil
}

// unsafeSendJson sends JSON over the websocket, ignoring any higher-level
// checks. Do not call this directly unless a response should be sent.
func (h *Handler) unsafeSendJson(v interface{}) error {
	h.Lock()
	defer h.Unlock()

	return h.Connection.WriteJSON(v)
}

// SendErrorJson sends an error back to the connected websocket. The caller is
// already authenticated with the node token, so the underlying message is included.
func (h *Handler) SendErrorJson(msg Message, err error, shouldLog ...bool) error {
	wsm := Message{
		Event: ErrorEvent,
		Args:  []string{err.Error()},
	}

	m, u := h.GetErrorMessage(wsm.Args[0])
	wsm.Args = []string{m}

	if len(shouldLog) == 0 || (len(shouldLog) == 1 && shouldLog[0]) {
		h.server.Log().WithFields(log.Fields{"event": msg.Event, "error_identifier": u.String(), "error": err}).
			Errorf("error processing websocket event \"%s\"", msg.Event)
	}

	return h.unsafeSendJson(wsm)
}

// GetErrorMessage converts an error message into a more readable representation and returns a UUID
// that can be cross-referenced to find the specific error that triggered.
func (h *Handler) GetErrorMessage(msg string) (string, uuid.UUID) {
	u := uuid.Must(uuid.NewRandom())

	m := fmt.Sprintf("Error Event [%s]: %s", u.String(), msg)

	return m, u
}

// publishInitialState sends the current status once, after the first auth.
// Stats are included only while the server is offline and a filesystem exists.
func (h *Handler) publishInitialState() {
	state := environment.ProcessOfflineState
	if h.server.Environment != nil {
		state = h.server.Environment.State()
	}
	_ = h.SendJson(Message{
		Event: server.StatusEvent,
		Args:  []string{state},
	})

	if phase := h.server.InstallEventPhase(); phase != "" {
		_ = h.SendJson(Message{
			Event: server.InstallEvent,
			Args:  []string{phase},
		})
	}

	if state == environment.ProcessOfflineState && !h.server.IsInstalling() && h.server.Filesystem() != nil {
		b, _ := json.Marshal(h.server.Proc())
		_ = h.SendJson(Message{
			Event: server.StatsEvent,
			Args:  []string{string(b)},
		})
	}
}

// HandleInbound handles an inbound socket request and routes it to the proper action.
func (h *Handler) HandleInbound(ctx context.Context, m Message) error {
	if h.server.IsSuspended() {
		return server.ErrSuspended
	}

	if h.IsThrottled(m.Event) {
		return nil
	}

	if m.Event != AuthenticationEvent {
		if err := h.TokenValid(); err != nil {
			_ = h.unsafeSendJson(Message{
				Event: JwtErrorEvent,
				Args:  []string{err.Error()},
			})
			return nil
		}
	}

	switch m.Event {
	case AuthenticationEvent:
		h.authenticate(ctx, strings.Join(m.Args, ""), auth.Token())
		return nil
	case SetStateEvent:
		action := server.PowerAction(strings.Join(m.Args, ""))
		permission, ok := powerPermission(action)
		if !ok || !h.getClaims().Has(permission) {
			return nil
		}

		err := h.server.HandlePowerAction(action)
		if errors.Is(err, system.ErrLockerLocked) {
			msg, _ := h.GetErrorMessage("another power action is currently being processed for this server, please try again later")

			_ = h.SendJson(Message{
				Event: ErrorEvent,
				Args:  []string{msg},
			})

			return nil
		}

		return err
	case SendServerLogsEvent:
		if h.server.Environment == nil {
			return nil
		}

		readCtx, cancel := context.WithTimeout(context.Background(), time.Second*5)
		defer cancel()
		if running, _ := h.server.Environment.IsRunning(readCtx); !running {
			return nil
		}

		logs, err := h.server.Environment.Readlog(websocketLogCount)
		if err != nil {
			return err
		}

		for _, line := range logs {
			_ = h.SendJson(Message{
				Event: server.ConsoleOutputEvent,
				Args:  []string{line},
			})
		}

		return nil
	case SendStatsEvent:
		if h.server.Filesystem() == nil {
			return nil
		}

		b, _ := json.Marshal(h.server.Proc())
		_ = h.SendJson(Message{
			Event: server.StatsEvent,
			Args:  []string{string(b)},
		})

		return nil
	case SendCommandEvent:
		if !h.getClaims().Has(PermissionSendCommand) {
			return nil
		}
		if h.server.Environment == nil || h.server.Environment.State() == environment.ProcessOfflineState {
			return nil
		}

		// The container is not attached until the environment finishes booting.
		if h.server.Environment.State() == environment.ProcessStartingState {
			if e, ok := h.server.Environment.(*docker.Environment); ok {
				if !e.IsAttached() {
					return nil
				}
			}
		}

		return h.server.Environment.SendCommand(strings.Join(m.Args, ""))
	}

	return nil
}
