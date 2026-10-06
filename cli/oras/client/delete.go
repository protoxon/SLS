package client

import (
	"context"

	"emperror.dev/errors"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
)

// Delete removes the volume manifest for reference from the registry.
// Protocube's embedded registry schedules debounced GC after deletes;
// other registries leave blobs until their own GC runs.
func Delete(ctx context.Context, reference string, opts Options) (ocispec.Descriptor, error) {
	repository, err := NewRepository(reference, opts)
	if err != nil {
		return ocispec.Descriptor{}, err
	}

	descriptor, err := repository.Resolve(ctx, repository.Reference.Reference)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to resolve reference")
	}

	if err := repository.Manifests().Delete(ctx, descriptor); err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to delete volume")
	}

	return descriptor, nil
}
