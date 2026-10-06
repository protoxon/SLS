package config

import (
	"testing"
)

func TestSnapshotRevisionChangesWithPassword(t *testing.T) {
	t.Setenv("GHCR_TOKEN", "")
	a := RegistryConfiguration{
		Default: "ghcr.io/jessefaler",
		Credentials: []RegistryCredential{
			{Host: "ghcr.io", Username: "jesse", Password: "one"},
		},
	}.Snapshot()
	b := RegistryConfiguration{
		Default: "ghcr.io/jessefaler",
		Credentials: []RegistryCredential{
			{Host: "ghcr.io", Username: "jesse", Password: "two"},
		},
	}.Snapshot()
	if a.Revision == "" || a.Revision == b.Revision {
		t.Fatalf("password change should change revision: %q %q", a.Revision, b.Revision)
	}
}

func TestSnapshotRevisionUsesGHCRToken(t *testing.T) {
	t.Setenv("GHCR_TOKEN", "")
	cfg := RegistryConfiguration{
		Credentials: []RegistryCredential{
			{Host: "ghcr.io", Username: "jesse", Password: "inline"},
		},
	}
	inline := cfg.Snapshot()
	t.Setenv("GHCR_TOKEN", "from-env")
	env := cfg.Snapshot()
	if inline.Credentials[0].Password != "inline" {
		t.Fatalf("inline password %q", inline.Credentials[0].Password)
	}
	if env.Credentials[0].Password != "from-env" {
		t.Fatalf("env password %q", env.Credentials[0].Password)
	}
	if inline.Revision == env.Revision {
		t.Fatal("GHCR_TOKEN should change revision")
	}
}

func TestSnapshotEmptyCredentials(t *testing.T) {
	snap := RegistryConfiguration{}.Snapshot()
	if snap.Credentials == nil {
		t.Fatal("credentials should be empty slice")
	}
	if len(snap.Credentials) != 0 || snap.Revision == "" {
		t.Fatalf("got %+v", snap)
	}
}

func TestSnapshotSortsHosts(t *testing.T) {
	snap := RegistryConfiguration{
		Credentials: []RegistryCredential{
			{Host: "ghcr.io", Password: "a"},
			{Host: "localhost:5000", Password: "b", Insecure: true},
		},
	}.Snapshot()
	if len(snap.Credentials) != 2 {
		t.Fatalf("got %d", len(snap.Credentials))
	}
	if snap.Credentials[0].Host != "ghcr.io" || snap.Credentials[1].Host != "localhost:5000" {
		t.Fatalf("order %+v", snap.Credentials)
	}
	if !snap.Credentials[1].Insecure {
		t.Fatal("insecure")
	}
}

func TestSnapshotInsecureDefaultHost(t *testing.T) {
	snap := RegistryConfiguration{
		Default:  "https://localhost:5000/sls/",
		Insecure: true,
	}.Snapshot()
	if len(snap.Credentials) != 0 {
		t.Fatalf("credentials %+v", snap.Credentials)
	}
	if len(snap.Insecure) != 1 || snap.Insecure[0] != "localhost:5000" {
		t.Fatalf("insecure %+v", snap.Insecure)
	}
	secure := RegistryConfiguration{Default: "localhost:5000/sls"}.Snapshot()
	if snap.Revision == "" || snap.Revision == secure.Revision {
		t.Fatal("insecure flag should change revision")
	}
}

func TestSnapshotDefaultNameDoesNotChangeRevision(t *testing.T) {
	a := RegistryConfiguration{Default: "ghcr.io/a"}.Snapshot()
	b := RegistryConfiguration{Default: "ghcr.io/b"}.Snapshot()
	if a.Revision == "" || a.Revision != b.Revision {
		t.Fatalf("revisions %q %q", a.Revision, b.Revision)
	}
}

func TestRegistrySnapshotNilConfig(t *testing.T) {
	mutex.Lock()
	prev := config
	config = nil
	mutex.Unlock()
	t.Cleanup(func() {
		mutex.Lock()
		config = prev
		mutex.Unlock()
	})
	snap := RegistrySnapshot()
	if snap.Credentials == nil || len(snap.Credentials) != 0 {
		t.Fatalf("got %+v", snap)
	}
}
