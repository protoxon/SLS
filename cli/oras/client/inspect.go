package client

import (
	"context"

	"emperror.dev/errors"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/oras/volume"
)

// InspectResult is a volume artifact's OCI manifest and config.
type InspectResult struct {
	Reference  string             `json:"reference"`
	Descriptor ocispec.Descriptor `json:"descriptor"`
	Manifest   ocispec.Manifest   `json:"manifest"`
	Config     volume.Manifest    `json:"config"`
}

// Inspect resolves a volume reference and loads its manifest and config
// without fetching layer blobs.
func Inspect(ctx context.Context, reference string, opts Options) (InspectResult, error) {
	repository, err := NewRepository(reference, opts)
	if err != nil {
		return InspectResult{}, err
	}

	descriptor, err := repository.Resolve(ctx, repository.Reference.Reference)
	if err != nil {
		return InspectResult{}, errors.Wrap(err, "failed to resolve reference")
	}

	man, cfg, err := volume.FetchArtifact(ctx, repository, descriptor)
	if err != nil {
		return InspectResult{}, err
	}

	return InspectResult{
		Reference:  reference,
		Descriptor: descriptor,
		Manifest:   man,
		Config:     cfg,
	}, nil
}
