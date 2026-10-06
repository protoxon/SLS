package print

import (
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

func (s *Style) status(text string) lipgloss.Style {
	switch strings.ToLower(strings.TrimSpace(text)) {
	case "running":
		return s.running
	case "starting":
		return s.starting
	case "stopping":
		return s.stopping
	case "paused":
		return s.paused
	case "offline":
		return s.offline
	default:
		return s.plain
	}
}
