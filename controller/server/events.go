package server

import (
	"github.com/apex/log"
	"protoxon.com/sls/controller/system"
	"protoxon.com/sls/internal/events"
)

const (
	StatusEvent  = "status"
	CrashEvent   = "crash"
	DeletedEvent = "deleted"
	InstallEvent = "install"

	InstallStatusInstalling = "installing"
	InstallStatusCompleted  = "completed"
	InstallStatusFailed     = "failed"
)

// HandleInstallStatus publishes an install phase on the server and global event buses.
func (s *Server) HandleInstallStatus(phase string) {
	s.PublishEvent(InstallEvent, phase)
}

// Events returns the server's emitter instance.
func (s *Server) Events() *events.Bus {
	s.emitterLock.Lock()
	defer s.emitterLock.Unlock()

	if s.emitter == nil {
		s.emitter = events.NewBus()
	}

	return s.emitter
}

// PublishEvent publishes an event to the server's event bus and the global event bus.
func (s *Server) PublishEvent(event string, payload any) {
	s.Events().Publish(event, payload)
	// wrap the global event with the servers id
	s.GlobalEvents().Publish(event, struct {
		ServerID string      `json:"server_id"`
		Payload  interface{} `json:"payload"`
	}{
		ServerID: s.id,
		Payload:  payload,
	})
}

// Sink returns the instantiated and named sink for a server. If the sink has
// not been configured yet this function will cause a panic condition.
func (s *Server) Sink(name system.SinkName) *system.SinkPool {
	sink, ok := s.sinks[name]
	if !ok {
		s.Log().Fatalf("attempt to access nil sink: %s", name)
	}
	return sink
}

// DestroyAllSinks iterates over all the sinks configured for the server and
// destroys their instances. Note that this will cause a panic if you attempt
// to call Server.Sink() again after. This function is only used when a server
// is being deleted from the system.
func (s *Server) DestroyAllSinks() {
	s.Log().Info("destroying all registered sinks for server instance")
	for _, sink := range s.sinks {
		sink.Destroy()
	}
}

// Events returns the server managers emitter instance.
func (m *Manager) Events() *events.Bus {
	m.emitterLock.Lock()
	defer m.emitterLock.Unlock()

	if m.emitter == nil {
		m.emitter = events.NewBus()
	}

	return m.emitter
}

// Sink returns the instantiated and named sink for a server. If the sink has
// not been configured yet this function will cause a panic condition.
func (m *Manager) Sink(name system.SinkName) *system.SinkPool {
	sink, ok := m.sinks[name]
	if !ok {
		log.Fatalf("server/manager: attempt to access nil sink: %s", name)
	}
	return sink
}
