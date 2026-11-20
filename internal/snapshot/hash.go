package snapshot

import (
	"crypto/sha256"
	"encoding/hex"
	"sort"
)

// Hash is the fingerprint of a set of snapshot ids.
// Ids are sorted so the hash does not depend on directory order.
// The empty set hashes the empty input.
func Hash(ids []string) string {
	cp := append([]string(nil), ids...)
	sort.Strings(cp)
	h := sha256.New()
	for _, id := range cp {
		h.Write([]byte(id))
		h.Write([]byte{'\n'})
	}
	return hex.EncodeToString(h.Sum(nil))
}
