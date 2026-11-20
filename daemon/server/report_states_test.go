package server

import (
	"context"
	"errors"
	"sync"
	"testing"
	"time"

	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/daemon/oras/store"
	"protoxon.com/sls/daemon/remote"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/events"
)

func TestReportStatesPostsCurrentEnvironmentState(t *testing.T) {
	rec := &recordingClient{fail: map[string]error{
		"broken": errors.New("node unreachable"),
	}}
	m := &Manager{servers: map[string]*Server{}}
	m.Add(&Server{
		id:          "live",
		client:      rec,
		Environment: &reportEnv{state: environment.ProcessRunningState},
	})
	m.Add(&Server{
		id:          "stopped",
		client:      rec,
		Environment: &reportEnv{state: environment.ProcessOfflineState},
	})
	m.Add(&Server{
		id:          "broken",
		client:      rec,
		Environment: &reportEnv{state: environment.ProcessStoppingState},
	})

	m.ReportStates(context.Background())

	got := map[string]string{}
	for _, update := range rec.snapshot() {
		got[update.id] = update.status
	}
	if got["live"] != environment.ProcessRunningState || got["stopped"] != environment.ProcessOfflineState || got["broken"] != environment.ProcessStoppingState {
		t.Fatalf("reported states = %v", got)
	}
	if len(got) != 3 {
		t.Fatalf("reported %d servers, want 3", len(got))
	}
}

type statusReport struct {
	id     string
	status string
}

type recordingClient struct {
	mu      sync.Mutex
	updates []statusReport
	fail    map[string]error
}

func (c *recordingClient) snapshot() []statusReport {
	c.mu.Lock()
	defer c.mu.Unlock()
	out := make([]statusReport, len(c.updates))
	copy(out, c.updates)
	return out
}

func (c *recordingClient) StatusUpdate(_ context.Context, status string, id string) error {
	c.mu.Lock()
	defer c.mu.Unlock()
	c.updates = append(c.updates, statusReport{id: id, status: status})
	if c.fail != nil {
		return c.fail[id]
	}
	return nil
}

func (c *recordingClient) Register(context.Context) error { return nil }
func (c *recordingClient) Start()                         {}
func (c *recordingClient) Heartbeat(context.Context)      {}
func (c *recordingClient) Disconnect(context.Context)     {}
func (c *recordingClient) CrashReport(context.Context, remote.CrashData, string) error {
	return nil
}
func (c *recordingClient) ServerDeleted(context.Context, string, string) error { return nil }
func (c *recordingClient) GetServers(context.Context, int) ([]models.ServerConfiguration, error) {
	return nil, nil
}
func (c *recordingClient) GetServerConfiguration(context.Context, string) (models.ServerConfiguration, error) {
	return models.ServerConfiguration{}, nil
}
func (c *recordingClient) GetInstallationScript(context.Context, string) (remote.InstallationScript, error) {
	return remote.InstallationScript{}, nil
}
func (c *recordingClient) SetInstallationStatus(context.Context, string, string) error { return nil }
func (c *recordingClient) GetRegistry(context.Context) (models.RegistrySnapshot, error) {
	return models.RegistrySnapshot{}, nil
}
func (c *recordingClient) SyncRegistry(context.Context) error { return nil }
func (c *recordingClient) SyncRegistryIfChanged(context.Context, string) error {
	return nil
}
func (c *recordingClient) SetOnConnected(func(context.Context))                       {}
func (c *recordingClient) SetVolumeStore(*store.Store)                                {}
func (c *recordingClient) ReportSnapshot(context.Context, api.SnapshotProgress) error { return nil }

type reportEnv struct {
	state string
}

func (e *reportEnv) Type() string                       { return "stub" }
func (e *reportEnv) Config() *environment.Configuration { return &environment.Configuration{} }
func (e *reportEnv) Events() *events.Bus                { return nil }
func (e *reportEnv) Exists() (bool, error)              { return true, nil }
func (e *reportEnv) IsRunning(context.Context) (bool, error) {
	return e.state == environment.ProcessRunningState, nil
}
func (e *reportEnv) InSituUpdate() error                 { return nil }
func (e *reportEnv) OnBeforeStart(context.Context) error { return nil }
func (e *reportEnv) Start(context.Context) error         { return nil }
func (e *reportEnv) Stop(context.Context) error          { return nil }
func (e *reportEnv) Pause(context.Context) error         { return nil }
func (e *reportEnv) Unpause(context.Context) error       { return nil }
func (e *reportEnv) WaitForStop(context.Context, time.Duration, bool) error {
	return nil
}
func (e *reportEnv) Terminate(context.Context, string) error { return nil }
func (e *reportEnv) Destroy() error                          { return nil }
func (e *reportEnv) ExitState() (uint32, bool, error)        { return 0, false, nil }
func (e *reportEnv) Create() error                           { return nil }
func (e *reportEnv) Attach(context.Context) error            { return nil }
func (e *reportEnv) SendCommand(string) error                { return nil }
func (e *reportEnv) Readlog(int) ([]string, error)           { return nil, nil }
func (e *reportEnv) State() string                           { return e.state }
func (e *reportEnv) SetState(state string)                   { e.state = state }
func (e *reportEnv) Uptime(context.Context) (int64, error)   { return 0, nil }
func (e *reportEnv) SetLogCallback(func([]byte))             {}
