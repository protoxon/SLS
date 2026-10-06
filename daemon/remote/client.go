package remote

import (
	"context"
	"net/http"
	"sync"
	"time"

	"github.com/apex/log"
	"protoxon.com/sls/daemon/models"
)

type Client interface {
	Register(ctx context.Context) error
	Start()
	Heartbeat(ctx context.Context)
	Disconnect(ctx context.Context)
	StatusUpdate(ctx context.Context, status string, id string) error // Sends a server status update
	CrashReport(ctx context.Context, data CrashData, id string) error // Sends a server crash report
	ServerDeleted(ctx context.Context, id string) error               // Sends a server deleted event
	GetServers(context context.Context, perPage int) ([]models.ServerConfiguration, error)
	GetServerConfiguration(ctx context.Context, uuid string) (models.ServerConfiguration, error)
	GetInstallationScript(ctx context.Context, serverId string) (InstallationScript, error)
	SetInstallationStatus(ctx context.Context, uuid string, data InstallStatusRequest) error
	GetRegistry(ctx context.Context) (models.RegistrySnapshot, error)
	SyncRegistry(ctx context.Context) error
	SyncRegistryIfChanged(ctx context.Context, revision string) error
	SetOnConnected(callback func(context.Context))
}

type client struct {
	httpClient  *http.Client
	baseUrl     string
	token       string
	maxAttempts int
	ctx         context.Context
	cancel      context.CancelFunc
	onConnected func(context.Context)
	mu          sync.RWMutex
}

// New returns a new HTTP request client that is used for making authenticated
// requests to the node
func New(base string, opts ...ClientOption) Client {
	ctx, cancel := context.WithCancel(context.Background())
	c := client{
		baseUrl: base,
		httpClient: &http.Client{
			Timeout: time.Second * 15,
		},
		maxAttempts: 0,
		ctx:         ctx,
		cancel:      cancel,
	}
	for _, opt := range opts {
		opt(&c)
	}

	return &c
}

// Start registers with Protocube and begins heartbeats. Call this after
// SetOnConnected so the first successful register can sync servers.
func (c *client) Start() {
	go func() {
		registerCtx, registerCancel := context.WithTimeout(context.Background(), 5*time.Second)
		defer registerCancel()
		if err := c.Register(registerCtx); err != nil {
			log.WithError(err).Debug("initial registration attempt failed, will retry on heartbeat")
		}
	}()
	c.StartHeartbeats()
}

// SetOnConnected sets the callback to be executed when the node successfully connects.
// If the node is already connected, the callback runs immediately.
func (c *client) SetOnConnected(callback func(context.Context)) {
	c.mu.Lock()
	c.onConnected = callback
	c.mu.Unlock()
	if callback != nil && connected.Load() {
		callback(c.ctx)
	}
}

func (c *client) notifyConnected(ctx context.Context) {
	c.mu.RLock()
	callback := c.onConnected
	c.mu.RUnlock()
	if callback != nil {
		callback(ctx)
	}
}

// WithCredentials sets the credentials to use when making request to the remote
// API endpoint.
func WithCredentials(token string) ClientOption {
	return func(c *client) {
		c.token = token
	}
}

// WithHttpClient sets the underlying HTTP client instance to use when making
// requests to protocube API.
func WithHttpClient(httpClient *http.Client) ClientOption {
	return func(c *client) {
		c.httpClient = httpClient
	}
}
