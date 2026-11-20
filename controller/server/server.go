package server

import (
	"context"
	"sync"
	"time"

	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/server/repository"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/controller/system"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/events"
)

// Server represents a managed server instance controlled by SLS.
type Server struct {
	id          string
	nodeName    string
	nodeId      string
	blueprintId string
	Overrides   *models.ServerOverrides
	statusMu    sync.Mutex
	status      Status
	emitterLock sync.Mutex

	// Events emitted by the server instance.
	emitter      *events.Bus
	GlobalEvents func() *events.Bus
	sinks        map[system.SinkName]*system.SinkPool

	// Removes the server from the manager
	Remove func()

	// The crash handler for this server instance.
	crasher CrashHandler

	// Configuration is the servers runtime configuration information.
	// cfgMu guards Configuration.
	cfgMu         sync.RWMutex
	Configuration *models.ServerConfiguration

	// usage is the learned memory use the scheduler charges against.
	// usageRunning mirrors whether the status is running. usageAt is where
	// observed running time was last counted to, zero while not running.
	// usageDirty marks usage that has not been written to the database.
	usageMu      sync.Mutex
	usage        models.ServerUsage
	usageRunning bool
	usageAt      time.Time
	usageDirty   bool

	// InstallScript is copied from the selected software at creation time.
	InstallScript *software.InstallationScript

	// sc is the dedicated client used to interact with server-specific API endpoints.
	// A server client can only access its own endpoints and control itself.
	sc client.ServerClient

	// releaseAlloc returns the server's port to the node allocator. It is not
	// part of the configuration document sent to the daemon.
	releaseAlloc func()

	// destroyOnce guards destroy. The node's deleted event and the delete
	// request both clean up, and a second port release could free a port
	// another server now holds.
	destroyOnce sync.Once
}

// GetServerConfiguration returns the runtime configuration info for the server.
func (s *Server) GetServerConfiguration() *models.ServerConfiguration {
	s.cfgMu.RLock()
	defer s.cfgMu.RUnlock()
	if s.Configuration == nil {
		return &models.ServerConfiguration{Id: s.Id()}
	}
	cfg := *s.Configuration
	cfg.Id = s.Id()
	return &cfg
}

// stampedLimits returns a copy of the stamped limits.
func (s *Server) stampedLimits() (api.Limits, bool) {
	s.cfgMu.RLock()
	defer s.cfgMu.RUnlock()
	if s.Configuration == nil {
		return api.Limits{}, false
	}
	return s.Configuration.Limits, true
}

func (s *Server) setConfiguration(cfg *models.ServerConfiguration) {
	s.cfgMu.Lock()
	s.Configuration = cfg
	s.cfgMu.Unlock()
}

func (s *Server) allocations() *environment.Allocations {
	s.cfgMu.RLock()
	defer s.cfgMu.RUnlock()
	if s.Configuration == nil {
		return nil
	}
	alloc := s.Configuration.Allocations
	return &alloc
}

// bindAllocationRelease remembers how to return this server's port. The
// address and port are copied so a later edit of the configuration cannot
// release a different allocation.
func (s *Server) bindAllocationRelease(release func(address string, port int)) {
	if s == nil || release == nil {
		if s != nil {
			s.releaseAlloc = nil
		}
		return
	}
	s.cfgMu.RLock()
	if s.Configuration == nil {
		s.cfgMu.RUnlock()
		s.releaseAlloc = nil
		return
	}
	ip := s.Configuration.Allocations.DefaultMapping.Ip
	port := s.Configuration.Allocations.DefaultMapping.Port
	s.cfgMu.RUnlock()
	s.releaseAlloc = func() { release(ip, port) }
}

func (s *Server) Id() string {
	return s.id
}

func (s *Server) NodeName() string {
	return s.nodeName
}
func (s *Server) NodeId() string {
	return s.nodeId
}
func (s *Server) BlueprintId() string {
	return s.blueprintId
}

// SetStatus updates the server's status and publishes the change.
// An unchanged status is ignored so a reconnect does not emit a duplicate event.
func (s *Server) SetStatus(status Status) {
	s.statusMu.Lock()
	if s.status == status {
		s.statusMu.Unlock()
		return
	}
	s.status = status
	s.statusMu.Unlock()
	s.noteStatus(status, time.Now())
	s.PublishEvent(StatusEvent, status)
}

// Client returns the underlying server client used to interact with remote endpoints.
func (s *Server) Client() client.ServerClient {
	return s.sc
}

// NewWithClient builds a server bound to an existing node client.
func NewWithClient(id, nodeID string, sc client.ServerClient) *Server {
	return &Server{
		id:            id,
		nodeId:        nodeID,
		sc:            sc,
		Configuration: &models.ServerConfiguration{Id: id},
	}
}

// Stats fetches resource stats from the servers remote node.
func (s *Server) Stats(ctx context.Context, update bool) (models.ResourceUsage, error) {
	return s.Client().Stats(ctx, update)
}

// Power sends a power action request to the remote node.
func (s *Server) Power(ctx context.Context, request models.PowerAction) error {
	return s.Client().Power(ctx, request)
}

// Stop gracefully stops the server by sending a "stop" power action.
func (s *Server) Stop(ctx context.Context) error {
	return s.Power(ctx, models.PowerAction{Action: "stop"})
}

// Kill forcefully terminates the server by sending a "kill" power action.
func (s *Server) Kill(ctx context.Context) error {
	return s.Power(ctx, models.PowerAction{Action: "kill"})
}

// Pause pauses the server container (Docker pause). Server must be running.
func (s *Server) Pause(ctx context.Context) error {
	return s.Power(ctx, models.PowerAction{Action: "pause"})
}

// Unpause resumes a paused server container.
func (s *Server) Unpause(ctx context.Context) error {
	return s.Power(ctx, models.PowerAction{Action: "unpause"})
}

// Reset sends a request to reset the server on the node
// This will delete the servers overlay and restart the server
// If it is running
func (s *Server) Reset(ctx context.Context) error {
	return s.Client().Reset(ctx)
}

func (s *Server) Reinstall(ctx context.Context) error {
	return s.Client().Reinstall(ctx)
}

// Delete deletes the server from the daemon
func (s *Server) Delete(ctx context.Context) error {
	return s.Client().DeleteServer(ctx)
}

// GetStatus returns the server's most recently reported power status.
func (s *Server) GetStatus() Status {
	s.statusMu.Lock()
	defer s.statusMu.Unlock()
	return s.status
}

// GetRemoteStatus fetches the servers status from the remote node
func (s *Server) GetRemoteStatus(ctx context.Context) (Status, error) {
	return s.Client().Status(ctx)
}

// SendCommands sends an array of commands to the remote node.
func (s *Server) SendCommands(ctx context.Context, commands []string) error {
	return s.Client().Commands(ctx, commands)
}

// GetLogs fetches server logs from the remote node.
func (s *Server) GetLogs(ctx context.Context, page, perPage int) (gin.H, error) {
	return s.Client().Logs(ctx, page, perPage)
}

func (s *Server) InstallInfo(ctx context.Context) (models.InstallInfo, error) {
	return s.Client().InstallInfo(ctx)
}

func (s *Server) InstallLogs(ctx context.Context, page, perPage int) (gin.H, error) {
	return s.Client().InstallLogs(ctx, page, perPage)
}

// ServerData returns the ServerData model for this server.
// ServerData is the public API representation of a managed server.
func (s *Server) ServerData() models.ServerData {
	s.cfgMu.RLock()
	var softwareID, softwareVersion, image string
	var limits api.Limits
	var alloc *environment.Allocations
	if s.Configuration != nil {
		softwareID = s.Configuration.SoftwareId
		softwareVersion = s.Configuration.SoftwareVersion
		image = s.Configuration.Image
		limits = s.Configuration.Limits
		copied := s.Configuration.Allocations
		alloc = &copied
	}
	s.cfgMu.RUnlock()
	return models.ServerData{
		Id:              s.id,
		BlueprintId:     s.BlueprintId(),
		NodeId:          s.NodeId(),
		NodeName:        s.NodeName(),
		Overrides:       s.Overrides,
		SoftwareId:      softwareID,
		SoftwareVersion: softwareVersion,
		Image:           image,
		Limits:          environment.LimitOverridesFrom(limits),
		Allocations:     portAllocations(alloc),
	}
}

func portAllocations(in *environment.Allocations) *api.PortAllocations {
	if in == nil {
		return nil
	}
	out := &api.PortAllocations{
		ForceOutgoingIP: in.ForceOutgoingIP,
		Alias:           in.Alias,
		Mappings:        in.Mappings,
	}
	out.DefaultMapping.Ip = in.DefaultMapping.Ip
	out.DefaultMapping.Port = in.DefaultMapping.Port
	return out
}

func (s *Server) Log() *log.Entry {
	return log.WithField("server", s.Id())
}

// CleanupForDestroy removes the server from the controller and publishes the
// deleted event.
func (s *Server) CleanupForDestroy() {
	s.destroy(true, "")
}

// CleanupDeletedByNode is CleanupForDestroy for a server the node removed on
// its own. reason is included in the deleted event.
func (s *Server) CleanupDeletedByNode(reason string) {
	s.destroy(true, reason)
}

// discard removes a server whose create failed. No one has seen it, so no
// deleted event is published.
func (s *Server) discard() {
	s.destroy(false, "")
}

// destroy releases the port and removes the server from the manager and the
// database. Only the first call has any effect.
func (s *Server) destroy(announce bool, reason string) {
	s.destroyOnce.Do(func() {
		if announce {
			s.PublishEvent(DeletedEvent, api.ServerDeleted{Reason: reason})
		}
		s.Events().Destroy()
		s.DestroyAllSinks()
		if s.releaseAlloc != nil {
			s.releaseAlloc()
		}
		if s.Remove != nil {
			s.Remove()
		}
		if !database.Ready() {
			return
		}
		if err := repository.RemoveServer(s.Id()); err != nil {
			log.WithError(err).Errorf("failed to remove server %s from database.", s.Id())
		}
	})
}
