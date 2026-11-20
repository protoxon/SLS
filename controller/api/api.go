package api

import (
	"context"
	"crypto/tls"
	"net"
	"net/http"
	"os"
	"path/filepath"
	"strconv"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"protoxon.com/sls/controller/api/router"
	"protoxon.com/sls/controller/api/router/middleware"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/system"
	"protoxon.com/sls/internal/httpunix"
)

type Server interface {
	Run(listener net.Listener) error
	Stop() error
}

type Api struct {
	Listener     net.Listener
	UnixListener net.Listener
	unixServer   *http.Server
	peerListener net.Listener
	peerServer   *http.Server
	Router       *router.Router
}

func New(resources *router.Resources) *Api {
	return &Api{
		Router: router.New(resources),
	}
}

// Run starts the API server
// The server run asynchronously and any errors are logged directly.
// If any server fails to listen the program will exit
func (api *Api) Run() {

	cfg := config.Get().Api
	address := cfg.Host + ":" + strconv.Itoa(cfg.Port)

	if cfg.ListenEnabled() {
		// Create a single listener for HTTP
		lis, err := net.Listen("tcp", address)
		if err != nil {
			log.WithField("error", err).Fatal("Failed to create net listener")
		}

		// Wrap listener in TLS if enabled
		if cfg.Tls.Enabled {
			tlsCfg, err := config.GetTLSConfig()
			if err != nil {
				log.WithField("error", err).Fatal("Failed to load TLS configuration")
			}
			lis = tls.NewListener(lis, tlsCfg)
		}
		// Set the api listener
		api.Listener = lis

		// Run the HTTP Server
		go func() {
			if err := api.Router.Run(lis); err != nil && !errors.Is(err, net.ErrClosed) {
				log.WithField("error", err).Warn("HTTP server failed")
			}
		}()
	}

	unixLis, err := listenUnix(cfg.AdminSocket)
	if err != nil {
		log.WithError(err).WithField("socket", cfg.AdminSocket).Error("failed to create admin socket")
	} else {
		api.UnixListener = unixLis
		api.unixServer = newUnixHTTPServer(api.Router.Handler, unixTrustAdmin)
		go func() {
			if err := api.unixServer.Serve(unixLis); err != nil && !errors.Is(err, http.ErrServerClosed) && !errors.Is(err, net.ErrClosed) {
				log.WithError(err).WithField("socket", cfg.AdminSocket).Error("admin socket server failed")
			}
		}()
		log.Info("Admin socket listening on " + system.Red(cfg.AdminSocket))
	}

	if peer := cfg.Socket.ActivePath(); peer != "" {
		peerLis, err := httpunix.Listen(peer)
		if err != nil {
			log.WithError(err).WithField("socket", peer).Fatal("failed to create peer socket")
		}
		api.peerListener = peerLis
		api.peerServer = newUnixHTTPServer(api.Router.Handler, unixTrustNode)
		go func() {
			if err := api.peerServer.Serve(peerLis); err != nil && !errors.Is(err, http.ErrServerClosed) && !errors.Is(err, net.ErrClosed) {
				log.WithError(err).WithField("socket", peer).Error("peer socket server failed")
			}
		}()
		log.Info("API socket listening on " + system.Red(peer))
	}

	if api.Listener == nil && api.UnixListener == nil && api.peerListener == nil {
		log.Fatal("no API listener: api.listen is false and no socket is available")
	}
	if cfg.ListenEnabled() {
		log.Info("Congestion control algorithm: " + system.DefaultTCPCC())
		if !cfg.Tls.Enabled {
			log.Warn("TLS disabled")
		}
		log.Info("Listening on " + system.Red(address))
	}
}

type unixTrust int

const (
	unixTrustNone unixTrust = iota
	unixTrustAdmin
	unixTrustNode
)

// newUnixHTTPServer serves handler on a Unix listener.
// unixTrustAdmin is the CLI socket. unixTrustNode is the daemon API socket
// and is accepted as a node without a bearer token.
func newUnixHTTPServer(handler http.Handler, trust unixTrust) *http.Server {
	srv := &http.Server{
		Handler:           handler,
		ReadHeaderTimeout: 5 * time.Second,
		ReadTimeout:       0,
		IdleTimeout:       5 * time.Minute,
	}
	switch trust {
	case unixTrustAdmin:
		srv.ConnContext = func(ctx context.Context, _ net.Conn) context.Context {
			return middleware.WithLocalAdmin(ctx)
		}
	case unixTrustNode:
		srv.ConnContext = func(ctx context.Context, _ net.Conn) context.Context {
			return middleware.WithLocalNode(ctx)
		}
	}
	return srv
}

func listenUnix(path string) (net.Listener, error) {
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return nil, errors.Wrap(err, "failed to create unix socket directory")
	}
	if err := os.Remove(path); err != nil && !errors.Is(err, os.ErrNotExist) {
		return nil, errors.Wrap(err, "failed to remove stale unix socket")
	}
	lis, err := net.Listen("unix", path)
	if err != nil {
		return nil, errors.Wrap(err, "failed to listen on unix socket")
	}
	if err := os.Chmod(path, 0o600); err != nil {
		_ = lis.Close()
		return nil, errors.Wrap(err, "failed to chmod unix socket")
	}
	return lis, nil
}

// Stop stops the api servers and closes the net listener
func (api *Api) Stop() {
	shutdownHTTP(api.unixServer)
	shutdownHTTP(api.peerServer)
	// Stop the HTTP server
	if api.Router != nil {
		api.Router.Stop()
	}
	if api.UnixListener != nil {
		_ = api.UnixListener.Close()
	}
	if api.peerListener != nil {
		_ = api.peerListener.Close()
	}
	// Close the listener
	if api.Listener != nil {
		_ = api.Listener.Close()
	}
}

func shutdownHTTP(srv *http.Server) {
	if srv == nil {
		return
	}
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()
	if err := srv.Shutdown(ctx); err != nil {
		_ = srv.Close()
	}
}
