package store

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strings"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
)

const serversDir = "servers"

// Pin is a daemon-local digest pin for one artifact volume on a server.
type Pin struct {
	Name     string        `json:"name"`
	Artifact string        `json:"artifact"`
	Digest   digest.Digest `json:"digest"`
	Source   string        `json:"source"`
}

type serverPins struct {
	Volumes []Pin `json:"volumes"`
}

func (s *Store) pinsPath(serverID string) string {
	return filepath.Join(s.Root, slsDir, serversDir, serverID+".json")
}

func (s *Store) LoadPins(serverID string) ([]Pin, error) {
	if serverID == "" {
		return nil, errors.New("missing server id")
	}
	unlock := s.lock(pinLockPrefix + serverID)
	defer unlock()
	return s.loadPinsLocked(serverID)
}

func (s *Store) loadPinsLocked(serverID string) ([]Pin, error) {
	b, err := os.ReadFile(s.pinsPath(serverID))
	if err != nil {
		if os.IsNotExist(err) {
			return nil, nil
		}
		return nil, errors.Wrap(err, "failed to read volume pins")
	}
	var pins serverPins
	if err := json.Unmarshal(b, &pins); err != nil {
		return nil, errors.Wrap(err, "failed to parse volume pins")
	}
	return pins.Volumes, nil
}

func (s *Store) SavePins(serverID string, pins []Pin) error {
	if serverID == "" {
		return errors.New("missing server id")
	}
	unlock := s.lock(pinLockPrefix + serverID)
	defer unlock()
	if pins == nil {
		pins = []Pin{}
	}
	dir := filepath.Dir(s.pinsPath(serverID))
	if err := os.MkdirAll(dir, 0o755); err != nil {
		return err
	}
	b, err := json.MarshalIndent(serverPins{Volumes: pins}, "", "  ")
	if err != nil {
		return err
	}
	tmp := s.pinsPath(serverID) + tmpSuffix
	if err := os.WriteFile(tmp, append(b, '\n'), 0o644); err != nil {
		return errors.Wrap(err, "failed to write volume pins")
	}
	if err := os.Rename(tmp, s.pinsPath(serverID)); err != nil {
		return errors.Wrap(err, "failed to replace volume pins")
	}
	return nil
}

func (s *Store) DeletePins(serverID string) error {
	if serverID == "" {
		return errors.New("missing server id")
	}
	unlock := s.lock(pinLockPrefix + serverID)
	defer unlock()
	if err := os.Remove(s.pinsPath(serverID)); err != nil && !os.IsNotExist(err) {
		return errors.Wrap(err, "failed to delete volume pins")
	}
	return nil
}

// listPinnedDigests returns every digest held by volumes/.sls/servers/*.json.
// Pins are the GC hold; refs.json is a rebuildable cache.
func (s *Store) listPinnedDigests() (map[digest.Digest]struct{}, error) {
	out := make(map[digest.Digest]struct{})
	dir := filepath.Join(s.Root, slsDir, serversDir)
	entries, err := os.ReadDir(dir)
	if err != nil {
		if os.IsNotExist(err) {
			return out, nil
		}
		return nil, errors.Wrap(err, "failed to list volume pins")
	}
	for _, e := range entries {
		if e.IsDir() {
			continue
		}
		name := e.Name()
		if !strings.HasSuffix(name, ".json") {
			continue
		}
		serverID := strings.TrimSuffix(name, ".json")
		if serverID == "" {
			continue
		}
		pins, err := s.LoadPins(serverID)
		if err != nil {
			return nil, err
		}
		for _, p := range pins {
			if p.Digest != "" {
				out[p.Digest] = struct{}{}
			}
		}
	}
	return out, nil
}
