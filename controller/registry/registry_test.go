package registry

import (
	"bytes"
	"context"
	"net/http"
	"net/http/httptest"
	"net/url"
	"sync"
	"sync/atomic"
	"testing"
	"time"

	"github.com/opencontainers/go-digest"
)

func TestNewServesPing(t *testing.T) {
	h, err := New(context.Background(), t.TempDir())
	if err != nil {
		t.Fatal(err)
	}
	req := httptest.NewRequest(http.MethodGet, "/v2/", nil)
	w := httptest.NewRecorder()
	h.ServeHTTP(w, req)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d: %s", w.Code, w.Body.String())
	}
}

func TestNewRequiresStorage(t *testing.T) {
	if _, err := New(context.Background(), "  "); err == nil {
		t.Fatal("expected error")
	}
}

func TestIsManifestPath(t *testing.T) {
	cases := []struct {
		path string
		want bool
	}{
		{"/v2/sls/demo/manifests/latest", true},
		{"/v2/a/b/c/manifests/sha256:abc", true},
		{"/v2/sls/demo/blobs/uploads/", false},
		{"/v2/sls/demo/tags/list", false},
		{"/v2/", false},
		{"/v2/manifests/latest", false},
	}
	for _, tc := range cases {
		if got := isManifestPath(tc.path); got != tc.want {
			t.Errorf("isManifestPath(%q) = %v, want %v", tc.path, got, tc.want)
		}
	}
}

func TestShouldScheduleGC(t *testing.T) {
	if !shouldScheduleGC(http.MethodPut, "/v2/sls/demo/manifests/latest") {
		t.Fatal("PUT manifest should schedule")
	}
	if !shouldScheduleGC(http.MethodDelete, "/v2/sls/demo/manifests/latest") {
		t.Fatal("DELETE manifest should schedule")
	}
	if shouldScheduleGC(http.MethodPost, "/v2/sls/demo/blobs/uploads/") {
		t.Fatal("POST upload should not schedule")
	}
	if shouldScheduleGC(http.MethodGet, "/v2/sls/demo/manifests/latest") {
		t.Fatal("GET should not schedule")
	}
}

func TestDebounceCoalescesSchedules(t *testing.T) {
	var calls atomic.Int32
	done := make(chan struct{}, 4)
	r := &Registry{
		debounce: 40 * time.Millisecond,
		runGC: func(context.Context) error {
			calls.Add(1)
			done <- struct{}{}
			return nil
		},
	}

	r.Schedule()
	r.Schedule()
	r.Schedule()

	select {
	case <-done:
	case <-time.After(time.Second):
		t.Fatal("timed out waiting for GC")
	}
	time.Sleep(80 * time.Millisecond)
	if n := calls.Load(); n != 1 {
		t.Fatalf("GC calls = %d, want 1", n)
	}
}

func TestDebouncePendingWhileRunning(t *testing.T) {
	started := make(chan struct{})
	release := make(chan struct{})
	var calls atomic.Int32
	done := make(chan struct{}, 4)

	r := &Registry{
		debounce: 20 * time.Millisecond,
		runGC: func(context.Context) error {
			n := calls.Add(1)
			if n == 1 {
				close(started)
				<-release
			}
			done <- struct{}{}
			return nil
		},
	}

	r.Schedule()
	select {
	case <-started:
	case <-time.After(time.Second):
		t.Fatal("first GC did not start")
	}

	r.Schedule()
	close(release)

	select {
	case <-done: // first
	case <-time.After(time.Second):
		t.Fatal("first GC did not finish")
	}
	select {
	case <-done: // second after debounce
	case <-time.After(time.Second):
		t.Fatal("pending GC did not run")
	}
	if n := calls.Load(); n != 2 {
		t.Fatalf("GC calls = %d, want 2", n)
	}
}

func TestUploadServedDuringGC(t *testing.T) {
	started := make(chan struct{})
	release := make(chan struct{})
	inner := http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusAccepted)
	})
	r := &Registry{
		handler:  inner,
		debounce: 20 * time.Millisecond,
		runGC: func(context.Context) error {
			close(started)
			<-release
			return nil
		},
	}
	r.Schedule()
	select {
	case <-started:
	case <-time.After(time.Second):
		t.Fatal("GC did not start")
	}

	w := httptest.NewRecorder()
	r.ServeHTTP(w, httptest.NewRequest(http.MethodPost, "/v2/sls/demo/blobs/uploads/", nil))
	if w.Code != http.StatusAccepted {
		t.Fatalf("POST status %d, want 202", w.Code)
	}
	w = httptest.NewRecorder()
	r.ServeHTTP(w, httptest.NewRequest(http.MethodPut, "/v2/sls/demo/blobs/uploads/uuid?digest=sha256:abc", nil))
	if w.Code != http.StatusAccepted {
		t.Fatalf("PUT status %d, want 202", w.Code)
	}
	close(release)
}

func TestCommittedBlobSurvivesSweepUntilQuiet(t *testing.T) {
	h, err := New(context.Background(), t.TempDir())
	if err != nil {
		t.Fatal(err)
	}
	body := []byte("snapshot-layer")
	dgst := putBlob(t, h, "demo", body)

	if err := h.markAndSweep(context.Background()); err != nil {
		t.Fatal(err)
	}
	if code := blobStatus(t, h, "demo", dgst); code != http.StatusOK {
		t.Fatalf("protected blob status %d, want 200", code)
	}

	h.protectMu.Lock()
	h.protected[dgst] = time.Now().Add(-time.Second)
	h.protectMu.Unlock()

	if err := h.markAndSweep(context.Background()); err != nil {
		t.Fatal(err)
	}
	if code := blobStatus(t, h, "demo", dgst); code != http.StatusNotFound {
		t.Fatalf("expired blob status %d, want 404", code)
	}
}

func putBlob(t *testing.T, h *Registry, repo string, body []byte) digest.Digest {
	t.Helper()
	dgst := digest.FromBytes(body)
	w := httptest.NewRecorder()
	h.ServeHTTP(w, httptest.NewRequest(http.MethodPost, "/v2/"+repo+"/blobs/uploads/", nil))
	if w.Code != http.StatusAccepted {
		t.Fatalf("start upload %d: %s", w.Code, w.Body.String())
	}
	loc, err := url.Parse(w.Header().Get("Location"))
	if err != nil || loc.Path == "" {
		t.Fatalf("location %q: %v", w.Header().Get("Location"), err)
	}
	q := loc.Query()
	q.Set("digest", dgst.String())
	loc.RawQuery = q.Encode()
	target := loc.RequestURI()
	if loc.Host != "" {
		target = loc.Path + "?" + loc.RawQuery
	}
	req := httptest.NewRequest(http.MethodPut, target, bytes.NewReader(body))
	req.Header.Set("Content-Type", "application/octet-stream")
	w = httptest.NewRecorder()
	h.ServeHTTP(w, req)
	if w.Code != http.StatusCreated {
		t.Fatalf("finish upload %d: %s", w.Code, w.Body.String())
	}
	if got := w.Header().Get("Docker-Content-Digest"); got != dgst.String() {
		t.Fatalf("digest %s, want %s", got, dgst)
	}
	return dgst
}

func blobStatus(t *testing.T, h *Registry, repo string, dgst digest.Digest) int {
	t.Helper()
	w := httptest.NewRecorder()
	h.ServeHTTP(w, httptest.NewRequest(http.MethodGet, "/v2/"+repo+"/blobs/"+dgst.String(), nil))
	return w.Code
}

func TestSuccessfulManifestPutSchedulesGC(t *testing.T) {
	var calls atomic.Int32
	var wg sync.WaitGroup
	wg.Add(1)

	inner := http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusCreated)
	})
	r := &Registry{
		handler:  inner,
		debounce: 20 * time.Millisecond,
		runGC: func(context.Context) error {
			calls.Add(1)
			wg.Done()
			return nil
		},
	}

	w := httptest.NewRecorder()
	r.ServeHTTP(w, httptest.NewRequest(http.MethodPut, "/v2/sls/demo/manifests/latest", nil))
	if w.Code != http.StatusCreated {
		t.Fatalf("status %d", w.Code)
	}

	done := make(chan struct{})
	go func() {
		wg.Wait()
		close(done)
	}()
	select {
	case <-done:
	case <-time.After(time.Second):
		t.Fatal("GC was not scheduled")
	}
	if calls.Load() != 1 {
		t.Fatalf("calls = %d", calls.Load())
	}
}

func TestFailedManifestDeleteDoesNotScheduleGC(t *testing.T) {
	var calls atomic.Int32
	inner := http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusNotFound)
	})
	r := &Registry{
		handler:  inner,
		debounce: 20 * time.Millisecond,
		runGC: func(context.Context) error {
			calls.Add(1)
			return nil
		},
	}

	w := httptest.NewRecorder()
	r.ServeHTTP(w, httptest.NewRequest(http.MethodDelete, "/v2/sls/demo/manifests/latest", nil))
	if w.Code != http.StatusNotFound {
		t.Fatalf("status %d", w.Code)
	}
	time.Sleep(60 * time.Millisecond)
	if calls.Load() != 0 {
		t.Fatalf("GC should not run on failed delete, calls=%d", calls.Load())
	}
}
