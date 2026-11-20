package blueprint

import (
	"sort"
	"strings"
)

// ArtifactRefs returns the deduped artifact references named by resolved blueprints.
// Local source volumes are skipped. Includes are already applied on the blueprints
// stored in the registry.
func ArtifactRefs(blueprints []*Blueprint) []string {
	seen := map[string]struct{}{}
	out := []string{}
	for _, bp := range blueprints {
		if bp == nil || bp.State == nil {
			continue
		}
		for _, v := range bp.State.Volumes {
			art := strings.TrimSpace(v.Artifact)
			if art == "" {
				continue
			}
			if _, ok := seen[art]; ok {
				continue
			}
			seen[art] = struct{}{}
			out = append(out, art)
		}
	}
	sort.Strings(out)
	return out
}
