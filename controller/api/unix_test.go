package api

import (
	"os"
	"path/filepath"
	"testing"
)

func TestListenUnixCreatesSocket(t *testing.T) {
	dir := t.TempDir()
	path := filepath.Join(dir, "sls", "sls.sock")
	lis, err := listenUnix(path)
	if err != nil {
		t.Fatal(err)
	}
	t.Cleanup(func() { _ = lis.Close() })
	st, err := os.Stat(path)
	if err != nil {
		t.Fatal(err)
	}
	if st.Mode().Perm() != 0o600 {
		t.Fatalf("perm %o", st.Mode().Perm())
	}
}
