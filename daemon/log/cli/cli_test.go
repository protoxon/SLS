package cli

import (
	"bytes"
	"strings"
	"testing"

	"emperror.dev/errors"
	"github.com/apex/log"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/system"
	"protoxon.com/sls/internal/logcomponent"
	"protoxon.com/sls/run/logsplit"
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

func TestLabelOffLeavesLineUnchanged(t *testing.T) {
	var buf bytes.Buffer
	h := New(&buf, false)
	l := &log.Logger{Handler: h, Level: log.InfoLevel}
	l.WithField("path", "/tmp/sls.log").Info("writing log files to disk")
	out := buf.String()
	if strings.Contains(out, "[daemon]") || strings.Contains(out, "[controller]") || strings.Contains(out, "component=") {
		t.Fatalf("standalone line gained a source tag: %s", out)
	}
	if !strings.Contains(out, " INFO: [") || !strings.Contains(out, "] writing log files to disk") {
		t.Fatalf("line format changed: %s", out)
	}
	if !strings.Contains(out, "path=/tmp/sls.log") {
		t.Fatalf("missing field: %s", out)
	}
}

func TestComponentLabelsAlign(t *testing.T) {
	controller := messageColumn(logcomponent.Controller, "processing servers")
	daemon := messageColumn(logcomponent.Daemon, "loading configuration")
	if controller != daemon {
		t.Fatalf("message columns differ: controller=%d daemon=%d", controller, daemon)
	}
	if strings.Contains(lineWithComponent(logcomponent.Daemon, "loading configuration", "path", "/tmp/sls.log"), "component=") {
		t.Fatal("component field was printed as a key")
	}
}

func TestSplitHandlerStampsDaemon(t *testing.T) {
	var got string
	h := &logsplit.Handler{Console: log.HandlerFunc(func(e *log.Entry) error {
		s, _ := e.Fields.Get("component").(string)
		got = s
		return nil
	})}
	logger := &log.Logger{Handler: h, Level: log.InfoLevel}
	logger.Info("loading configuration from file")
	if got != logcomponent.Daemon {
		t.Fatalf("component = %q", got)
	}
}

func TestRelayNamesCaller(t *testing.T) {
	if got := logcomponent.Relay(); got != logcomponent.Daemon {
		t.Fatalf("component = %q", got)
	}
}

func messageColumn(component, msg string) int {
	return strings.Index(lineWithComponent(component, msg), msg)
}

func lineWithComponent(component, msg string, fields ...string) string {
	var buf bytes.Buffer
	h := New(&buf, false)
	h.LabelComponents = true
	l := &log.Logger{Handler: h, Level: log.InfoLevel}
	entry := l.WithField("component", component)
	for i := 0; i+1 < len(fields); i += 2 {
		entry = entry.WithField(fields[i], fields[i+1])
	}
	entry.Info(msg)
	return buf.String()
}
