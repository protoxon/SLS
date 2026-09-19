package progress

import (
	"io"
	"os"
	"sync"

	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/x/term"
	"github.com/opencontainers/go-digest"
	"protoxon.com/sls/daemon/oras/volume"
)

type charmPrinter struct {
	w    io.Writer
	mu   sync.Mutex
	prog *tea.Program
	done chan struct{}
}

func newCharmPrinter(w io.Writer) *charmPrinter {
	return &charmPrinter{w: w}
}

func (p *charmPrinter) Start(verb, ref string) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.done = make(chan struct{})
	m := newProgressModel(verb, ref)
	if f, ok := p.w.(*os.File); ok && term.IsTerminal(f.Fd()) {
		if width, _, err := term.GetSize(f.Fd()); err == nil && width > 0 {
			m.width = width
		}
	}
	p.prog = tea.NewProgram(
		m,
		tea.WithOutput(p.w),
		tea.WithInput(nil),
	)
	go func() {
		_, _ = p.prog.Run()
		close(p.done)
	}()
}

func (p *charmPrinter) Handle(ev volume.ProgressEvent) {
	p.mu.Lock()
	prog := p.prog
	p.mu.Unlock()
	if prog == nil {
		return
	}
	prog.Send(progressMsg{ev: ev})
}

func (p *charmPrinter) Finish(verb string, d digest.Digest) {
	p.mu.Lock()
	prog := p.prog
	p.mu.Unlock()
	if prog == nil {
		return
	}
	prog.Send(finishMsg{verb: verb, digest: d})
	<-p.done
	p.mu.Lock()
	p.prog = nil
	p.mu.Unlock()
}

func (p *charmPrinter) Close() {
	p.mu.Lock()
	prog := p.prog
	p.prog = nil
	p.mu.Unlock()
	if prog == nil {
		return
	}
	prog.Quit()
	<-p.done
}
