package logsplit

import (
	"testing"

	"github.com/apex/log"
	"protoxon.com/sls/internal/logcomponent"
)

func TestExplicitComponentWins(t *testing.T) {
	var got string
	h := &Handler{Console: log.HandlerFunc(func(e *log.Entry) error {
		s, _ := e.Fields.Get("component").(string)
		got = s
		return nil
	})}
	logger := &log.Logger{Handler: h, Level: log.InfoLevel}
	logger.WithField("component", logcomponent.Daemon).Info("writing log files to disk")
	if got != logcomponent.Daemon {
		t.Fatalf("component = %q", got)
	}
}

func TestRoutesFilesByComponent(t *testing.T) {
	var console, controller, daemon []string
	record := func(dst *[]string) log.Handler {
		return log.HandlerFunc(func(e *log.Entry) error {
			*dst = append(*dst, e.Message)
			return nil
		})
	}
	h := &Handler{
		Console:    record(&console),
		Controller: record(&controller),
		Daemon:     record(&daemon),
	}
	logger := &log.Logger{Handler: h, Level: log.InfoLevel}
	logger.WithField("component", logcomponent.Controller).Info("from-controller")
	logger.WithField("component", logcomponent.Daemon).Info("from-daemon")
	logger.Info("from-run")

	if join(console) != "from-controller,from-daemon,from-run" {
		t.Fatalf("console = %v", console)
	}
	if join(controller) != "from-controller,from-run" {
		t.Fatalf("controller file = %v", controller)
	}
	if join(daemon) != "from-daemon,from-run" {
		t.Fatalf("daemon file = %v", daemon)
	}
}

func TestCallerIsRun(t *testing.T) {
	var got string
	h := &Handler{Console: log.HandlerFunc(func(e *log.Entry) error {
		s, _ := e.Fields.Get("component").(string)
		got = s
		return nil
	})}
	logger := &log.Logger{Handler: h, Level: log.InfoLevel}
	logger.Info("run stopped")
	if got != logcomponent.Run {
		t.Fatalf("component = %q", got)
	}
}

func join(parts []string) string {
	out := ""
	for i, part := range parts {
		if i > 0 {
			out += ","
		}
		out += part
	}
	return out
}
