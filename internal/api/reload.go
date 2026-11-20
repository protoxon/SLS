package api

// LoadError is one blueprint, mixin, software file, or unclassified document
// that failed to load.
type LoadError struct {
	Kind  string `json:"kind"`
	ID    string `json:"id,omitempty"`
	Path  string `json:"path,omitempty"`
	Error string `json:"error"`
}

// ReloadResult is the body of a blueprint or software reload. Counts that the
// endpoint does not return stay zero.
type ReloadResult struct {
	Blueprints int         `json:"blueprints"`
	Mixins     int         `json:"mixins"`
	Software   int         `json:"software"`
	Errors     []LoadError `json:"errors"`
}

// DefaultRegistryInfo is Controller's configured default registry.
type DefaultRegistryInfo struct {
	Default  string `json:"default"`
	Insecure bool   `json:"insecure"`
}
