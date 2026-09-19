package volume

import (
	"bytes"
	"context"
	"crypto/sha256"
	"encoding/json"
	"io"
	"os"
	"strings"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	oras "oras.land/oras-go/v2"
	"oras.land/oras-go/v2/content"
	"oras.land/oras-go/v2/errdef"
	"protoxon.com/sls/daemon/oras/volume/compress"
)

// PackOptions controls how a volume tree is packed.
type PackOptions struct {
	LayerMaxBytes    int64
	LayerMaxFiles    int
	RegistryMaxBytes int64
	Chunking         ChunkingConfig
	Compression      compress.Compression
	Mount            MountInfo
	Previous         *Manifest
	Created          string
	Progress         ProgressFunc
}

func (o PackOptions) withDefaults() PackOptions {
	if o.LayerMaxBytes <= 0 {
		o.LayerMaxBytes = DefaultLayerMaxBytes
	}
	if o.LayerMaxFiles <= 0 {
		o.LayerMaxFiles = DefaultLayerMaxFiles
	}
	if o.RegistryMaxBytes <= 0 {
		o.RegistryMaxBytes = DefaultRegistryMaxBytes
	}
	o.Compression = compress.Compression(strings.ToLower(string(o.Compression)))
	if o.Compression == "" {
		o.Compression = compress.CompressionZstd
	}
	o.Chunking = o.Chunking.clampForLimits(o.LayerMaxBytes, o.RegistryMaxBytes)
	return o
}

// Pack walks path and writes a file-centric volume artifact into dst.
func Pack(ctx context.Context, dst content.Storage, path string, opts PackOptions) (ocispec.Descriptor, error) {
	info, err := os.Stat(path)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to stat volume path")
	}
	if !info.IsDir() {
		return ocispec.Descriptor{}, errors.New("volume path must be a directory")
	}
	opts = opts.withDefaults()

	codec, err := compress.GetCodec(opts.Compression)
	if err != nil {
		return ocispec.Descriptor{}, err
	}

	refs, err := listFiles(path)
	if err != nil {
		return ocispec.Descriptor{}, err
	}
	opts.Progress.Emit(ProgressEvent{Kind: ProgressWalk, Name: path, Count: len(refs)})

	var prev map[string]File
	prevLayers := map[digest.Digest]LayerInfo{}
	prevCompression := ""
	if opts.Previous != nil {
		prev = opts.Previous.fileMap()
		prevCompression = opts.Previous.Compression
		for _, layer := range opts.Previous.Layers {
			layer.Compression = layer.resolvedCompression(prevCompression)
			prevLayers[layer.Digest] = layer
		}
	}

	files := make([]File, 0, len(refs))
	layers := make([]LayerInfo, 0)
	seenLayer := map[digest.Digest]struct{}{}
	remember := func(info LayerInfo, _ bool) {
		if _, ok := seenLayer[info.Digest]; ok {
			return
		}
		layers = append(layers, info)
		seenLayer[info.Digest] = struct{}{}
	}

	for _, group := range groupFiles(refs) {
		b := newLayerBuilder(opts.LayerMaxBytes, opts.LayerMaxFiles, opts.RegistryMaxBytes, string(opts.Compression))
		for _, ref := range group {
			plain, err := digestFile(ref.Abs)
			if err != nil {
				return ocispec.Descriptor{}, errors.Wrapf(err, "failed to hash %s", ref.Rel)
			}
			reused := false
			if old, ok := prev[ref.Rel]; ok && old.Digest == plain && old.Size == ref.Size {
				files = append(files, File{
					Path:   ref.Rel,
					Digest: plain,
					Size:   ref.Size,
					Mode:   ref.Mode,
					Mtime:  ref.Mtime,
					Parts:  append([]Part(nil), old.Parts...),
				})
				for _, part := range old.Parts {
					info, ok := prevLayers[part.Layer]
					if !ok {
						return ocispec.Descriptor{}, errors.Errorf("previous layer %s missing from config", part.Layer)
					}
					remember(info, true)
				}
				reused = true
			} else {
				files = append(files, File{Path: ref.Rel, Digest: plain, Size: ref.Size, Mode: ref.Mode, Mtime: ref.Mtime})
				cur := &files[len(files)-1]
				if err := eachCompressedPart(ref, opts, codec, func(part compressedPart) error {
					return b.add(ctx, dst, cur, part, remember, opts.Progress)
				}); err != nil {
					return ocispec.Descriptor{}, errors.Wrapf(err, "failed to pack %s", ref.Rel)
				}
			}
			opts.Progress.Emit(ProgressEvent{
				Kind:   ProgressFile,
				Path:   ref.Rel,
				Group:  groupKey(ref.Rel),
				Size:   ref.Size,
				Cached: reused,
			})
		}
		if err := b.flush(ctx, dst, remember, opts.Progress); err != nil {
			return ocispec.Descriptor{}, err
		}
	}

	cfg := Manifest{
		SchemaVersion:    SchemaVersion,
		MediaType:        ConfigMediaType,
		Format:           PackFormat,
		Compression:      string(opts.Compression),
		LayerMaxBytes:    opts.LayerMaxBytes,
		LayerMaxFiles:    opts.LayerMaxFiles,
		RegistryMaxBytes: opts.RegistryMaxBytes,
		Chunking:         opts.Chunking,
		Files:            files,
		Layers:           layers,
		MountInfo:        opts.Mount,
	}

	configBytes, err := json.Marshal(cfg)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to encode volume config")
	}
	configDesc, err := oras.PushBytes(ctx, dst, ConfigMediaType, configBytes)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to push volume config")
	}
	opts.Progress.Emit(ProgressEvent{
		Kind:   ProgressConfig,
		Digest: configDesc.Digest.String(),
		Size:   configDesc.Size,
	})
	if opts.Previous != nil && cfg.Fragmented() {
		opts.Progress.Emit(ProgressEvent{
			Kind:  ProgressRewriteHint,
			Count: len(cfg.Layers),
			Size:  cfg.avgLayerBytes(),
		})
	}

	ociLayers := make([]ocispec.Descriptor, 0, len(cfg.Layers))
	for _, layer := range cfg.Layers {
		ociLayers = append(ociLayers, layer.Descriptor())
	}

	packOpts := oras.PackManifestOptions{
		Layers:           ociLayers,
		ConfigDescriptor: &configDesc,
	}
	if opts.Created != "" {
		packOpts.ManifestAnnotations = map[string]string{
			ocispec.AnnotationCreated: opts.Created,
		}
	}
	desc, err := oras.PackManifest(ctx, dst, oras.PackManifestVersion1_1, ArtifactType, packOpts)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to pack volume manifest")
	}
	return desc, nil
}

func digestFile(path string) (digest.Digest, error) {
	f, err := os.Open(path)
	if err != nil {
		return "", err
	}
	defer f.Close()
	h := sha256.New()
	if _, err := io.Copy(h, f); err != nil {
		return "", err
	}
	return digest.NewDigestFromBytes(digest.SHA256, h.Sum(nil)), nil
}

type openPart struct {
	file *File
	idx  int
}

type layerBuilder struct {
	layerMax    int64
	fileMax     int
	registryMax int64
	compression string
	members     [][]byte
	bytes       int64
	open        []openPart
}

func newLayerBuilder(layerMax int64, fileMax int, registryMax int64, compression string) *layerBuilder {
	return &layerBuilder{layerMax: layerMax, fileMax: fileMax, registryMax: registryMax, compression: compression}
}

func (b *layerBuilder) canFit(n int64) bool {
	if len(b.members) == 0 {
		return true
	}
	if b.bytes+n > b.layerMax {
		return false
	}
	if b.fileMax > 0 && len(b.members) >= b.fileMax {
		return false
	}
	return true
}

func (b *layerBuilder) add(ctx context.Context, dst content.Storage, file *File, part compressedPart, remember func(LayerInfo, bool), progress ProgressFunc) error {
	n := int64(len(part.Compressed))
	if n > b.registryMax {
		return errors.Errorf("compressed part %d exceeds registry max %d", n, b.registryMax)
	}
	if !b.canFit(n) {
		if err := b.flush(ctx, dst, remember, progress); err != nil {
			return err
		}
	}
	file.Parts = append(file.Parts, Part{
		Digest: part.Digest,
		Offset: b.bytes,
		Size:   n,
	})
	b.open = append(b.open, openPart{file: file, idx: len(file.Parts) - 1})
	b.members = append(b.members, part.Compressed)
	b.bytes += n
	if n > b.layerMax {
		return b.flush(ctx, dst, remember, progress)
	}
	return nil
}

func (b *layerBuilder) flush(ctx context.Context, dst content.Storage, remember func(LayerInfo, bool), progress ProgressFunc) error {
	if len(b.members) == 0 {
		return nil
	}
	var buf bytes.Buffer
	for _, m := range b.members {
		buf.Write(m)
	}
	raw := buf.Bytes()
	desc := content.NewDescriptorFromBytes(LayerMediaType, raw)
	exists, err := dst.Exists(ctx, desc)
	if err != nil {
		return errors.Wrap(err, "failed to check layer blob")
	}
	cached := exists
	if !exists {
		if err := dst.Push(ctx, desc, bytes.NewReader(raw)); err != nil {
			if !errors.Is(err, errdef.ErrAlreadyExists) {
				return errors.Wrap(err, "failed to push layer")
			}
			cached = true
		}
	}
	info := LayerInfo{Digest: desc.Digest, MediaType: LayerMediaType, Size: desc.Size, Compression: b.compression}
	for _, p := range b.open {
		p.file.Parts[p.idx].Layer = info.Digest
	}
	remember(info, cached)
	progress.Emit(ProgressEvent{
		Kind:   ProgressLayer,
		Digest: info.Digest.String(),
		Size:   info.Size,
		Cached: cached,
	})
	b.members = nil
	b.open = nil
	b.bytes = 0
	return nil
}
