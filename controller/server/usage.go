package server

import (
	"time"

	"github.com/apex/log"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/server/repository"
	"protoxon.com/sls/internal/api"
)

const (
	// maxObservedGap caps the running time one heartbeat adds, so time a
	// server spent stopped, or a node spent silent, is not counted.
	maxObservedGap     = 30 * time.Second
	usageFlushInterval = 5 * time.Minute
)

// noteStatus starts the observed running time clock when the server becomes
// running and stops it when it leaves running.
func (s *Server) noteStatus(status Status, at time.Time) {
	s.usageMu.Lock()
	defer s.usageMu.Unlock()
	s.usageRunning = status == ProcessRunningState
	s.usageAt = time.Time{}
	if s.usageRunning {
		s.usageAt = at
	}
}

// observeUsage records one heartbeat sample of this server. The peak counts
// every sample, startup included. Observed time counts only while running.
func (s *Server) observeUsage(sample api.ServerSample, at time.Time) {
	s.usageMu.Lock()
	defer s.usageMu.Unlock()
	if peak := max(sample.MemoryCurrent, sample.MemoryPeak); peak > s.usage.PeakBytes {
		s.usage.PeakBytes = peak
		s.usageDirty = true
	}
	if !s.usageRunning {
		return
	}
	if !s.usageAt.IsZero() {
		if gap := at.Sub(s.usageAt); gap > 0 {
			s.usage.ObservedSeconds += min(gap, maxObservedGap).Seconds()
			s.usageDirty = true
		}
	}
	s.usageAt = at
}

// learnedUsage returns the highest memory use seen and the running time observed.
func (s *Server) learnedUsage() (uint64, time.Duration) {
	s.usageMu.Lock()
	defer s.usageMu.Unlock()
	return s.usage.PeakBytes, time.Duration(s.usage.ObservedSeconds * float64(time.Second))
}

func (s *Server) setUsage(usage models.ServerUsage) {
	s.usageMu.Lock()
	s.usage = usage
	s.usageMu.Unlock()
}

// takeDirtyUsage returns the usage and clears the dirty mark when it changed
// since the last call.
func (s *Server) takeDirtyUsage() (models.ServerUsage, bool) {
	s.usageMu.Lock()
	defer s.usageMu.Unlock()
	if !s.usageDirty {
		return models.ServerUsage{}, false
	}
	s.usageDirty = false
	return s.usage, true
}

func (s *Server) markUsageDirty() {
	s.usageMu.Lock()
	s.usageDirty = true
	s.usageMu.Unlock()
}

// ObserveUsage records a heartbeat's server samples against the servers
// placed on that node.
func (m *Manager) ObserveUsage(nodeID string, samples []api.ServerSample, at time.Time) {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	for _, sample := range samples {
		s := m.servers[sample.ID]
		if s == nil || s.nodeId != nodeID {
			continue
		}
		s.observeUsage(sample, at)
	}
}

// flushUsage writes learned usage that changed since the last flush.
func (m *Manager) flushUsage() {
	if !database.Ready() {
		return
	}
	for _, s := range m.All() {
		usage, ok := s.takeDirtyUsage()
		if !ok {
			continue
		}
		if err := repository.UpdateUsage(s.Id(), &usage); err != nil {
			s.markUsageDirty()
			log.WithError(err).WithField("server", s.Id()).Warn("failed to persist learned usage")
		}
	}
}

func (m *Manager) startUsageFlush() {
	go func() {
		ticker := time.NewTicker(usageFlushInterval)
		defer ticker.Stop()
		for range ticker.C {
			m.flushUsage()
		}
	}()
}
