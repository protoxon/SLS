package remote

import (
	"testing"

	"protoxon.com/sls/daemon/models"
	orasclient "protoxon.com/sls/daemon/oras/client"
)

func TestSyncRegistryIfChangedSkipsSameRevision(t *testing.T) {
	orasclient.ApplySnapshot(models.RegistrySnapshot{Revision: "abc"})
	t.Cleanup(func() { orasclient.ApplySnapshot(models.RegistrySnapshot{}) })
	c := &client{}
	if err := c.SyncRegistryIfChanged(t.Context(), "abc"); err != nil {
		t.Fatal(err)
	}
	if err := c.SyncRegistryIfChanged(t.Context(), ""); err != nil {
		t.Fatal(err)
	}
}
