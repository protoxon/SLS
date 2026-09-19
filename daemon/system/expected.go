package system

import "emperror.dev/errors"

// Expected marks an error as an expected outcome (registry miss, already running).
// Loggers skip the stack dump unless debug is on.
type Expected interface {
	Expected()
}

type expected struct{ error }

func (expected) Expected() {}

func (e expected) Unwrap() error { return e.error }

// ExpectedError wraps err so IsExpected reports true. err is returned unchanged
// if it is nil or already expected.
func ExpectedError(err error) error {
	if err == nil {
		return nil
	}
	if IsExpected(err) {
		return err
	}
	return expected{err}
}

func IsExpected(err error) bool {
	var e Expected
	return errors.As(err, &e)
}
