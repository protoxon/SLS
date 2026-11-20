package blueprint

import (
	"os"
	"path/filepath"
	"testing"

	"protoxon.com/sls/controller/software"
)

func TestLoadAllRecordsSkippedBlueprint(t *testing.T) {
	root := t.TempDir()
	if err := os.MkdirAll(filepath.Join(root, "games"), 0o755); err != nil {
		t.Fatal(err)
	}
	good := []byte(`blueprint:
  id: good
  name: Good
  type: game
server:
  software: platform
  version: "1.0.0"
  image: java_21
`)
	broken := []byte("blueprint:\n  id: broken\n")
	notes := []byte("hello: world\n")
	if err := os.WriteFile(filepath.Join(root, "good.yml"), good, 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(root, "games", "broken.yml"), broken, 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(root, "notes.yml"), notes, 0o644); err != nil {
		t.Fatal(err)
	}

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

	loaded, err := LoadAll(root, reg)
	if err != nil {
		t.Fatal(err)
	}
	if len(loaded.Blueprints) != 1 || loaded.Blueprints[0].Meta.ID != "good" {
		t.Fatalf("blueprints: %+v", loaded.Blueprints)
	}
	if len(loaded.Errors) != 1 {
		t.Fatalf("errors: %+v", loaded.Errors)
	}
	got := loaded.Errors[0]
	if got.Kind != "blueprint" || got.Path != "games/broken.yml" || got.ID != "" {
		t.Fatalf("error: %+v", got)
	}
	if got.Error != "missing required field: blueprint.name" {
		t.Fatalf("reason: %q", got.Error)
	}
}
