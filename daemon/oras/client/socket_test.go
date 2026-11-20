package client

import (
	"io"
	"net/http"
	"path/filepath"
	"sync/atomic"
	"testing"

	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/retry"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/internal/httpunix"
)

func TestRepositoryUsesPeerSocketForRemoteHost(t *testing.T) {
	socket := filepath.Join(t.TempDir(), "controller.sock")
	lis, err := httpunix.Listen(socket)
	if err != nil {
		t.Fatal(err)
	}
	var hits atomic.Int32
	srv := &http.Server{Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		hits.Add(1)
		w.WriteHeader(http.StatusOK)
	})}
	go func() { _ = srv.Serve(lis) }()
	t.Cleanup(func() { _ = srv.Close() })

	prev := config.Get()
	t.Cleanup(func() { config.Set(prev) })
	config.Set(&config.Configuration{
		RemoteApi: config.RemoteApi{
			Url:    "http://127.0.0.1:5620",
			Socket: onSocket(socket),
		},
	})

	repo, err := NewRepository("127.0.0.1:5620/sls/app:latest")
	if err != nil {
		t.Fatal(err)
	}
	req, err := http.NewRequest(http.MethodGet, "http://127.0.0.1:5620/v2/", nil)
	if err != nil {
		t.Fatal(err)
	}
	resp, err := repo.Client.Do(req)
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()
	_, _ = io.Copy(io.Discard, resp.Body)
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("status %d", resp.StatusCode)
	}
	if hits.Load() == 0 {
		t.Fatal("registry request did not reach the peer socket")
	}

	other, err := NewRepository("ghcr.io/sls/app:latest")
	if err != nil {
		t.Fatal(err)
	}
	ac, ok := other.Client.(*auth.Client)
	if !ok {
		t.Fatalf("client %T", other.Client)
	}
	if ac.Client != retry.DefaultClient {
		t.Fatal("other registries should keep the default HTTP client")
	}

	probe, err := NewProbeRepository("127.0.0.1:5620/sls/app:latest")
	if err != nil {
		t.Fatal(err)
	}
	pac, ok := probe.Client.(*auth.Client)
	if !ok {
		t.Fatalf("probe client %T", probe.Client)
	}
	if pac.Client == nil || pac.Client.Timeout != ProbeTimeout {
		t.Fatalf("probe timeout = %s", pac.Client.Timeout)
	}
}

func onSocket(path string) config.Socket {
	on := true
	return config.Socket{Enabled: &on, Path: path}
}
