package cli

import (
	"fmt"
	"io"
	"os"
	"strings"
	"sync"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/apex/log/handlers/cli"
	color2 "github.com/fatih/color"
	"github.com/mattn/go-colorable"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/system"
)

var (
	Default = New(os.Stderr, true)
	bold    = color2.New(color2.Bold)
	boldred = color2.New(color2.Bold, color2.FgRed)
)

var Strings = [...]string{
	log.DebugLevel: "DEBUG",
	log.InfoLevel:  " INFO",
	log.WarnLevel:  " WARN",
	log.ErrorLevel: "ERROR",
	log.FatalLevel: "FATAL",
}

type Handler struct {
	mu      sync.Mutex
	Writer  io.Writer
	Padding int
}

// New creates a log Handler
// useColors controls whether ANSI color codes are included when writing to a file.
func New(w io.Writer, useColors bool) *Handler {
	if f, ok := w.(*os.File); ok {
		if useColors {
			return &Handler{Writer: colorable.NewColorable(f), Padding: 2}
		}
	}

	return &Handler{Writer: colorable.NewNonColorable(w), Padding: 2}
}

// HandleLog implements log.Handler.
func (h *Handler) HandleLog(e *log.Entry) error {
	color := cli.Colors[e.Level]
	level := Strings[e.Level]
	names := e.Fields.Names()

	h.mu.Lock()
	defer h.mu.Unlock()

	color.Fprintf(h.Writer, "%s: [%s] %-25s", bold.Sprintf("%*s", h.Padding+1, level), time.Now().Format(time.StampMilli), e.Message)

	for _, name := range names {
		if name == "source" {
			continue
		}
		fmt.Fprintf(h.Writer, " %s=%v", color.Sprint(name), e.Fields.Get(name))
	}

	fmt.Fprintln(h.Writer)

	for _, name := range names {
		if name != "error" {
			continue
		}

		if err, ok := e.Fields.Get("error").(error); ok {
			debug := config.Get() != nil && config.Get().Debug
			if !debug && system.IsExpected(err) {
				break
			}
			h.writeStack(err)
		}

		// Only one key with the name "error" can be in the map.
		break
	}

	return nil
}

func (h *Handler) writeStack(err error) {
	err = errors.WithStackDepthIf(err, 4)
	formatted := fmt.Sprintf("\n%s\n%+v\n\n", boldred.Sprintf("Stacktrace:"), err)

	if !strings.Contains(formatted, "runtime.goexit") {
		_, _ = fmt.Fprint(h.Writer, formatted)
		return
	}

	var b strings.Builder
	var endOfStack bool
	for _, s := range strings.Split(formatted, "\n") {
		b.WriteString(s + "\n")

		if s == "runtime.goexit" {
			endOfStack = true
			continue
		}

		if !endOfStack {
			continue
		}

		b.WriteString("\n")
		endOfStack = false
	}

	_, _ = fmt.Fprint(h.Writer, b.String())
}
