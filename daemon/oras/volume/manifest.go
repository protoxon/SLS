package volume

import (
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/oras/volume/compress"
)

const (
	ArtifactType    = "application/vnd.sls.volume.v1"
	ConfigMediaType = "application/vnd.sls.volume.config.v1+json"
	LayerMediaType  = "application/vnd.sls.volume.layer.v1"

	PackFormat    = "files"
	SchemaVersion = 1

	DefaultLayerMaxBytes    int64 = 400 << 20
	DefaultLayerMaxFiles          = 1024
	DefaultRegistryMaxBytes int64 = 1 << 30

	DefaultChunkMin = 16 << 20
	DefaultChunkAvg = 64 << 20
	DefaultChunkMax = 400 << 20

	// Incremental packs that keep old layers plus many tiny new ones.
	// Warn when there are enough layers and the average is far below the cap.
	fragmentMinLayers     = 16
	fragmentAvgMaxDivisor = 10
)

// Manifest is the SLS volume config blob. It lists every regular file and
// where its compressed parts live in OCI layers.
type Manifest struct {
	SchemaVersion    int            `json:"schemaVersion"`
	MediaType        string         `json:"mediaType"`
	Format           string         `json:"format"`
	Compression      string         `json:"compression"`
	LayerMaxBytes    int64          `json:"layerMaxBytes"`
	LayerMaxFiles    int            `json:"layerMaxFiles"`
	RegistryMaxBytes int64          `json:"registryMaxBytes"`
	Chunking         ChunkingConfig `json:"chunking"`
	Files            []File         `json:"files"`
	Layers           []LayerInfo    `json:"layers,omitempty"`
	MountInfo        MountInfo      `json:"mountInfo"`
}

// File is one regular file in the volume.
type File struct {
	Path   string        `json:"path"`
	Digest digest.Digest `json:"digest"`
	Size   int64         `json:"size"`
	Mode   uint32        `json:"mode"`
	Mtime  int64         `json:"mtime,omitempty"`
	Parts  []Part        `json:"parts"`
}

// Part is one compressed member stored in a layer.
type Part struct {
	Digest digest.Digest `json:"digest"`
	Layer  digest.Digest `json:"layer"`
	Offset int64         `json:"offset"`
	Size   int64         `json:"size"`
}

// LayerInfo describes one concatenated layer blob.
type LayerInfo struct {
	Digest      digest.Digest `json:"digest"`
	MediaType   string        `json:"mediaType"`
	Size        int64         `json:"size"`
	Compression string        `json:"compression,omitempty"`
}

// Descriptor returns the OCI descriptor for this layer.
func (l LayerInfo) Descriptor() ocispec.Descriptor {
	return ocispec.Descriptor{
		MediaType: l.MediaType,
		Digest:    l.Digest,
		Size:      l.Size,
	}
}

// MountInfo contains the default mount options set when the volume is built.
type MountInfo struct {
	Target string `json:"target,omitempty"`
	Mode   string `json:"mode,omitempty"`
}

// ChunkingConfig is used when a file is larger than the layer cap.
type ChunkingConfig struct {
	MinSize     int `json:"minSize"`
	AverageSize int `json:"averageSize"`
	MaxSize     int `json:"maxSize"`
}

func (m Manifest) layerInfo(d digest.Digest) (LayerInfo, bool) {
	for _, layer := range m.Layers {
		if layer.Digest == d {
			return layer, true
		}
	}
	return LayerInfo{}, false
}

// resolvedCompression is the codec for this layer. Empty layers fall back to
// the pack-time manifest value, then zstd (old artifacts).
func (l LayerInfo) resolvedCompression(fallback string) string {
	if l.Compression != "" {
		return l.Compression
	}
	if fallback != "" {
		return fallback
	}
	return string(compress.CompressionZstd)
}

func (m Manifest) codecForLayer(layer LayerInfo) (compress.Codec, error) {
	return compress.GetCodec(compress.Compression(layer.resolvedCompression(m.Compression)))
}

func (m Manifest) fileMap() map[string]File {
	out := make(map[string]File, len(m.Files))
	for _, file := range m.Files {
		out[file.Path] = file
	}
	return out
}

func (m Manifest) layerBytes() int64 {
	var n int64
	for _, layer := range m.Layers {
		n += layer.Size
	}
	return n
}

func (m Manifest) avgLayerBytes() int64 {
	n := len(m.Layers)
	if n == 0 {
		return 0
	}
	return m.layerBytes() / int64(n)
}

// Fragmented reports an incremental-style layer list: many layers whose
// average size is far below the configured cap.
func (m Manifest) Fragmented() bool {
	if len(m.Layers) < fragmentMinLayers {
		return false
	}
	max := m.LayerMaxBytes
	if max <= 0 {
		max = DefaultLayerMaxBytes
	}
	return m.avgLayerBytes() <= max/fragmentAvgMaxDivisor
}

func defaultChunking() ChunkingConfig {
	return ChunkingConfig{
		MinSize:     DefaultChunkMin,
		AverageSize: DefaultChunkAvg,
		MaxSize:     DefaultChunkMax,
	}
}

func (c ChunkingConfig) withDefaults() ChunkingConfig {
	if c.MinSize == 0 && c.AverageSize == 0 && c.MaxSize == 0 {
		return defaultChunking()
	}
	return c
}

// clampForLimits keeps CDC parts at or under the layer and registry caps.
func (c ChunkingConfig) clampForLimits(layerMax, registryMax int64) ChunkingConfig {
	c = c.withDefaults()
	capBytes := layerMax
	if registryMax > 0 && (capBytes <= 0 || registryMax < capBytes) {
		capBytes = registryMax
	}
	if capBytes < 64 {
		capBytes = 64
	}
	if c.MaxSize <= 0 || int64(c.MaxSize) > capBytes {
		c.MaxSize = int(capBytes)
	}
	if c.MinSize < 64 {
		c.MinSize = 64
	}
	if c.MinSize >= c.MaxSize {
		c.MinSize = c.MaxSize / 4
		if c.MinSize < 64 {
			c.MinSize = 64
		}
		if c.MinSize >= c.MaxSize {
			c.MinSize = c.MaxSize - 1
		}
	}
	if c.AverageSize < c.MinSize || c.AverageSize > c.MaxSize {
		c.AverageSize = c.MinSize + (c.MaxSize-c.MinSize)/2
	}
	return c
}
