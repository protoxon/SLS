package blueprint

import (
	"testing"

	"protoxon.com/sls/controller/software"
)

func TestArtifactRefsIncludesMixinVolumes(t *testing.T) {
	prev := softwareRegistry
	t.Cleanup(func() { softwareRegistry = prev })
	reg := software.NewRegistry()
	reg.Register(&software.Software{
		Id:   "platform",
		Name: "platform",
		DockerImages: map[string]string{
			"java_21": "ghcr.io/example/java:21",
		},
		StopCommand:  "stop",
		Invocation:   "java -jar server.jar",
		OnlineSignal: "Done",
	})
	softwareRegistry = reg

	raw := &LoadResult{
		Mixins: []*Mixin{{
			Meta:   MixinMeta{ID: "base"},
			Server: &Server{Software: "platform", Version: "1.0.0"},
			State: &State{Volumes: []Volume{{
				Artifact: "ghcr.io/protoxon/sls/plugins:1",
				Target:   "/plugins",
			}}},
		}},
		Blueprints: []*Blueprint{{
			Meta:     Meta{ID: "bp", Name: "BP", Type: "game"},
			Includes: []string{"base"},
			Server:   &Server{Image: "java_21"},
			State: &State{Volumes: []Volume{
				{Artifact: "ghcr.io/protoxon/sls/world:latest", Target: "/world"},
				{Name: "lobby", Source: "worlds/lobby", Target: "/lobby", Mode: VolumeModeRW},
			}},
		}, {
			Meta:   Meta{ID: "other", Name: "Other", Type: "game"},
			Server: &Server{Software: "platform", Version: "1.0.0", Image: "java_21"},
			State: &State{Volumes: []Volume{
				{Artifact: "ghcr.io/protoxon/sls/world:latest", Target: "/world"},
			}},
		}},
	}
	out := Resolve(raw)
	if len(out.Blueprints) != 2 {
		t.Fatalf("blueprints: got %d", len(out.Blueprints))
	}
	got := ArtifactRefs(out.Blueprints)
	want := []string{
		"ghcr.io/protoxon/sls/plugins:1",
		"ghcr.io/protoxon/sls/world:latest",
	}
	if len(got) != len(want) {
		t.Fatalf("artifacts %#v", got)
	}
	for i := range want {
		if got[i] != want[i] {
			t.Fatalf("artifacts %#v", got)
		}
	}
}
