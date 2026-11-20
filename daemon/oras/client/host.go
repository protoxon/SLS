package client

import (
	"strings"
)

// NormalizeRegistryHost turns a registry server address into a host[:port].
func NormalizeRegistryHost(host string) string {
	host = strings.TrimSpace(host)
	host = strings.TrimPrefix(host, "https://")
	host = strings.TrimPrefix(host, "http://")
	host = strings.TrimRight(host, "/")
	switch host {
	case "index.docker.io", "index.docker.io/v1", "registry-1.docker.io":
		return "docker.io"
	}
	return host
}
