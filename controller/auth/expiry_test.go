package auth

import (
	"testing"
	"time"
)

func TestParseExpiresIn(t *testing.T) {
	d, err := ParseExpiresIn("7d")
	if err != nil {
		t.Fatal(err)
	}
	if d != 7*24*time.Hour {
		t.Fatalf("got %s", d)
	}
	d, err = ParseExpiresIn("24h")
	if err != nil || d != 24*time.Hour {
		t.Fatalf("%s %v", d, err)
	}
	if _, err := ParseExpiresIn("never"); err == nil {
		t.Fatal("never should be empty")
	}
	if _, err := ParseExpiresIn("-1h"); err == nil {
		t.Fatal("negative should fail")
	}
}
