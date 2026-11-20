package snapshot

import (
	"testing"

	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/internal/api"
)

func TestPinVolumesRewritesDigest(t *testing.T) {
	rows := []models.OverlaySnapshotRecord{{
		Targets: []api.SnapshotTarget{{
			Target: "/",
			Lowers: []api.SnapshotLower{{
				Kind:     "volume",
				Name:     "world",
				Artifact: "localhost:5000/sls/world:latest",
				Digest:   "sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
			}},
		}},
	}}
	got, err := PinVolumes([]api.Volume{{
		Name:     "world",
		Artifact: "localhost:5000/sls/world:newer",
		Target:   "/",
	}}, rows)
	if err != nil {
		t.Fatal(err)
	}
	want := "localhost:5000/sls/world@sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
	if got[0].Artifact != want {
		t.Fatalf("artifact %s", got[0].Artifact)
	}
}
