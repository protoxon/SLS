package snapshot

import (
	"errors"
	"os"
	"strings"
	"sync"
	"testing"

	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
)

var snapshotDBOnce sync.Once

func openSnapshotDB(t *testing.T) {
	t.Helper()
	var initErr error
	snapshotDBOnce.Do(func() {
		dir, err := os.MkdirTemp("", "sls-snapshot-tag")
		if err != nil {
			initErr = err
			return
		}
		config.SetForTest(&config.Configuration{System: config.SystemConfiguration{RootDirectory: dir}})
		initErr = database.Initialize()
	})
	if initErr != nil {
		t.Fatal(initErr)
	}
	t.Cleanup(func() {
		if err := database.Instance().Exec("DELETE FROM overlay_snapshot_records").Error; err != nil {
			t.Errorf("clean snapshots: %v", err)
		}
	})
}

func TestNormalizeTag(t *testing.T) {
	got, err := NormalizeTag("  Reset ")
	if err != nil || got != "reset" {
		t.Fatalf("NormalizeTag(Reset) = %q, %v", got, err)
	}
	if got, err := NormalizeTag("  "); err != nil || got != "" {
		t.Fatalf("blank tag = %q, %v", got, err)
	}
	for _, raw := range []string{"all", "ALL", "bad/tag", "-reset", "has space", strings.Repeat("a", 64)} {
		if _, err := NormalizeTag(raw); err == nil {
			t.Fatalf("NormalizeTag(%q) accepted", raw)
		}
	}
}

func TestSaveClaimingTagMovesAlias(t *testing.T) {
	openSnapshotDB(t)
	old := models.OverlaySnapshotRecord{
		ID: "h8w2", BlueprintID: "bedwars", Tag: TagPtr("reset"),
		Status: models.SnapshotReady, Digest: "sha256:old",
	}
	if err := SaveClaimingTag(&old); err != nil {
		t.Fatal(err)
	}
	other := models.OverlaySnapshotRecord{
		ID: "lobby1", BlueprintID: "lobby", Tag: TagPtr("reset"),
		Status: models.SnapshotReady,
	}
	if err := SaveClaimingTag(&other); err != nil {
		t.Fatal(err)
	}
	moved, err := Get("h8w2")
	if err != nil {
		t.Fatal(err)
	}
	if moved.Tag != nil || moved.Digest != "sha256:old" {
		t.Fatalf("tag stayed on the first blueprint: %+v", moved)
	}
	next := models.OverlaySnapshotRecord{
		ID: "k3m9", BlueprintID: "bedwars", Tag: TagPtr("reset"),
		Status: models.SnapshotCreating,
	}
	if err := SaveClaimingTag(&next); err != nil {
		t.Fatal(err)
	}

	gotOld, err := Get("h8w2")
	if err != nil {
		t.Fatal(err)
	}
	if gotOld.Tag != nil || gotOld.Digest != "sha256:old" || gotOld.Status != models.SnapshotReady {
		t.Fatalf("old snapshot = %+v", gotOld)
	}
	gotNew, err := Get("k3m9")
	if err != nil {
		t.Fatal(err)
	}
	if gotNew.Tag == nil || *gotNew.Tag != "reset" {
		t.Fatalf("new tag = %v", gotNew.Tag)
	}
	gotLobby, err := Get("lobby1")
	if err != nil {
		t.Fatal(err)
	}
	if gotLobby.Tag != nil {
		t.Fatalf("lobby kept the tag: %v", gotLobby.Tag)
	}

	untagged := models.OverlaySnapshotRecord{ID: "plain", BlueprintID: "bedwars", Status: models.SnapshotReady}
	if err := Save(&untagged); err != nil {
		t.Fatal(err)
	}
	also := models.OverlaySnapshotRecord{ID: "plain2", BlueprintID: "bedwars", Status: models.SnapshotReady}
	if err := Save(&also); err != nil {
		t.Fatalf("second untagged snapshot: %v", err)
	}
	dup := models.OverlaySnapshotRecord{ID: "dup", BlueprintID: "bedwars", Tag: TagPtr("reset"), Status: models.SnapshotReady}
	if err := Save(&dup); err == nil {
		t.Fatal("duplicate tag was stored")
	}
}

func TestResolveSnapshotRef(t *testing.T) {
	openSnapshotDB(t)
	rows := []models.OverlaySnapshotRecord{
		{ID: "snap1", BlueprintID: "bedwars", Status: models.SnapshotReady},
		{ID: "old", BlueprintID: "lobby", Tag: TagPtr("snap1"), Status: models.SnapshotReady},
		{ID: "bw", BlueprintID: "bedwars", Tag: TagPtr("reset"), Status: models.SnapshotReady},
	}
	for i := range rows {
		if err := Save(&rows[i]); err != nil {
			t.Fatal(err)
		}
	}
	again := models.OverlaySnapshotRecord{ID: "lb", BlueprintID: "lobby", Tag: TagPtr("reset"), Status: models.SnapshotReady}
	if err := Save(&again); err == nil {
		t.Fatal("same tag was stored on a second blueprint")
	}

	got, err := Resolve("snap1")
	if err != nil || got.ID != "snap1" || got.Tag != nil {
		t.Fatalf("id lookup = %+v, %v", got, err)
	}

	got, err = Resolve("Reset")
	if err != nil || got.ID != "bw" {
		t.Fatalf("tag lookup = %+v, %v", got, err)
	}
	if _, err := Resolve("bedwars/reset"); err == nil || !errors.Is(err, ErrNotFound) {
		t.Fatalf("slash ref err = %v", err)
	}

	if _, err := Resolve("missing"); err == nil || !errors.Is(err, ErrNotFound) {
		t.Fatalf("missing err = %v", err)
	}

	ids, err := ResolveAll([]string{"reset", "snap1"})
	if err != nil || len(ids) != 2 || ids[0] != "bw" || ids[1] != "snap1" {
		t.Fatalf("ResolveAll = %v, %v", ids, err)
	}
}
