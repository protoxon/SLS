package system

import (
	"fmt"
	"testing"

	"emperror.dev/errors"
)

func TestIsExpectedThroughWrap(t *testing.T) {
	base := ExpectedError(errors.NewPlain("volume reference not found"))
	if !IsExpected(base) {
		t.Fatal("sentinel")
	}
	wrapped := errors.Wrap(base, "failed to pull volume")
	if !IsExpected(wrapped) {
		t.Fatal("wrap")
	}
	if !errors.Is(wrapped, base) {
		t.Fatal("errors.Is")
	}
	if IsExpected(fmt.Errorf("failed to chown")) {
		t.Fatal("unexpected")
	}
}
