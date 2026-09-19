package progress

import (
	"fmt"
	"strings"
	"time"

	tea "github.com/charmbracelet/bubbletea"
	"github.com/charmbracelet/lipgloss"
	"github.com/opencontainers/go-digest"
	"protoxon.com/sls/daemon/oras/volume"
)

const recentWindowLimit = 5

var (
	stylePlus   = lipgloss.NewStyle().Foreground(lipgloss.Color("10")).Bold(true)
	styleArrow  = lipgloss.NewStyle().Foreground(lipgloss.Color("14"))
	styleCached = lipgloss.NewStyle().Foreground(lipgloss.Color("11"))
	styleFetch  = lipgloss.NewStyle().Foreground(lipgloss.Color("12"))
	styleDelete = lipgloss.NewStyle().Foreground(lipgloss.Color("9"))
)

type progressMsg struct {
	ev volume.ProgressEvent
}

type finishMsg struct {
	verb   string
	digest digest.Digest
}

type tickMsg time.Time

type progressVertex struct {
	key     string
	title   string
	details []string
	recent  []string
}

type progressModel struct {
	verb   string
	ref    string
	start  time.Time
	width  int
	xfer   int64
	finish string

	vertices []*progressVertex
	index    map[string]*progressVertex

	packGroup  string
	packNew    int
	packCache  int
	packGroups int
	packFiles  int
	packLive   bool
	layerCount int

	mergeGroup  string
	mergeCache  int
	mergeFetch  int
	mergeReason map[string]int
}

func newProgressModel(verb, ref string) progressModel {
	return progressModel{
		verb:        verb,
		ref:         ref,
		start:       time.Now(),
		width:       80,
		index:       map[string]*progressVertex{},
		mergeReason: map[string]int{},
	}
}

func (m progressModel) Init() tea.Cmd {
	return tickCmd()
}

func (m progressModel) Update(msg tea.Msg) (tea.Model, tea.Cmd) {
	switch msg := msg.(type) {
	case tea.WindowSizeMsg:
		if msg.Width > 0 {
			m.width = msg.Width
		}
		return m, nil
	case progressMsg:
		m.apply(msg.ev)
		return m, nil
	case finishMsg:
		m.flushPack()
		m.flushMerge()
		m.finish = fmt.Sprintf("%s %s %s  %s  %s", stylePlus.Render("[+]"), msg.verb, msg.digest, fmtBytes(m.xfer), fmtDur(time.Since(m.start)))
		return m, tea.Quit
	case tickMsg:
		if m.finish != "" {
			return m, nil
		}
		return m, tickCmd()
	}
	return m, nil
}

func tickCmd() tea.Cmd {
	return tea.Tick(100*time.Millisecond, func(t time.Time) tea.Msg {
		return tickMsg(t)
	})
}

func (m progressModel) View() string {
	var b strings.Builder
	b.WriteString(m.fit(fmt.Sprintf("%s %s %s  %s", stylePlus.Render("[+]"), m.verb, m.ref, fmtDur(time.Since(m.start)))))
	b.WriteByte('\n')
	for _, v := range m.vertices {
		b.WriteString(m.fit(fmt.Sprintf(" %s %s", styleArrow.Render("=>"), v.title)))
		b.WriteByte('\n')
		for _, d := range v.details {
			b.WriteString(m.fit(fmt.Sprintf(" %s %s", styleArrow.Render("=> =>"), d)))
			b.WriteByte('\n')
		}
		for _, line := range v.recent {
			b.WriteString(m.fit(fmt.Sprintf(" %s %s", styleArrow.Render("=> =>"), line)))
			b.WriteByte('\n')
		}
	}
	if m.finish != "" {
		b.WriteString(m.fit(m.finish))
		b.WriteByte('\n')
	}
	return b.String()
}

func (m progressModel) fit(s string) string {
	if m.width <= 0 {
		return s
	}
	return lipgloss.NewStyle().MaxWidth(m.width).Render(s)
}

func (m *progressModel) apply(ev volume.ProgressEvent) {
	switch ev.Kind {
	case volume.ProgressResolve:
		v := m.vertex("resolve", "[internal] resolve")
		if ev.Name != "" {
			v.addDetail(ev.Name)
		}
		if ev.Digest != "" {
			v.addDetail(shortDigest(ev.Digest))
		}
	case volume.ProgressPrevious:
		v := m.vertex("previous", "[internal] load previous")
		if ev.Detail == "rewrite" {
			v.addDetail("rewrite (not reusing layers)")
		} else if ev.Digest != "" {
			v.addDetail(fmt.Sprintf("%s %s", styleCached.Render("CACHED"), shortDigest(ev.Digest)))
		} else {
			v.addDetail("no previous tag")
		}
	case volume.ProgressRewriteHint:
		v := m.vertex("rewrite-hint", "[pack]")
		v.addDetail(fmt.Sprintf("%d layers (avg %s). Consider sls push --rewrite to rebuild layers.", ev.Count, fmtBytes(ev.Size)))
	case volume.ProgressWalk:
		v := m.vertex("walk", "[internal] load "+ev.Name)
		v.addDetail(fmt.Sprintf("%d files", ev.Count))
	case volume.ProgressFile:
		m.addPackFile(ev.Group, ev.Cached)
	case volume.ProgressLayer:
		m.layerCount++
		line := fmt.Sprintf("%s  %s", shortDigest(ev.Digest), fmtBytes(ev.Size))
		if ev.Cached {
			line += "  " + styleCached.Render("CACHED")
		} else {
			m.xfer += ev.Size
		}
		v := m.vertex("layers", fmt.Sprintf("[internal] export layers  %d", m.layerCount))
		v.pushRecent(line)
	case volume.ProgressConfig:
		m.flushPack()
		m.flushMerge()
		v := m.vertex("config", "[internal] load config")
		if ev.Digest != "" {
			m.xfer += ev.Size
			v.addDetail(fmt.Sprintf("%s  %s", shortDigest(ev.Digest), fmtBytes(ev.Size)))
		} else {
			v.addDetail(fmt.Sprintf("%d files, %d layers", ev.Count, ev.Total))
		}
	case volume.ProgressMount:
		v := m.vertex("mount", "[mount]")
		if ev.Name != "" {
			v.addDetail("target " + ev.Name)
		}
		if ev.Detail != "" {
			v.addDetail("mode " + ev.Detail)
		}
	case volume.ProgressTag:
		v := m.vertex("tag", "[internal] naming to "+ev.Name)
		if ev.Digest != "" {
			v.addDetail(shortDigest(ev.Digest))
		}
	case volume.ProgressRange:
		v := m.vertex("range", "[internal] range")
		switch ev.Detail {
		case volume.RangeSupported:
			v.addDetail("supported")
		case volume.RangeFallback:
			v.addDetail("not supported, fetching whole layers")
		case volume.RangeCoalesce:
			v.addDetail(fmt.Sprintf("coalesced %d parts  %s", ev.Count, fmtBytes(ev.Size)))
		}
	case volume.ProgressMerge:
		if ev.Path == "" {
			m.vertex("merge", "[merge] "+ev.Name)
			return
		}
		m.addMergeFile(ev)
	}
}

func (m *progressModel) vertex(key, title string) *progressVertex {
	if v, ok := m.index[key]; ok {
		if title != "" {
			v.title = title
		}
		return v
	}
	v := &progressVertex{key: key, title: title}
	m.index[key] = v
	m.vertices = append(m.vertices, v)
	return v
}

func (v *progressVertex) addDetail(s string) {
	v.details = append(v.details, s)
	const max = 8
	if len(v.details) > max {
		v.details = v.details[len(v.details)-max:]
	}
}

func (v *progressVertex) pushRecent(s string) {
	v.recent = append(v.recent, s)
	if len(v.recent) > recentWindowLimit {
		v.recent = v.recent[len(v.recent)-recentWindowLimit:]
	}
}

func (v *progressVertex) replaceLastRecent(s string) {
	if len(v.recent) == 0 {
		v.pushRecent(s)
		return
	}
	v.recent[len(v.recent)-1] = s
}

func (v *progressVertex) setDetail(s string) {
	if s == "" {
		v.details = nil
		return
	}
	v.details = []string{s}
}

func (m *progressModel) addPackFile(group string, cached bool) {
	if group != m.packGroup {
		m.flushPack()
		m.packGroup = group
		m.packGroups++
		m.packLive = false
	}
	if cached {
		m.packCache++
	} else {
		m.packNew++
	}
	v := m.vertex("pack", fmt.Sprintf("[pack] %d groups", m.packGroups))
	v.setDetail(fmt.Sprintf("%d files", m.packFiles+m.packCache+m.packNew))
	line := fmt.Sprintf("%s  %s", m.packSummary(), groupLabel(group))
	if m.packLive {
		v.replaceLastRecent(line)
	} else {
		v.pushRecent(line)
		m.packLive = true
	}
}

func (m *progressModel) packSummary() string {
	n := m.packCache + m.packNew
	switch {
	case m.packCache > 0 && m.packNew > 0:
		return fmt.Sprintf("%d files (%d cached, %d new)", n, m.packCache, m.packNew)
	case m.packCache > 0:
		return fmt.Sprintf("%d files %s", n, styleCached.Render("CACHED"))
	default:
		return fmt.Sprintf("%d files", n)
	}
}

func (m *progressModel) flushPack() {
	n := m.packCache + m.packNew
	if n == 0 {
		return
	}
	m.packFiles += n
	v := m.vertex("pack", fmt.Sprintf("[pack] %d groups", m.packGroups))
	v.setDetail(fmt.Sprintf("%d files", m.packFiles))
	v.replaceLastRecent(fmt.Sprintf("%s  %s", m.packSummary(), groupLabel(m.packGroup)))
	m.packCache = 0
	m.packNew = 0
	m.packLive = false
}

func (m *progressModel) addMergeFile(ev volume.ProgressEvent) {
	if ev.Group != m.mergeGroup {
		m.flushMerge()
		m.mergeGroup = ev.Group
		m.mergeReason = map[string]int{}
	}
	v := m.vertex("merge", "[merge] "+groupLabel(ev.Group))
	if ev.Detail == actionDelete {
		v.pushRecent(fmt.Sprintf("%s %s", styleDelete.Render("DELETE"), ev.Path))
		v.setDetail(m.mergeSummary())
		return
	}
	if ev.Cached {
		m.mergeCache++
		m.mergeReason[ev.Detail]++
	} else {
		m.mergeFetch++
		m.xfer += ev.Size
		v.pushRecent(fmt.Sprintf("%s %s  %s", styleFetch.Render("FETCH"), ev.Path, fmtBytes(ev.Size)))
	}
	v.setDetail(m.mergeSummary())
}

func (m *progressModel) mergeSummary() string {
	var parts []string
	if m.mergeFetch > 0 {
		parts = append(parts, fmt.Sprintf("%s %d", styleFetch.Render("FETCH"), m.mergeFetch))
	}
	if m.mergeCache > 0 {
		parts = append(parts, fmt.Sprintf("%s %d%s", styleCached.Render("CACHED"), m.mergeCache, mergeReasons(m.mergeReason)))
	}
	return strings.Join(parts, "  ")
}

func (m *progressModel) flushMerge() {
	if m.mergeCache+m.mergeFetch == 0 {
		return
	}
	v := m.vertex("merge", "[merge] "+groupLabel(m.mergeGroup))
	v.setDetail(m.mergeSummary())
	m.mergeCache = 0
	m.mergeFetch = 0
	m.mergeReason = map[string]int{}
}
