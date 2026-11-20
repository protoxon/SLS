package server

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"sync"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/docker/docker/client"
	"github.com/gammazero/workerpool"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/daemon/environment/docker"
	"protoxon.com/sls/daemon/internal/overlay"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/daemon/oras/store"
	"protoxon.com/sls/daemon/remote"
	"protoxon.com/sls/daemon/server/filesystem"
	"protoxon.com/sls/daemon/system"
	"protoxon.com/sls/internal/api"
)

type Manager struct {
	mutex   sync.RWMutex
	client  remote.Client
	servers map[string]*Server // key = server ID
	volumes *store.Store

	// unloaded holds servers the controller lists that failed to load during
	// the last Sync. Their containers may still exist, so a delete must still
	// be able to reach them.
	unloaded map[string]unloadedServer
}

type unloadedServer struct {
	cfg models.ServerConfiguration
	err error
}

// NewManager returns a new server manager instance.
func NewManager(client remote.Client) *Manager {
	root := ""
	if cfg := config.Get(); cfg != nil {
		root = cfg.System.Volumes
	}
	st := store.New(root)
	st.SetCleanup(volumeCleanupPolicy())
	if root != "" {
		// Safe at boot: GC keeps any digest listed in volumes/.sls/servers/*.json
		// even when refs.json is missing or empty. unreferenced deletion waits
		// until a retain list has been saved.
		_ = st.GC()
	}
	m := &Manager{
		client:   client,
		servers:  make(map[string]*Server),
		volumes:  st,
		unloaded: make(map[string]unloadedServer),
	}
	system.SetSnapshotInUse(func(id string) bool {
		return snapshotInUse(m.All(), id)
	})
	return m
}

func (m *Manager) VolumeStore() *store.Store {
	return m.volumes
}

// CollectVolumes re-reads the cleanup policy and deletes idle artifact trees.
func (m *Manager) CollectVolumes() error {
	if m == nil || m.volumes == nil || m.volumes.Root == "" {
		return nil
	}
	m.volumes.SetCleanup(volumeCleanupPolicy())
	return m.volumes.GC()
}

func volumeCleanupPolicy() store.CleanupPolicy {
	cfg := config.Get()
	if cfg == nil {
		return store.CleanupPolicy{}
	}
	return store.CleanupPolicy{
		Mode:  cfg.System.Volume.Cleanup.Policy,
		After: cfg.System.Volume.Cleanup.AfterDuration,
	}
}

// Add a server to the collection
func (m *Manager) Add(server *Server) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	server.BaseReinstallAllowed = m.baseReinstallAllowed
	m.servers[server.id] = server
}

// baseReinstallAllowed reports whether every server on this node sharing basePath
// is offline so the installed artifact may be reinstalled.
func (m *Manager) baseReinstallAllowed(basePath string) bool {
	clean := filepath.Clean(basePath)
	if clean == "" {
		return true
	}

	m.mutex.RLock()
	defer m.mutex.RUnlock()

	for _, s := range m.servers {
		if s.sharedBasePath() != clean {
			continue
		}
		if s.Environment.State() != environment.ProcessOfflineState {
			return false
		}
	}
	return true
}

// Get returns a single server instance and a boolean value indicating if it was
// found in the global collection or not.
func (m *Manager) Get(id string) (*Server, bool) {
	match := m.Find(func(server *Server) bool {
		return server.id == id
	})
	return match, match != nil
}

func (m *Manager) Client() remote.Client {
	return m.client
}

// Find returns a single element from the collection matching the filter. If
// nothing is found, a nil result is returned.
func (m *Manager) Find(filter func(match *Server) bool) *Server {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	for _, server := range m.servers {
		if filter(server) {
			return server
		}
	}
	return nil
}

// Remove removes a server from the collection by its ID.
func (m *Manager) Remove(id string) {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	delete(m.servers, id)
}

// addNew inserts the server unless that id is already present.
func (m *Manager) addNew(s *Server) bool {
	m.mutex.Lock()
	defer m.mutex.Unlock()
	if _, ok := m.servers[s.id]; ok {
		return false
	}
	m.servers[s.id] = s
	return true
}

// All returns a snapshot of all servers managed by this instance.
func (m *Manager) All() []*Server {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	servers := make([]*Server, 0, len(m.servers))
	for _, s := range m.servers {
		servers = append(servers, s)
	}
	return servers
}

// CgroupSamples reads per-server cgroup counters for the heartbeat.
func (m *Manager) CgroupSamples() []api.ServerSample {
	var out []api.ServerSample
	for _, s := range m.All() {
		if s == nil || s.Environment == nil || s.Environment.State() == environment.ProcessOfflineState {
			continue
		}
		sampler, ok := s.Environment.(interface {
			SampleCgroup() (api.ServerSample, bool)
		})
		if !ok {
			continue
		}
		sample, ok := sampler.SampleCgroup()
		if !ok {
			continue
		}
		sample.ID = s.ID()
		out = append(out, sample)
	}
	return out
}

// InitServer initializes a server using the provided server configuration data
func (m *Manager) InitServer(ctx context.Context, req models.ServerConfiguration) (*Server, error) {
	return m.initServer(ctx, req, false)
}

// initServer builds and adds the server. Teardown mode skips the checks that
// only matter for running it, the server folder and the volume registry, so a
// server whose files are gone can still be deleted.
func (m *Manager) initServer(ctx context.Context, req models.ServerConfiguration, teardown bool) (*Server, error) {
	if ctx == nil {
		ctx = context.Background()
	}
	if existing, ok := m.Get(req.Id); ok && existing != nil {
		return existing, nil
	}
	s, err := New(m.client)
	if err != nil {
		return nil, err
	}
	s.volumeStore = m.volumes

	// This will delete the server if it does not persist and any of the following steps fail
	created := false
	defer func() {
		if !created {
			s.Events().Destroy()
			s.DestroyAllSinks()
		}
	}()

	s.persists = req.Persists
	s.Config().SkipInstallScripts = req.SkipInstallScript
	s.Remove = func() {
		m.Remove(s.id)
	}
	s.Config().Build = environment.Limits(req.Limits)
	s.Config().Allocations = environment.Allocations(req.Allocations)
	s.id = req.Id

	// Replace the server.build.default.port variable with the servers actual port
	// todo add support for other variables in the invocation
	invocation := req.Invocation
	invocation = strings.ReplaceAll(invocation, "{{server.build.default.port}}", fmt.Sprintf("%d", s.Config().Allocations.DefaultMapping.Port))

	s.Config().Invocation = invocation
	s.SetProcessConfiguration(req.ProcessConfiguration)
	s.Config().Container.Image = req.Image
	s.Config().SoftwareVersion = req.SoftwareVersion

	// Get the path of the base server folder
	serverFolder := filepath.Join(config.Get().System.Servers, req.ServerFolder)

	// If the server does not have an installation script or is configured to skip it check to ensure
	// that the server folder exists before proceeding that way if it doesn't exist we can send an error back to the user
	if !teardown && (!req.HasInstallScript || req.SkipInstallScript) {
		if exists, err := overlay.DirExists(serverFolder); err != nil {
			return nil, errors.Wrapf(err, "failed to check server folder: %s", serverFolder)
		} else if !exists {
			return nil, errors.Wrapf(ErrServerFolderNotFound,
				"server folder does not exist: either add an install script to your software configuration or manually create the server folder. path=%s", serverFolder)
		}
	}

	// Create the path to the servers volume
	volume := filepath.Join(config.Get().System.Data, s.id)

	// create the overlay volume
	ov, err := filesystem.NewOverlayVolume(filepath.Join(config.Get().System.RootDirectory, "internal", "overlay", s.id), volume, serverFolder)
	if err != nil {
		return nil, err
	}

	// Apply custom host mounts from the state configuration (validated against AllowedMounts in s.Mounts()).
	mounts := make([]Mount, 0, len(req.State.Mounts))
	for _, m := range req.State.Mounts {
		mounts = append(mounts, Mount(environment.Mount{
			Target:   m.Target,
			Source:   m.Source,
			ReadOnly: m.ReadOnly,
		}))
	}
	s.cfg.Mounts = mounts

	// Set environment variables from the state configuration
	if len(req.State.Env) > 0 {
		envVars := make(environment.Variables, len(req.State.Env))
		for k, v := range req.State.Env {
			envVars[k] = v
		}
		s.cfg.EnvVars = envVars
	}

	s.volumes = append([]models.Volume(nil), req.State.Volumes...)
	s.snapshots = append([]api.SnapshotMount(nil), req.Snapshots...)
	s.softwareID = req.SoftwareId
	s.serverFolder = req.ServerFolder
	if err := s.validateVolumes(); err != nil {
		return nil, err
	}
	if !teardown {
		if err := s.probeVolumes(ctx); err != nil {
			return nil, err
		}
	}

	// Base overlay only. Artifact pull and volume lowerdirs happen on first start.
	ov.NewOverlay(system.PathId("/"), []string{serverFolder}, volume)

	// Set files to copy into the server filesystem
	// These will be copied when the server starts
	s.cfg.Copy = req.State.Copy

	// create the filesystem
	// denylist is not used for now so it is set to nil
	s.fs, err = filesystem.New(volume, ov, s.DiskSpace(), nil)
	if err != nil {
		return nil, errors.WithStackIf(err)
	}

	// set the servers environment settings
	settings := environment.Settings{
		Mounts:      s.Mounts(),
		Allocations: s.Config().Allocations,
		Limits:      s.cfg.Build,
		Labels:      s.cfg.Labels,
	}

	envCfg := environment.NewConfiguration(settings, s.GetEnvironmentVariables())
	meta := docker.Metadata{
		Image: s.Config().Container.Image,
		Stop:  req.ProcessConfiguration.Stop,
	}

	env, err := docker.New(s.id, &meta, envCfg)
	if err != nil {
		return nil, err
	}

	s.Environment = env
	s.StartEventListeners()

	// Indicate that the server was successfully created so that it is not removed by the defer function
	if !m.addNew(s) {
		created = false
		if existing, ok := m.Get(s.id); ok {
			return existing, nil
		}
	}
	created = true
	return s, nil
}

// PersistStates writes the current environment states to the disk for each
// server that persists. This is generally called at a specific interval defined in the root
// runner command to avoid hammering disk I/O when tons of server switch states
// at once. It is fine if this file falls slightly out of sync, it is just here
// to make recovering from an unexpected system reboot a little easier.
func (m *Manager) PersistStates() error {
	states := map[string]string{}
	for _, s := range m.All() {
		if s.persists {
			// only write the state for servers that persist
			states[s.ID()] = s.Environment.State()
		}
	}
	data, err := json.Marshal(states)
	if err != nil {
		return errors.WithStack(err)
	}
	if err := os.WriteFile(config.Get().System.GetStatesPath(), data, 0o644); err != nil {
		return errors.WithStack(err)
	}
	return nil
}

// ReadStates returns the state of the servers.
func (m *Manager) ReadStates() (map[string]string, error) {
	f, err := os.OpenFile(config.Get().System.GetStatesPath(), os.O_RDONLY|os.O_CREATE, 0o644)
	if err != nil {
		return nil, errors.WithStack(err)
	}
	defer f.Close()
	var states map[string]string
	if err := json.NewDecoder(f).Decode(&states); err != nil && err != io.EOF {
		return nil, errors.WithStack(err)
	}
	out := make(map[string]string, 0)
	// Only return states for servers that we're currently tracking in the system.
	for id, state := range states {
		if _, ok := m.Get(id); ok {
			out[id] = state
		}
	}
	return out, nil
}

// ReportStates sends each server's current process state to Controller.
// A failed report is logged and the remaining servers are still reported.
// This does not go through OnStateChange, which treats a transition to offline
// as a crash and skips the first offline broadcast.
func (m *Manager) ReportStates(ctx context.Context) {
	for _, s := range m.All() {
		if s.Environment == nil {
			s.Log().Warn("skipping state report for server with no environment")
			continue
		}
		if s.client == nil {
			s.Log().Warn("skipping state report for server with no client")
			continue
		}
		if err := s.client.StatusUpdate(ctx, s.Environment.State(), s.ID()); err != nil {
			s.Log().WithError(err).Warn("failed to report server state")
		}
	}
}

// LoadError returns why a server the controller lists failed to load during
// the last Sync, or nil if it did not fail.
func (m *Manager) LoadError(id string) error {
	m.mutex.RLock()
	defer m.mutex.RUnlock()
	return m.unloaded[id].err
}

// LoadForDelete loads a server that failed to load during Sync, skipping the
// checks that only matter for running it, so it can be deleted.
func (m *Manager) LoadForDelete(ctx context.Context, id string) (*Server, bool) {
	m.mutex.RLock()
	u, ok := m.unloaded[id]
	m.mutex.RUnlock()
	if !ok {
		return nil, false
	}
	s, err := m.initServer(ctx, u.cfg, true)
	if err != nil {
		log.WithField("server", id).WithField("error", err).Error("failed to load server for delete")
		return nil, false
	}
	m.dropUnloaded(id)
	return s, true
}

// Sync syncs all servers on the daemon with controller
func (m *Manager) Sync(ctx context.Context) error {
	log.Info("fetching list of servers from API")
	servers, err := m.client.GetServers(ctx, config.Get().RemoteQuery.BootServersPerPage)
	if err != nil {
		if !remote.IsRequestError(err) {
			return errors.WithStackIf(err)
		}
		return errors.WrapIf(err, "manager: failed to retrieve server configurations")
	}

	start := time.Now()
	log.WithField("total_configs", len(servers)).Info("processing servers returned by the API")

	m.loadConfigs(ctx, servers)

	err = m.LoadServers(ctx)
	if err != nil {
		return err
	}

	diff := time.Now().Sub(start)
	log.WithField("duration", fmt.Sprintf("%s", diff)).Info("finished processing server configurations")

	return nil
}

// loadConfigs loads every server the controller lists and replaces the
// unloaded set with the ones that failed.
func (m *Manager) loadConfigs(ctx context.Context, servers []models.ServerConfiguration) {
	var failedMu sync.Mutex
	failed := make(map[string]unloadedServer)
	pool := workerpool.New(runtime.NumCPU())
	log.Debugf("using %d workerpools to instantiate server instances", runtime.NumCPU())
	for _, data := range servers {
		s := data
		pool.Submit(func() {
			_, err := m.InitServer(ctx, s)
			if err != nil {
				log.WithField("server", s.Id).WithField("error", err).Error("failed to load server, skipping...")
				failedMu.Lock()
				failed[s.Id] = unloadedServer{cfg: s, err: err}
				failedMu.Unlock()
				return
			}
		})
	}

	// Wait until we've processed all the configuration files in the directory
	// before continuing.
	pool.StopWait()

	m.mutex.Lock()
	m.unloaded = failed
	m.mutex.Unlock()
}

func (m *Manager) LoadServers(ctx context.Context) error {
	// Create a new workerpool that limits us to 4 servers being bootstrapped at a time
	// on the daemon. This allows us to ensure the environment exists, write configurations,
	// and reboot processes without causing a slow-down due to sequential booting.
	pool := workerpool.New(4)
	states, err := m.ReadStates()
	if err != nil {
		log.WithField("error", err).Error("failed to retrieve locally cached server states from disk, assuming all servers in offline state")
	}
	for _, serv := range m.All() {
		s := serv
		pool.Submit(func() {
			m.restore(ctx, s, states)
		})
	}
	return nil
}

// restore brings a newly loaded server back to its previous state: it attaches
// to a running container, restarts a server that was running, or deletes an
// offline server that does not persist.
func (m *Manager) restore(ctx context.Context, s *Server, states map[string]string) {
	// For each server we encounter make sure the root data directory exists.
	if err := s.EnsureDataDirectoryExists(); err != nil {
		s.Log().Error("could not create root data directory for server: not loading server...")
		return
	}

	var st string
	if state, exists := states[s.ID()]; exists {
		st = state
	}

	// Use a timed context here to avoid booting issues where Docker hangs for a
	// specific container that would cause the daemon to be un-bootable until the entire
	// machine is rebooted. It is much better for us to just have a single failed
	// server instance than an entire offline node.
	ctx, cancel := context.WithTimeout(ctx, time.Second*30)
	defer cancel()

	r, err := s.Environment.IsRunning(ctx)
	// We ignore missing containers because we don't want to actually block booting of the daemon at this
	// point. If we didn't do this, and you pruned all the images and then started the daemon you could
	// end up waiting a long period of time for all the images to be re-pulled on the daemon boot rather
	// than when the server itself is started.
	if err != nil && !client.IsErrNotFound(err) {
		s.Log().WithField("error", err).Error("error checking server environment status")
	}

	// Servers that do not persist should be deleted on daemon boot if they're offline.
	if !s.persists {
		if !r {
			go s.Delete()
			return
		}
		s.Log().Info("configuring server environment")
		s.Environment.SetState(environment.ProcessRunningState)
		if err := s.Environment.Attach(ctx); err != nil {
			s.Log().WithField("error", err).Warn("failed to attach to running server environment")
		}
		return
	}

	s.Log().Info("configuring server environment and restoring to previous state")
	switch {
	case !r && (st == environment.ProcessRunningState || st == environment.ProcessStartingState):
		// The server was previously running, so start it again and pick up where the daemon left off.
		// If the environment does not exist at all it is created by the normal start flow. After a
		// catastrophic machine crash that wiped the Docker images this makes for a slow boot.
		if err := s.HandlePowerAction(PowerActionStart); err != nil {
			s.Log().WithField("error", err).Warn("failed to return server to running state")
		}
	case r || s.IsRunning():
		// If the server is currently running on Docker, mark the process as being in that state.
		// We never want to stop an instance that is currently running external from the daemon since
		// that is a good way of keeping things running even if the daemon gets in a very corrupted state.
		//
		// This will also validate that a server process is running if the last tracked state we have
		// is that it was running, but we see that the container process is not currently running.
		s.Log().Info("detected server is running, re-attaching to process...")
		s.Environment.SetState(environment.ProcessRunningState)
		if err := s.Environment.Attach(ctx); err != nil {
			s.Log().WithField("error", err).Warn("failed to attach to running server environment")
		}
	default:
		// At this point we've determined that the server should indeed be in an offline state, so we'll
		// make a call to set that state just to ensure we don't ever accidentally end up with some invalid
		// state being tracked.
		s.Environment.SetState(environment.ProcessOfflineState)
	}

	if state := s.Environment.State(); state == environment.ProcessStartingState || state == environment.ProcessRunningState {
		s.Log().Debug("re-syncing server configuration for already running server")
		if err := s.Sync(); err != nil {
			s.Log().WithError(err).Error("failed to re-sync server configuration")
		}
	}
}
