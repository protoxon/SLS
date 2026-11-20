package server

import (
	"context"
	"os"
	"path/filepath"
	"testing"
	"time"

	"emperror.dev/errors"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/internal/process"
)

// unloadedTestManager sets up the daemon directories with the base folder
// paper/1 and returns a manager.
func unloadedTestManager(t *testing.T) (*Manager, string) {
	t.Helper()
	root := t.TempDir()
	for _, dir := range []string{"data", "volumes", "servers/paper/1"} {
		if err := os.MkdirAll(filepath.Join(root, dir), 0o755); err != nil {
			t.Fatal(err)
		}
	}
	prev := config.Get()
	cfg := &config.Configuration{
		System: config.SystemConfiguration{
			RootDirectory: root,
			Data:          filepath.Join(root, "data"),
			Servers:       filepath.Join(root, "servers"),
			Volumes:       filepath.Join(root, "volumes"),
		},
	}
	cfg.System.User.Uid = os.Getuid()
	cfg.System.User.Gid = os.Getgid()
	config.Set(cfg)
	t.Cleanup(func() { config.Set(prev) })
	return NewManager(&recordingClient{}), root
}

func unloadedTestConfig(id, folder string) models.ServerConfiguration {
	return models.ServerConfiguration{
		Id:                   id,
		Persists:             true,
		Image:                "img",
		ServerFolder:         folder,
		ProcessConfiguration: &process.ProcessConfiguration{},
	}
}

func TestSyncRecordsServersThatFailToLoad(t *testing.T) {
	m, _ := unloadedTestManager(t)
	m.loadConfigs(context.Background(), []models.ServerConfiguration{
		unloadedTestConfig("ok", "paper/1"),
		unloadedTestConfig("broken", "paper/2"),
	})

	if _, ok := m.Get("ok"); !ok {
		t.Fatal("server with a base folder was not loaded")
	}
	if m.LoadError("ok") != nil {
		t.Fatal("loaded server is recorded as unloaded")
	}
	if _, ok := m.Get("broken"); ok {
		t.Fatal("server without a base folder was loaded")
	}
	err := m.LoadError("broken")
	if err == nil {
		t.Fatal("failed server was not recorded")
	}
	if !errors.Is(err, ErrServerFolderNotFound) {
		t.Fatalf("recorded error = %v, want server folder not found", err)
	}
}

func TestLoadForDeleteLoadsServerWithoutBaseFolder(t *testing.T) {
	m, _ := unloadedTestManager(t)
	m.loadConfigs(context.Background(), []models.ServerConfiguration{unloadedTestConfig("broken", "paper/2")})

	if _, ok := m.LoadForDelete(context.Background(), "unknown"); ok {
		t.Fatal("loaded a server the controller does not list")
	}
	s, ok := m.LoadForDelete(context.Background(), "broken")
	if !ok || s == nil {
		t.Fatal("server without a base folder could not be loaded for delete")
	}
	if got, ok := m.Get("broken"); !ok || got != s {
		t.Fatal("server loaded for delete is not in the manager")
	}
	if m.LoadError("broken") != nil {
		t.Fatal("server loaded for delete is still recorded as unloaded")
	}
}

func TestRetryLoadsServerOnceItCanLoad(t *testing.T) {
	m, root := unloadedTestManager(t)
	m.loadConfigs(context.Background(), []models.ServerConfiguration{unloadedTestConfig("broken", "paper/2")})
	r := newUnloadedRetrier(m)
	start := time.Now()
	at := func(d time.Duration) []*Server { return r.pass(context.Background(), start.Add(d)) }

	if got := at(0); len(got) != 0 {
		t.Fatal("retried a server Sync just failed to load")
	}
	if got := at(r.start); len(got) != 0 {
		t.Fatal("loaded a server whose base folder is still missing")
	}
	if m.LoadError("broken") == nil {
		t.Fatal("failed retry dropped the unloaded entry")
	}
	if err := os.MkdirAll(filepath.Join(root, "servers", "paper", "2"), 0o755); err != nil {
		t.Fatal(err)
	}
	if got := at(2 * r.start); len(got) != 0 {
		t.Fatal("retried before the doubled delay passed")
	}
	got := at(3 * r.start)
	if len(got) != 1 || got[0].ID() != "broken" {
		t.Fatalf("retry loaded %d servers, want broken", len(got))
	}
	if _, ok := m.Get("broken"); !ok {
		t.Fatal("retried server is not in the manager")
	}
	if m.LoadError("broken") != nil {
		t.Fatal("retried server is still recorded as unloaded")
	}
}

func TestRetryForgetsServersSyncNoLongerLists(t *testing.T) {
	m, _ := unloadedTestManager(t)
	m.loadConfigs(context.Background(), []models.ServerConfiguration{unloadedTestConfig("gone", "paper/2")})
	r := newUnloadedRetrier(m)
	r.pass(context.Background(), time.Now())
	m.loadConfigs(context.Background(), nil)
	r.pass(context.Background(), time.Now())
	if len(r.due) != 0 {
		t.Fatalf("retrier still tracks %d servers", len(r.due))
	}
}

func TestNextSyncClearsUnloaded(t *testing.T) {
	m, root := unloadedTestManager(t)
	m.loadConfigs(context.Background(), []models.ServerConfiguration{
		unloadedTestConfig("fixed", "paper/2"),
		unloadedTestConfig("dropped", "paper/3"),
	})
	if err := os.MkdirAll(filepath.Join(root, "servers", "paper", "2"), 0o755); err != nil {
		t.Fatal(err)
	}

	m.loadConfigs(context.Background(), []models.ServerConfiguration{unloadedTestConfig("fixed", "paper/2")})
	if _, ok := m.Get("fixed"); !ok {
		t.Fatal("server was not loaded once its base folder existed")
	}
	if m.LoadError("fixed") != nil {
		t.Fatal("loaded server is still recorded as unloaded")
	}
	if m.LoadError("dropped") != nil {
		t.Fatal("server the controller no longer lists is still recorded")
	}
}
