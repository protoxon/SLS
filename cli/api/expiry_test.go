package api

import (
	"testing"
	"time"
)

func TestParseExpiresIn(t *testing.T) {
	d, err := ParseExpiresIn("30d")
	if err != nil || d != 30*24*time.Hour {
		t.Fatalf("%s %v", d, err)
	}
	if _, err := ParseExpiresIn(""); err == nil {
		t.Fatal("empty should fail")
	}
}
