package api

import (
	"context"
	"crypto/tls"
	"errors"
	"net"
	"net/http"
	"strconv"
	"time"

	"github.com/apex/log"
	"github.com/fatih/color"
	"protoxon.com/sls/daemon/api/router"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/system"
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
	red := color.New(color.FgHiRed).SprintFunc()

	if cfg.ListenEnabled() {
		tlsOn := true
		if cfg.Tls.Enabled != nil {
			tlsOn = *cfg.Tls.Enabled
		}

		// create a single listener for HTTP
		lis, err := net.Listen("tcp", address)
		if err != nil {
			log.WithField("error", err).Fatal("Failed to create net listener")
		}

		// Wrap listener in TLS if enabled
		if tlsOn {
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

		log.Info("Congestion control algorithm: " + system.DefaultTCPCC())
		if !tlsOn {
			log.Warn("TLS disabled")
		}
		log.Info("Listening on " + red(address))
	}

	if socket := cfg.Socket.ActivePath(); socket != "" {
		unixLis, err := httpunix.Listen(socket)
		if err != nil {
			log.WithField("error", err).Fatal("Failed to create unix listener")
		}
		api.UnixListener = unixLis
		base := api.Router.HTTPServer
		api.unixServer = &http.Server{
			Handler:           base.Handler,
			ReadHeaderTimeout: base.ReadHeaderTimeout,
			ReadTimeout:       base.ReadTimeout,
			WriteTimeout:      base.WriteTimeout,
			IdleTimeout:       base.IdleTimeout,
		}
		go func() {
			if err := api.unixServer.Serve(unixLis); err != nil && !errors.Is(err, http.ErrServerClosed) && !errors.Is(err, net.ErrClosed) {
				log.WithField("error", err).Warn("unix socket server failed")
			}
		}()
		log.Info("Peer socket listening on " + red(socket))
	}
	if api.Listener == nil && api.UnixListener == nil {
		log.Fatal("no API listener: api.listen is false and api.socket is disabled")
	}
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
