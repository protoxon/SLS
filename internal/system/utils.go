package system

import (
	"bufio"
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"strconv"
	"sync"

	"emperror.dev/errors"
)

var (
	cr  = []byte(" \r")
	crr = []byte("\r\n")
)

// maxBufferSize is the maximum line size ScanReader will emit.
var maxBufferSize = 64 * 1024

// FirstNotEmpty returns the first string passed in that is not an empty value.
func FirstNotEmpty(v ...string) string {
	for _, val := range v {
		if val != "" {
			return val
		}
	}
	return ""
}

func MustInt(v string) int {
	i, err := strconv.Atoi(v)
	if err != nil {
		panic(errors.Wrap(err, "system/utils: could not parse int"))
	}
	return i
}

// ScanReader reads up to 64KB of line from the reader and emits that value
// over the callback. If a line exceeds that size, it is truncated and only that
// amount is sent over.
func ScanReader(r io.Reader, callback func(line []byte)) error {
	br := bufio.NewReaderSize(r, 256)
	var buf bytes.Buffer
	for {
		buf.Reset()
		var err error
		var line []byte
		var isPrefix bool

		for {
			line, isPrefix, err = br.ReadLine()
			line = bytes.ReplaceAll(line, cr, crr)
			ns := buf.Len() + len(line)
			if ns > maxBufferSize {
				buf.Write(line[:len(line)-(ns-maxBufferSize)])
				break
			} else {
				buf.Write(line)
			}
			if err != nil && err != io.EOF {
				return err
			}
			if !isPrefix || err == io.EOF {
				break
			}
		}

		if buf.Len() > 0 {
			c := make([]byte, buf.Len())
			copy(c, buf.Bytes())
			callback(c)
		}

		if err == io.EOF {
			break
		}
	}
	return nil
}

func FormatBytes[T int | int16 | int32 | int64 | uint | uint16 | uint32 | uint64](b T) string {
	if b < 1024 {
		return fmt.Sprintf("%d B", b)
	}
	div, exp := int64(1024), 0
	for n := b / 1024; n >= 1024; n /= 1024 {
		div *= 1024
		exp++
	}
	return fmt.Sprintf("%.1f %ciB", float64(b)/float64(div), "KMGTPE"[exp])
}

type AtomicBool struct {
	v  bool
	mu sync.RWMutex
}

func NewAtomicBool(v bool) *AtomicBool {
	return &AtomicBool{v: v}
}

func (ab *AtomicBool) Store(v bool) {
	ab.mu.Lock()
	ab.v = v
	ab.mu.Unlock()
}

// SwapIf stores the value "v" if the current value stored in the AtomicBool is
// the opposite boolean value. If successfully swapped, the response is "true",
// otherwise "false" is returned.
func (ab *AtomicBool) SwapIf(v bool) bool {
	ab.mu.Lock()
	defer ab.mu.Unlock()
	if ab.v != v {
		ab.v = v
		return true
	}
	return false
}

func (ab *AtomicBool) Load() bool {
	ab.mu.RLock()
	defer ab.mu.RUnlock()
	return ab.v
}

func (ab *AtomicBool) UnmarshalJSON(b []byte) error {
	ab.mu.Lock()
	defer ab.mu.Unlock()
	return json.Unmarshal(b, &ab.v)
}

func (ab *AtomicBool) MarshalJSON() ([]byte, error) {
	return json.Marshal(ab.Load())
}

// AtomicString allows for reading/writing to a given struct field without having to worry
// about a potential race condition scenario. Under the hood it uses a simple sync.RWMutex
// to control access to the value.
type AtomicString struct {
	v  string
	mu sync.RWMutex
}

func NewAtomicString(v string) *AtomicString {
	return &AtomicString{v: v}
}

// Store stores the string value passed atomically.
func (as *AtomicString) Store(v string) {
	as.mu.Lock()
	as.v = v
	as.mu.Unlock()
}

// Load loads the string value and returns it.
func (as *AtomicString) Load() string {
	as.mu.RLock()
	defer as.mu.RUnlock()
	return as.v
}

func (as *AtomicString) UnmarshalJSON(b []byte) error {
	as.mu.Lock()
	defer as.mu.Unlock()
	return json.Unmarshal(b, &as.v)
}

func (as *AtomicString) MarshalJSON() ([]byte, error) {
	return json.Marshal(as.Load())
}

type Atomic[T any] struct {
	v  T
	mu sync.RWMutex
}

func NewAtomic[T any](v T) *Atomic[T] {
	return &Atomic[T]{v: v}
}

// Store stores the value passed atomically.
func (a *Atomic[T]) Store(v T) {
	a.mu.Lock()
	defer a.mu.Unlock()

	a.v = v
}

// Load loads the value and returns it.
func (a *Atomic[T]) Load() T {
	a.mu.RLock()
	defer a.mu.RUnlock()

	return a.v
}

// UnmarshalJSON unmarshals the JSON value into the Atomic[T] value.
func (a *Atomic[T]) UnmarshalJSON(b []byte) error {
	a.mu.Lock()
	defer a.mu.Unlock()

	return json.Unmarshal(b, &a.v)
}

// MarshalJSON marshals the Atomic[T] value into JSON.
func (a *Atomic[T]) MarshalJSON() ([]byte, error) {
	return json.Marshal(a.Load())
}
