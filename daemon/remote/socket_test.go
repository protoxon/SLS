package remote

import (
	"encoding/json"
	"net/http"
	"path/filepath"
	"testing"

	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/internal/httpunix"
)

func TestNewFromConfigDialsRemoteSocket(t *testing.T) {
	socket := filepath.Join(t.TempDir(), "controller.sock")
	daemonSocket := filepath.Join(t.TempDir(), "daemon.sock")
	lis, err := httpunix.Listen(socket)
	if err != nil {
		t.Fatal(err)
	}
	var got NodeRegistration
	srv := &http.Server{Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Host != "127.0.0.1:5620" {
			http.Error(w, r.Host, http.StatusBadRequest)
			return
		}
		defer r.Body.Close()
		if err := json.NewDecoder(r.Body).Decode(&got); err != nil {
			http.Error(w, err.Error(), http.StatusBadRequest)
			return
		}
		w.Header().Set("Content-Type", "application/json")
		_ = json.NewEncoder(w).Encode(map[string]string{"token": "node-token"})
	})}
	go func() { _ = srv.Serve(lis) }()
	t.Cleanup(func() { _ = srv.Close() })

	prev := config.Get()
	t.Cleanup(func() { config.Set(prev) })
	config.Set(&config.Configuration{
		Uuid:     "node-1",
		Name:     "local",
		Location: "local",
		Api: config.ApiConfiguration{
			Url:    "http://127.0.0.1:5585",
			Socket: onSocket(daemonSocket),
		},
		RemoteApi: config.RemoteApi{
			Url:    "http://127.0.0.1:5620",
			Token:  "node-key",
			Socket: onSocket(socket),
		},
	})

	if err := NewFromConfig().Register(t.Context()); err != nil {
		t.Fatal(err)
	}
	if got.Socket != daemonSocket {
		t.Fatalf("registered socket = %q", got.Socket)
	}
	if got.Url != "http://127.0.0.1:5585" {
		t.Fatalf("registered url = %q", got.Url)
	}
}

func onSocket(path string) config.Socket {
	on := true
	return config.Socket{Enabled: &on, Path: path}
}
