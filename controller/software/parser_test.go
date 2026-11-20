package software

import (
	"os"
	"path/filepath"
	"testing"
)

func TestLoadAllSoftwareRecordsSkippedFile(t *testing.T) {
	root := t.TempDir()
	good := []byte(`software:
  id: paper
  name: Paper
  images:
    java_21: ghcr.io/example/java:21
  stop-command: stop
  invocation: java -jar server.jar
  online-signal: Done
`)
	broken := []byte("software:\n  id: broken\n")
	if err := os.WriteFile(filepath.Join(root, "paper.yml"), good, 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.MkdirAll(filepath.Join(root, "bad"), 0o755); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(root, "bad", "broken.yml"), broken, 0o644); err != nil {
		t.Fatal(err)
	}

	loaded, err := LoadAllSoftware(root)
	if err != nil {
		t.Fatal(err)
	}
	if len(loaded.Software) != 1 || loaded.Software[0].Id != "paper" {
		t.Fatalf("software: %+v", loaded.Software)
	}
	if len(loaded.Errors) != 1 {
		t.Fatalf("errors: %+v", loaded.Errors)
	}
	got := loaded.Errors[0]
	if got.Kind != "software" || got.Path != "bad/broken.yml" || got.ID != "" {
		t.Fatalf("error: %+v", got)
	}
	if got.Error != "missing required field: software.name" {
		t.Fatalf("reason: %q", got.Error)
	}
}
