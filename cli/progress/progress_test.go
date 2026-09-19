package progress

import (
	"bytes"
	"fmt"
	"strings"
	"testing"

	"github.com/opencontainers/go-digest"
	"protoxon.com/sls/daemon/oras/volume"
)

func TestBuildPrinterPushLayout(t *testing.T) {
	var buf bytes.Buffer
	p := newBuildPrinter(&buf)
	p.Start("Pushing", "ghcr.io/example/vol:latest")
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressResolve, Name: "ghcr.io/example/vol:latest"})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressPrevious, Digest: "sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressWalk, Name: ".", Count: 3})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressFile, Group: "world", Cached: true})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressFile, Group: "world", Cached: false})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressLayer, Digest: "sha256:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb", Size: 1500})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressConfig, Digest: "sha256:cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc", Size: 120})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressRewriteHint, Count: 312, Size: 1200 << 10})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressTag, Name: "latest", Digest: "sha256:dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"})
	p.Finish("Pushed", digest.Digest("sha256:dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd"))

	got := buf.String()
	for _, want := range []string{
		"Pushing ghcr.io/example/vol:latest",
		"[internal] load previous",
		"CACHED",
		"[pack] world",
		"2 files (1 cached, 1 new)",
		"[internal] export layers",
		"312 layers (avg 1.17MB). Consider sls push --rewrite to rebuild layers.",
		"[internal] naming to latest",
		"Pushed sha256:dddddddd",
		"1.58KB",
	} {
		if !strings.Contains(got, want) {
			t.Fatalf("missing %q in:\n%s", want, got)
		}
	}
}

func TestBuildPrinterRewriteSkipsPreviousLayers(t *testing.T) {
	var buf bytes.Buffer
	p := newBuildPrinter(&buf)
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressPrevious, Detail: "rewrite"})
	if !strings.Contains(buf.String(), "rewrite (not reusing layers)") {
		t.Fatalf("got:\n%s", buf.String())
	}
}

func TestNewProgressBufferUsesPlain(t *testing.T) {
	var buf bytes.Buffer
	p := New(&buf, "auto")
	if _, ok := p.(*buildPrinter); !ok {
		t.Fatalf("auto on a buffer should be plain, got %T", p)
	}
}

func TestProgressModelCollapsesFetches(t *testing.T) {
	m := newProgressModel("Pulling", "localhost:5000/myvolume:1.0")
	m.width = 120
	m.apply(volume.ProgressEvent{Kind: volume.ProgressConfig, Count: 50, Total: 2})
	m.apply(volume.ProgressEvent{Kind: volume.ProgressMerge, Name: "."})
	for i := 0; i < 50; i++ {
		m.apply(volume.ProgressEvent{
			Kind:   volume.ProgressMerge,
			Path:   fmt.Sprintf("world/r.%d.mca", i),
			Group:  "world",
			Detail: "extract",
			Size:   1024,
		})
	}
	got := m.View()
	if strings.Count(got, "[merge] world") != 1 {
		t.Fatalf("expected one merge step:\n%s", got)
	}
	if strings.Count(got, "world/r.") != 5 {
		t.Fatalf("expected last 5 fetched files in the live frame:\n%s", got)
	}
	if strings.Contains(got, "world/r.44.mca") {
		t.Fatalf("older fetches should have scrolled out:\n%s", got)
	}
	if !strings.Contains(got, "world/r.45.mca") || !strings.Contains(got, "world/r.49.mca") {
		t.Fatalf("expected latest 5 files:\n%s", got)
	}
	if !strings.Contains(got, "50") {
		t.Fatalf("expected fetch count:\n%s", got)
	}
}

func TestProgressModelCollapsesPackAndLayers(t *testing.T) {
	m := newProgressModel("Pushing", "localhost:5000/adventures:latest")
	m.width = 120
	m.apply(volume.ProgressEvent{Kind: volume.ProgressWalk, Name: "/data/worlds", Count: 100})
	for i := 0; i < 12; i++ {
		group := fmt.Sprintf("world%d", i)
		m.apply(volume.ProgressEvent{Kind: volume.ProgressFile, Group: group})
		m.apply(volume.ProgressEvent{Kind: volume.ProgressFile, Group: group})
		m.apply(volume.ProgressEvent{
			Kind:   volume.ProgressLayer,
			Digest: fmt.Sprintf("sha256:%064d", i),
			Size:   1024,
		})
	}
	got := m.View()
	if strings.Count(got, "[pack]") != 1 {
		t.Fatalf("expected one pack step:\n%s", got)
	}
	if !strings.Contains(got, "12 groups") {
		t.Fatalf("expected pack group count:\n%s", got)
	}
	if strings.Contains(got, "world0") || strings.Contains(got, "world6") {
		t.Fatalf("older pack groups should have scrolled out:\n%s", got)
	}
	if !strings.Contains(got, "world7") || !strings.Contains(got, "world11") {
		t.Fatalf("expected latest 5 pack groups:\n%s", got)
	}
	if strings.Count(got, "[internal] export layers") != 1 {
		t.Fatalf("expected one layer step:\n%s", got)
	}
	if strings.Count(got, "sha256:") != 5 {
		t.Fatalf("expected last 5 layers:\n%s", got)
	}
}

func TestBuildPrinterPullLayout(t *testing.T) {
	var buf bytes.Buffer
	p := newBuildPrinter(&buf)
	p.Start("Pulling", "ghcr.io/example/vol:latest")
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressResolve, Name: "ghcr.io/example/vol:latest"})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressResolve, Digest: "sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressConfig, Count: 2, Total: 1})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressMount, Name: "/home/container/world", Detail: "ro"})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressRange, Detail: volume.RangeSupported})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressMerge, Name: "."})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressMerge, Path: "world/a", Group: "world", Detail: "mtime", Size: 10, Cached: true})
	p.Handle(volume.ProgressEvent{Kind: volume.ProgressMerge, Path: "world/b", Group: "world", Detail: "extract", Size: 4096, Cached: false})
	p.Finish("Pulled", digest.Digest("sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))

	got := buf.String()
	for _, want := range []string{
		"Pulling ghcr.io/example/vol:latest",
		"2 files, 1 layers",
		"[mount]",
		"target /home/container/world",
		"mode ro",
		"[internal] range",
		"supported",
		"[merge] world",
		"FETCH world/b",
		"CACHED 1 files (mtime 1)",
		"Pulled sha256:aaaaaaaa",
		"4.00KB",
	} {
		if !strings.Contains(got, want) {
			t.Fatalf("missing %q in:\n%s", want, got)
		}
	}
}
