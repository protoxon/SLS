package config

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"sort"
	"strings"
)

// Snapshot is the pull-credential payload sent to a node.
type Snapshot struct {
	Revision    string               `json:"revision"`
	Credentials []SnapshotCredential `json:"credentials"`
	// Insecure is registry hosts that should be reached with HTTP.
	// The default registry's host is included when registry.insecure is set,
	// even when that host has no pull credential.
	Insecure []string `json:"insecure,omitempty"`
}

// SnapshotCredential is a pull login for one registry host.
type SnapshotCredential struct {
	Host     string `json:"host"`
	Username string `json:"username,omitempty"`
	Password string `json:"password,omitempty"`
	Insecure bool   `json:"insecure,omitempty"`
}

// RegistrySnapshot builds the pull-credential payload for nodes.
// Passwords are resolved here (GHCR_TOKEN) so daemons never read Protocube env.
func RegistrySnapshot() Snapshot {
	cfg := Get()
	if cfg == nil {
		return Snapshot{Credentials: []SnapshotCredential{}}
	}
	return cfg.Registry.Snapshot()
}

// Snapshot copies configured pull credentials and assigns a revision hash.
func (c RegistryConfiguration) Snapshot() Snapshot {
	creds := make([]SnapshotCredential, 0, len(c.Credentials))
	for _, cred := range c.Credentials {
		host := NormalizeRegistryHost(cred.Host)
		if host == "" {
			continue
		}
		creds = append(creds, SnapshotCredential{
			Host:     host,
			Username: cred.Username,
			Password: cred.ResolvePassword(),
			Insecure: cred.Insecure,
		})
	}
	sort.Slice(creds, func(i, j int) bool {
		return strings.ToLower(creds[i].Host) < strings.ToLower(creds[j].Host)
	})
	var insecure []string
	if host := defaultInsecureHost(c); host != "" {
		insecure = []string{host}
	}
	snap := Snapshot{
		Credentials: creds,
		Insecure:    insecure,
	}
	snap.Revision = snapshotRevision(snap)
	return snap
}

// defaultInsecureHost is the default registry host when clients should use HTTP.
func defaultInsecureHost(c RegistryConfiguration) string {
	if !c.Insecure {
		return ""
	}
	host, _ := splitDefaultRegistry(c.Default)
	return host
}

func snapshotRevision(snap Snapshot) string {
	h := sha256.New()
	for _, host := range snap.Insecure {
		fmt.Fprintf(h, "insecure\t%s\n", host)
	}
	for _, cred := range snap.Credentials {
		fmt.Fprintf(h, "%s\t%s\t%s\t%t\n", cred.Host, cred.Username, cred.Password, cred.Insecure)
	}
	return hex.EncodeToString(h.Sum(nil))
}
