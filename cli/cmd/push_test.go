package cmd

import "testing"

func TestNormalizePushMode(t *testing.T) {
	ok, err := normalizePushMode(" RO ")
	if err != nil || ok != "ro" {
		t.Fatalf("got %q %v", ok, err)
	}
	if _, err := normalizePushMode("rw"); err == nil {
		t.Fatal("expected rw to be rejected on artifacts")
	}
	if _, err := normalizePushMode("bind"); err == nil {
		t.Fatal("expected invalid mode")
	}
	if got, err := normalizePushMode(""); err != nil || got != "" {
		t.Fatalf("empty mode: %q %v", got, err)
	}
}
