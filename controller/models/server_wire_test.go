package models_test

import (
	"encoding/json"
	"strings"
	"testing"

	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/process"
)

func TestServerConfigurationJSONRoundTrip(t *testing.T) {
	matcher, err := process.NewOutputLineMatcher("Done")
	if err != nil {
		t.Fatal(err)
	}
	cfg := models.ServerConfiguration{
		Id:         "srv",
		Image:      "paper:1.21",
		Invocation: "java -jar server.jar",
		State: api.State{
			Volumes: []api.Volume{{
				Name:     "world",
				Artifact: "ghcr.io/example/world:1",
				Source:   "worlds",
				Path:     "region",
				Target:   "/data",
				Mode:     api.VolumeModeCOW,
			}},
			Mounts: []api.Mount{{Target: "/mnt", Source: "/host", ReadOnly: true}},
			Copy:   []api.Copy{{Source: "eula.txt", Target: "/data/eula.txt"}},
			Env:    map[string]string{"EULA": "true"},
		},
		Limits: api.Limits{
			MemoryLimit: 2048,
			Swap:        128,
			IoWeight:    400,
			CpuLimit:    200,
			DiskSpace:   4096,
			Threads:     "0-1",
			OOMDisabled: true,
		},
		Persists: true,
		Allocations: api.Allocations{
			ForceOutgoingIP: true,
			Alias:           "game",
			Mappings:        map[string][]int{"0.0.0.0": {25565}},
		},
		SoftwareId:        "paper",
		ServerFolder:      "/var/lib/sls/srv",
		SoftwareVersion:   "1.21",
		HasInstallScript:  true,
		SkipInstallScript: false,
		ProcessConfiguration: &process.ProcessConfiguration{
			Stop: process.ProcessStopConfiguration{Type: "command", Value: "stop"},
		},
	}
	cfg.ProcessConfiguration.Startup.Done = []*process.OutputLineMatcher{matcher}
	cfg.ProcessConfiguration.Startup.StripAnsi = true
	cfg.Allocations.DefaultMapping.Ip = "0.0.0.0"
	cfg.Allocations.DefaultMapping.Port = 25565

	raw, err := json.Marshal(cfg)
	if err != nil {
		t.Fatal(err)
	}
	encoded := string(raw)
	if !strings.Contains(encoded, `"env":`) {
		t.Fatalf("env must use the blueprint JSON name: %s", encoded)
	}
	if strings.Contains(encoded, `"Env"`) {
		t.Fatalf("env encoded with the Go field name: %s", encoded)
	}
	if !strings.Contains(encoded, `"memory_limit":2048`) || !strings.Contains(encoded, `"oom_disabled":true`) {
		t.Fatalf("limits must be resolved numbers: %s", encoded)
	}

	var again models.ServerConfiguration
	if err := json.Unmarshal(raw, &again); err != nil {
		t.Fatal(err)
	}
	if again.State.Env["EULA"] != "true" || again.Limits.MemoryLimit != 2048 || !again.Limits.OOMDisabled {
		t.Fatalf("round trip: %+v", again)
	}
	if again.State.Volumes[0].Mode != api.VolumeModeCOW || again.Allocations.Alias != "game" || again.Allocations.DefaultMapping.Port != 25565 {
		t.Fatalf("round trip fields: %+v", again)
	}
	if again.ProcessConfiguration == nil || again.ProcessConfiguration.Stop.Value != "stop" || !again.ProcessConfiguration.Startup.StripAnsi {
		t.Fatalf("process: %+v", again.ProcessConfiguration)
	}
}

func TestServerConfigurationLegacyJSON(t *testing.T) {
	const raw = `{
		"id": "srv",
		"state": {"env": {"EULA": "true"}, "volumes": [{"name": "world", "mode": "cow"}]},
		"limits": {"memory_limit": 2048, "swap": 0, "io_weight": 500, "cpu_limit": 0, "disk_space": 8192, "threads": "", "oom_disabled": true},
		"allocations": {"alias": "game", "force_outgoing_ip": false, "default": {"ip": "0.0.0.0", "port": 25565}, "mappings": {"0.0.0.0": [25565]}}
	}`
	var cfg models.ServerConfiguration
	if err := json.Unmarshal([]byte(raw), &cfg); err != nil {
		t.Fatal(err)
	}
	if cfg.Id != "srv" || cfg.State.Env["EULA"] != "true" || cfg.State.Volumes[0].Name != "world" || cfg.State.Volumes[0].Mode != "cow" {
		t.Fatalf("state: %+v", cfg.State)
	}
	if cfg.Limits.MemoryLimit != 2048 || cfg.Limits.DiskSpace != 8192 || !cfg.Limits.OOMDisabled {
		t.Fatalf("limits: %+v", cfg.Limits)
	}
	if cfg.Allocations.Alias != "game" || cfg.Allocations.DefaultMapping.Port != 25565 {
		t.Fatalf("allocations: %+v", cfg.Allocations)
	}
}

func TestResolveLimitsNilOOMStaysEnabled(t *testing.T) {
	mem := int64(128)
	got, err := environment.ResolveLimits(&environment.Limits{MemoryLimit: &mem})
	if err != nil {
		t.Fatal(err)
	}
	if !got.OOMDisabled {
		t.Fatal("nil OOMDisabled resolved to false")
	}
	if got.MemoryLimit != 128 {
		t.Fatalf("memory: %d", got.MemoryLimit)
	}
	if got.DiskSpace != 8192 || got.IoWeight != 500 {
		t.Fatalf("defaults: %+v", got)
	}

	empty, err := environment.ResolveLimits(nil)
	if err != nil {
		t.Fatal(err)
	}
	if !empty.OOMDisabled || empty.MemoryLimit != 4096 {
		t.Fatalf("nil limits: %+v", empty)
	}
}
