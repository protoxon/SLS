package repository

import (
	"emperror.dev/errors"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
)

func StoreServer(server *models.ServerRecord) error {
	if err := database.Instance().Create(server).Error; err != nil {
		return errors.Wrap(err, "failed to save server to database")
	}
	return nil
}

func UpdateConfiguration(id string, cfg *models.ServerConfiguration) error {
	if err := database.Instance().Model(&models.ServerRecord{}).Where("id = ?", id).Updates(&models.ServerRecord{Configuration: cfg}).Error; err != nil {
		return errors.Wrap(err, "failed to update server configuration")
	}
	return nil
}

func UpdateUsage(id string, usage *models.ServerUsage) error {
	if err := database.Instance().Model(&models.ServerRecord{}).Where("id = ?", id).Updates(&models.ServerRecord{Usage: usage}).Error; err != nil {
		return errors.Wrap(err, "failed to update server usage")
	}
	return nil
}

func RemoveServer(id string) error {
	if err := database.Instance().Where("id = ?", id).Delete(&models.ServerRecord{}).Error; err != nil {
		return errors.Wrap(err, "failed to remove server from database")
	}
	return nil
}

// GetAllServers returns all servers stored in the database
func GetAllServers() ([]*models.ServerRecord, error) {
	servers := make([]*models.ServerRecord, 0)
	if err := database.Instance().Find(&servers).Error; err != nil {
		return nil, errors.Wrap(err, "failed to fetch servers from database")
	}
	return servers, nil
}
