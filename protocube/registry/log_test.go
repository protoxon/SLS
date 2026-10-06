package registry

import (
	"bytes"
	"testing"

	"github.com/sirupsen/logrus"
)

type codeError string

func (e codeError) Error() string { return string(e) }

func TestKnownMissesAreNotLogged(t *testing.T) {
	var buf bytes.Buffer
	logger := logrus.New()
	logger.SetOutput(&buf)
	logger.SetFormatter(quietMissFormatter{base: &logrus.TextFormatter{DisableTimestamp: true}})

	logger.WithField("err.code", codeError("manifest unknown")).Error("response completed with error")
	logger.WithField("err.code", codeError("blob unknown")).Error("response completed with error")
	logger.WithField("err.code", codeError("name unknown")).Error("response completed with error")
	if buf.Len() != 0 {
		t.Fatalf("logged existence checks: %s", buf.String())
	}

	logger.WithField("err.code", codeError("manifest invalid")).Error("response completed with error")
	if !bytes.Contains(buf.Bytes(), []byte("manifest invalid")) {
		t.Fatalf("dropped a real error: %s", buf.String())
	}
}
