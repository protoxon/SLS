package cli

import (
	"bytes"
	"strings"
	"testing"

	"github.com/apex/log"
	"protoxon.com/sls/internal/logcomponent"
	"protoxon.com/sls/run/logsplit"
)

func TestLabelOffLeavesPluginLineUnchanged(t *testing.T) {
	var buf bytes.Buffer
	h := New(&buf, false)
	l := &log.Logger{Handler: h, Level: log.InfoLevel}
	l.WithField("plugin", "example").Info("enabled")
	out := buf.String()
	if strings.Contains(out, "[controller]") || strings.Contains(out, "[daemon]") {
		t.Fatalf("standalone line gained a source tag: %s", out)
	}
	if !strings.Contains(out, "] [example] enabled") {
		t.Fatalf("plugin format changed: %s", out)
	}
}

func TestComponentLabelWithPlugin(t *testing.T) {
	var buf bytes.Buffer
	h := New(&buf, false)
	h.LabelComponents = true
	l := &log.Logger{Handler: h, Level: log.InfoLevel}
	l.WithField("component", logcomponent.Controller).WithField("plugin", "example").Info("enabled")
	out := buf.String()
	ctrl := strings.Index(out, "[controller]")
	plug := strings.Index(out, "[example]")
	msg := strings.Index(out, "enabled")
	if ctrl < 0 || plug < ctrl || msg < plug {
		t.Fatalf("label order: %s", out)
	}
	if strings.Contains(out, "component=") || strings.Contains(out, "plugin=") {
		t.Fatalf("tag printed as a field: %s", out)
	}
}

func TestComponentLabelsAlign(t *testing.T) {
	controller := messageColumn(logcomponent.Controller, "processing servers")
	daemon := messageColumn(logcomponent.Daemon, "loading configuration")
	if controller < 0 || controller != daemon {
		t.Fatalf("message columns differ: controller=%d daemon=%d", controller, daemon)
	}
}

func TestSplitHandlerStampsController(t *testing.T) {
	var got string
	h := &logsplit.Handler{Console: log.HandlerFunc(func(e *log.Entry) error {
		s, _ := e.Fields.Get("component").(string)
		got = s
		return nil
	})}
	logger := &log.Logger{Handler: h, Level: log.InfoLevel}
	logger.Info("loading configuration from file")
	if got != logcomponent.Controller {
		t.Fatalf("component = %q", got)
	}
}

func TestRelayNamesCaller(t *testing.T) {
	if got := logcomponent.Relay(); got != logcomponent.Controller {
		t.Fatalf("component = %q", got)
	}
}

func messageColumn(component, msg string) int {
	var buf bytes.Buffer
	h := New(&buf, false)
	h.LabelComponents = true
	l := &log.Logger{Handler: h, Level: log.InfoLevel}
	l.WithField("component", component).Info(msg)
	return strings.Index(buf.String(), msg)
}
