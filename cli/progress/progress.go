package progress

import (
	"fmt"
	"io"
	"os"
	"strings"
	"time"

	"github.com/fatih/color"
	"github.com/mattn/go-isatty"
	"github.com/opencontainers/go-digest"
	"protoxon.com/sls/daemon/oras/volume"
)

// Renderer prints pack/unpack progress to a writer.
type Renderer interface {
	Start(verb, ref string)
	Handle(ev volume.ProgressEvent)
	Finish(verb string, d digest.Digest)
	Close()
}

// New returns a TTY or plain progress renderer. mode is auto, tty, or plain.
func New(w io.Writer, mode string) Renderer {
	mode = strings.ToLower(strings.TrimSpace(mode))
	if mode == "" {
		mode = "auto"
	}
	switch mode {
	case "plain":
		return newBuildPrinter(w)
	case "tty":
		return newCharmPrinter(w)
	default:
		if f, ok := w.(*os.File); ok && isatty.IsTerminal(f.Fd()) {
			return newCharmPrinter(w)
		}
		return newBuildPrinter(w)
	}
}

type buildPrinter struct {
	w     io.Writer
	start time.Time

	packGroup string
	packNew   int
	packCache int

	mergeGroup   string
	mergeCache   int
	mergeFetch   int
	mergeReason  map[string]int
	startedMerge bool
	startedPack  bool
	startedLayer bool
	xferBytes    int64
}

func newBuildPrinter(w io.Writer) *buildPrinter {
	return &buildPrinter{
		w:           w,
		start:       time.Now(),
		mergeReason: map[string]int{},
	}
}

func (p *buildPrinter) Start(verb, ref string) {
	fmt.Fprintf(p.w, "%s %s %s\n", plus(), verb, ref)
}

func (p *buildPrinter) Handle(ev volume.ProgressEvent) {
	switch ev.Kind {
	case volume.ProgressResolve:
		if ev.Digest != "" && ev.Name == "" {
			p.detail(shortDigest(ev.Digest))
			return
		}
		p.step("[internal] resolve")
		if ev.Name != "" {
			p.detail(ev.Name)
		}
		if ev.Digest != "" {
			p.detail(shortDigest(ev.Digest))
		}
	case volume.ProgressPrevious:
		p.step("[internal] load previous")
		if ev.Detail == "rewrite" {
			p.detail("rewrite (not reusing layers)")
		} else if ev.Digest != "" {
			p.detail(fmt.Sprintf("%s %s", cachedTag(), shortDigest(ev.Digest)))
		} else {
			p.detail("no previous tag")
		}
	case volume.ProgressRewriteHint:
		p.step("[pack]")
		p.detail(fmt.Sprintf("%d layers (avg %s). Consider sls push --rewrite to rebuild layers.", ev.Count, fmtBytes(ev.Size)))
	case volume.ProgressWalk:
		p.step("[internal] load " + ev.Name)
		p.detail(fmt.Sprintf("%d files", ev.Count))
	case volume.ProgressFile:
		p.addPackFile(ev.Group, ev.Cached)
	case volume.ProgressLayer:
		p.flushPackGroup()
		if !p.startedLayer {
			p.step("[internal] export layers")
			p.startedLayer = true
		}
		line := fmt.Sprintf("%s  %s", shortDigest(ev.Digest), fmtBytes(ev.Size))
		if ev.Cached {
			line += "  " + cachedTag()
		} else {
			p.xferBytes += ev.Size
		}
		p.detail(line)
	case volume.ProgressConfig:
		p.flushPackGroup()
		p.flushMergeGroup()
		p.step("[internal] load config")
		if ev.Digest != "" {
			p.xferBytes += ev.Size
			p.detail(fmt.Sprintf("%s  %s", shortDigest(ev.Digest), fmtBytes(ev.Size)))
			return
		}
		p.detail(fmt.Sprintf("%d files, %d layers", ev.Count, ev.Total))
	case volume.ProgressMount:
		p.step("[mount]")
		if ev.Name != "" {
			p.detail("target " + ev.Name)
		}
		if ev.Detail != "" {
			p.detail("mode " + ev.Detail)
		}
	case volume.ProgressTag:
		p.step("[internal] naming to " + ev.Name)
		if ev.Digest != "" {
			p.detail(shortDigest(ev.Digest))
		}
	case volume.ProgressRange:
		switch ev.Detail {
		case volume.RangeSupported:
			p.step("[internal] range")
			p.detail("supported")
		case volume.RangeFallback:
			p.step("[internal] range")
			p.detail("not supported, fetching whole layers")
		case volume.RangeCoalesce:
			p.detail(fmt.Sprintf("coalesced %d parts  %s", ev.Count, fmtBytes(ev.Size)))
		}
	case volume.ProgressMerge:
		if ev.Path == "" {
			p.step("[merge] " + ev.Name)
			p.startedMerge = true
			return
		}
		p.addMergeFile(ev)
	}
}

func (p *buildPrinter) Finish(verb string, d digest.Digest) {
	p.flushPackGroup()
	p.flushMergeGroup()
	fmt.Fprintf(p.w, "%s %s %s  %s  %s\n", plus(), verb, d, fmtBytes(p.xferBytes), fmtDur(time.Since(p.start)))
}

func (p *buildPrinter) Close() {}

func (p *buildPrinter) addPackFile(group string, cached bool) {
	if !p.startedPack || group != p.packGroup {
		p.flushPackGroup()
		name := groupLabel(group)
		p.step("[pack] " + name)
		p.startedPack = true
		p.packGroup = group
	}
	if cached {
		p.packCache++
	} else {
		p.packNew++
	}
}

func (p *buildPrinter) flushPackGroup() {
	n := p.packCache + p.packNew
	if n == 0 {
		return
	}
	switch {
	case p.packCache > 0 && p.packNew > 0:
		p.detail(fmt.Sprintf("%d files (%d cached, %d new)", n, p.packCache, p.packNew))
	case p.packCache > 0:
		p.detail(fmt.Sprintf("%d files %s", n, cachedTag()))
	default:
		p.detail(fmt.Sprintf("%d files", n))
	}
	p.packCache = 0
	p.packNew = 0
}

func (p *buildPrinter) addMergeFile(ev volume.ProgressEvent) {
	if !p.startedMerge {
		p.step("[merge]")
		p.startedMerge = true
	}
	if ev.Group != p.mergeGroup && (p.mergeCache+p.mergeFetch) > 0 {
		p.flushMergeGroup()
	}
	if ev.Group != p.mergeGroup {
		p.mergeGroup = ev.Group
		p.step("[merge] " + groupLabel(ev.Group))
	}
	if ev.Detail == actionDelete {
		p.detail(fmt.Sprintf("DELETE %s", ev.Path))
		return
	}
	if ev.Cached {
		p.mergeCache++
		p.mergeReason[ev.Detail]++
		return
	}
	p.mergeFetch++
	p.xferBytes += ev.Size
	p.detail(fmt.Sprintf("%s %s  %s", fetchTag(), ev.Path, fmtBytes(ev.Size)))
}

func (p *buildPrinter) flushMergeGroup() {
	if p.mergeCache == 0 && p.mergeFetch == 0 {
		return
	}
	if p.mergeCache > 0 {
		p.detail(fmt.Sprintf("%s %d files%s", cachedTag(), p.mergeCache, mergeReasons(p.mergeReason)))
	}
	p.mergeCache = 0
	p.mergeFetch = 0
	p.mergeReason = map[string]int{}
}

func (p *buildPrinter) step(name string) {
	fmt.Fprintf(p.w, " %s %s\n", arrow(), name)
}

func (p *buildPrinter) detail(msg string) {
	fmt.Fprintf(p.w, " %s %s\n", nested(), msg)
}

func plus() string {
	return color.New(color.FgGreen, color.Bold).Sprint("[+]")
}

func arrow() string {
	return color.New(color.FgCyan).Sprint("=>")
}

func nested() string {
	return color.New(color.FgCyan).Sprint("=> =>")
}

func cachedTag() string {
	return color.New(color.FgYellow).Sprint("CACHED")
}

func fetchTag() string {
	return color.New(color.FgBlue).Sprint("FETCH")
}

func groupLabel(group string) string {
	if group == "" {
		return "."
	}
	return group
}

func mergeReasons(reasons map[string]int) string {
	var parts []string
	for _, key := range []string{actionMtime, actionHash, actionSidecar} {
		if n := reasons[key]; n > 0 {
			parts = append(parts, fmt.Sprintf("%s %d", key, n))
		}
	}
	if len(parts) == 0 {
		return ""
	}
	return " (" + strings.Join(parts, ", ") + ")"
}

const (
	actionMtime   = "mtime"
	actionHash    = "hash"
	actionSidecar = "sidecar"
	actionDelete  = "delete"
)

func shortDigest(d string) string {
	if strings.HasPrefix(d, "sha256:") && len(d) >= 19 {
		return d[:19]
	}
	return d
}

func fmtBytes(n int64) string {
	const unit = 1024
	if n < unit {
		return fmt.Sprintf("%dB", n)
	}
	div, exp := int64(unit), 0
	for n/div >= unit && exp < 3 {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.2f%cB", float64(n)/float64(div), "KMGT"[exp])
}

func fmtDur(d time.Duration) string {
	if d < time.Minute {
		return fmt.Sprintf("%.1fs", d.Seconds())
	}
	min := int(d.Minutes())
	return fmt.Sprintf("%dm%.0fs", min, d.Seconds()-float64(min*60))
}
