package version

import (
	"fmt"
	"io"
	"runtime"
	"time"
)

var (
	Version   = "0.2.1"
	Authors   = "Jesse Faler & Contributors"
	GitCommit = "unknown"
	// BuildDate is the commit time in UTC, RFC3339
	BuildDate = ""
)

// GoVersion is the Go toolchain that compiled this binary.
func GoVersion() string {
	return runtime.Version()
}

// OSArch is the operating system and architecture of this binary.
func OSArch() string {
	return runtime.GOOS + "/" + runtime.GOARCH
}

// Fprint writes the version block used by sls.
func Fprint(w io.Writer) error {
	if _, err := fmt.Fprintf(w, "SLS v%s\nCopyright © 2025 - %d %s\n", Version, time.Now().Year(), Authors); err != nil {
		return err
	}
	for _, line := range [][2]string{
		{"Go version:", GoVersion()},
		{"Git commit:", GitCommit},
		{"Built:", Built()},
		{"OS/Arch:", OSArch()},
	} {
		if _, err := fmt.Fprintf(w, " %-19s%s\n", line[0], line[1]); err != nil {
			return err
		}
	}
	return nil
}

// Built is the commit time formatted for display. An unstamped or unparseable
// value is returned unchanged, and an empty value is "unknown".
func Built() string {
	if BuildDate == "" {
		return "unknown"
	}
	t, err := time.Parse(time.RFC3339, BuildDate)
	if err != nil {
		return BuildDate
	}
	return t.UTC().Format(time.ANSIC)
}
