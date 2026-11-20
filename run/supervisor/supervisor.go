package supervisor

import (
	"context"
	"errors"
)

// Running is one side of sls run after it has started listening.
type Running interface {
	Stop(ctx context.Context) error
}

// Starter launches one side. The context is cancelled after that side is stopped,
// and the daemon context is cancelled before the controller context.
type Starter func(ctx context.Context) (Running, error)

// Options wires the two sides. A nil starter skips that side.
type Options struct {
	StartController Starter
	StartDaemon     Starter
	// AfterController runs after the controller is listening and before the daemon starts.
	// running is nil when the controller is not started.
	AfterController func(ctx context.Context, running Running) error
}

// Run starts the controller, then the daemon, and on ctx cancellation stops the daemon first.
func Run(ctx context.Context, opts Options) error {
	if opts.StartController == nil && opts.StartDaemon == nil {
		return errors.New("run: no controller or daemon to start")
	}
	if ctx == nil {
		ctx = context.Background()
	}

	ctrlCtx, ctrlCancel := context.WithCancel(context.Background())
	defer ctrlCancel()

	var ctrl Running
	if opts.StartController != nil {
		var err error
		ctrl, err = opts.StartController(ctrlCtx)
		if err != nil {
			return err
		}
	}
	if opts.AfterController != nil {
		if err := opts.AfterController(ctx, ctrl); err != nil {
			return join(err, stop(ctrl))
		}
	}

	daemonCtx, daemonCancel := context.WithCancel(context.Background())
	defer daemonCancel()

	var daemon Running
	if opts.StartDaemon != nil {
		var err error
		daemon, err = opts.StartDaemon(daemonCtx)
		if err != nil {
			return join(err, stop(ctrl))
		}
	}

	<-ctx.Done()
	daemonCancel()
	daemonErr := stop(daemon)
	ctrlCancel()
	return join(daemonErr, stop(ctrl))
}

func stop(running Running) error {
	if running == nil {
		return nil
	}
	return running.Stop(context.Background())
}

func join(errs ...error) error {
	return errors.Join(errs...)
}
