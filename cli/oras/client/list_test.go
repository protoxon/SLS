package client

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"net/url"
	"path/filepath"
	"strconv"
	"strings"
	"testing"

	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/oras/volume"
)

func TestIsVolumeManifest(t *testing.T) {
	if !isVolumeManifest(ocispec.Manifest{ArtifactType: volume.ArtifactType}) {
		t.Fatal("artifact type should match")
	}
	if !isVolumeManifest(ocispec.Manifest{Config: ocispec.Descriptor{MediaType: volume.ConfigMediaType}}) {
		t.Fatal("config media type should match")
	}
	if isVolumeManifest(ocispec.Manifest{Config: ocispec.Descriptor{MediaType: ocispec.MediaTypeImageConfig}}) {
		t.Fatal("image config should not match")
	}
}

func TestListFiltersVolumes(t *testing.T) {
	volBody := mustOCIManifest(t, volume.ArtifactType, volume.ConfigMediaType)
	imgBody := mustOCIManifest(t, "", ocispec.MediaTypeImageConfig)
	volDigest := digest.FromBytes(volBody)
	imgDigest := digest.FromBytes(imgBody)

	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.URL.Path == "/v2/" || r.URL.Path == "/v2":
			w.WriteHeader(http.StatusOK)
		case r.URL.Path == "/v2/test/world/tags/list" && r.Method == http.MethodGet:
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(map[string]any{"name": "test/world", "tags": []string{"v2", "alpine", "latest", "missing"}})
		case strings.HasPrefix(r.URL.Path, "/v2/test/world/manifests/"):
			tag := strings.TrimPrefix(r.URL.Path, "/v2/test/world/manifests/")
			var body []byte
			var dgst digest.Digest
			switch tag {
			case "latest", "v2":
				body, dgst = volBody, volDigest
			case "alpine":
				body, dgst = imgBody, imgDigest
			default:
				http.NotFound(w, r)
				return
			}
			serveManifest(w, r, body, dgst)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)

	t.Setenv("SLS_CREDENTIALS", filepath.Join(t.TempDir(), "credentials.json"))
	host := strings.TrimPrefix(srv.URL, "http://")
	ref := host + "/test/world:ignored"
	got, err := List(t.Context(), ref, Options{PlainHTTP: true})
	if err != nil {
		t.Fatal(err)
	}
	wantRepo := host + "/test/world"
	if got.Repository != wantRepo {
		t.Fatalf("repository %q, want %q", got.Repository, wantRepo)
	}
	if len(got.Volumes) != 2 {
		t.Fatalf("volumes: %+v", got.Volumes)
	}
	if got.Volumes[0].Tag != "latest" || got.Volumes[1].Tag != "v2" {
		t.Fatalf("order: %+v", got.Volumes)
	}
	if got.Volumes[0].Digest != volDigest || got.Volumes[0].Reference != wantRepo+":latest" {
		t.Fatalf("latest: %+v", got.Volumes[0])
	}
}

func TestProbeTag(t *testing.T) {
	if got := probeTag([]string{"v2", "latest", "alpine"}); got != "latest" {
		t.Fatalf("probe %q", got)
	}
	if got := probeTag([]string{"v1", "v2"}); got != "v1" {
		t.Fatalf("first %q", got)
	}
}

func TestListSkipsRepoWhenLatestIsNotVolume(t *testing.T) {
	volBody := mustOCIManifest(t, volume.ArtifactType, volume.ConfigMediaType)
	imgBody := mustOCIManifest(t, "", ocispec.MediaTypeImageConfig)
	volDigest := digest.FromBytes(volBody)
	imgDigest := digest.FromBytes(imgBody)
	var extraGets int

	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.URL.Path == "/v2/" || r.URL.Path == "/v2":
			w.WriteHeader(http.StatusOK)
		case r.URL.Path == "/v2/test/img/tags/list":
			json.NewEncoder(w).Encode(map[string]any{"name": "test/img", "tags": []string{"latest", "v2"}})
		case r.URL.Path == "/v2/test/img/manifests/latest":
			serveManifest(w, r, imgBody, imgDigest)
		case r.URL.Path == "/v2/test/img/manifests/v2":
			extraGets++
			serveManifest(w, r, volBody, volDigest)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_CREDENTIALS", filepath.Join(t.TempDir(), "credentials.json"))
	host := strings.TrimPrefix(srv.URL, "http://")
	got, err := List(t.Context(), host+"/test/img", Options{PlainHTTP: true})
	if err != nil {
		t.Fatal(err)
	}
	if len(got.Volumes) != 0 {
		t.Fatalf("volumes: %+v", got.Volumes)
	}
	if extraGets != 0 {
		t.Fatalf("fetched extra tags: %d", extraGets)
	}
}

func TestListEmpty(t *testing.T) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.URL.Path == "/v2/" || r.URL.Path == "/v2":
			w.WriteHeader(http.StatusOK)
		case r.URL.Path == "/v2/test/empty/tags/list":
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(map[string]any{"name": "test/empty", "tags": []string{}})
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_CREDENTIALS", filepath.Join(t.TempDir(), "credentials.json"))
	host := strings.TrimPrefix(srv.URL, "http://")
	got, err := List(t.Context(), host+"/test/empty", Options{PlainHTTP: true})
	if err != nil {
		t.Fatal(err)
	}
	if len(got.Volumes) != 0 {
		t.Fatalf("volumes: %+v", got.Volumes)
	}
}

func TestListNamespaceFromCatalog(t *testing.T) {
	volBody := mustOCIManifest(t, volume.ArtifactType, volume.ConfigMediaType)
	volDigest := digest.FromBytes(volBody)

	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.URL.Path == "/v2/" || r.URL.Path == "/v2":
			w.WriteHeader(http.StatusOK)
		case r.URL.Path == "/v2/jessefaler/tags/list":
			w.Header().Set("Content-Type", "application/json")
			w.WriteHeader(http.StatusNotFound)
			json.NewEncoder(w).Encode(map[string]any{
				"errors": []map[string]string{{"code": "NAME_UNKNOWN", "message": "repository name not known to registry"}},
			})
		case r.URL.Path == "/v2/_catalog":
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(map[string]any{
				"repositories": []string{"jessefaler/slsmp3", "other/foo"},
			})
		case r.URL.Path == "/v2/jessefaler/slsmp3/tags/list":
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(map[string]any{"name": "jessefaler/slsmp3", "tags": []string{"latest"}})
		case r.URL.Path == "/v2/jessefaler/slsmp3/manifests/latest":
			serveManifest(w, r, volBody, volDigest)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_CREDENTIALS", filepath.Join(t.TempDir(), "credentials.json"))
	host := strings.TrimPrefix(srv.URL, "http://")
	got, err := List(t.Context(), host+"/jessefaler", Options{PlainHTTP: true})
	if err != nil {
		t.Fatal(err)
	}
	if got.Namespace != host+"/jessefaler" {
		t.Fatalf("namespace %q", got.Namespace)
	}
	if len(got.Volumes) != 1 || got.Volumes[0].Reference != host+"/jessefaler/slsmp3:latest" {
		t.Fatalf("volumes: %+v", got.Volumes)
	}
}

func TestListNamespaceFromNameInvalid(t *testing.T) {
	volBody := mustOCIManifest(t, volume.ArtifactType, volume.ConfigMediaType)
	volDigest := digest.FromBytes(volBody)

	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.URL.Path == "/v2/" || r.URL.Path == "/v2":
			w.WriteHeader(http.StatusOK)
		case r.URL.Path == "/v2/jessefaler/tags/list":
			w.Header().Set("Content-Type", "application/json")
			w.WriteHeader(http.StatusBadRequest)
			json.NewEncoder(w).Encode(map[string]any{
				"errors": []map[string]string{{"code": "NAME_INVALID", "message": "invalid repository name"}},
			})
		case r.URL.Path == "/v2/_catalog":
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(map[string]any{
				"repositories": []string{"jessefaler/slsmp3"},
			})
		case r.URL.Path == "/v2/jessefaler/slsmp3/tags/list":
			w.Header().Set("Content-Type", "application/json")
			json.NewEncoder(w).Encode(map[string]any{"name": "jessefaler/slsmp3", "tags": []string{"latest"}})
		case r.URL.Path == "/v2/jessefaler/slsmp3/manifests/latest":
			serveManifest(w, r, volBody, volDigest)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_CREDENTIALS", filepath.Join(t.TempDir(), "credentials.json"))
	host := strings.TrimPrefix(srv.URL, "http://")
	got, err := List(t.Context(), host+"/jessefaler", Options{PlainHTTP: true})
	if err != nil {
		t.Fatal(err)
	}
	if got.Namespace != host+"/jessefaler" || len(got.Volumes) != 1 {
		t.Fatalf("got %+v", got)
	}
}

func TestListRegistryCatalog(t *testing.T) {
	volBody := mustOCIManifest(t, volume.ArtifactType, volume.ConfigMediaType)
	volDigest := digest.FromBytes(volBody)

	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch {
		case r.URL.Path == "/v2/" || r.URL.Path == "/v2":
			w.WriteHeader(http.StatusOK)
		case r.URL.Path == "/v2/_catalog":
			json.NewEncoder(w).Encode(map[string]any{
				"repositories": []string{"world", "other/foo"},
			})
		case r.URL.Path == "/v2/world/tags/list":
			json.NewEncoder(w).Encode(map[string]any{"name": "world", "tags": []string{"latest"}})
		case r.URL.Path == "/v2/world/manifests/latest":
			serveManifest(w, r, volBody, volDigest)
		case r.URL.Path == "/v2/other/foo/tags/list":
			json.NewEncoder(w).Encode(map[string]any{"name": "other/foo", "tags": []string{}})
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_CREDENTIALS", filepath.Join(t.TempDir(), "credentials.json"))
	host := strings.TrimPrefix(srv.URL, "http://")
	got, err := List(t.Context(), host, Options{PlainHTTP: true})
	if err != nil {
		t.Fatal(err)
	}
	if got.Namespace != host {
		t.Fatalf("namespace %q", got.Namespace)
	}
	if len(got.Volumes) != 1 || got.Volumes[0].Reference != host+"/world:latest" {
		t.Fatalf("volumes: %+v", got.Volumes)
	}
}

func TestListTagsError(t *testing.T) {
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path == "/v2/" || r.URL.Path == "/v2" {
			w.WriteHeader(http.StatusOK)
			return
		}
		w.WriteHeader(http.StatusUnauthorized)
	}))
	t.Cleanup(srv.Close)
	t.Setenv("SLS_CREDENTIALS", filepath.Join(t.TempDir(), "credentials.json"))
	u, err := url.Parse(srv.URL)
	if err != nil {
		t.Fatal(err)
	}
	if _, err := List(t.Context(), u.Host+"/test/world", Options{PlainHTTP: true}); err == nil {
		t.Fatal("expected list error")
	}
}

func mustOCIManifest(t *testing.T, artifactType, configMT string) []byte {
	t.Helper()
	man := ocispec.Manifest{
		MediaType:    ocispec.MediaTypeImageManifest,
		ArtifactType: artifactType,
		Config: ocispec.Descriptor{
			MediaType: configMT,
			Digest:    digest.FromString("{}"),
			Size:      2,
		},
	}
	b, err := json.Marshal(man)
	if err != nil {
		t.Fatal(err)
	}
	return b
}

func serveManifest(w http.ResponseWriter, r *http.Request, body []byte, dgst digest.Digest) {
	w.Header().Set("Content-Type", ocispec.MediaTypeImageManifest)
	w.Header().Set("Docker-Content-Digest", dgst.String())
	w.Header().Set("Content-Length", strconv.Itoa(len(body)))
	if r.Method != http.MethodHead {
		w.Write(body)
	}
}
