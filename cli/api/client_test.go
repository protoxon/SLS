package api

import (
	"net"
	"path/filepath"
	"testing"
)

func TestProbeLocal(t *testing.T) {
	missing := filepath.Join(t.TempDir(), "no.sock")
	if err := ProbeLocal(missing); err == nil {
		t.Fatal("expected probe to fail")
	}

	path := filepath.Join(t.TempDir(), "ok.sock")
	lis, err := net.Listen("unix", path)
	if err != nil {
		t.Fatal(err)
	}
	t.Cleanup(func() { _ = lis.Close() })
	if err := ProbeLocal(path); err != nil {
		t.Fatal(err)
	}
}
