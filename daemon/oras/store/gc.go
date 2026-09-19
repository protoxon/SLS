package store

import (
	"io/fs"
	"os"
	"path/filepath"
	"syscall"
	"time"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
)

type digestTree struct {
	digest digest.Digest
	origin Origin
	mtime  time.Time
	refs   digestRefs
}

// GC removes leftover unpack tmp dirs, old unused digest trees that have been
// replaced by a newer pull of the same repo:tag, and CAS objects that no dest
// tree still hardlinks. A tree is unused only when no pin file holds it and
// refs.json lists no servers.
func (s *Store) GC() error {
	if err := s.gcTmp(); err != nil {
		return err
	}
	if err := s.gcSuperseded(); err != nil {
		return err
	}
	return s.gcCAS()
}

func (s *Store) digestRoots() []string {
	return []string{
		filepath.Join(s.Root, digestDir),
		filepath.Join(s.Root, legacyDigestDir),
	}
}

func (s *Store) gcTmp() error {
	for _, root := range s.digestRoots() {
		entries, err := os.ReadDir(root)
		if err != nil {
			if os.IsNotExist(err) {
				continue
			}
			return err
		}
		for _, e := range entries {
			if !e.IsDir() || !isTmpName(e.Name()) {
				continue
			}
			d, err := digestFromTmpName(e.Name())
			if err == nil {
				unlock, ok := s.tryLock(d.String())
				if !ok {
					continue
				}
				path := filepath.Join(root, e.Name())
				removeErr := os.RemoveAll(path)
				unlock()
				if removeErr != nil {
					return errors.Wrap(removeErr, "failed to remove volume tmp directory")
				}
				continue
			}
			if err := os.RemoveAll(filepath.Join(root, e.Name())); err != nil {
				return errors.Wrap(err, "failed to remove volume tmp directory")
			}
		}
	}
	return nil
}

func (s *Store) listDigestTrees() ([]digestTree, error) {
	var out []digestTree
	for _, root := range s.digestRoots() {
		entries, err := os.ReadDir(root)
		if err != nil {
			if os.IsNotExist(err) {
				continue
			}
			return nil, err
		}
		for _, e := range entries {
			if !e.IsDir() || isTmpName(e.Name()) {
				continue
			}
			d, err := ParseDirName(e.Name())
			if err != nil {
				continue
			}
			origin, mtime, err := s.loadOrigin(d)
			if err != nil {
				return nil, err
			}
			refs, err := s.loadRefs(d)
			if err != nil {
				return nil, err
			}
			out = append(out, digestTree{digest: d, origin: origin, mtime: mtime, refs: refs})
		}
	}
	return out, nil
}

func (s *Store) gcSuperseded() error {
	pinned, err := s.listPinnedDigests()
	if err != nil {
		return err
	}
	trees, err := s.listDigestTrees()
	if err != nil {
		return err
	}
	groups := map[string][]digestTree{}
	for _, tree := range trees {
		key := tree.origin.Key()
		if key == "" {
			continue
		}
		groups[key] = append(groups[key], tree)
	}
	for _, group := range groups {
		if len(group) < 2 {
			continue
		}
		newest := newestTree(group)
		for _, tree := range group {
			if tree.digest == newest.digest {
				continue
			}
			if _, ok := pinned[tree.digest]; ok {
				continue
			}
			if len(tree.refs.Servers) > 0 {
				continue
			}
			if err := s.removeUnusedTree(tree.digest); err != nil {
				return err
			}
		}
	}
	return nil
}

func newestTree(group []digestTree) digestTree {
	best := group[0]
	for _, tree := range group[1:] {
		if tree.mtime.After(best.mtime) {
			best = tree
			continue
		}
		if tree.mtime.Equal(best.mtime) && tree.digest.String() > best.digest.String() {
			best = tree
		}
	}
	return best
}

func (s *Store) removeUnusedTree(d digest.Digest) error {
	unlock := s.lock(d.String())
	defer unlock()
	pinned, err := s.listPinnedDigests()
	if err != nil {
		return err
	}
	if _, ok := pinned[d]; ok {
		return nil
	}
	refs, err := s.loadRefs(d)
	if err != nil {
		return err
	}
	if len(refs.Servers) > 0 {
		return nil
	}
	if err := os.RemoveAll(s.DigestPath(d)); err != nil {
		return errors.Wrapf(err, "failed to remove unused volume %s", d)
	}
	return nil
}

func (s *Store) gcCAS() error {
	root := s.CASRoot()
	if _, err := os.Stat(root); os.IsNotExist(err) {
		return nil
	}
	return filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			if os.IsNotExist(err) {
				return nil
			}
			return err
		}
		if d.IsDir() {
			if d.Name() == "tmp" && path == filepath.Join(root, "tmp") {
				return fs.SkipDir
			}
			return nil
		}
		info, err := os.Lstat(path)
		if err != nil {
			if os.IsNotExist(err) {
				return nil
			}
			return err
		}
		st, ok := info.Sys().(*syscall.Stat_t)
		if !ok {
			return nil
		}
		if st.Nlink != 1 {
			return nil
		}
		if err := os.Remove(path); err != nil && !os.IsNotExist(err) {
			return errors.Wrap(err, "failed to remove unused cas object")
		}
		return nil
	})
}
