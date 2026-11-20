package client

import (
	"net"
	"net/http"
	"time"

	"protoxon.com/sls/internal/httpunix"
)

const (
	// dialTimeout bounds opening a connection. A failure here means the node
	// never saw the request.
	dialTimeout = 5 * time.Second
	// requestTimeout bounds a request whose connection was accepted. The node
	// may have handled it even when this fires.
	requestTimeout = 15 * time.Second
)

// Client serves as the base client shared by all node and server clients.
type Client struct {
	httpClient  *http.Client
	maxAttempts int
}

type ClientOption func(c *Client)

// WithHTTPClient Option: custom HTTP client
func WithHTTPClient(httpClient *http.Client) ClientOption {
	return func(c *Client) {
		c.httpClient = httpClient
	}
}

// WithMaxAttempts Option: retry attempts
func WithMaxAttempts(n int) ClientOption {
	return func(c *Client) {
		c.maxAttempts = n
	}
}

func New(opts ...ClientOption) *Client {
	transport := http.DefaultTransport.(*http.Transport).Clone()
	transport.DialContext = (&net.Dialer{Timeout: dialTimeout}).DialContext
	c := &Client{
		httpClient: &http.Client{
			Timeout:   requestTimeout,
			Transport: transport,
		},
		maxAttempts: 3,
	}

	for _, opt := range opts {
		opt(c)
	}

	return c
}

// Node creates a client for a specific node.
func (c *Client) Node(nodeId string, baseUrl, token string) NodeClient {
	return &nodeClient{
		client:  c,
		nodeId:  nodeId,
		baseUrl: baseUrl,
		token:   token,
	}
}

// LocalNode dials socket for every request. baseUrl stays the HTTP origin
// used in request URLs and websocket addresses.
func (c *Client) LocalNode(nodeId, baseUrl, token, socket string) NodeClient {
	timeout := requestTimeout
	attempts := 3
	if c != nil {
		attempts = c.maxAttempts
		if c.httpClient != nil {
			timeout = c.httpClient.Timeout
		}
	}
	local := New(WithHTTPClient(httpunix.Client(socket, timeout)), WithMaxAttempts(attempts))
	return &nodeClient{
		client:  local,
		nodeId:  nodeId,
		baseUrl: baseUrl,
		token:   token,
		socket:  socket,
	}
}
