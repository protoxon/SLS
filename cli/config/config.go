package config

import (
	"fmt"
	"net/url"
	"os"
	"os/user"
	"path/filepath"
	"regexp"
	"sort"
	"strings"

	"gopkg.in/yaml.v3"
)

const (
	credentialsEnv = "SLS_CREDENTIALS"
	configEnv      = "SLS_CONFIG"
	apiURLEnv      = "SLS_API_URL"
	tokenEnv       = "SLS_TOKEN"
	socketEnv      = "SLS_SOCKET"
	profileEnv     = "SLS_PROFILE"

	DefaultSocket = "/var/lib/sls/run/sls.sock"
	DefaultAPIURL = "https://localhost:5620"

	// LocalProfile is the built-in profile that talks to the admin socket.
	LocalProfile = "local"
)

var profileNamePattern = regexp.MustCompile(`^[A-Za-z0-9_-]+$`)

// Profile is one Controller the CLI can talk to.
type Profile struct {
	URL      string         `yaml:"url,omitempty"`
	Token    string         `yaml:"token,omitempty"`
	Scopes   []string       `yaml:"scopes,omitempty"`
	Socket   string         `yaml:"socket,omitempty"`
	Registry Registry       `yaml:"registry,omitempty"`
	Hosts    []RegistryHost `yaml:"hosts,omitempty"`
}

// File is the CLI config. API and Registry are the profile this process is using.
type File struct {
	Current  string
	Profiles map[string]Profile
	API      API
	Registry Registry
	Hosts    []RegistryHost

	diskCurrent string
	switched    bool
	baseAPI     API
}

type storedConfig struct {
	Current  string             `yaml:"current,omitempty"`
	Profiles map[string]Profile `yaml:"profiles,omitempty"`
}

// Registry is the CLI's saved default registry.
type Registry struct {
	// Default is a registry host or host/namespace used when a reference omits one.
	Default string `yaml:"default,omitempty"`
	// Insecure means use HTTP instead of HTTPS for Default's host.
	Insecure bool `yaml:"insecure,omitempty"`
}

// RegistryHost is an extra name for this Controller's embedded registry.
// The login URL's host is always included and is not stored here.
// registry.default is not a name for the embedded registry.
type RegistryHost struct {
	Host     string `yaml:"host"`
	Insecure bool   `yaml:"insecure,omitempty"`
}

type API struct {
	URL    string   `yaml:"url"`
	Token  string   `yaml:"token"`
	Scopes []string `yaml:"scopes,omitempty"`
	Socket string   `yaml:"socket,omitempty"`
}

func ConfigPath() (string, error) {
	if path := os.Getenv(configEnv); path != "" {
		return path, nil
	}
	dir, err := userConfigDir()
	if err != nil {
		return "", err
	}
	return filepath.Join(dir, "sls", "config.yaml"), nil
}

func userConfigDir() (string, error) {
	if sudo := os.Getenv("SUDO_USER"); sudo != "" && os.Geteuid() == 0 {
		u, err := user.Lookup(sudo)
		if err == nil && u.HomeDir != "" {
			if xdg := sudoUserXDG(u.HomeDir); xdg != "" {
				return xdg, nil
			}
			return filepath.Join(u.HomeDir, ".config"), nil
		}
	}
	return os.UserConfigDir()
}

func sudoUserXDG(home string) string {
	// SUDO typically clears XDG_CONFIG_HOME or leaves the root value; prefer the
	// invoking user's default so setup does not write /root/.config.
	return filepath.Join(home, ".config")
}

// CredentialsPath is the location where registry logins are stored
// SLS_CREDENTIALS overrides the default ($XDG_CONFIG_HOME/sls/credentials.json).
func CredentialsPath() (string, error) {
	if path := os.Getenv(credentialsEnv); path != "" {
		return path, nil
	}
	dir, err := os.UserConfigDir()
	if err != nil {
		return "", err
	}
	return filepath.Join(dir, "sls", "credentials.json"), nil
}

func Load() (File, error) {
	var cfg File
	path, err := ConfigPath()
	if err != nil {
		return cfg, err
	}
	data, err := os.ReadFile(path)
	if err != nil && !os.IsNotExist(err) {
		return cfg, err
	}
	if len(data) > 0 {
		var doc storedConfig
		if err := yaml.Unmarshal(data, &doc); err != nil {
			return cfg, err
		}
		cfg.Current = doc.Current
		cfg.Profiles = doc.Profiles
	}
	cfg.ensure()
	if _, ok := cfg.Profiles[cfg.Current]; !ok {
		return cfg, fmt.Errorf("unknown profile %q", cfg.Current)
	}
	cfg.diskCurrent = cfg.Current
	if v := strings.TrimSpace(os.Getenv(profileEnv)); v != "" {
		if err := ValidateProfileName(v); err != nil {
			return cfg, err
		}
		if _, ok := cfg.Profiles[v]; !ok {
			return cfg, fmt.Errorf("unknown profile %q", v)
		}
		cfg.Current = v
	}
	if err := cfg.project(); err != nil {
		return cfg, err
	}
	return cfg, nil
}

func Save(cfg File) error {
	cfg.ensure()
	if strings.TrimSpace(cfg.Current) == "" {
		cfg.Current = LocalProfile
	}
	cfg.sync()
	current := cfg.diskCurrent
	if cfg.switched || current == "" {
		current = cfg.Current
	}
	doc := storedConfig{
		Current:  current,
		Profiles: storedProfiles(cfg.Profiles),
	}
	path, err := ConfigPath()
	if err != nil {
		return err
	}
	if err := os.MkdirAll(filepath.Dir(path), 0o700); err != nil {
		return err
	}
	data, err := yaml.Marshal(doc)
	if err != nil {
		return err
	}
	return os.WriteFile(path, data, 0o600)
}

// ValidateProfileName reports whether name can be stored as a profile.
func ValidateProfileName(name string) error {
	if !profileNamePattern.MatchString(name) {
		return fmt.Errorf("invalid profile name %q", name)
	}
	return nil
}

// UsesLocalSocket reports whether the active profile talks over the admin socket.
// A profile with no URL is local. SLS_API_URL selects the network for this process.
func (f File) UsesLocalSocket() bool {
	if strings.TrimSpace(os.Getenv(apiURLEnv)) != "" {
		return false
	}
	if f.Profiles == nil || f.Current == "" {
		return true
	}
	return strings.TrimSpace(f.Profiles[f.Current].URL) == ""
}

// Names lists profiles, with local first and the rest in order.
func (f File) Names() []string {
	names := []string{LocalProfile}
	var rest []string
	for name := range f.Profiles {
		if name == LocalProfile {
			continue
		}
		rest = append(rest, name)
	}
	sort.Strings(rest)
	return append(names, rest...)
}

// Use saves name as the current profile.
func (f *File) Use(name string) error {
	if err := ValidateProfileName(name); err != nil {
		return err
	}
	f.ensure()
	if _, ok := f.Profiles[name]; !ok {
		return fmt.Errorf("unknown profile %q", name)
	}
	f.sync()
	f.Current = name
	f.diskCurrent = name
	f.switched = true
	return f.project()
}

// PersistCurrent makes the next Save write the active profile as current.
func (f *File) PersistCurrent() {
	f.ensure()
	f.diskCurrent = f.Current
	f.switched = true
}

// SetLogin stores a Controller token on name and makes that profile current.
func (f *File) SetLogin(name, url, token string, scopes []string) error {
	if name == LocalProfile {
		return fmt.Errorf("--profile local is not a login target; local uses the admin socket")
	}
	if err := ValidateProfileName(name); err != nil {
		return err
	}
	f.ensure()
	f.sync()
	prev := f.Current
	p := f.Profiles[name]
	p.URL = strings.TrimRight(strings.TrimSpace(url), "/")
	p.Token = token
	p.Scopes = append([]string(nil), scopes...)
	f.Profiles[name] = p
	f.Current = name
	if prev != name {
		f.diskCurrent = name
		f.switched = true
	}
	return f.project()
}

// UpdateProfile changes the URL, token, or both on an existing profile.
// A nil url or token leaves that field unchanged. Changing the token clears
// scopes. The current profile stays the same.
func (f *File) UpdateProfile(name string, url, token *string) error {
	if url == nil && token == nil {
		return fmt.Errorf("url or token is required")
	}
	if err := ValidateProfileName(name); err != nil {
		return err
	}
	if name == LocalProfile {
		return fmt.Errorf("profile local uses the admin socket")
	}
	f.ensure()
	if _, ok := f.Profiles[name]; !ok {
		return fmt.Errorf("unknown profile %q", name)
	}
	var nextURL, nextToken string
	if url != nil {
		nextURL = strings.TrimRight(strings.TrimSpace(*url), "/")
		if nextURL == "" {
			return fmt.Errorf("Controller URL is required")
		}
	}
	if token != nil {
		nextToken = strings.TrimSpace(*token)
		if nextToken == "" {
			return fmt.Errorf("token is required")
		}
	}
	f.sync()
	p := f.Profiles[name]
	if url != nil {
		p.URL = nextURL
	}
	if token != nil {
		p.Token = nextToken
		p.Scopes = nil
	}
	f.Profiles[name] = p
	// project reloads the active profile so Save does not write the previous URL or token back.
	return f.project()
}

// RemoveProfile deletes a saved profile. The built-in local profile cannot
// be removed. switched is true when name was the saved current profile,
// which is now local.
func (f *File) RemoveProfile(name string) (switched bool, err error) {
	if err := ValidateProfileName(name); err != nil {
		return false, err
	}
	if name == LocalProfile {
		return false, fmt.Errorf("profile local cannot be removed")
	}
	f.ensure()
	if _, ok := f.Profiles[name]; !ok {
		return false, fmt.Errorf("unknown profile %q", name)
	}
	// An empty disk current means the saved current is Current. The active
	// profile can differ when SLS_PROFILE selects another one for this process.
	saved := f.diskCurrent
	if saved == "" {
		saved = f.Current
	}
	switched = saved == name
	removingActive := f.Current == name
	// Flush edits onto the profile that will remain. Skipping this when the
	// active profile is the one being deleted keeps Save from writing it back.
	if !removingActive {
		f.sync()
	}
	delete(f.Profiles, name)
	if removingActive {
		next := saved
		if switched || next == "" || next == name {
			next = LocalProfile
		}
		if _, ok := f.Profiles[next]; !ok {
			next = LocalProfile
		}
		f.Current = next
	}
	if switched {
		f.diskCurrent = LocalProfile
		f.switched = true
	}
	return switched, f.project()
}

// ClearToken removes the active profile's token.
func (f *File) ClearToken() {
	f.ensure()
	p := f.Profiles[f.Current]
	p.Token = ""
	p.Scopes = nil
	f.Profiles[f.Current] = p
	f.API.Token = ""
	f.API.Scopes = nil
	f.baseAPI.Token = ""
	f.baseAPI.Scopes = nil
}

func (f *File) ensure() {
	if f.Profiles == nil {
		f.Profiles = map[string]Profile{}
	}
	if _, ok := f.Profiles[LocalProfile]; !ok {
		f.Profiles[LocalProfile] = Profile{}
	}
	if strings.TrimSpace(f.Current) == "" {
		f.Current = LocalProfile
	}
}

func (f *File) project() error {
	f.ensure()
	p, ok := f.Profiles[f.Current]
	if !ok {
		return fmt.Errorf("unknown profile %q", f.Current)
	}
	f.baseAPI = API{
		URL:    p.URL,
		Token:  p.Token,
		Scopes: append([]string(nil), p.Scopes...),
		Socket: p.Socket,
	}
	f.API = f.baseAPI
	f.Registry = p.Registry
	f.Hosts = append([]RegistryHost(nil), p.Hosts...)
	if v := os.Getenv(apiURLEnv); v != "" {
		f.API.URL = v
	}
	if v := os.Getenv(tokenEnv); v != "" {
		f.API.Token = v
	}
	if v := os.Getenv(socketEnv); v != "" {
		f.API.Socket = v
	}
	return nil
}

func (f *File) sync() {
	f.ensure()
	name := f.Current
	if name == "" {
		name = LocalProfile
	}
	p := f.Profiles[name]
	// A File built with Profiles already filled, and no projected API, is saved as given.
	if !f.projectionEdited() && !profileBlank(p) {
		return
	}
	p.URL = keepSaved(f.API.URL, os.Getenv(apiURLEnv), f.baseAPI.URL)
	p.Token = keepSaved(f.API.Token, os.Getenv(tokenEnv), f.baseAPI.Token)
	p.Socket = keepSaved(f.API.Socket, os.Getenv(socketEnv), f.baseAPI.Socket)
	p.Scopes = append([]string(nil), f.API.Scopes...)
	p.Registry = f.Registry
	p.Hosts = append([]RegistryHost(nil), f.Hosts...)
	f.Profiles[name] = p
}

// RememberRegistryHost saves host as another name for this Controller's
// embedded registry. The saved token and, on the local profile, the admin
// socket are used for it. A host equal to the login URL is already covered.
func (f *File) RememberRegistryHost(host string, insecure bool) {
	host = strings.TrimSpace(host)
	if host == "" {
		return
	}
	f.ensure()
	name := f.Current
	if name == "" {
		name = LocalProfile
	}
	if apiHost := registryHostOfURL(f.API.URL); apiHost != "" && strings.EqualFold(apiHost, host) {
		return
	}
	p := f.Profiles[name]
	for i, existing := range p.Hosts {
		if !strings.EqualFold(existing.Host, host) {
			continue
		}
		if existing.Insecure != insecure {
			p.Hosts[i].Insecure = insecure
			f.Profiles[name] = p
			f.Hosts = append([]RegistryHost(nil), p.Hosts...)
		}
		return
	}
	p.Hosts = append(p.Hosts, RegistryHost{Host: host, Insecure: insecure})
	f.Profiles[name] = p
	f.Hosts = append([]RegistryHost(nil), p.Hosts...)
}

// ForgetRegistryHost removes a saved embedded-registry hostname.
func (f *File) ForgetRegistryHost(host string) bool {
	host = strings.TrimSpace(host)
	if host == "" {
		return false
	}
	f.ensure()
	name := f.Current
	if name == "" {
		name = LocalProfile
	}
	p := f.Profiles[name]
	var next []RegistryHost
	found := false
	for _, existing := range p.Hosts {
		if strings.EqualFold(existing.Host, host) {
			found = true
			continue
		}
		next = append(next, existing)
	}
	if !found {
		return false
	}
	p.Hosts = next
	f.Profiles[name] = p
	f.Hosts = append([]RegistryHost(nil), p.Hosts...)
	return true
}

func registryHostOfURL(rawURL string) string {
	rawURL = strings.TrimSpace(rawURL)
	if rawURL == "" {
		return ""
	}
	if !strings.Contains(rawURL, "://") {
		return strings.TrimRight(rawURL, "/")
	}
	u, err := url.Parse(rawURL)
	if err != nil || u.Host == "" {
		return strings.TrimRight(rawURL, "/")
	}
	return u.Host
}

func (f *File) projectionEdited() bool {
	return apiEdited(f.API) || apiEdited(f.baseAPI) || f.Registry != (Registry{})
}

func apiEdited(a API) bool {
	return a.URL != "" || a.Token != "" || a.Socket != "" || len(a.Scopes) > 0
}

func keepSaved(current, env, base string) string {
	if env != "" && current == env {
		return base
	}
	return current
}

func storedProfiles(profiles map[string]Profile) map[string]Profile {
	out := make(map[string]Profile, len(profiles))
	for name, p := range profiles {
		if name == LocalProfile && profileBlank(p) {
			continue
		}
		out[name] = p
	}
	if len(out) == 0 {
		return nil
	}
	return out
}

func profileBlank(p Profile) bool {
	return p.URL == "" && p.Token == "" && len(p.Scopes) == 0 && p.Socket == "" && p.Registry.Default == "" && !p.Registry.Insecure && len(p.Hosts) == 0
}

func Socket(cfg File, flag string) string {
	if flag != "" {
		return flag
	}
	if v := os.Getenv(socketEnv); v != "" {
		return v
	}
	if cfg.API.Socket != "" {
		return cfg.API.Socket
	}
	return DefaultSocket
}
