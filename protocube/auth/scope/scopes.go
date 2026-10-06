package scope

import (
	"fmt"
	"strings"
)

const (
	AppAdmin = "app:admin"
	Node     = "node"

	ServersRead  = "servers:read"
	ServersWrite = "servers:write"
	ServersAll   = "servers:*"

	BlueprintsRead  = "blueprints:read"
	BlueprintsWrite = "blueprints:write"
	BlueprintsAll   = "blueprints:*"

	NodesRead  = "nodes:read"
	NodesWrite = "nodes:write"
	NodesAll   = "nodes:*"

	EventsRead = "events:read"

	TokensRead  = "tokens:read"
	TokensWrite = "tokens:write"
	TokensAll   = "tokens:*"

	RegistryRead  = "registry:read"
	RegistryWrite = "registry:write"
	RegistryAll   = "registry:*"
)

// Info describes a grantable scope for API responses and the CLI picker.
type Info struct {
	Scope       string `json:"scope"`
	Description string `json:"description"`
	Group       string `json:"group"`
}

var catalog = []Info{
	{AppAdmin, "Full control of the control plane", "Admin"},
	{Node, "Daemon identity for a node", "Admin"},
	{ServersRead, "List servers and view status, logs, and stats", "Servers"},
	{ServersWrite, "Create, delete, and control servers", "Servers"},
	{ServersAll, "All server permissions", "Servers"},
	{BlueprintsRead, "List blueprints, mixins, and software", "Blueprints"},
	{BlueprintsWrite, "Reload blueprints and software", "Blueprints"},
	{BlueprintsAll, "All blueprint permissions", "Blueprints"},
	{NodesRead, "List nodes and view system info", "Nodes"},
	{NodesWrite, "Drain and update nodes", "Nodes"},
	{NodesAll, "All node permissions", "Nodes"},
	{EventsRead, "Subscribe to server events", "Events"},
	{TokensRead, "List tokens you could have created", "Tokens"},
	{TokensWrite, "Create and revoke tokens within your scopes", "Tokens"},
	{TokensAll, "All token permissions", "Tokens"},
	{RegistryRead, "Pull and list volumes from the Protocube registry", "Registry"},
	{RegistryWrite, "Push and delete volumes on the Protocube registry", "Registry"},
	{RegistryAll, "All registry permissions", "Registry"},
}

var known map[string]struct{}

func init() {
	known = make(map[string]struct{}, len(catalog))
	for _, info := range catalog {
		known[info.Scope] = struct{}{}
	}
}

// All returns every grantable scope string, including wildcards.
func All() []string {
	out := make([]string, 0, len(catalog))
	for _, info := range catalog {
		out = append(out, info.Scope)
	}
	return out
}

// Catalog returns scope metadata for pickers and API responses.
func Catalog() []Info {
	out := make([]Info, len(catalog))
	copy(out, catalog)
	return out
}

// Known reports whether scope is in the catalog.
func Known(s string) bool {
	_, ok := known[s]
	return ok
}

// Allows reports whether have authorizes need.
// app:admin implies every user scope but not node. node implies registry:read.
// write does not imply read.
func Allows(have []string, need string) bool {
	if need == "" {
		return true
	}
	for _, s := range have {
		if s == "*" || s == need {
			return true
		}
		if s == AppAdmin && need != Node {
			return true
		}
		if s == Node && need == RegistryRead {
			return true
		}
		if strings.HasSuffix(s, ":*") {
			prefix := strings.TrimSuffix(s, "*")
			if strings.HasPrefix(need, prefix) {
				return true
			}
		}
	}
	return false
}

// AllowsAny reports whether have authorizes at least one of needs.
func AllowsAny(have []string, needs ...string) bool {
	for _, need := range needs {
		if Allows(have, need) {
			return true
		}
	}
	return false
}

// CanGrant reports whether a caller with have may mint a token with want.
// A Unix-local connection or app:admin may grant any known scope, including node.
// A user PAT can never grant node, and may only grant scopes it already allows.
func CanGrant(have []string, want []string, local bool) error {
	admin := local || Allows(have, AppAdmin)
	for _, w := range want {
		if !Known(w) {
			return fmt.Errorf("unknown scope %s", w)
		}
		if admin {
			continue
		}
		if w == Node {
			return fmt.Errorf("cannot grant %s", w)
		}
		if !Allows(have, w) {
			return fmt.Errorf("cannot grant %s", w)
		}
	}
	return nil
}

// CanManage reports whether a caller may list, show, revoke, or delete a key
// whose scopes are target. Admin and local callers can manage every key.
func CanManage(have []string, target []string, local bool) bool {
	return CanGrant(have, target, local) == nil
}

// Grantable returns catalog entries the caller may assign to a new token.
func Grantable(have []string, local bool) []Info {
	out := make([]Info, 0, len(catalog))
	for _, info := range catalog {
		if CanGrant(have, []string{info.Scope}, local) == nil {
			out = append(out, info)
		}
	}
	return out
}
