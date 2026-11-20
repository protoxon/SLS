package snapshot

import (
	"path/filepath"
	"strings"

	"github.com/opencontainers/go-digest"
	"protoxon.com/sls/internal/volume"
)

const (
	ArtifactType    = "application/vnd.sls.snapshot.v1"
	ConfigMediaType = "application/vnd.sls.snapshot.config.v1+json"
	SchemaVersion   = 1

	KindServer   = "server"
	KindVolume   = "volume"
	KindSnapshot = "snapshot"

	// LocalityMinBytes is the combined snapshot size that earns a placement
	// preference for a node that already has every requested snapshot.
	LocalityMinBytes int64 = 1 << 30
)

// Config is the snapshot config blob. Regular file bytes live in volume
// layers. Whiteouts, opaque directories, and symlinks are recorded here
// because the volume packer only stores regular files.
type Config struct {
	SchemaVersion   int      `json:"schemaVersion"`
	MediaType       string   `json:"mediaType"`
	ID              string   `json:"id"`
	ServerID        string   `json:"serverId,omitempty"`
	SoftwareID      string   `json:"softwareId,omitempty"`
	SoftwareVersion string   `json:"softwareVersion,omitempty"`
	ServerFolder    string   `json:"serverFolder,omitempty"`
	Requires        []string `json:"requires,omitempty"`
	Digest          string   `json:"digest,omitempty"`
	Targets         []Target `json:"targets,omitempty"`
}

// Target is one overlay diff, keyed by the volume target.
type Target struct {
	Target    string          `json:"target"`
	Name      string          `json:"name"`
	Whiteouts []string        `json:"whiteouts,omitempty"`
	Opaque    []string        `json:"opaque,omitempty"`
	Symlinks  []Symlink       `json:"symlinks,omitempty"`
	Dirs      []string        `json:"dirs,omitempty"`
	Lowers    []Lower         `json:"lowers,omitempty"`
	Files     volume.Manifest `json:"files"`
}

// Symlink is a symlink in the overlay upper.
type Symlink struct {
	Path   string `json:"path"`
	Target string `json:"target"`
}

// Lower is one directory that was mounted under the snapshot diff.
// Kind is server, volume, or snapshot.
type Lower struct {
	Kind       string `json:"kind"`
	Name       string `json:"name,omitempty"`
	Artifact   string `json:"artifact,omitempty"`
	Digest     string `json:"digest,omitempty"`
	Path       string `json:"path,omitempty"`
	Target     string `json:"target,omitempty"`
	SnapshotID string `json:"snapshotId,omitempty"`
}

// NormalizeTarget returns the overlay target used as a map key.
// Root is "/".
func NormalizeTarget(target string) string {
	target = strings.TrimSpace(target)
	if target == "" || target == "." || target == "/" {
		return "/"
	}
	cleaned := filepath.ToSlash(filepath.Clean(target))
	cleaned = strings.Trim(cleaned, "/")
	if cleaned == "" || cleaned == "." {
		return "/"
	}
	return "/" + cleaned
}

// FileBytes is the uncompressed size of every regular file in the snapshot.
func (c Config) FileBytes() int64 {
	var n int64
	for _, target := range c.Targets {
		n += target.Files.FileBytes()
	}
	return n
}

// LayerBytes is the compressed size of every layer blob.
func (c Config) LayerBytes() int64 {
	seen := map[digest.Digest]int64{}
	for _, target := range c.Targets {
		for _, layer := range target.Files.Layers {
			seen[layer.Digest] = layer.Size
		}
	}
	var n int64
	for _, size := range seen {
		n += size
	}
	return n
}

// HasTarget reports whether the snapshot has a diff for target.
func (c Config) HasTarget(target string) bool {
	target = NormalizeTarget(target)
	for _, item := range c.Targets {
		if NormalizeTarget(item.Target) == target {
			return true
		}
	}
	return false
}

// TargetNamed returns the diff for target.
func (c Config) TargetNamed(target string) (Target, bool) {
	target = NormalizeTarget(target)
	for _, item := range c.Targets {
		if NormalizeTarget(item.Target) == target {
			return item, true
		}
	}
	return Target{}, false
}
