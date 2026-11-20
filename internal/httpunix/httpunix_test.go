package httpunix

import (
	"net/http"
	"os"
	"path/filepath"
	"testing"
	"time"
)

func TestListenAndRoundTrip(t *testing.T) {
	path := filepath.Join(t.TempDir(), "sls", "peer.sock")
	lis, err := Listen(path)
	if err != nil {
		t.Fatal(err)
	}
	st, err := os.Stat(path)
	if err != nil {
		t.Fatal(err)
	}
	if st.Mode().Perm() != 0o600 {
		t.Fatalf("perm %o", st.Mode().Perm())
	}

	srv := &http.Server{
		Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			if r.URL.Path != "/ok" || (r.Host != "127.0.0.1:5620" && r.Host != "controller.sls.net:5620") {
				http.NotFound(w, r)
				return
			}
			w.WriteHeader(http.StatusNoContent)
		}),
	}
	go func() { _ = srv.Serve(lis) }()
	t.Cleanup(func() { _ = srv.Close() })

	resp, err := Client(path, time.Second).Get("http://127.0.0.1:5620/ok")
	if err != nil {
		t.Fatal(err)
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusNoContent {
		t.Fatalf("status %d", resp.StatusCode)
	}

	httpsResp, err := Client(path, time.Second).Get("https://controller.sls.net:5620/ok")
	if err != nil {
		t.Fatal(err)
	}
	defer httpsResp.Body.Close()
	if httpsResp.StatusCode != http.StatusNoContent {
		t.Fatalf("https status %d", httpsResp.StatusCode)
	}

	if err := lis.Close(); err != nil && !isClosed(err) {
		t.Fatal(err)
	}
	lis, err = Listen(path)
	if err != nil {
		t.Fatal(err)
	}
	t.Cleanup(func() { _ = lis.Close() })
	st, err = os.Stat(path)
	if err != nil {
		t.Fatal(err)
	}
	if st.Mode().Perm() != 0o600 {
		t.Fatalf("replaced perm %o", st.Mode().Perm())
	}
}

func isClosed(err error) bool {
	return err != nil && (err.Error() == "use of closed network connection" || os.IsTimeout(err))
}
