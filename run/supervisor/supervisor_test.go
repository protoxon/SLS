package supervisor

import (
	"context"
	"errors"
	"sync"
	"testing"
	"time"
)

type hook struct {
	stop func(context.Context) error
}

func (h hook) Stop(ctx context.Context) error {
	return h.stop(ctx)
}

func TestStopOrder(t *testing.T) {
	var mu sync.Mutex
	var order []string
	daemonStopped := make(chan struct{})
	started := make(chan struct{}, 2)
	ctx, cancel := context.WithCancel(context.Background())

	done := make(chan error, 1)
	go func() {
		done <- Run(ctx, Options{
			StartController: func(context.Context) (Running, error) {
				started <- struct{}{}
				return hook{stop: func(context.Context) error {
					select {
					case <-daemonStopped:
					default:
						t.Errorf("controller stopped before the daemon finished")
					}
					mu.Lock()
					order = append(order, "controller")
					mu.Unlock()
					return nil
				}}, nil
			},
			StartDaemon: func(context.Context) (Running, error) {
				started <- struct{}{}
				return hook{stop: func(context.Context) error {
					mu.Lock()
					order = append(order, "daemon")
					mu.Unlock()
					close(daemonStopped)
					return nil
				}}, nil
			},
		})
	}()

	<-started
	<-started
	cancel()

	select {
	case err := <-done:
		if err != nil {
			t.Fatal(err)
		}
	case <-time.After(2 * time.Second):
		t.Fatal("supervisor did not return")
	}
	if len(order) != 2 || order[0] != "daemon" || order[1] != "controller" {
		t.Fatalf("stop order = %v", order)
	}
}

func TestControllerOnlyStops(t *testing.T) {
	ctx, cancel := context.WithCancel(context.Background())
	started := make(chan struct{})
	stopped := make(chan struct{})
	done := make(chan error, 1)
	go func() {
		done <- Run(ctx, Options{
			StartController: func(context.Context) (Running, error) {
				started <- struct{}{}
				return hook{stop: func(context.Context) error {
					close(stopped)
					return nil
				}}, nil
			},
		})
	}()
	<-started
	cancel()
	select {
	case err := <-done:
		if err != nil {
			t.Fatal(err)
		}
	case <-time.After(2 * time.Second):
		t.Fatal("supervisor did not return")
	}
	select {
	case <-stopped:
	default:
		t.Fatal("controller was not stopped")
	}
}

func TestAfterControllerErrorStopsController(t *testing.T) {
	stopped := false
	daemonStarted := false
	err := Run(context.Background(), Options{
		StartController: func(context.Context) (Running, error) {
			return hook{stop: func(context.Context) error {
				stopped = true
				return nil
			}}, nil
		},
		AfterController: func(context.Context, Running) error {
			return errors.New("token")
		},
		StartDaemon: func(context.Context) (Running, error) {
			daemonStarted = true
			return hook{stop: func(context.Context) error { return nil }}, nil
		},
	})
	if err == nil {
		t.Fatal("expected error")
	}
	if !stopped {
		t.Fatal("controller was not stopped")
	}
	if daemonStarted {
		t.Fatal("daemon started after controller setup failed")
	}
}
