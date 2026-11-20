package registry

import (
	"context"
	"crypto/rand"
	"encoding/hex"
	"fmt"
	"net/http"
	"net/http/httptest"
	"os"
	"strings"
	"sync"
	"time"

	"github.com/distribution/distribution/v3/configuration"
	"github.com/distribution/distribution/v3/registry/handlers"
	_ "github.com/distribution/distribution/v3/registry/storage/driver/filesystem"
	"github.com/opencontainers/go-digest"
	"github.com/sirupsen/logrus"
)

const defaultGCDebounce = 30 * time.Second

// Registry is an OCI Distribution /v2 handler with debounced garbage collection.
type Registry struct {
	handler  http.Handler
	root     string
	debounce time.Duration

	// protectMu guards protected. A blob or manifest commit holds it across
	// the write and the record, and a sweep holds it across the check and delete.
	protectMu sync.Mutex
	protected map[digest.Digest]time.Time

	mu      sync.Mutex
	timer   *time.Timer
	running bool
	pending bool

	runGC func(ctx context.Context) error
}

// New builds an OCI Distribution /v2 registry backed by a filesystem store.
// Distribution auth is left unset so SLS middleware can sit in front.
// Upload purging uses distribution defaults (7d age, 24h interval).
func New(ctx context.Context, root string) (*Registry, error) {
	root = strings.TrimSpace(root)
	if root == "" {
		return nil, fmt.Errorf("registry storage path is empty")
	}
	if err := os.MkdirAll(root, 0o700); err != nil {
		return nil, fmt.Errorf("create registry storage: %w", err)
	}
	logrus.SetLevel(logrus.ErrorLevel)
	quietKnownMisses()
	secret, err := randomSecret()
	if err != nil {
		return nil, err
	}

	cfg := &configuration.Configuration{
		Version: configuration.CurrentVersion,
		Log: configuration.Log{
			Level:     "error",
			AccessLog: configuration.AccessLog{Disabled: true},
		},
		Storage: configuration.Storage{
			"filesystem": configuration.Parameters{
				"rootdirectory": root,
			},
			"delete": configuration.Parameters{
				"enabled": true,
			},
		},
		HTTP: configuration.HTTP{
			Secret:       secret,
			RelativeURLs: true,
		},
		Catalog: configuration.Catalog{
			MaxEntries: 1000,
		},
		Validation: configuration.Validation{
			Disabled: true,
		},
	}

	var app http.Handler
	func() {
		defer func() {
			if rec := recover(); rec != nil {
				err = fmt.Errorf("embedded registry: %v", rec)
			}
		}()
		app = handlers.NewApp(ctx, cfg)
	}()
	if err != nil {
		return nil, err
	}
	if app == nil {
		return nil, fmt.Errorf("embedded registry: empty handler")
	}

	r := &Registry{
		handler:  app,
		root:     root,
		debounce: defaultGCDebounce,
	}
	r.runGC = r.markAndSweep
	return r, nil
}

// ErrManifestNotFound is returned when the registry has no such manifest.
var ErrManifestNotFound = fmt.Errorf("manifest not found")

// DeleteManifest deletes one manifest by tag or digest.
// A missing manifest returns ErrManifestNotFound.
func (r *Registry) DeleteManifest(repo, reference string) error {
	if r == nil {
		return fmt.Errorf("registry is not configured")
	}
	repo = strings.Trim(repo, "/")
	reference = strings.TrimSpace(reference)
	if repo == "" || reference == "" {
		return fmt.Errorf("manifest reference is empty")
	}
	req := httptest.NewRequest(http.MethodDelete, "/v2/"+repo+"/manifests/"+reference, nil)
	req.Header.Set("Accept", "application/vnd.oci.image.manifest.v1+json")
	rec := httptest.NewRecorder()
	r.ServeHTTP(rec, req)
	if rec.Code == http.StatusNotFound {
		return ErrManifestNotFound
	}
	if rec.Code < 200 || rec.Code >= 300 {
		return fmt.Errorf("delete manifest %s: %s", reference, strings.TrimSpace(rec.Body.String()))
	}
	return nil
}

// ServeHTTP serves the distribution API. A blob or manifest commit is recorded
// as in progress so garbage collection does not delete it before the push finishes.
// Successful manifest PUT or DELETE schedules garbage collection.
func (r *Registry) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	commit := isCommitRequest(req)
	if commit {
		r.protectMu.Lock()
		defer r.protectMu.Unlock()
	}

	rw := &statusWriter{ResponseWriter: w, status: http.StatusOK}
	r.handler.ServeHTTP(rw, req)

	if rw.status < 200 || rw.status >= 300 {
		return
	}
	if commit {
		r.protectLocked(committedDigest(req, rw.Header()))
	}
	if shouldScheduleGC(req.Method, req.URL.Path) {
		r.Schedule()
	}
}

func randomSecret() (string, error) {
	buf := make([]byte, 32)
	if _, err := rand.Read(buf); err != nil {
		return "", fmt.Errorf("registry secret: %w", err)
	}
	return hex.EncodeToString(buf), nil
}

func shouldScheduleGC(method, path string) bool {
	switch method {
	case http.MethodPut, http.MethodDelete:
		return isManifestPath(path)
	default:
		return false
	}
}

// isManifestPath reports whether path is /v2/<name>/manifests/<reference>.
func isManifestPath(path string) bool {
	parts := strings.Split(strings.Trim(path, "/"), "/")
	if len(parts) < 4 || parts[0] != "v2" {
		return false
	}
	for i := 1; i < len(parts)-1; i++ {
		if parts[i] == "manifests" && parts[i+1] != "" {
			return true
		}
	}
	return false
}

// isCommitRequest reports a request that finishes a blob or stores a manifest.
// Chunk uploads and upload creation are not commits.
func isCommitRequest(req *http.Request) bool {
	if req == nil {
		return false
	}
	switch req.Method {
	case http.MethodPut:
		return isManifestPath(req.URL.Path) || isBlobUploadPath(req.URL.Path)
	case http.MethodPost:
		if !isBlobUploadPath(req.URL.Path) {
			return false
		}
		q := req.URL.Query()
		return q.Get("digest") != "" || q.Get("mount") != ""
	default:
		return false
	}
}

// isBlobUploadPath reports whether path is /v2/<name>/blobs/uploads[/<uuid>].
func isBlobUploadPath(path string) bool {
	parts := strings.Split(strings.Trim(path, "/"), "/")
	if len(parts) < 4 || parts[0] != "v2" {
		return false
	}
	for i := 1; i < len(parts)-1; i++ {
		if parts[i] == "blobs" && parts[i+1] == "uploads" {
			return true
		}
	}
	return false
}

// committedDigest is the digest a successful commit stored.
func committedDigest(req *http.Request, header http.Header) string {
	if !isCommitRequest(req) || header == nil {
		return ""
	}
	return header.Get("Docker-Content-Digest")
}

type statusWriter struct {
	http.ResponseWriter
	status      int
	wroteHeader bool
}

func (w *statusWriter) WriteHeader(code int) {
	if !w.wroteHeader {
		w.status = code
		w.wroteHeader = true
	}
	w.ResponseWriter.WriteHeader(code)
}

func (w *statusWriter) Write(b []byte) (int, error) {
	if !w.wroteHeader {
		w.WriteHeader(http.StatusOK)
	}
	return w.ResponseWriter.Write(b)
}

func (w *statusWriter) Flush() {
	if f, ok := w.ResponseWriter.(http.Flusher); ok {
		f.Flush()
	}
}

func (w *statusWriter) Unwrap() http.ResponseWriter {
	return w.ResponseWriter
}
