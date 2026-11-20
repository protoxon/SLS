package snapshot

import (
	"strings"

	"emperror.dev/errors"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/snapshot"
)

// Expand loads requested and the snapshots they were stacked on, highest
// precedence first.
func Expand(requested []string) ([]models.OverlaySnapshotRecord, error) {
	if len(requested) == 0 {
		return nil, nil
	}
	cfgs, err := snapshot.Expand(requested, func(id string) (snapshot.Config, error) {
		row, err := Get(id)
		if err != nil {
			return snapshot.Config{}, errors.Wrapf(err, "snapshot %s", id)
		}
		if row.Status != models.SnapshotReady {
			return snapshot.Config{}, errors.Errorf("snapshot %s is %s", id, row.Status)
		}
		return snapshot.Config{ID: row.ID, Requires: row.Requires}, nil
	})
	if err != nil {
		return nil, err
	}
	out := make([]models.OverlaySnapshotRecord, 0, len(cfgs))
	for _, cfg := range cfgs {
		row, err := Get(cfg.ID)
		if err != nil {
			return nil, err
		}
		out = append(out, row)
	}
	return out, nil
}

// PinVolumes rewrites artifact volumes to the digests recorded in the snapshots.
func PinVolumes(volumes []api.Volume, rows []models.OverlaySnapshotRecord) ([]api.Volume, error) {
	type pin struct {
		digest   string
		artifact string
	}
	pins := map[string]pin{}
	for _, row := range rows {
		for _, target := range row.Targets {
			for _, lower := range target.Lowers {
				if lower.Kind != snapshot.KindVolume || lower.Name == "" || lower.Digest == "" {
					continue
				}
				if prev, ok := pins[lower.Name]; ok && prev.digest != lower.Digest {
					return nil, errors.Errorf("snapshot volume %s digest conflict", lower.Name)
				}
				pins[lower.Name] = pin{digest: lower.Digest, artifact: lower.Artifact}
			}
		}
	}
	if len(pins) == 0 {
		return volumes, nil
	}
	out := append([]api.Volume(nil), volumes...)
	seen := map[string]struct{}{}
	for i := range out {
		name := out[i].Name
		if name == "" {
			name = out[i].Artifact
		}
		pinned, ok := pins[name]
		if !ok {
			continue
		}
		seen[name] = struct{}{}
		if out[i].Artifact == "" {
			continue
		}
		base := pinned.artifact
		if base == "" {
			base = out[i].Artifact
		}
		out[i].Artifact = artifactDigest(base, pinned.digest)
	}
	for name := range pins {
		if _, ok := seen[name]; !ok {
			return nil, errors.Errorf("snapshot volume %s is not on this server", name)
		}
	}
	return out, nil
}

func artifactDigest(artifact, digest string) string {
	base := artifact
	if i := strings.Index(base, "@"); i >= 0 {
		base = base[:i]
	}
	if i := strings.LastIndex(base, ":"); i >= 0 && strings.LastIndex(base, "/") < i {
		base = base[:i]
	}
	return base + "@" + digest
}

// DiskNeeds is the per-snapshot size used when a node does not already have it.
func DiskNeeds(rows []models.OverlaySnapshotRecord) []struct {
	ID    string
	Bytes int64
} {
	out := make([]struct {
		ID    string
		Bytes int64
	}, 0, len(rows))
	for _, row := range rows {
		out = append(out, struct {
			ID    string
			Bytes int64
		}{ID: row.ID, Bytes: row.Size})
	}
	return out
}
