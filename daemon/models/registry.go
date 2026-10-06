package models

// RegistrySnapshot is the pull-credential set a node caches from Protocube.
type RegistrySnapshot struct {
	Revision    string               `json:"revision"`
	Credentials []RegistryCredential `json:"credentials"`
	// Insecure is registry hosts that should be reached with HTTP.
	Insecure []string `json:"insecure,omitempty"`
}

// RegistryCredential is a pull login for one registry host.
type RegistryCredential struct {
	Host     string `json:"host"`
	Username string `json:"username,omitempty"`
	Password string `json:"password,omitempty"`
	Insecure bool   `json:"insecure,omitempty"`
}

// HeartbeatResponse is returned after a successful heartbeat.
type HeartbeatResponse struct {
	RegistryRevision string `json:"registry_revision"`
}
