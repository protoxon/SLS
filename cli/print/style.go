package print

import (
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/charmbracelet/lipgloss"
	"github.com/mattn/go-isatty"
	"github.com/muesli/termenv"
)

// Style is the color set for human-readable output.
type Style struct {
	header   lipgloss.Style
	key      lipgloss.Style
	plain    lipgloss.Style
	running  lipgloss.Style
	starting lipgloss.Style
	stopping lipgloss.Style
	paused   lipgloss.Style
	offline  lipgloss.Style
	failed   lipgloss.Style
}

func newStyle(w io.Writer) *Style {
	r := lipgloss.NewRenderer(w)
	if !colorEnabled(w) {
		r.SetColorProfile(termenv.Ascii)
	}
	base := r.NewStyle()
	return &Style{
		header:   base.Bold(true),
		key:      base.Bold(true),
		plain:    base,
		running:  base.Foreground(lipgloss.Color("2")),
		starting: base.Foreground(lipgloss.Color("3")),
		stopping: base.Foreground(lipgloss.Color("3")),
		paused:   base.Foreground(lipgloss.Color("6")),
		offline:  base.Faint(true),
		failed:   base.Foreground(lipgloss.Color("1")),
	}
}

func colorEnabled(w io.Writer) bool {
	if _, ok := os.LookupEnv("NO_COLOR"); ok {
		return false
	}
	f, ok := w.(*os.File)
	return ok && isatty.IsTerminal(f.Fd())
}

// PaintKey renders a field name.
func (s *Style) PaintKey(text string) string {
	return s.key.Render(text)
}

// PaintStatus colors text by server state.
func (s *Style) PaintStatus(text string) string {
	return s.status(text).Render(text)
}

// SwitchMessage is the line printed after the current profile changes.
// The profile name and the command that switches back are colored on a terminal.
func SwitchMessage(w io.Writer, name, previous string) string {
	back := "sls profile " + previous
	if !colorEnabled(w) {
		return fmt.Sprintf("Switched to profile %s. Use %s to switch back.", name, back)
	}
	r := lipgloss.NewRenderer(w)
	profile := r.NewStyle().Foreground(lipgloss.Color("2")).Bold(true).Render(name)
	command := r.NewStyle().Foreground(lipgloss.Color("6")).Bold(true).Render(back)
	return fmt.Sprintf("Switched to profile %s. Use %s to switch back.", profile, command)
}

func (s *Style) status(text string) lipgloss.Style {
	switch strings.ToLower(strings.TrimSpace(text)) {
	case "running", "ready":
		return s.running
	case "starting", "creating", "copying", "packing", "pushing":
		return s.starting
	case "stopping", "deleting":
		return s.stopping
	case "paused":
		return s.paused
	case "offline":
		return s.offline
	case "failed":
		return s.failed
	default:
		return s.plain
	}
}
