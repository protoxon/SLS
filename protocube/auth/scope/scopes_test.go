package scope

import "testing"

func TestAllowsAdminImpliesUserScopesNotNode(t *testing.T) {
	have := []string{AppAdmin}
	if !Allows(have, ServersRead) || !Allows(have, TokensWrite) || !Allows(have, AppAdmin) {
		t.Fatal("admin should allow user scopes")
	}
	if Allows(have, Node) {
		t.Fatal("admin should not satisfy node")
	}
}

func TestAllowsWildcard(t *testing.T) {
	have := []string{ServersAll}
	if !Allows(have, ServersRead) || !Allows(have, ServersWrite) {
		t.Fatal("servers:* should allow read and write")
	}
	if Allows(have, BlueprintsRead) {
		t.Fatal("servers:* should not allow blueprints")
	}
	if Allows(have, ServersAll) == false {
		t.Fatal("servers:* should allow itself")
	}
}

func TestAllowsWriteDoesNotImplyRead(t *testing.T) {
	if Allows([]string{ServersWrite}, ServersRead) {
		t.Fatal("write should not imply read")
	}
	if Allows([]string{RegistryWrite}, RegistryRead) {
		t.Fatal("registry:write should not imply registry:read")
	}
}

func TestAllowsRegistryScopes(t *testing.T) {
	if !Allows([]string{AppAdmin}, RegistryRead) || !Allows([]string{AppAdmin}, RegistryWrite) {
		t.Fatal("admin should allow registry read and write")
	}
	if !Allows([]string{Node}, RegistryRead) {
		t.Fatal("node should allow registry:read")
	}
	if Allows([]string{Node}, RegistryWrite) {
		t.Fatal("node should not allow registry:write")
	}
	if !Allows([]string{RegistryAll}, RegistryRead) || !Allows([]string{RegistryAll}, RegistryWrite) {
		t.Fatal("registry:* should allow read and write")
	}
	if Allows([]string{ServersRead}, RegistryRead) {
		t.Fatal("servers:read should not allow registry:read")
	}
}

func TestCanGrantSubsetAndNodeIsolation(t *testing.T) {
	have := []string{ServersRead, TokensWrite}
	if err := CanGrant(have, []string{ServersRead}, false); err != nil {
		t.Fatal(err)
	}
	if err := CanGrant(have, []string{ServersWrite}, false); err == nil {
		t.Fatal("should not grant servers:write")
	}
	if err := CanGrant(have, []string{Node}, false); err == nil {
		t.Fatal("user PAT should not grant node")
	}
	if err := CanGrant(have, []string{AppAdmin}, false); err == nil {
		t.Fatal("should not grant admin")
	}
	if err := CanGrant([]string{AppAdmin}, []string{Node, ServersAll}, false); err != nil {
		t.Fatal(err)
	}
	if err := CanGrant(nil, []string{Node, AppAdmin}, true); err != nil {
		t.Fatal(err)
	}
	if err := CanGrant(have, []string{"not:a:scope"}, false); err == nil {
		t.Fatal("unknown scope should fail")
	}
}

func TestCanManage(t *testing.T) {
	if !CanManage([]string{AppAdmin}, []string{Node}, false) {
		t.Fatal("admin should manage node keys")
	}
	if CanManage([]string{ServersRead}, []string{ServersWrite}, false) {
		t.Fatal("read should not manage write keys")
	}
	if !CanManage([]string{ServersAll}, []string{ServersRead}, false) {
		t.Fatal("servers:* should manage servers:read keys")
	}
}

func TestGrantableFilters(t *testing.T) {
	got := Grantable([]string{ServersRead, TokensWrite}, false)
	seen := map[string]bool{}
	for _, info := range got {
		seen[info.Scope] = true
		if info.Scope == Node || info.Scope == AppAdmin || info.Scope == ServersWrite {
			t.Fatalf("unexpected grantable %s", info.Scope)
		}
	}
	if !seen[ServersRead] || !seen[TokensWrite] {
		t.Fatalf("missing expected scopes: %v", seen)
	}
}
