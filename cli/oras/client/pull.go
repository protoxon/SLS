package client

import (
	"context"

	"emperror.dev/errors"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/oras/volume"
)

// Pull fetches a volume artifact and merges it into dest by hashing files on
// disk. Local edits that still match the remote digest are kept; extra files
// not in the artifact are left alone unless opts.Delete is set. No dest/.sls
// sidecar is written.
func Pull(ctx context.Context, reference, dest string, progress volume.ProgressFunc, opts Options) (ocispec.Descriptor, error) {
	progress.Emit(volume.ProgressEvent{Kind: volume.ProgressResolve, Name: reference})

	repository, err := NewRepository(reference, opts)
	if err != nil {
		return ocispec.Descriptor{}, err
	}

	descriptor, err := repository.Resolve(ctx, repository.Reference.Reference)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to resolve reference")
	}
	progress.Emit(volume.ProgressEvent{Kind: volume.ProgressResolve, Digest: descriptor.Digest.String()})

	if err := volume.UnpackWith(ctx, repository, descriptor, dest, volume.UnpackOptions{
		HashDest:    true,
		TrustMtime:  true,
		SkipSidecar: true,
		DeleteExtra: opts.Delete,
		Progress:    progress,
	}); err != nil {
		return ocispec.Descriptor{}, err
	}

	return descriptor, nil
}
