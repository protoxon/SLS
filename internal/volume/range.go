package volume

import (
	"context"
	"fmt"
	"io"
	"net/http"
	"sort"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"oras.land/oras-go/v2/content"
	"oras.land/oras-go/v2/registry/remote"
)

// RangeFetcher fetches a byte range of a blob. A non-nil error means the
// caller should download the whole layer instead.
type RangeFetcher interface {
	FetchRange(ctx context.Context, desc ocispec.Descriptor, offset, size int64) ([]byte, error)
}

type remoteRanger struct {
	repo *remote.Repository
}

func newRemoteRanger(repo *remote.Repository) *remoteRanger {
	return &remoteRanger{repo: repo}
}

func rangerFor(src content.Fetcher) RangeFetcher {
	if r, ok := src.(RangeFetcher); ok {
		return r
	}
	if repo, ok := src.(*remote.Repository); ok {
		return newRemoteRanger(repo)
	}
	return nil
}

func (r *remoteRanger) FetchRange(ctx context.Context, desc ocispec.Descriptor, offset, size int64) ([]byte, error) {
	if size <= 0 {
		return nil, errors.New("invalid range size")
	}
	scheme := "https"
	if r.repo.PlainHTTP {
		scheme = "http"
	}
	u := fmt.Sprintf("%s://%s/v2/%s/blobs/%s", scheme, r.repo.Reference.Host(), r.repo.Reference.Repository, desc.Digest)

	req, err := http.NewRequestWithContext(ctx, http.MethodGet, u, nil)
	if err != nil {
		return nil, err
	}
	req.Header.Set("Range", fmt.Sprintf("bytes=%d-%d", offset, offset+size-1))

	client := r.repo.Client
	if client == nil {
		client = http.DefaultClient
	}
	resp, err := client.Do(req)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()

	switch resp.StatusCode {
	case http.StatusPartialContent:
		b, err := io.ReadAll(io.LimitReader(resp.Body, size+1))
		if err != nil {
			return nil, errors.Wrap(err, "failed to read range body")
		}
		if int64(len(b)) != size {
			return nil, errors.Errorf("range length %d != %d", len(b), size)
		}
		return b, nil
	case http.StatusOK:
		return nil, errNoRange
	default:
		_, _ = io.Copy(io.Discard, resp.Body)
		return nil, errors.Errorf("range request: unexpected status %s", resp.Status)
	}
}

var errNoRange = errors.New("range requests not supported")

type layerSpan struct {
	offset int64
	size   int64
	data   []byte
}

type mergedSpan struct {
	offset int64
	size   int64
	parts  int
}

type layerPuller struct {
	fetcher         content.Fetcher
	ranger          RangeFetcher
	progress        ProgressFunc
	cache           map[string][]byte
	spans           map[string][]layerSpan
	noRange         map[string]bool
	pending         map[string][]Part
	remaining       map[string]int
	ready           map[string]bool
	loggedSupported bool
	loggedFallback  bool
	stats           *UnpackStats
}

func newLayerPuller(src content.Fetcher, progress ProgressFunc, stats *UnpackStats) *layerPuller {
	return &layerPuller{
		fetcher:   src,
		ranger:    rangerFor(src),
		progress:  progress,
		cache:     map[string][]byte{},
		spans:     map[string][]layerSpan{},
		noRange:   map[string]bool{},
		pending:   map[string][]Part{},
		remaining: map[string]int{},
		ready:     map[string]bool{},
		stats:     stats,
	}
}

func (p *layerPuller) plan(files []File) {
	p.pending = map[string][]Part{}
	p.remaining = map[string]int{}
	p.ready = map[string]bool{}
	for _, file := range files {
		for _, part := range file.Parts {
			key := part.Layer.String()
			p.pending[key] = append(p.pending[key], part)
			p.remaining[key]++
		}
	}
}

func (p *layerPuller) ensureLayer(ctx context.Context, layer ocispec.Descriptor) error {
	key := layer.Digest.String()
	if p.ready[key] || len(p.cache[key]) > 0 || len(p.spans[key]) > 0 {
		return nil
	}
	parts := p.pending[key]
	if len(parts) == 0 {
		return nil
	}
	for _, span := range mergeLayerSpans(parts) {
		if _, ok := p.fromSpan(key, span.offset, span.size); ok {
			continue
		}
		data, err := p.fetchSpan(ctx, layer, span)
		if err != nil {
			return err
		}
		p.spans[key] = append(p.spans[key], layerSpan{offset: span.offset, size: span.size, data: data})
		if span.parts > 1 {
			p.progress.Emit(ProgressEvent{
				Kind:   ProgressRange,
				Detail: RangeCoalesce,
				Digest: key,
				Count:  span.parts,
				Size:   span.size,
			})
		}
	}
	p.ready[key] = true
	return nil
}

func (p *layerPuller) donePart(layer digest.Digest) {
	key := layer.String()
	p.remaining[key]--
	if p.remaining[key] > 0 {
		return
	}
	delete(p.cache, key)
	delete(p.spans, key)
	delete(p.pending, key)
	delete(p.ready, key)
	delete(p.remaining, key)
}

func (p *layerPuller) cachedLayerCount() int {
	seen := map[string]struct{}{}
	for key, spans := range p.spans {
		if len(spans) > 0 {
			seen[key] = struct{}{}
		}
	}
	for key, b := range p.cache {
		if len(b) > 0 {
			seen[key] = struct{}{}
		}
	}
	return len(seen)
}

func (p *layerPuller) reportRange(supported bool) {
	if supported {
		if p.loggedSupported {
			return
		}
		p.loggedSupported = true
		p.progress.Emit(ProgressEvent{Kind: ProgressRange, Detail: RangeSupported})
		return
	}
	if p.loggedFallback {
		return
	}
	p.loggedFallback = true
	p.progress.Emit(ProgressEvent{Kind: ProgressRange, Detail: RangeFallback})
}

func mergeLayerSpans(parts []Part) []mergedSpan {
	if len(parts) == 0 {
		return nil
	}
	sorted := append([]Part(nil), parts...)
	sort.Slice(sorted, func(i, j int) bool {
		if sorted[i].Offset != sorted[j].Offset {
			return sorted[i].Offset < sorted[j].Offset
		}
		return sorted[i].Size < sorted[j].Size
	})
	out := []mergedSpan{{offset: sorted[0].Offset, size: sorted[0].Size, parts: 1}}
	for _, part := range sorted[1:] {
		cur := &out[len(out)-1]
		end := cur.offset + cur.size
		if part.Offset > end {
			out = append(out, mergedSpan{offset: part.Offset, size: part.Size, parts: 1})
			continue
		}
		if part.Offset+part.Size > end {
			cur.size = part.Offset + part.Size - cur.offset
		}
		cur.parts++
	}
	return out
}

func (p *layerPuller) fetchSpan(ctx context.Context, desc ocispec.Descriptor, span mergedSpan) ([]byte, error) {
	if span.offset == 0 && desc.Size > 0 && span.size == desc.Size {
		return p.layerBytes(ctx, desc)
	}
	key := desc.Digest.String()
	if p.ranger != nil && !p.noRange[key] {
		b, err := p.ranger.FetchRange(ctx, desc, span.offset, span.size)
		if err == nil {
			p.reportRange(true)
			p.stats.add(int64(len(b)))
			return b, nil
		}
		p.noRange[key] = true
		p.reportRange(false)
	}
	raw, err := p.layerBytes(ctx, desc)
	if err != nil {
		return nil, err
	}
	end := span.offset + span.size
	if span.offset < 0 || end > int64(len(raw)) {
		return nil, errors.Errorf("span [%d,%d) outside layer size %d", span.offset, end, len(raw))
	}
	return raw[span.offset:end], nil
}

func (p *layerPuller) fromSpan(key string, offset, size int64) ([]byte, bool) {
	for _, s := range p.spans[key] {
		if offset >= s.offset && offset+size <= s.offset+s.size {
			rel := offset - s.offset
			return s.data[rel : rel+size], true
		}
	}
	return nil, false
}

func (p *layerPuller) part(ctx context.Context, layer ocispec.Descriptor, offset, size int64) ([]byte, error) {
	if err := p.ensureLayer(ctx, layer); err != nil {
		return nil, err
	}
	key := layer.Digest.String()
	if b, ok := p.fromSpan(key, offset, size); ok {
		return b, nil
	}
	if raw, ok := p.cache[key]; ok {
		end := offset + size
		if offset < 0 || end > int64(len(raw)) {
			return nil, errors.Errorf("part [%d,%d) outside layer size %d", offset, end, len(raw))
		}
		return raw[offset:end], nil
	}
	if p.ranger != nil && !p.noRange[key] {
		b, err := p.ranger.FetchRange(ctx, layer, offset, size)
		if err == nil {
			p.reportRange(true)
			p.stats.add(int64(len(b)))
			return b, nil
		}
		p.noRange[key] = true
		p.reportRange(false)
	}
	raw, err := p.layerBytes(ctx, layer)
	if err != nil {
		return nil, err
	}
	end := offset + size
	if offset < 0 || end > int64(len(raw)) {
		return nil, errors.Errorf("part [%d,%d) outside layer size %d", offset, end, len(raw))
	}
	return raw[offset:end], nil
}

func (p *layerPuller) layerBytes(ctx context.Context, layer ocispec.Descriptor) ([]byte, error) {
	key := layer.Digest.String()
	if b, ok := p.cache[key]; ok {
		return b, nil
	}
	b, err := content.FetchAll(ctx, p.fetcher, layer)
	if err != nil {
		return nil, errors.Wrap(err, "failed to fetch layer")
	}
	p.stats.add(int64(len(b)))
	p.cache[key] = b
	return b, nil
}
