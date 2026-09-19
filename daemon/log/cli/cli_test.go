package cli

import (
	"bytes"
	"strings"
	"testing"

	"emperror.dev/errors"
	"github.com/apex/log"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/system"
)

func logError(err error) string {
	var buf bytes.Buffer
	h := New(&buf, false)
	l := &log.Logger{Handler: h, Level: log.ErrorLevel}
	l.WithField("error", err).Error("encountered error processing a server power action")
	return buf.String()
}

func TestHandleLogOmitsStackForExpected(t *testing.T) {
	prev := config.Get()
	defer config.Set(prev)
	config.Set(&config.Configuration{})

	out := logError(system.ExpectedError(errors.NewPlain("volume reference not found")))
	if !strings.Contains(out, "volume reference not found") {
		t.Fatalf("missing error text: %s", out)
	}
	if strings.Contains(out, "Stacktrace") {
		t.Fatalf("stack for expected: %s", out)
	}
}

func TestHandleLogIncludesStackForUnexpected(t *testing.T) {
	prev := config.Get()
	defer config.Set(prev)
	config.Set(&config.Configuration{})

	out := logError(errors.New("failed to chown"))
	if !strings.Contains(out, "Stacktrace") {
		t.Fatalf("expected stack for unexpected: %s", out)
	}
}

func TestHandleLogIncludesStackForExpectedInDebug(t *testing.T) {
	prev := config.Get()
	defer config.Set(prev)
	config.Set(&config.Configuration{Debug: true})

	out := logError(system.ExpectedError(errors.NewPlain("volume reference not found")))
	if !strings.Contains(out, "Stacktrace") {
		t.Fatalf("expected stack in debug: %s", out)
	}
}
