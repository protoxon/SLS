package httpunix

import (
	"context"
	"fmt"
	"net"
	"net/http"
	"os"
	"path/filepath"
	"time"
)

// Listen creates path as a Unix socket, replacing a stale socket file.
// The socket mode is 0600.
func Listen(path string) (net.Listener, error) {
	if path == "" {
		return nil, fmt.Errorf("unix socket path is empty")
	}
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return nil, fmt.Errorf("create unix socket directory: %w", err)
	}
	if err := os.Remove(path); err != nil && !os.IsNotExist(err) {
		return nil, fmt.Errorf("remove stale unix socket: %w", err)
	}
	lis, err := net.Listen("unix", path)
	if err != nil {
		return nil, fmt.Errorf("listen on unix socket: %w", err)
	}
	if err := os.Chmod(path, 0o600); err != nil {
		_ = lis.Close()
		return nil, fmt.Errorf("chmod unix socket: %w", err)
	}
	return lis, nil
}

// Transport dials path for every address. Request URLs can stay https://host/...
// The socket speaks plain HTTP, so an https URL does not start TLS. The host
// is still sent as the Host header.
func Transport(path string) *http.Transport {
	dial := func(ctx context.Context, _, _ string) (net.Conn, error) {
		var dialer net.Dialer
		return dialer.DialContext(ctx, "unix", path)
	}
	base := http.DefaultTransport.(*http.Transport).Clone()
	base.Proxy = nil
	base.DialContext = dial
	// https URLs use DialTLSContext and then skip the TLS handshake.
	base.DialTLSContext = dial
	return base
}

// Client returns an HTTP client that dials path.
func Client(path string, timeout time.Duration) *http.Client {
	return &http.Client{
		Timeout:   timeout,
		Transport: Transport(path),
	}
}
