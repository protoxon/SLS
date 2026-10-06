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
	"protoxon.com/sls/protocube/api/router"
	"protoxon.com/sls/protocube/api/router/middleware"
	"protoxon.com/sls/protocube/config"
	"protoxon.com/sls/protocube/system"
)

type Server interface {
	Run(listener net.Listener) error
	Stop() error
}

type Api struct {
	Listener     net.Listener
	UnixListener net.Listener
	unixServer   *http.Server
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

	unixLis, err := listenUnix(cfg.Socket)
	if err != nil {
		log.WithError(err).WithField("socket", cfg.Socket).Error("failed to create admin socket")
	} else {
		api.UnixListener = unixLis
		api.unixServer = &http.Server{
			Handler:           api.Router.Handler,
			ReadHeaderTimeout: 5 * time.Second,
			ReadTimeout:       0,
			IdleTimeout:       5 * time.Minute,
			ConnContext: func(ctx context.Context, _ net.Conn) context.Context {
				return middleware.WithLocalAdmin(ctx)
			},
		}
		go func() {
			if err := api.unixServer.Serve(unixLis); err != nil && !errors.Is(err, http.ErrServerClosed) && !errors.Is(err, net.ErrClosed) {
				log.WithError(err).WithField("socket", cfg.Socket).Error("admin socket server failed")
			}
		}()
		log.Info("Admin socket listening on " + system.Red(cfg.Socket))
	}

	log.Info("Congestion control algorithm: " + system.DefaultTCPCC())
	if !cfg.Tls.Enabled {
		log.Warn("TLS disabled")
	}
	log.Info("Listening on " + system.Red(address))
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
	if api.unixServer != nil {
		ctx, cancel := context.WithTimeout(context.Background(), time.Second)
		if err := api.unixServer.Shutdown(ctx); err != nil {
			_ = api.unixServer.Close()
		}
		cancel()
	}
	// Stop the HTTP server
	if api.Router != nil {
		api.Router.Stop()
	}
	if api.UnixListener != nil {
		_ = api.UnixListener.Close()
	}
	// Close the listener
	if api.Listener != nil {
		_ = api.Listener.Close()
	}
}
