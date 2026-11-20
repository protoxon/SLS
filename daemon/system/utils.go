package system

import (
	"crypto/sha1"
	"encoding/hex"
	"io"
	"os"

	shared "protoxon.com/sls/internal/system"
)

type AtomicBool = shared.AtomicBool
type AtomicString = shared.AtomicString
type Atomic[T any] = shared.Atomic[T]

func FirstNotEmpty(v ...string) string { return shared.FirstNotEmpty(v...) }

func MustInt(v string) int { return shared.MustInt(v) }

func ScanReader(r io.Reader, callback func(line []byte)) error {
	return shared.ScanReader(r, callback)
}

func FormatBytes[T int | int16 | int32 | int64 | uint | uint16 | uint32 | uint64](b T) string {
	return shared.FormatBytes(b)
}

func NewAtomicBool(v bool) *AtomicBool { return shared.NewAtomicBool(v) }

func NewAtomicString(v string) *AtomicString { return shared.NewAtomicString(v) }

func NewAtomic[T any](v T) *Atomic[T] { return shared.NewAtomic(v) }

// PathId generates an id given a folder path
func PathId(target string) string {
	h := sha1.Sum([]byte(target))
	return hex.EncodeToString(h[:])[:8]
}

func DirExists(path string) bool {
	info, err := os.Stat(path)
	if err != nil {
		if os.IsNotExist(err) {
			return false
		}
		return false
	}
	return info.IsDir()
}
