package snapshot

import "testing"

func TestHashIsStableAndOrderIndependent(t *testing.T) {
	a := Hash([]string{"b", "a"})
	b := Hash([]string{"a", "b"})
	if a != b {
		t.Fatalf("hash order: %s %s", a, b)
	}
	if Hash(nil) != Hash([]string{}) {
		t.Fatal("empty hash changed")
	}
	if a == Hash(nil) {
		t.Fatal("non-empty hash matched empty")
	}
	if len(Hash(nil)) != 64 {
		t.Fatalf("empty hash length %d", len(Hash(nil)))
	}
}

func TestExpandAppendsRequirements(t *testing.T) {
	load := func(id string) (Config, error) {
		switch id {
		case "new":
			return Config{ID: "new", Requires: []string{"old"}}, nil
		case "old":
			return Config{ID: "old"}, nil
		case "other":
			return Config{ID: "other", Requires: []string{"old"}}, nil
		default:
			t.Fatalf("unexpected %s", id)
			return Config{}, nil
		}
	}
	got, err := Expand([]string{"other", "new"}, load)
	if err != nil {
		t.Fatal(err)
	}
	var ids []string
	for _, cfg := range got {
		ids = append(ids, cfg.ID)
	}
	want := []string{"other", "old", "new"}
	if len(ids) != len(want) {
		t.Fatalf("ids %v", ids)
	}
	for i := range want {
		if ids[i] != want[i] {
			t.Fatalf("ids %v", ids)
		}
	}
}
