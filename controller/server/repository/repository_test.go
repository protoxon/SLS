package repository

import (
	"testing"

	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/software"
)

// Column updates go through the JSON serializer, so the stored record reads
// back the same.
func TestUpdatesRoundTrip(t *testing.T) {
	prev := config.Get()
	config.SetForTest(&config.Configuration{System: config.SystemConfiguration{RootDirectory: t.TempDir()}})
	t.Cleanup(func() { config.SetForTest(prev) })
	if err := database.Initialize(); err != nil {
		t.Fatal(err)
	}

	record := &models.ServerRecord{
		Id:            "srv",
		Configuration: &models.ServerConfiguration{Id: "srv"},
		InstallScript: &software.InstallationScript{},
	}
	if err := StoreServer(record); err != nil {
		t.Fatal(err)
	}
	want := models.ServerUsage{PeakBytes: 3 << 30, ObservedSeconds: 7200}
	if err := UpdateUsage("srv", &want); err != nil {
		t.Fatal(err)
	}
	all, err := GetAllServers()
	if err != nil {
		t.Fatal(err)
	}
	if len(all) != 1 || all[0].Usage == nil || *all[0].Usage != want {
		t.Fatalf("stored %+v", all)
	}
	if all[0].Configuration == nil || all[0].Configuration.Id != "srv" {
		t.Fatalf("usage update changed the configuration: %+v", all[0].Configuration)
	}

	cfg := models.ServerConfiguration{Id: "srv", Image: "next"}
	if err := UpdateConfiguration("srv", &cfg); err != nil {
		t.Fatal(err)
	}
	all, err = GetAllServers()
	if err != nil {
		t.Fatal(err)
	}
	if all[0].Configuration == nil || all[0].Configuration.Image != "next" {
		t.Fatalf("stored configuration %+v", all[0].Configuration)
	}
}
