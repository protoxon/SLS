package registry

import (
	"context"
	"fmt"
	"time"

	"github.com/apex/log"
	"github.com/distribution/distribution/v3/registry/storage"
	"github.com/distribution/distribution/v3/registry/storage/driver/factory"
)

// Schedule arms (or resets) the debounced garbage collection timer.
// If a GC run is already in progress, another run is queued when it finishes.
func (r *Registry) Schedule() {
	r.mu.Lock()
	defer r.mu.Unlock()

	if r.running {
		r.pending = true
		return
	}
	r.armTimerLocked()
}

func (r *Registry) armTimerLocked() {
	if r.timer != nil {
		r.timer.Stop()
	}
	delay := r.debounce
	if delay <= 0 {
		delay = defaultGCDebounce
	}
	r.timer = time.AfterFunc(delay, r.fire)
}

func (r *Registry) fire() {
	r.mu.Lock()
	if r.running {
		r.pending = true
		r.mu.Unlock()
		return
	}
	r.running = true
	r.timer = nil
	run := r.runGC
	r.mu.Unlock()

	if run == nil {
		run = r.markAndSweep
	}

	r.gate.Lock()
	err := run(context.Background())
	r.gate.Unlock()

	r.mu.Lock()
	r.running = false
	pending := r.pending
	r.pending = false
	if pending {
		r.armTimerLocked()
	}
	r.mu.Unlock()

	if err != nil {
		log.WithError(err).Error("embedded registry garbage collection failed")
	}
}

func (r *Registry) markAndSweep(ctx context.Context) error {
	driver, err := factory.Create(ctx, "filesystem", map[string]any{
		"rootdirectory": r.root,
	})
	if err != nil {
		return fmt.Errorf("registry gc driver: %w", err)
	}
	reg, err := storage.NewRegistry(ctx, driver)
	if err != nil {
		return fmt.Errorf("registry gc namespace: %w", err)
	}
	if err := storage.MarkAndSweep(ctx, driver, reg, storage.GCOpts{
		RemoveUntagged: true,
		Quiet:          true,
	}); err != nil {
		return fmt.Errorf("registry mark and sweep: %w", err)
	}
	return nil
}
