package docker

import (
	"context"
	"io"
	"net/http"
	"net/http/httptest"
	"strings"
	"sync/atomic"
	"testing"
	"time"

	"emperror.dev/errors"
	"github.com/docker/docker/client"
	"protoxon.com/sls/daemon/config"
)

// fakeDocker serves the two endpoints the pull code uses.
type fakeDocker struct {
	pull      func(w http.ResponseWriter, r *http.Request)
	images    string // body for GET /images/json; empty means a 500
	listCalls atomic.Int32
}

func (f *fakeDocker) client(t *testing.T) *client.Client {
	t.Helper()
	config.Set(&config.Configuration{})
	t.Cleanup(func() { config.Set(nil) })

	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case strings.HasSuffix(r.URL.Path, "/images/create"):
			f.pull(w, r)
		case strings.HasSuffix(r.URL.Path, "/images/json"):
			f.listCalls.Add(1)
			if f.images == "" {
				http.Error(w, `{"message":"daemon unavailable"}`, http.StatusInternalServerError)
				return
			}
			w.Header().Set("Content-Type", "application/json")
			_, _ = io.WriteString(w, f.images)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)

	cli, err := client.NewClientWithOpts(
		client.WithHost("tcp://"+srv.Listener.Addr().String()),
		client.WithVersion("1.45"),
	)
	if err != nil {
		t.Fatal(err)
	}
	t.Cleanup(func() { _ = cli.Close() })
	return cli
}

func streamLines(lines ...string) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, _ *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		for _, l := range lines {
			_, _ = io.WriteString(w, l+"\n")
		}
	}
}

// stallAfter sends one status line and then nothing until the client hangs up.
func stallAfter(line string) func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		_, _ = io.WriteString(w, line+"\n")
		w.(http.Flusher).Flush()
		<-r.Context().Done()
	}
}

const testImage = "example/img:1"

func TestPullImageReturnsStreamError(t *testing.T) {
	f := &fakeDocker{
		pull:   streamLines(`{"status":"Pulling from example/img"}`, `{"errorDetail":{"message":"manifest unknown"},"error":"manifest unknown"}`),
		images: `[]`,
	}
	err := PullImageWithOfflineFallback(context.Background(), f.client(t), testImage, nil)
	if err == nil || !strings.Contains(err.Error(), "manifest unknown") {
		t.Fatalf("expected the stream error, got %v", err)
	}
}

func TestPullImageReportsStatus(t *testing.T) {
	f := &fakeDocker{pull: streamLines(`{"status":"Downloading","progress":"[=>  ] 1MB/8MB"}`, `{"status":"Download complete"}`)}
	var got []string
	err := PullImage(context.Background(), f.client(t), testImage, func(s string) { got = append(got, s) })
	if err != nil {
		t.Fatal(err)
	}
	if len(got) != 2 || got[0] != "Downloading [=>  ] 1MB/8MB" {
		t.Fatalf("unexpected status lines %q", got)
	}
}

func TestPullImageFallsBackToLocalImage(t *testing.T) {
	f := &fakeDocker{
		pull:   streamLines(`{"error":"dial tcp: connection refused"}`),
		images: `[{"Id":"sha256:abc","RepoTags":["` + testImage + `"]}]`,
	}
	if err := PullImageWithOfflineFallback(context.Background(), f.client(t), testImage, nil); err != nil {
		t.Fatalf("expected the local image to be used, got %v", err)
	}
}

func TestPullImageKeepsPullErrorWhenListFails(t *testing.T) {
	f := &fakeDocker{pull: streamLines(`{"error":"manifest unknown"}`)}
	err := PullImageWithOfflineFallback(context.Background(), f.client(t), testImage, nil)
	if err == nil || !strings.Contains(err.Error(), "manifest unknown") || !strings.Contains(err.Error(), "checking local images also failed") {
		t.Fatalf("expected the pull error with the list failure, got %v", err)
	}
}

func TestPullImageCancelledSkipsFallback(t *testing.T) {
	f := &fakeDocker{pull: stallAfter(`{"status":"Pulling"}`), images: `[]`}
	cli := f.client(t)
	ctx, cancel := context.WithCancel(context.Background())
	time.AfterFunc(50*time.Millisecond, cancel)

	err := PullImageWithOfflineFallback(ctx, cli, testImage, nil)
	if err == nil || !strings.Contains(err.Error(), "was cancelled") {
		t.Fatalf("expected a cancelled pull error, got %v", err)
	}
	if n := f.listCalls.Load(); n != 0 {
		t.Fatalf("expected no local image check after cancel, got %d", n)
	}
}

func TestPullImageStalls(t *testing.T) {
	prev := pullStallTimeout
	pullStallTimeout = 100 * time.Millisecond
	t.Cleanup(func() { pullStallTimeout = prev })

	f := &fakeDocker{pull: stallAfter(`{"status":"Pulling"}`), images: `[]`}
	start := time.Now()
	err := PullImageWithOfflineFallback(context.Background(), f.client(t), testImage, nil)
	if !errors.Is(err, ErrPullStalled) {
		t.Fatalf("expected ErrPullStalled, got %v", err)
	}
	if elapsed := time.Since(start); elapsed > 5*time.Second {
		t.Fatalf("stall detection took %s", elapsed)
	}
	if n := f.listCalls.Load(); n != 1 {
		t.Fatalf("expected one local image check after a stall, got %d", n)
	}
}
