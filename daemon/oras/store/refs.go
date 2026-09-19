package store

import (
	"encoding/json"
	"os"
	"path/filepath"
	"slices"
	"sort"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
)

const (
	slsDir   = ".sls"
	refsFile = "refs.json"
)

type digestRefs struct {
	Servers []string `json:"servers"`
}

func (s *Store) refsPath(d digest.Digest) string {
	return filepath.Join(s.DigestPath(d), slsDir, refsFile)
}

func (s *Store) loadRefs(d digest.Digest) (digestRefs, error) {
	var refs digestRefs
	b, err := os.ReadFile(s.refsPath(d))
	if err != nil {
		if os.IsNotExist(err) {
			return digestRefs{}, nil
		}
		return digestRefs{}, errors.Wrap(err, "failed to read volume refs")
	}
	if err := json.Unmarshal(b, &refs); err != nil {
		return digestRefs{}, errors.Wrap(err, "failed to parse volume refs")
	}
	return refs, nil
}

func (s *Store) writeRefs(d digest.Digest, refs digestRefs) error {
	dir := filepath.Join(s.DigestPath(d), slsDir)
	if err := os.MkdirAll(dir, 0o755); err != nil {
		return err
	}
	if refs.Servers == nil {
		refs.Servers = []string{}
	}
	sort.Strings(refs.Servers)
	b, err := json.MarshalIndent(refs, "", "  ")
	if err != nil {
		return err
	}
	tmp := s.refsPath(d) + ".tmp"
	if err := os.WriteFile(tmp, append(b, '\n'), 0o644); err != nil {
		return errors.Wrap(err, "failed to write volume refs")
	}
	if err := os.Rename(tmp, s.refsPath(d)); err != nil {
		return errors.Wrap(err, "failed to replace volume refs")
	}
	return nil
}

func (s *Store) AddRef(d digest.Digest, serverID string) error {
	if serverID == "" {
		return errors.New("missing server id")
	}
	unlock := s.lock(d.String())
	defer unlock()
	if exists, err := dirExists(s.DigestPath(d)); err != nil {
		return err
	} else if !exists {
		return errors.Errorf("volume digest %s is not present", d)
	}
	refs, err := s.loadRefs(d)
	if err != nil {
		return err
	}
	if slices.Contains(refs.Servers, serverID) {
		return nil
	}
	refs.Servers = append(refs.Servers, serverID)
	return s.writeRefs(d, refs)
}

func (s *Store) DropRef(d digest.Digest, serverID string) error {
	if serverID == "" {
		return errors.New("missing server id")
	}
	unlock := s.lock(d.String())
	defer unlock()
	if exists, err := dirExists(s.DigestPath(d)); err != nil {
		return err
	} else if !exists {
		return nil
	}
	refs, err := s.loadRefs(d)
	if err != nil {
		return err
	}
	next := refs.Servers[:0]
	for _, id := range refs.Servers {
		if id != serverID {
			next = append(next, id)
		}
	}
	refs.Servers = next
	return s.writeRefs(d, refs)
}

// ReconcileRefs makes digest trees list exactly keep for serverID.
// It returns whether any ref was dropped.
func (s *Store) ReconcileRefs(serverID string, keep []digest.Digest) (bool, error) {
	if serverID == "" {
		return false, errors.New("missing server id")
	}
	wanted := make(map[digest.Digest]struct{}, len(keep))
	for _, d := range keep {
		if d != "" {
			wanted[d] = struct{}{}
		}
	}
	trees, err := s.listDigestTrees()
	if err != nil {
		return false, err
	}
	dropped := false
	for _, tree := range trees {
		has := slices.Contains(tree.refs.Servers, serverID)
		_, want := wanted[tree.digest]
		if has && !want {
			if err := s.DropRef(tree.digest, serverID); err != nil {
				return dropped, err
			}
			dropped = true
		}
	}
	for d := range wanted {
		if err := s.AddRef(d, serverID); err != nil {
			return dropped, err
		}
	}
	return dropped, nil
}
