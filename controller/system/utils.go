package system

import (
	"crypto/rand"
	"encoding/base64"
	"io"

	"github.com/fatih/color"
	shared "protoxon.com/sls/internal/system"
)

// Red color for log formatting
var Red = color.New(color.FgHiRed).SprintFunc()

// Blue color for log formatting
var Blue = color.New(color.FgHiBlue).SprintFunc()

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

// GenerateKey returns a simple encoded string.
func GenerateKey() (string, error) {
	b := make([]byte, 32) // 256 bits
	if _, err := rand.Read(b); err != nil {
		return "", err
	}
	return base64.RawURLEncoding.EncodeToString(b), nil
}
