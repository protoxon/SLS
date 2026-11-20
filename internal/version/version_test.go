package version

import "testing"

func TestBuiltFormatsCommitTime(t *testing.T) {
	prev := BuildDate
	t.Cleanup(func() { BuildDate = prev })

	BuildDate = "2026-02-02T17:17:42Z"
	if got := Built(); got != "Mon Feb  2 17:17:42 2026" {
		t.Fatalf("Built() = %q", got)
	}

	BuildDate = ""
	if got := Built(); got != "unknown" {
		t.Fatalf("empty Built() = %q", got)
	}
}
