package snapshot

import (
	"strings"
	"time"

	"emperror.dev/errors"
	"protoxon.com/sls/controller/models"
	ociregistry "protoxon.com/sls/controller/registry"
)

// ErrInUse is returned when a server still mounts the snapshot.
var ErrInUse = errors.New("snapshot is in use")

// ErrStillCreating is returned when a snapshot has not finished yet.
var ErrStillCreating = errors.New("snapshot is still being created")

// Remove deletes the registry manifest and then the controller row.
// A missing manifest is success. force drops the row when the registry delete fails.
// Nodes that had the snapshot cached receive a tombstone.
func Remove(reg *ociregistry.Registry, id string, force, inUse bool) error {
	rec, err := Get(id)
	if err != nil {
		return err
	}
	if inUse {
		return ErrInUse
	}
	if required, err := requiredBy(id); err != nil {
		return err
	} else if required {
		return ErrInUse
	}
	if rec.Status == models.SnapshotCreating && !force {
		return ErrStillCreating
	}
	previous := rec.Status
	rec.Status = models.SnapshotDeleting
	if err := Save(&rec); err != nil {
		return err
	}
	if err := deleteManifest(reg, rec); err != nil {
		if !force {
			rec.Status = previous
			if previous == models.SnapshotDeleting {
				rec.Status = models.SnapshotReady
			}
			_ = Save(&rec)
			return err
		}
	}
	nodes := append([]string(nil), rec.CachedNodes...)
	if rec.OriginNode != "" {
		nodes = addNode(nodes, rec.OriginNode)
	}
	if err := DeleteRecord(id); err != nil {
		return err
	}
	if len(nodes) > 0 {
		return SaveTombstone(id, nodes)
	}
	return nil
}

func requiredBy(id string) (bool, error) {
	rows, err := ListReady()
	if err != nil {
		return false, err
	}
	for _, row := range rows {
		if row.ID == id {
			continue
		}
		for _, dep := range row.Requires {
			if dep == id {
				return true, nil
			}
		}
	}
	return false, nil
}

func deleteManifest(reg *ociregistry.Registry, rec models.OverlaySnapshotRecord) error {
	if rec.Digest == "" || rec.Reference == "" || reg == nil {
		return nil
	}
	repo := repoFromReference(rec.Reference)
	var last error
	for attempt := 0; attempt < 3; attempt++ {
		err := reg.DeleteManifest(repo, rec.Digest)
		if err == nil || errors.Is(err, ociregistry.ErrManifestNotFound) {
			return nil
		}
		last = err
		time.Sleep(time.Duration(attempt+1) * 200 * time.Millisecond)
	}
	return last
}

func repoFromReference(ref string) string {
	name := ref
	if i := strings.Index(name, "@"); i >= 0 {
		name = name[:i]
	}
	if i := strings.LastIndex(name, ":"); i >= 0 && strings.LastIndex(name, "/") < i {
		name = name[:i]
	}
	host, repo, ok := strings.Cut(name, "/")
	if !ok {
		return name
	}
	if strings.Contains(host, ".") || strings.Contains(host, ":") || host == "localhost" {
		return repo
	}
	return name
}
