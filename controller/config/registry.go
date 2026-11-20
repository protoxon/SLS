package config

import (
	"net"
	"strconv"
	"strings"

	"emperror.dev/errors"
)

func (c RegistryConfiguration) ResolveArtifact(ref string) (string, error) {
	ref = strings.TrimSpace(ref)
	ref = strings.TrimPrefix(ref, "https://")
	ref = strings.TrimPrefix(ref, "http://")
	if ref == "" {
		return "", errors.New("artifact is empty")
	}

	digest := ""
	if i := strings.Index(ref, "@"); i >= 0 {
		digest = ref[i:]
		ref = ref[:i]
	}

	name, tag := splitArtifactNameTag(ref)
	if name == "" {
		return "", errors.New("artifact is missing a repository name")
	}

	if artifactHasRegistry(name) {
		if tag == "" && digest == "" {
			tag = "latest"
		}
		return joinArtifact(name, tag, digest), nil
	}

	host, namespace := splitDefaultRegistry(c.Default)
	if host == "" {
		return "", errors.Errorf("artifact %q is missing a registry", ref)
	}
	if !strings.Contains(name, "/") && namespace != "" {
		name = namespace + "/" + name
	}
	if tag == "" && digest == "" {
		tag = "latest"
	}
	return joinArtifact(host+"/"+name, tag, digest), nil
}

// ResolveSnapshot returns the OCI reference for one snapshot id.
// registry.snapshots is the host or host/namespace when set. Otherwise the
// reference is resolved through registry.default. The repository is snapshots
// and the tag is id.
func (c RegistryConfiguration) ResolveSnapshot(id string) (string, error) {
	id = strings.TrimSpace(id)
	if id == "" {
		return "", errors.New("snapshot id is empty")
	}
	reg := c
	if dest := strings.TrimSpace(c.Snapshots); dest != "" {
		reg.Default = dest
	}
	return reg.ResolveArtifact("snapshots:" + id)
}

// SnapshotRepository is the OCI repository name used for snapshot manifests.
// It matches ResolveSnapshot without the registry host or tag.
func (c RegistryConfiguration) SnapshotRepository() string {
	ref, err := c.ResolveSnapshot("snapshot")
	if err != nil {
		return ""
	}
	name := ref
	if i := strings.LastIndex(name, ":"); i >= 0 && strings.LastIndex(name, "/") < i {
		name = name[:i]
	}
	_, repo, ok := strings.Cut(name, "/")
	if !ok {
		return ""
	}
	return strings.Trim(repo, "/")
}

func splitDefaultRegistry(s string) (host, namespace string) {
	s = strings.Trim(NormalizeRegistryHost(s), "/")
	if s == "" {
		return "", ""
	}
	host, namespace, ok := strings.Cut(s, "/")
	if !ok {
		return host, ""
	}
	return host, strings.Trim(namespace, "/")
}

func splitArtifactNameTag(ref string) (name, tag string) {
	i := strings.LastIndex(ref, ":")
	if i < 0 {
		return ref, ""
	}
	if strings.LastIndex(ref, "/") > i {
		return ref, ""
	}
	return ref[:i], ref[i+1:]
}

func artifactHasRegistry(name string) bool {
	first, _, hasPath := strings.Cut(name, "/")
	if !hasPath {
		return false
	}
	host, port, hasPort := splitRegistryHostPort(first)
	if hasPort {
		return host != "" && isRegistryPort(port)
	}
	return isRegistryHostname(host)
}

func joinArtifact(name, tag, digest string) string {
	if tag != "" {
		name += ":" + tag
	}
	return name + digest
}

func splitRegistryHostPort(host string) (string, string, bool) {
	if h, p, err := net.SplitHostPort(host); err == nil {
		return h, p, true
	}
	return strings.Trim(host, "[]"), "", false
}

func isRegistryPort(port string) bool {
	n, err := strconv.Atoi(port)
	return err == nil && n > 0 && n <= 65535
}

func isRegistryHostname(host string) bool {
	if host == "" {
		return false
	}
	if strings.EqualFold(host, "localhost") {
		return true
	}
	if net.ParseIP(host) != nil {
		return true
	}
	return strings.Contains(host, ".")
}
