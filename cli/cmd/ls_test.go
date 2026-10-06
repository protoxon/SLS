package cmd

import (
	"bytes"
	"context"
	"encoding/json"
	"path/filepath"
	"strings"
	"testing"

	"github.com/opencontainers/go-digest"
	"protoxon.com/config"
	"protoxon.com/oras/client"
	"protoxon.com/print"
)

func testListResult() client.ListResult {
	return client.ListResult{
		Repository: "localhost:5000/world",
		Volumes: []client.VolumeRef{
			{
				Repository: "localhost:5000/world",
				Tag:        "latest",
				Digest:     digest.Digest("sha256:" + strings.Repeat("a", 64)),
				Reference:  "localhost:5000/world:latest",
			},
			{
				Repository: "localhost:5000/world",
				Tag:        "v2",
				Digest:     digest.Digest("sha256:" + strings.Repeat("b", 64)),
				Reference:  "localhost:5000/world:v2",
			},
		},
	}
}

func TestVolumeTable(t *testing.T) {
	var buf bytes.Buffer
	p, err := print.New(&buf, "table")
	if err != nil {
		t.Fatal(err)
	}
	result := testListResult()
	if err := p.Write(result, volumeTable(result.Volumes)); err != nil {
		t.Fatal(err)
	}
	got := buf.String()
	if !strings.Contains(got, "REPOSITORY") || !strings.Contains(got, "TAG") || !strings.Contains(got, "DIGEST") {
		t.Fatalf("missing headers: %q", got)
	}
	if !strings.Contains(got, "localhost:5000/world") || !strings.Contains(got, "latest") {
		t.Fatalf("missing rows: %q", got)
	}
	if !strings.Contains(got, "sha256:"+strings.Repeat("a", 64)) {
		t.Fatalf("missing digest: %q", got)
	}
}

func TestVolumeTableEmpty(t *testing.T) {
	var buf bytes.Buffer
	p, err := print.New(&buf, "table")
	if err != nil {
		t.Fatal(err)
	}
	if err := p.Write(client.ListResult{}, volumeTable(nil)); err != nil {
		t.Fatal(err)
	}
	got := buf.String()
	if !strings.Contains(got, "REPOSITORY") {
		t.Fatalf("expected headers for empty list: %q", got)
	}
}

func TestVolumeListJSON(t *testing.T) {
	var buf bytes.Buffer
	p, err := print.New(&buf, "json")
	if err != nil {
		t.Fatal(err)
	}
	result := testListResult()
	if err := p.Write(result, volumeTable(result.Volumes)); err != nil {
		t.Fatal(err)
	}
	var got client.ListResult
	if err := json.Unmarshal(buf.Bytes(), &got); err != nil {
		t.Fatal(err)
	}
	if got.Repository != result.Repository || len(got.Volumes) != 2 {
		t.Fatalf("json: %+v", got)
	}
	if got.Volumes[0].Tag != "latest" || got.Volumes[1].Reference != "localhost:5000/world:v2" {
		t.Fatalf("volumes: %+v", got.Volumes)
	}
}

func TestVolumeLsUsesDefaultWhenNoName(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.yaml")
	t.Setenv("SLS_CONFIG", path)
	t.Setenv("SLS_API_URL", "")
	t.Setenv("SLS_TOKEN", "")
	t.Setenv("SLS_SOCKET", "")
	if err := config.Save(config.File{Registry: config.Registry{Default: "protocube.sls.net:5620/sls"}}); err != nil {
		t.Fatal(err)
	}
	got, err := currentDefaultRegistry(context.Background())
	if err != nil {
		t.Fatal(err)
	}
	ref, err := resolveVolumeRef(context.Background(), got)
	if err != nil {
		t.Fatal(err)
	}
	if ref != "protocube.sls.net:5620/sls" {
		t.Fatalf("ref %q", ref)
	}
}
