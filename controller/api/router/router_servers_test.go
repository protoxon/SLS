package router

import (
	"encoding/json"
	"net/http"
	"testing"

	"protoxon.com/sls/controller/auth/scope"
	"protoxon.com/sls/controller/client"
	"protoxon.com/sls/controller/node"
	"protoxon.com/sls/controller/server"
)

func TestListServersByNode(t *testing.T) {
	manager := server.NewEmptyManager()
	nodes := client.New()
	manager.Add(server.NewWithClient("srv-a", "node-a", nodes.Node("node-a", "http://a", "t").Server("srv-a")))
	manager.Add(server.NewWithClient("srv-b", "node-b", nodes.Node("node-b", "http://b", "t").Server("srv-b")))

	rt, svc := testTokenRouter(t)
	rt.ServerManager = manager
	rt.NodeManager = node.NewManager(client.New())
	rt.NodeManager.Add(node.New("node-a", "a", "local", "http://a", "t", false))
	rt.NodeManager.Add(node.New("node-b", "b", "local", "http://b", "t", false))
	rt.NodeManager.Add(node.New("node-empty", "empty", "local", "http://e", "t", false))
	rt.Handler = rt.Configure()

	key := createTestKey(t, svc, "read", []string{scope.ServersRead}, nil)

	all := doJSON(t, rt.Handler, http.MethodGet, "/api/servers", key.Key, nil, false)
	if all.Code != http.StatusOK {
		t.Fatalf("list status %d body %s", all.Code, all.Body.String())
	}
	if got := serverIDs(t, all.Body.Bytes()); !sameIDs(got, "srv-a", "srv-b") {
		t.Fatalf("list ids %v", got)
	}

	filtered := doJSON(t, rt.Handler, http.MethodGet, "/api/servers?node_id=node-a", key.Key, nil, false)
	if filtered.Code != http.StatusOK {
		t.Fatalf("filter status %d body %s", filtered.Code, filtered.Body.String())
	}
	if got := serverIDs(t, filtered.Body.Bytes()); !sameIDs(got, "srv-a") {
		t.Fatalf("filter ids %v", got)
	}

	idsOnly := doJSON(t, rt.Handler, http.MethodGet, "/api/servers?node_id=node-b&ids_only=true", key.Key, nil, false)
	if idsOnly.Code != http.StatusOK {
		t.Fatalf("ids status %d body %s", idsOnly.Code, idsOnly.Body.String())
	}
	var ids []string
	if err := json.Unmarshal(idsOnly.Body.Bytes(), &ids); err != nil {
		t.Fatal(err)
	}
	if !sameIDs(ids, "srv-b") {
		t.Fatalf("ids %v", ids)
	}

	empty := doJSON(t, rt.Handler, http.MethodGet, "/api/servers?node_id=node-empty", key.Key, nil, false)
	if empty.Code != http.StatusOK {
		t.Fatalf("empty status %d body %s", empty.Code, empty.Body.String())
	}
	if got := serverIDs(t, empty.Body.Bytes()); len(got) != 0 {
		t.Fatalf("empty ids %v", got)
	}

	missing := doJSON(t, rt.Handler, http.MethodGet, "/api/servers?node_id=missing", key.Key, nil, false)
	if missing.Code != http.StatusNotFound {
		t.Fatalf("missing status %d body %s", missing.Code, missing.Body.String())
	}
}

func serverIDs(t *testing.T, body []byte) []string {
	t.Helper()
	var rows []struct {
		ID string `json:"id"`
	}
	if err := json.Unmarshal(body, &rows); err != nil {
		t.Fatal(err)
	}
	ids := make([]string, len(rows))
	for i, row := range rows {
		ids[i] = row.ID
	}
	return ids
}

func sameIDs(got []string, want ...string) bool {
	if len(got) != len(want) {
		return false
	}
	seen := map[string]int{}
	for _, id := range got {
		seen[id]++
	}
	for _, id := range want {
		seen[id]--
		if seen[id] < 0 {
			return false
		}
	}
	for _, n := range seen {
		if n != 0 {
			return false
		}
	}
	return true
}
