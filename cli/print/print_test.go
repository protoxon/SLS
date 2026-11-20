package print

import (
	"bytes"
	"strings"
	"testing"
)

type sample struct {
	BlueprintID string `json:"blueprint_id"`
	NodeName    string `json:"node_name"`
}

func TestWriteJSONIndented(t *testing.T) {
	var buf bytes.Buffer
	p, err := New(&buf, "json")
	if err != nil {
		t.Fatal(err)
	}
	if err := p.Write(sample{BlueprintID: "bedwars", NodeName: "a"}, nil); err != nil {
		t.Fatal(err)
	}
	want := "{\n  \"blueprint_id\": \"bedwars\",\n  \"node_name\": \"a\"\n}\n"
	if buf.String() != want {
		t.Fatalf("got %q want %q", buf.String(), want)
	}
}

func TestWriteYAMLUsesJSONTags(t *testing.T) {
	var buf bytes.Buffer
	p, err := New(&buf, "yaml")
	if err != nil {
		t.Fatal(err)
	}
	if err := p.Write(sample{BlueprintID: "bedwars", NodeName: "a"}, nil); err != nil {
		t.Fatal(err)
	}
	got := buf.String()
	if !strings.Contains(got, "blueprint_id:") || !strings.Contains(got, "node_name:") {
		t.Fatalf("yaml %q", got)
	}
	if strings.Contains(got, "BlueprintID") || strings.Contains(got, "NodeName") {
		t.Fatalf("yaml used Go names: %q", got)
	}
}

func TestTableStatusUncolored(t *testing.T) {
	var buf bytes.Buffer
	p, err := New(&buf, "table")
	if err != nil {
		t.Fatal(err)
	}
	view := Table{
		Columns: []Column{{Header: "ID"}, {Header: "STATUS", Status: true}},
		Rows:    [][]string{{"srv_a", "running"}, {"srv_b", "offline"}},
	}
	if err := p.Write(nil, view); err != nil {
		t.Fatal(err)
	}
	got := buf.String()
	if strings.Contains(got, "\x1b") {
		t.Fatalf("buffer output has color: %q", got)
	}
	for _, want := range []string{"ID", "STATUS", "srv_a", "running", "srv_b", "offline"} {
		if !strings.Contains(got, want) {
			t.Fatalf("missing %q in %q", want, got)
		}
	}
}

func TestUnknownFormat(t *testing.T) {
	if _, err := New(&bytes.Buffer{}, "xml"); err == nil {
		t.Fatal("expected error")
	}
}
