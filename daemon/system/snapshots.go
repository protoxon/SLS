package system

import (
	"os"
	"path/filepath"
	"sync"

	"emperror.dev/errors"
)

var (
	snapshotMu    sync.RWMutex
	snapshotInUse func(string) bool
)

// SetSnapshotInUse registers the check that keeps a mounted snapshot on disk.
func SetSnapshotInUse(fn func(string) bool) {
	snapshotMu.Lock()
	snapshotInUse = fn
	snapshotMu.Unlock()
}

func snapshotBusy(id string) bool {
	snapshotMu.RLock()
	fn := snapshotInUse
	snapshotMu.RUnlock()
	return fn != nil && fn(id)
}

// SnapshotIDs lists snapshot ids cached under root.
func SnapshotIDs(root string) ([]string, error) {
	if root == "" {
		return nil, nil
	}
	entries, err := os.ReadDir(root)
	if err != nil {
		if os.IsNotExist(err) {
			return nil, nil
		}
		return nil, errors.Wrap(err, "failed to list snapshots")
	}
	var ids []string
	for _, entry := range entries {
		if !entry.IsDir() {
			continue
		}
		name := entry.Name()
		if name == "" || name[0] == '.' {
			continue
		}
		ids = append(ids, name)
	}
	return ids, nil
}

// DeleteSnapshots removes ids that are not in use. It returns the ids still
// present, including ones that were skipped because a server is using them.
func DeleteSnapshots(root string, ids []string) ([]string, error) {
	if root == "" || len(ids) == 0 {
		return SnapshotIDs(root)
	}
	for _, id := range ids {
		if id == "" || snapshotBusy(id) {
			continue
		}
		if err := os.RemoveAll(filepath.Join(root, id)); err != nil && !os.IsNotExist(err) {
			return nil, errors.Wrapf(err, "failed to delete snapshot %s", id)
		}
	}
	return SnapshotIDs(root)
}
