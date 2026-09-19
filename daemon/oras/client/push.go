package client

import (
	"context"

	"emperror.dev/errors"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/oras/volume"
)

func Push(ctx context.Context, reference, path string) (ocispec.Descriptor, error) {
	repository, err := NewRepository(reference)
	if err != nil {
		return ocispec.Descriptor{}, err
	}

	opts := volume.PackOptions{}
	if prevDesc, err := repository.Resolve(ctx, repository.Reference.Reference); err == nil {
		if prev, err := volume.FetchConfig(ctx, repository, prevDesc); err == nil {
			opts.Previous = &prev
		}
	}

	descriptor, err := volume.Pack(ctx, repository, path, opts)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to pack volume")
	}

	if err := repository.Tag(ctx, descriptor, repository.Reference.Reference); err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to tag volume")
	}

	return descriptor, nil
}
