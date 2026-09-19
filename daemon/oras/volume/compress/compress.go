package compress

import "fmt"

type Compression string

const (
	CompressionNone Compression = "none"
	CompressionGzip Compression = "gzip"
	CompressionZstd Compression = "zstd"
)

type Codec interface {
	Name() Compression
	NewEncoder() (Encoder, error)
	NewDecoder() (Decoder, error)
}

type Encoder interface {
	Encode(src []byte) ([]byte, error)
	Close() error
}

type Decoder interface {
	Decode(src []byte) ([]byte, error)
	Close() error
}

var codecs = map[Compression]Codec{
	CompressionZstd: ZstdCodec{},
	CompressionGzip: GzipCodec{},
	CompressionNone: NoneCodec{},
}

func GetCodec(compression Compression) (Codec, error) {
	c, ok := codecs[compression]
	if !ok {
		return nil, fmt.Errorf("unsupported compression: %q", compression)
	}
	return c, nil
}
