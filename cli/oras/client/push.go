package client

import (
	"context"

	"emperror.dev/errors"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/oras/volume"
	"protoxon.com/sls/daemon/oras/volume/compress"
)

func Push(ctx context.Context, reference, path string, progress volume.ProgressFunc, opts Options, mount volume.MountInfo) (ocispec.Descriptor, error) {
	progress.Emit(volume.ProgressEvent{Kind: volume.ProgressResolve, Name: reference})

	repository, err := NewRepository(reference, opts)
	if err != nil {
		return ocispec.Descriptor{}, err
	}

	packOpts := volume.PackOptions{
		Progress:    progress,
		Compression: compress.Compression(opts.Compression),
		Mount:       mount,
	}
	if prevDesc, err := repository.Resolve(ctx, repository.Reference.Reference); err == nil {
		if prev, err := volume.FetchConfig(ctx, repository, prevDesc); err == nil {
			if !opts.Rewrite {
				packOpts.Previous = &prev
			}
			if packOpts.Mount.Target == "" {
				packOpts.Mount.Target = prev.MountInfo.Target
			}
			if packOpts.Mount.Mode == "" {
				packOpts.Mount.Mode = prev.MountInfo.Mode
			}
			if opts.Rewrite {
				progress.Emit(volume.ProgressEvent{Kind: volume.ProgressPrevious, Detail: "rewrite"})
			} else {
				progress.Emit(volume.ProgressEvent{Kind: volume.ProgressPrevious, Digest: prevDesc.Digest.String(), Cached: true})
			}
		} else {
			progress.Emit(volume.ProgressEvent{Kind: volume.ProgressPrevious})
		}
	} else {
		progress.Emit(volume.ProgressEvent{Kind: volume.ProgressPrevious})
	}

	descriptor, err := volume.Pack(ctx, repository, path, packOpts)
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to pack volume")
	}

	if err := repository.Tag(ctx, descriptor, repository.Reference.Reference); err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to tag volume")
	}
	progress.Emit(volume.ProgressEvent{
		Kind:   volume.ProgressTag,
		Name:   repository.Reference.Reference,
		Digest: descriptor.Digest.String(),
	})

	return descriptor, nil
}
