package cmd

import (
	"bytes"
	"runtime"
	"strings"
	"testing"

	"protoxon.com/sls/internal/version"
)

func TestVersionPrintsVersionAndAuthors(t *testing.T) {
	prevCommit, prevDate := version.GitCommit, version.BuildDate
	t.Cleanup(func() {
		version.GitCommit = prevCommit
		version.BuildDate = prevDate
	})
	version.GitCommit = "a5c7197"
	version.BuildDate = "2026-02-02T17:17:42Z"

	cmd := newVersionCommand()
	var out bytes.Buffer
	cmd.SetOut(&out)
	cmd.SetErr(&out)
	if err := cmd.Execute(); err != nil {
		t.Fatal(err)
	}
	got := out.String()
	for _, want := range []string{
		version.Version,
		version.Authors,
		" Go version:        " + runtime.Version(),
		" Git commit:        a5c7197",
		" Built:             Mon Feb  2 17:17:42 2026",
		" OS/Arch:           " + runtime.GOOS + "/" + runtime.GOARCH,
	} {
		if !strings.Contains(got, want) {
			t.Fatalf("output %q does not contain %q", got, want)
		}
	}
}
