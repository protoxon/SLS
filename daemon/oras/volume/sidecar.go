package volume

import (
	"encoding/json"
	"os"
	"path/filepath"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
)

const (
	slsDir    = ".sls"
	stateFile = "state.json"
	mountFile = "mount.json"
	tmpDir    = "tmp"
)

// SidecarMount is dest/.sls/mount.json: mount defaults from the last sidecar pull.
type SidecarMount struct {
	Artifact digest.Digest `json:"artifact"`
	MountInfo
}

type sidecarState struct {
	Artifact digest.Digest            `json:"artifact"`
	Files    map[string]digest.Digest `json:"files"`
}

func slsPath(dest string, elem ...string) string {
	parts := append([]string{dest, slsDir}, elem...)
	return filepath.Join(parts...)
}

func loadSidecar(dest string) (sidecarState, error) {
	state := sidecarState{Files: map[string]digest.Digest{}}
	b, err := os.ReadFile(slsPath(dest, stateFile))
	if err != nil {
		if os.IsNotExist(err) {
			return state, nil
		}
		return state, errors.Wrap(err, "failed to read volume sidecar")
	}
	if err := json.Unmarshal(b, &state); err != nil {
		return sidecarState{}, errors.Wrap(err, "failed to parse volume sidecar")
	}
	if state.Files == nil {
		state.Files = map[string]digest.Digest{}
	}
	return state, nil
}

func writeSidecar(dest string, state sidecarState, owner *Owner) error {
	if state.Files == nil {
		state.Files = map[string]digest.Digest{}
	}
	return writeSidecarJSON(dest, stateFile, state, owner)
}

func writeMount(dest string, mount SidecarMount, owner *Owner) error {
	return writeSidecarJSON(dest, mountFile, mount, owner)
}

func writeSidecarJSON(dest, name string, v any, owner *Owner) error {
	if err := mkdirAllOwned(slsPath(dest), owner); err != nil {
		return errors.Wrap(err, "failed to create volume sidecar directory")
	}
	b, err := json.MarshalIndent(v, "", "  ")
	if err != nil {
		return errors.Wrap(err, "failed to encode volume sidecar")
	}
	tmp := slsPath(dest, name+".tmp")
	if err := os.WriteFile(tmp, append(b, '\n'), 0o644); err != nil {
		return errors.Wrap(err, "failed to write volume sidecar")
	}
	if err := os.Rename(tmp, slsPath(dest, name)); err != nil {
		return errors.Wrap(err, "failed to replace volume sidecar")
	}
	return nil
}

// ReadMount loads dest/.sls/mount.json from the last sidecar pull.
// A missing file returns a zero value.
func ReadMount(dest string) (SidecarMount, error) {
	var mount SidecarMount
	b, err := os.ReadFile(slsPath(dest, mountFile))
	if err != nil {
		if os.IsNotExist(err) {
			return mount, nil
		}
		return mount, errors.Wrap(err, "failed to read volume mount sidecar")
	}
	if err := json.Unmarshal(b, &mount); err != nil {
		return SidecarMount{}, errors.Wrap(err, "failed to parse volume mount sidecar")
	}
	return mount, nil
}
