// Package logcomponent names which process side emitted a log line.
// sls run stamps lines with these names. Standalone controller and
// daemon processes leave them unset, so their output stays unchanged.
package logcomponent

import (
	"io"
	"runtime"
	"strings"

	"github.com/fatih/color"
)

const (
	Controller = "controller"
	Daemon     = "daemon"
	Run        = "run"
)

// labelWidth is the padded width of "[controller] ", including the space
// before the message, so "[daemon]" lines up with it.
const labelWidth = len("[controller]") + 1

var (
	controllerColor = color.New(color.FgCyan)
	daemonColor     = color.New(color.FgMagenta)
	runColor        = color.New(color.FgGreen)
)

// WriteLabel writes an aligned "[controller]" / "[daemon]" / "[run]" tag.
// Padding spaces stay outside the color so the message column lines up.
func WriteLabel(w io.Writer, component string, useColor bool) {
	if component == "" {
		return
	}
	text := "[" + component + "]"
	if useColor {
		colorFor(component).Fprint(w, text)
	} else {
		_, _ = io.WriteString(w, text)
	}
	if n := labelWidth - len(text); n > 0 {
		_, _ = io.WriteString(w, strings.Repeat(" ", n))
	}
}

func colorFor(component string) *color.Color {
	switch component {
	case Controller:
		return controllerColor
	case Daemon:
		return daemonColor
	default:
		return runColor
	}
}

// FromCaller reports the closest controller, daemon, or run frame on the
// stack. The splitter's own frames are skipped, and frames in a shared
// package are walked past, so the line is named for the side that logged it.
func FromCaller() string {
	var pcs [64]uintptr
	n := runtime.Callers(1, pcs[:])
	frames := runtime.CallersFrames(pcs[:n])
	for {
		frame, more := frames.Next()
		if !skipFrame(frame.Function) {
			if component := componentOf(frame.Function); component != "" {
				return component
			}
		}
		if !more {
			return ""
		}
	}
}

// Relay returns FromCaller. Tests use it to prove a neutral frame is skipped
// and the caller above it is what gets named.
func Relay() string {
	return FromCaller()
}

func skipFrame(fn string) bool {
	// The splitter sits under protoxon.com/sls/run, so its own frames would
	// otherwise be labeled as run. The caller's frame is above these.
	return strings.Contains(fn, "protoxon.com/sls/run/logsplit.stamp") ||
		strings.Contains(fn, "protoxon.com/sls/run/logsplit.(*Handler).HandleLog")
}

func componentOf(fn string) string {
	switch {
	case strings.Contains(fn, "protoxon.com/sls/controller"):
		return Controller
	case strings.Contains(fn, "protoxon.com/sls/daemon"):
		return Daemon
	case strings.Contains(fn, "protoxon.com/sls/run"):
		return Run
	default:
		return ""
	}
}
