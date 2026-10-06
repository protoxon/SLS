package remote

import (
	"context"

	"emperror.dev/errors"
	"protoxon.com/sls/daemon/models"
	orasclient "protoxon.com/sls/daemon/oras/client"
)

// GetRegistry fetches the Protocube pull-credential snapshot.
func (c *client) GetRegistry(ctx context.Context) (models.RegistrySnapshot, error) {
	return Get[models.RegistrySnapshot](c, ctx, "/internal/registry", nil)
}

// SyncRegistry replaces the in-memory ORAS snapshot from Protocube.
func (c *client) SyncRegistry(ctx context.Context) error {
	snap, err := c.GetRegistry(ctx)
	if err != nil {
		return errors.Wrap(err, "failed to fetch registry credentials")
	}
	if snap.Credentials == nil {
		snap.Credentials = []models.RegistryCredential{}
	}
	orasclient.ApplySnapshot(snap)
	return nil
}

// SyncRegistryIfChanged fetches the snapshot when revision differs from cache.
func (c *client) SyncRegistryIfChanged(ctx context.Context, revision string) error {
	if revision == "" || revision == orasclient.SnapshotRevision() {
		return nil
	}
	return c.SyncRegistry(ctx)
}
