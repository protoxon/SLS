package server

import (
	"context"
	"time"

	"github.com/apex/log"
)

// The delay before retrying a server that failed to load doubles from
// unloadedRetryStart up to unloadedRetryMax.
const (
	unloadedRetryStart = time.Second
	unloadedRetryMax   = 5 * time.Minute
)

// RetryUnloaded keeps trying to load the servers that failed during Sync until
// ctx is done. A server that loads is restored to its previous state, which
// attaches to a container that kept running.
func (m *Manager) RetryUnloaded(ctx context.Context) {
	r := newUnloadedRetrier(m)
	ticker := time.NewTicker(r.start)
	defer ticker.Stop()
	for {
		select {
		case <-ctx.Done():
			return
		case now := <-ticker.C:
			loaded := r.pass(ctx, now)
			if len(loaded) == 0 {
				continue
			}
			states, err := m.ReadStates()
			if err != nil {
				log.WithField("error", err).Error("failed to retrieve locally cached server states from disk, assuming all servers in offline state")
			}
			// A restore can wait on Docker or start the server, so one slow
			// server must not hold up the others or the next pass.
			for _, s := range loaded {
				s.Log().Info("loaded server that failed to load during sync")
				go m.restore(ctx, s, states)
			}
		}
	}
}

type retryState struct {
	delay time.Duration
	next  time.Time
}

type unloadedRetrier struct {
	m          *Manager
	start, max time.Duration
	due        map[string]retryState
}

func newUnloadedRetrier(m *Manager) *unloadedRetrier {
	return &unloadedRetrier{
		m:     m,
		start: unloadedRetryStart,
		max:   unloadedRetryMax,
		due:   make(map[string]retryState),
	}
}

// pass tries each unloaded server whose delay has passed and returns the ones
// that loaded. A server seen for the first time waits one delay, since Sync
// has just failed to load it.
func (r *unloadedRetrier) pass(ctx context.Context, now time.Time) []*Server {
	r.m.mutex.RLock()
	pending := make(map[string]unloadedServer, len(r.m.unloaded))
	for id, u := range r.m.unloaded {
		pending[id] = u
	}
	r.m.mutex.RUnlock()

	for id := range r.due {
		if _, ok := pending[id]; !ok {
			delete(r.due, id)
		}
	}

	var loaded []*Server
	for id, u := range pending {
		st, ok := r.due[id]
		if !ok {
			r.due[id] = retryState{delay: r.start, next: now.Add(r.start)}
			continue
		}
		if now.Before(st.next) {
			continue
		}
		if _, live := r.m.Get(id); live {
			r.m.dropUnloaded(id)
			delete(r.due, id)
			continue
		}
		s, err := r.m.InitServer(ctx, u.cfg)
		if err != nil {
			st.delay = min(st.delay*2, r.max)
			st.next = now.Add(st.delay)
			r.due[id] = st
			r.m.setUnloadedErr(id, err)
			log.WithField("server", id).WithField("error", err).Debug("server still fails to load")
			continue
		}
		r.m.dropUnloaded(id)
		delete(r.due, id)
		loaded = append(loaded, s)
	}
	return loaded
}

func (m *Manager) dropUnloaded(id string) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	delete(m.unloaded, id)
}

func (m *Manager) setUnloadedErr(id string, err error) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	if u, ok := m.unloaded[id]; ok {
		u.err = err
		m.unloaded[id] = u
	}
}
