package snapshot

import (
	"context"
	"encoding/json"

	"emperror.dev/errors"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	oras "oras.land/oras-go/v2"
	"oras.land/oras-go/v2/content"
	"protoxon.com/sls/internal/volume"
)

// Pack packs each target directory of regular files and writes a snapshot
// manifest whose layers are those volume blobs. cfg.Targets[i].Name is the
// directory under root. Whiteouts and the other non-regular entries stay in
// the config; volume.PackFiles skips them.
func Pack(ctx context.Context, dst content.Storage, root string, cfg Config, opts volume.PackOptions) (ocispec.Descriptor, error) {
	if cfg.ID == "" {
		return ocispec.Descriptor{}, errors.New("snapshot id is required")
	}
	cfg.SchemaVersion = SchemaVersion
	cfg.MediaType = ConfigMediaType
	seen := map[string]struct{}{}
	var layers []ocispec.Descriptor
	for i := range cfg.Targets {
		target := &cfg.Targets[i]
		dir := targetDir(root, target.Name)
		files, err := volume.PackFiles(ctx, dst, dir, opts)
		if err != nil {
			return ocispec.Descriptor{}, errors.Wrapf(err, "failed to pack snapshot target %s", target.Target)
		}
		target.Files = files
		for _, layer := range files.Layers {
			if _, ok := seen[layer.Digest.String()]; ok {
				continue
			}
			seen[layer.Digest.String()] = struct{}{}
			layers = append(layers, layer.Descriptor())
		}
	}
	configBytes, err := json.Marshal(cfg)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to encode snapshot config")
	}
	configDesc, err := oras.PushBytes(ctx, dst, ConfigMediaType, configBytes)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to push snapshot config")
	}
	packOpts := oras.PackManifestOptions{
		Layers:           layers,
		ConfigDescriptor: &configDesc,
	}
	desc, err := oras.PackManifest(ctx, dst, oras.PackManifestVersion1_1, ArtifactType, packOpts)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to pack snapshot manifest")
	}
	return desc, nil
}

// Fetch loads a snapshot config from an OCI manifest descriptor.
func Fetch(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor) (Config, error) {
	raw, err := content.FetchAll(ctx, src, desc)
	if err != nil {
		return Config{}, errors.Wrap(err, "failed to fetch snapshot manifest")
	}
	var man ocispec.Manifest
	if err := json.Unmarshal(raw, &man); err != nil {
		return Config{}, errors.Wrap(err, "failed to parse snapshot manifest")
	}
	if man.ArtifactType != "" && man.ArtifactType != ArtifactType {
		return Config{}, errors.Errorf("unexpected artifact type %q", man.ArtifactType)
	}
	configBytes, err := content.FetchAll(ctx, src, man.Config)
	if err != nil {
		return Config{}, errors.Wrap(err, "failed to fetch snapshot config")
	}
	var cfg Config
	if err := json.Unmarshal(configBytes, &cfg); err != nil {
		return Config{}, errors.Wrap(err, "failed to parse snapshot config")
	}
	if cfg.MediaType != "" && cfg.MediaType != ConfigMediaType {
		return Config{}, errors.Errorf("unexpected config media type %q", cfg.MediaType)
	}
	return cfg, nil
}
