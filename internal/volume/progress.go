package volume

// ProgressFunc receives pack/unpack status. A nil func is ignored.
type ProgressFunc func(ProgressEvent)

// ProgressEvent is one status update for a CLI-style progress printer.
type ProgressEvent struct {
	Kind   string
	Name   string
	Group  string
	Path   string
	Digest string
	Detail string
	Size   int64
	Count  int
	Total  int
	Cached bool
}

const (
	ProgressResolve     = "resolve"
	ProgressPrevious    = "previous"
	ProgressWalk        = "walk"
	ProgressFile        = "file"
	ProgressLayer       = "layer"
	ProgressConfig      = "config"
	ProgressTag         = "tag"
	ProgressMerge       = "merge"
	ProgressRange       = "range"
	ProgressMount       = "mount"
	ProgressRewriteHint = "rewrite-hint"

	RangeSupported = "supported"
	RangeFallback  = "fallback"
	RangeCoalesce  = "coalesce"
)

func (fn ProgressFunc) Emit(ev ProgressEvent) {
	if fn != nil {
		fn(ev)
	}
}
