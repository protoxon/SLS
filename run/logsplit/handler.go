// Package logsplit stamps each log line with the side that emitted it and
// writes controller and daemon lines into their own files. sls run installs
// this handler. Standalone processes keep a plain multi handler.
package logsplit

import (
	"github.com/apex/log"
	"protoxon.com/sls/internal/logcomponent"
)

// Handler fans one log entry out to the console and the side that produced it.
// Lines that are not from the controller or the daemon, including lines from
// sls run itself, are written to every open file so nothing is dropped.
type Handler struct {
	Console    log.Handler
	Controller log.Handler
	Daemon     log.Handler
}

// HandleLog implements log.Handler.
func (h *Handler) HandleLog(e *log.Entry) error {
	component := stamp(e)
	for _, handler := range h.targets(component) {
		if handler == nil {
			continue
		}
		if err := handler.HandleLog(e); err != nil {
			return err
		}
	}
	return nil
}

func (h *Handler) targets(component string) []log.Handler {
	switch component {
	case logcomponent.Controller:
		return []log.Handler{h.Console, h.Controller}
	case logcomponent.Daemon:
		return []log.Handler{h.Console, h.Daemon}
	default:
		return []log.Handler{h.Console, h.Controller, h.Daemon}
	}
}

func stamp(e *log.Entry) string {
	if e != nil && e.Fields != nil {
		if s, ok := e.Fields.Get("component").(string); ok && s != "" {
			return s
		}
	}
	component := logcomponent.FromCaller()
	if component == "" {
		return ""
	}
	if e.Fields == nil {
		e.Fields = log.Fields{}
	}
	e.Fields["component"] = component
	return component
}
