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
		return "", errors.Errorf("artifact %q is missing a registry; set registry.default (for example ghcr.io/jessefaler) or use a full reference", ref)
	}
	if !strings.Contains(name, "/") && namespace != "" {
		name = namespace + "/" + name
	}
	if tag == "" && digest == "" {
		tag = "latest"
	}
	return joinArtifact(host+"/"+name, tag, digest), nil
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
	first, _, _ := strings.Cut(name, "/")
	host, port, hasPort := splitRegistryHostPort(first)
	if hasPort && !isRegistryPort(port) {
		return false
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
