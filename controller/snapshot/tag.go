package snapshot

import (
	"regexp"
	"strings"

	"emperror.dev/errors"
	"gorm.io/gorm"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
)

// ErrNotFound is returned when an id or tag matches nothing.
var ErrNotFound = errors.New("snapshot not found")

const maxTagLength = 63

var tagPattern = regexp.MustCompile(`^[a-z0-9][a-z0-9_-]*$`)

// NormalizeTag checks an optional snapshot alias.
// Blank input is no tag. A present tag is stored lowercase.
func NormalizeTag(raw string) (string, error) {
	tag := strings.ToLower(strings.TrimSpace(raw))
	if tag == "" {
		return "", nil
	}
	if tag == "all" || len(tag) > maxTagLength || !tagPattern.MatchString(tag) {
		return "", errors.New("invalid snapshot tag")
	}
	return tag, nil
}

// TagPtr returns nil for a blank tag so the column stays NULL.
func TagPtr(tag string) *string {
	if tag == "" {
		return nil
	}
	return &tag
}

// SaveClaimingTag stores rec and clears the same tag on any other snapshot.
// The previous row stays, without the alias.
func SaveClaimingTag(rec *models.OverlaySnapshotRecord) error {
	if rec == nil {
		return errors.New("snapshot record is nil")
	}
	if !database.Ready() {
		return errors.New("database is not ready")
	}
	return database.Instance().Transaction(func(tx *gorm.DB) error {
		if rec.Tag != nil && *rec.Tag != "" {
			err := tx.Model(&models.OverlaySnapshotRecord{}).
				Where("tag = ? AND id <> ?", *rec.Tag, rec.ID).
				Update("tag", gorm.Expr("NULL")).Error
			if err != nil {
				return errors.Wrap(err, "failed to move snapshot tag")
			}
		}
		if err := tx.Save(rec).Error; err != nil {
			return errors.Wrap(err, "failed to save snapshot")
		}
		return nil
	})
}

// Resolve finds a snapshot by id, then by tag.
// An exact id wins even when another snapshot uses that string as a tag.
func Resolve(ref string) (models.OverlaySnapshotRecord, error) {
	ref = strings.TrimSpace(ref)
	if ref == "" {
		return models.OverlaySnapshotRecord{}, ErrNotFound
	}
	rec, err := Get(ref)
	if err == nil {
		return rec, nil
	}
	if !errors.Is(err, gorm.ErrRecordNotFound) {
		return models.OverlaySnapshotRecord{}, err
	}
	return one(strings.ToLower(ref))
}

// ResolveAll resolves each ref to its snapshot id, in order.
func ResolveAll(refs []string) ([]string, error) {
	if len(refs) == 0 {
		return nil, nil
	}
	out := make([]string, len(refs))
	for i, ref := range refs {
		rec, err := Resolve(ref)
		if err != nil {
			return nil, err
		}
		out[i] = rec.ID
	}
	return out, nil
}

func one(tag string) (models.OverlaySnapshotRecord, error) {
	if !database.Ready() {
		return models.OverlaySnapshotRecord{}, errors.New("database is not ready")
	}
	var rows []models.OverlaySnapshotRecord
	if err := database.Instance().Where("tag = ?", tag).Find(&rows).Error; err != nil {
		return models.OverlaySnapshotRecord{}, errors.Wrap(err, "failed to load snapshot")
	}
	if len(rows) == 0 {
		return models.OverlaySnapshotRecord{}, ErrNotFound
	}
	return Get(rows[0].ID)
}
