package websocket

import (
	"context"
	"encoding/json"
	"sync"

	"emperror.dev/errors"
	"protoxon.com/sls/daemon/server"
	"protoxon.com/sls/daemon/system"
	"protoxon.com/sls/internal/events"
)

// RegisterListenerEvents subscribes this connection to server console output
// and the server event bus. It runs only after the first successful auth.
func (h *Handler) RegisterListenerEvents(ctx context.Context) {
	h.Logger().Debug("registering event listeners for connection")

	go func() {
		if err := h.listenForServerEvents(ctx); err != nil {
			h.Logger().Warn("error while processing server event; closing websocket connection")
			if err := h.Connection.Close(); err != nil {
				h.Logger().WithField("error", errors.WithStack(err)).Error("error closing websocket connection")
			}
		}
	}()
}

// listenForServerEvents forwards server bus events and console/install sink
// output to the connected client. It blocks until ctx is canceled.
func (h *Handler) listenForServerEvents(ctx context.Context) error {
	var o sync.Once
	var err error

	ctx, cancel := context.WithCancel(ctx)
	defer cancel()

	eventChan := make(chan []byte)
	logOutput := make(chan []byte, 8)
	installOutput := make(chan []byte, 4)

	h.server.Events().On(eventChan)
	h.server.Sink(system.LogSink).On(logOutput)
	h.server.Sink(system.InstallSink).On(installOutput)

	onError := func(evt string, err2 error) {
		h.Logger().WithField("event", evt).WithField("error", err2).Error("failed to send event over server websocket")
		// Avoid race conditions by only setting the error once and then canceling
		// the context. This way if additional processing errors come through due
		// to a massive flood of things you still only report and stop at the first.
		o.Do(func() {
			err = err2
		})
		cancel()
	}

	for {
		select {
		case <-ctx.Done():
			break
		case b := <-logOutput:
			sendErr := h.SendJson(Message{Event: server.ConsoleOutputEvent, Args: []string{string(b)}})
			if sendErr == nil {
				continue
			}
			onError(server.ConsoleOutputEvent, sendErr)
		case b := <-installOutput:
			sendErr := h.SendJson(Message{Event: server.InstallOutputEvent, Args: []string{string(b)}})
			if sendErr == nil {
				continue
			}
			onError(server.InstallOutputEvent, sendErr)
		case b := <-eventChan:
			var e events.Event
			if err := events.DecodeTo(b, &e); err != nil {
				continue
			}
			var sendErr error
			message := Message{Event: Event(e.Topic)}
			if str, ok := e.Data.(string); ok {
				message.Args = []string{str}
			} else if b, ok := e.Data.([]byte); ok {
				message.Args = []string{string(b)}
			} else {
				b, sendErr = json.Marshal(e.Data)
				if sendErr == nil {
					message.Args = []string{string(b)}
				}
			}

			if sendErr == nil {
				sendErr = h.SendJson(message)
				if sendErr == nil {
					continue
				}
			}
			onError(string(message.Event), sendErr)
		}
		break
	}

	// These functions will automatically close the channel if it hasn't been already.
	h.server.Events().Off(eventChan)
	h.server.Sink(system.LogSink).Off(logOutput)
	h.server.Sink(system.InstallSink).Off(installOutput)

	// If the internal context is stopped it is either because the parent context
	// got canceled or because we ran into an error. If the "err" variable is nil
	// we can assume the parent was canceled and need not perform any actions.
	if err != nil {
		return errors.WithStack(err)
	}

	return nil
}
