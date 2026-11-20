package store

import (
	"encoding/json"
	"os"
	"path/filepath"
	"strings"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
)

const retainFile = "retain.json"

type retainList struct {
	Artifacts []string `json:"artifacts"`
}

type retainSet struct {
	tags    map[string]struct{}
	digests map[digest.Digest]struct{}
}

func (s *Store) retainPath() string {
	return filepath.Join(s.Root, slsDir, retainFile)
}

// SaveRetain writes the blueprint artifact list. An empty slice is a real list
// and replaces whatever was saved before.
func (s *Store) SaveRetain(artifacts []string) error {
	if artifacts == nil {
		artifacts = []string{}
	}
	dir := filepath.Join(s.Root, slsDir)
	if err := os.MkdirAll(dir, 0o755); err != nil {
		return err
	}
	b, err := json.MarshalIndent(retainList{Artifacts: artifacts}, "", "  ")
	if err != nil {
		return err
	}
	unlock := s.lock("retain")
	defer unlock()
	tmp := s.retainPath() + tmpSuffix
	if err := os.WriteFile(tmp, append(b, '\n'), 0o644); err != nil {
		return errors.Wrap(err, "failed to write volume retain list")
	}
	if err := os.Rename(tmp, s.retainPath()); err != nil {
		return errors.Wrap(err, "failed to replace volume retain list")
	}
	return nil
}

// loadRetain reports whether a retain list has been saved. A missing file is
// not an empty list.
func (s *Store) loadRetain() (retainSet, bool, error) {
	b, err := os.ReadFile(s.retainPath())
	if err != nil {
		if os.IsNotExist(err) {
			return retainSet{}, false, nil
		}
		return retainSet{}, false, errors.Wrap(err, "failed to read volume retain list")
	}
	var list retainList
	if err := json.Unmarshal(b, &list); err != nil {
		return retainSet{}, false, errors.Wrap(err, "failed to parse volume retain list")
	}
	set, err := retainFromArtifacts(list.Artifacts)
	if err != nil {
		return retainSet{}, false, err
	}
	return set, true, nil
}

func retainFromArtifacts(artifacts []string) (retainSet, error) {
	set := retainSet{
		tags:    map[string]struct{}{},
		digests: map[digest.Digest]struct{}{},
	}
	for _, art := range artifacts {
		art = strings.TrimSpace(art)
		if art == "" {
			continue
		}
		origin, err := originFromReference(art)
		if err != nil {
			return retainSet{}, errors.Wrapf(err, "volume retain artifact %s", art)
		}
		if origin.DigestPin {
			d, err := digest.Parse(origin.Reference)
			if err != nil {
				return retainSet{}, errors.Wrapf(err, "volume retain digest %s", art)
			}
			set.digests[d] = struct{}{}
			continue
		}
		if key := origin.Key(); key != "" {
			set.tags[key] = struct{}{}
		}
	}
	return set, nil
}

// holds reports whether this tree is the copy a blueprint artifact names.
// A tag keeps the newest local tree pulled as that tag. A digest keeps that tree.
func (set retainSet) holds(tree digestTree, newest map[string]digest.Digest) bool {
	if _, ok := set.digests[tree.digest]; ok {
		return true
	}
	key := tree.origin.Key()
	if key == "" {
		return false
	}
	if _, ok := set.tags[key]; !ok {
		return false
	}
	return newest[key] == tree.digest
}
