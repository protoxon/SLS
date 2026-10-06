package cmd

import (
	"bytes"
	"context"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/config"
	"protoxon.com/print"
)

func TestFormatUptime(t *testing.T) {
	cases := []struct {
		ms   int64
		want string
	}{
		{0, "0s"},
		{-1, "0s"},
		{45000, "45s"},
		{120000, "2m 0s"},
		{3661000, "1h 1m 1s"},
		{90000000, "1d 1h 0s"},
	}
	for _, tc := range cases {
		if got := formatUptime(tc.ms); got != tc.want {
			t.Errorf("formatUptime(%d) = %q, want %q", tc.ms, got, tc.want)
		}
	}
}

func TestInfoView(t *testing.T) {
	info := serverInfo{
		Status:    "running",
		Blueprint: "Chunk Runner",
		Type:      "minigame",
		Server:    "paper 1.11.2",
		Node:      "SLS 29a91c39",
		CPU:       "9.04%",
		Memory:    "10.99%",
		Uptime:    "2m 0s",
	}
	var buf bytes.Buffer
	p, err := print.New(&buf, "table")
	if err != nil {
		t.Fatal(err)
	}
	if err := p.Write(info, infoView(info)); err != nil {
		t.Fatal(err)
	}
	text := buf.String()
	for _, line := range []string{
		" - Status: running",
		" - Blueprint: Chunk Runner",
		" - Type: minigame",
		" - Server: paper 1.11.2",
		" - Node: SLS 29a91c39",
		" - Stats: [Cpu: 9.04%, Mem: 10.99%]",
		" - Uptime: 2m 0s",
	} {
		if !strings.Contains(text, line) {
			t.Errorf("missing %q in %q", line, text)
		}
	}

	info.Type = ""
	buf.Reset()
	if err := p.Write(info, infoView(info)); err != nil {
		t.Fatal(err)
	}
	if strings.Contains(buf.String(), "Type") {
		t.Fatalf("omitted type still printed: %q", buf.String())
	}
}

func TestLoadServerInfo(t *testing.T) {
	var listed bool
	srv := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		switch r.URL.Path {
		case "/api/servers/0123456789ab/status":
			_, _ = w.Write([]byte(`{"status":"running"}`))
		case "/api/servers/0123456789ab/stats":
			_, _ = w.Write([]byte(`{"cpu_absolute":9.04,"memory_bytes":1099,"memory_limit_bytes":10000,"uptime":120000}`))
		case "/api/blueprints/chunk_runner":
			_, _ = w.Write([]byte(`{"metadata":{"id":"chunk_runner","name":"Chunk Runner","type":"minigame"}}`))
		case "/api/blueprints":
			listed = true
			http.NotFound(w, r)
		default:
			http.NotFound(w, r)
		}
	}))
	t.Cleanup(srv.Close)

	client, err := api.New(config.API{URL: srv.URL, Token: "tok"})
	if err != nil {
		t.Fatal(err)
	}
	cmd := &cobra.Command{}
	cmd.SetContext(context.Background())
	info, err := loadServerInfo(cmd, client, api.Server{
		ID:              "0123456789ab",
		BlueprintID:     "chunk_runner",
		NodeName:        "SLS",
		NodeID:          "29a91c39-d7d7-4c86-a302-a426fe77cf5f",
		SoftwareID:      "paper",
		SoftwareVersion: "1.11.2",
	})
	if err != nil {
		t.Fatal(err)
	}
	if listed {
		t.Fatal("info listed every blueprint")
	}
	if info.Status != "running" || info.Blueprint != "Chunk Runner" || info.Type != "minigame" {
		t.Fatalf("info %+v", info)
	}
	if info.Server != "paper 1.11.2" || info.Node != "SLS 29a91c39" {
		t.Fatalf("info %+v", info)
	}
	if info.CPU != "9.04%" || info.Memory != "10.99%" || info.Uptime != "2m 0s" {
		t.Fatalf("info %+v", info)
	}
}

func TestCreateAcceptsOptionalType(t *testing.T) {
	cmd := newServerCreateCommand()
	if err := cmd.Args(cmd, []string{"chunk_runner"}); err != nil {
		t.Fatal(err)
	}
	if err := cmd.Args(cmd, []string{"minigame", "chunk_runner"}); err != nil {
		t.Fatal(err)
	}
	if err := cmd.Args(cmd, nil); err == nil {
		t.Fatal("expected an error for no arguments")
	}
	if err := cmd.Args(cmd, []string{"a", "b", "c"}); err == nil {
		t.Fatal("expected an error for three arguments")
	}
}

func TestParseDrained(t *testing.T) {
	on, err := parseDrained("true")
	if err != nil || !on {
		t.Fatalf("true: %v %v", on, err)
	}
	off, err := parseDrained("FALSE")
	if err != nil || off {
		t.Fatalf("false: %v %v", off, err)
	}
	if _, err := parseDrained("undo"); err == nil {
		t.Fatal("expected an error")
	}
}
