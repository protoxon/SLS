package volume

import (
	"io"
	"os"

	"emperror.dev/errors"
	"github.com/jotfs/fastcdc-go"
	"github.com/opencontainers/go-digest"
	"protoxon.com/sls/daemon/oras/volume/compress"
)

type compressedPart struct {
	Digest     digest.Digest
	Compressed []byte
}

func compressBytes(codec compress.Codec, data []byte) (compressedPart, error) {
	enc, err := codec.NewEncoder()
	if err != nil {
		return compressedPart{}, err
	}
	defer enc.Close()
	out, err := enc.Encode(data)
	if err != nil {
		return compressedPart{}, errors.Wrap(err, "failed to compress")
	}
	return compressedPart{
		Digest:     digest.FromBytes(data),
		Compressed: out,
	}, nil
}

// eachCompressedPart yields one zstd part at a time. Small files are a single
// part. Large files are CDC-split (or fixed-split) so only one part is live
// besides the open layer buffer.
func eachCompressedPart(ref fileRef, opts PackOptions, codec compress.Codec, fn func(compressedPart) error) error {
	needCDC := ref.Size > opts.LayerMaxBytes || ref.Size > opts.RegistryMaxBytes
	if !needCDC {
		data, err := os.ReadFile(ref.Abs)
		if err != nil {
			return err
		}
		part, err := compressBytes(codec, data)
		if err != nil {
			return err
		}
		if int64(len(part.Compressed)) <= opts.RegistryMaxBytes {
			return fn(part)
		}
	}

	f, err := os.Open(ref.Abs)
	if err != nil {
		return err
	}
	defer f.Close()
	if opts.Chunking.MaxSize <= opts.Chunking.MinSize {
		return eachFixedPart(f, opts.LayerMaxBytes, opts.RegistryMaxBytes, codec, fn)
	}
	return eachCDCPart(f, opts.Chunking, codec, fn)
}

func eachCDCPart(r io.Reader, chunking ChunkingConfig, codec compress.Codec, fn func(compressedPart) error) error {
	chunker, err := fastcdc.NewChunker(r, fastcdc.Options{
		MinSize:     chunking.MinSize,
		AverageSize: chunking.AverageSize,
		MaxSize:     chunking.MaxSize,
	})
	if err != nil {
		return errors.Wrap(err, "failed to create chunker")
	}
	for {
		chunk, err := chunker.Next()
		if err == io.EOF {
			return nil
		}
		if err != nil {
			return errors.Wrap(err, "failed to chunk file")
		}
		part, err := compressBytes(codec, append([]byte(nil), chunk.Data...))
		if err != nil {
			return err
		}
		if err := fn(part); err != nil {
			return err
		}
	}
}

func eachFixedPart(r io.Reader, layerMax, registryMax int64, codec compress.Codec, fn func(compressedPart) error) error {
	size := layerMax
	if registryMax > 0 && registryMax < size {
		size = registryMax
	}
	if size < 1 {
		size = 1
	}
	buf := make([]byte, size)
	for {
		n, err := io.ReadFull(r, buf)
		if n > 0 {
			part, cerr := compressBytes(codec, append([]byte(nil), buf[:n]...))
			if cerr != nil {
				return cerr
			}
			if err := fn(part); err != nil {
				return err
			}
		}
		if err == io.EOF || err == io.ErrUnexpectedEOF {
			return nil
		}
		if err != nil {
			return err
		}
	}
}
