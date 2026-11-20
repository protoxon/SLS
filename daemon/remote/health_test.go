package remote

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"protoxon.com/sls/daemon/oras/store"
)

func TestSaveRegisterArtifacts(t *testing.T) {
	st := store.New(t.TempDir())
	path := filepath.Join(st.Root, ".sls", "retain.json")

	if err := saveRegisterArtifacts(nil, st); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(path); !os.IsNotExist(err) {
		t.Fatal("missing artifacts field should leave the retain list unset")
	}
	if err := saveRegisterArtifacts(json.RawMessage("null"), st); err != nil {
		t.Fatal(err)
	}
	if _, err := os.Stat(path); !os.IsNotExist(err) {
		t.Fatal("null artifacts should leave the retain list unset")
	}

	if err := saveRegisterArtifacts(json.RawMessage(`["ghcr.io/protoxon/sls/chunk_runner:latest"]`), st); err != nil {
		t.Fatal(err)
	}
	if err := saveRegisterArtifacts(nil, st); err != nil {
		t.Fatal(err)
	}
	body, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(string(body), "chunk_runner:latest") {
		t.Fatalf("retain list was replaced by a missing field: %s", body)
	}

	if err := saveRegisterArtifacts(json.RawMessage("[]"), st); err != nil {
		t.Fatal(err)
	}
	body, err = os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	var list struct {
		Artifacts []string `json:"artifacts"`
	}
	if err := json.Unmarshal(body, &list); err != nil {
		t.Fatal(err)
	}
	if list.Artifacts == nil || len(list.Artifacts) != 0 {
		t.Fatalf("empty array should replace the list: %s", body)
	}
}
