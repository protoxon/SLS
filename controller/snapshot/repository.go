package snapshot

import (
	"time"

	"emperror.dev/errors"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/internal/api"
)

const createTimeout = 30 * time.Minute

func Save(rec *models.OverlaySnapshotRecord) error {
	if rec == nil {
		return errors.New("snapshot record is nil")
	}
	if !database.Ready() {
		return errors.New("database is not ready")
	}
	if err := database.Instance().Save(rec).Error; err != nil {
		return errors.Wrap(err, "failed to save snapshot")
	}
	return nil
}

func Get(id string) (models.OverlaySnapshotRecord, error) {
	var rec models.OverlaySnapshotRecord
	if !database.Ready() {
		return rec, errors.New("database is not ready")
	}
	err := database.Instance().First(&rec, "id = ?", id).Error
	if err != nil {
		return rec, errors.Wrap(err, "failed to load snapshot")
	}
	if rec.Status == models.SnapshotCreating && !rec.UpdatedAt.IsZero() && time.Since(rec.UpdatedAt) > createTimeout {
		rec.Status = models.SnapshotFailed
		rec.Phase = api.SnapshotPhaseFailed
		rec.Error = "snapshot timed out"
		if err := Save(&rec); err != nil {
			return rec, err
		}
	}
	return rec, nil
}

func DeleteRecord(id string) error {
	if !database.Ready() {
		return errors.New("database is not ready")
	}
	if err := database.Instance().Delete(&models.OverlaySnapshotRecord{}, "id = ?", id).Error; err != nil {
		return errors.Wrap(err, "failed to delete snapshot")
	}
	return nil
}

func List() ([]models.OverlaySnapshotRecord, error) {
	if !database.Ready() {
		return nil, errors.New("database is not ready")
	}
	var rows []models.OverlaySnapshotRecord
	if err := database.Instance().Order("created_at desc").Find(&rows).Error; err != nil {
		return nil, errors.Wrap(err, "failed to list snapshots")
	}
	if rows == nil {
		rows = []models.OverlaySnapshotRecord{}
	}
	return rows, nil
}

func ListReady() ([]models.OverlaySnapshotRecord, error) {
	if !database.Ready() {
		return nil, errors.New("database is not ready")
	}
	var rows []models.OverlaySnapshotRecord
	if err := database.Instance().Where("status = ?", models.SnapshotReady).Find(&rows).Error; err != nil {
		return nil, errors.Wrap(err, "failed to list snapshots")
	}
	return rows, nil
}

func SaveTombstone(id string, nodes []string) error {
	if !database.Ready() {
		return errors.New("database is not ready")
	}
	if nodes == nil {
		nodes = []string{}
	}
	row := models.SnapshotTombstone{ID: id, Nodes: nodes}
	if err := database.Instance().Save(&row).Error; err != nil {
		return errors.Wrap(err, "failed to save snapshot tombstone")
	}
	return nil
}

func Tombstones() ([]models.SnapshotTombstone, error) {
	if !database.Ready() {
		return nil, nil
	}
	var rows []models.SnapshotTombstone
	if err := database.Instance().Find(&rows).Error; err != nil {
		return nil, errors.Wrap(err, "failed to list snapshot tombstones")
	}
	return rows, nil
}

func DeleteTombstone(id string) error {
	if !database.Ready() {
		return nil
	}
	return database.Instance().Delete(&models.SnapshotTombstone{}, "id = ?", id).Error
}
