package config

import (
	"crypto/tls"
	_ "embed"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"sync"

	"github.com/apex/log"
	"github.com/creasty/defaults"
	"github.com/google/uuid"
	"github.com/mitchellh/colorstring"
	"gopkg.in/yaml.v3"
)

var Path = "/etc/sls/protocube/config.yml"

//go:embed config.yml
var defaultConfig []byte

var (
	mutex  sync.RWMutex   // protects concurrent access to the config
	config *Configuration // global singleton configuration
)

type Configuration struct {

	// Uuid is a unique identifier for this Protocube installation. It is set when
	// the default config file is first created (see writeDefaultConfig).
	Uuid string `yaml:"uuid"`

	// Determines if sls should be running in debug mode. This value is ignored
	// if the debug flag is passed through the command line arguments.
	Debug bool `yaml:"debug"`

	Api ApiConfiguration `json:"api" yaml:"api"`

	AppName string `default:"SLS" yaml:"app_name"`

	System SystemConfiguration `yaml:"system"`

	// Blueprint configures how blueprints are sourced (e.g. git remotes synced to disk).
	Blueprint BlueprintConfiguration `yaml:"blueprint"`

	// Registry holds the embedded registry store and pull credentials
	// Protocube can send to nodes.
	Registry RegistryConfiguration `yaml:"registry"`

	// AllowedOrigins is a list of allowed request origins.
	AllowedOrigins []string `json:"allowed_origins" yaml:"allowed_origins"`

	// AllowCORSPrivateNetwork sets the `Access-Control-Request-Private-Network` header which
	// allows client browsers to make requests to internal IP addresses over HTTP.
	AllowCORSPrivateNetwork bool `json:"allow_cors_private_network" yaml:"allow_cors_private_network"`

	// TelemetryEnabled controls usage reporting to protoxon.com. When nil (omitted from YAML),
	// telemetry is treated as enabled for backward compatibility.
	TelemetryEnabled *bool `yaml:"telemetry_enabled"`
}

// ApiConfiguration defines the configuration for the API server
type ApiConfiguration struct {

	// The interface that the internal proto should bind to.
	Host string `default:"0.0.0.0" yaml:"host"`

	// The port that the internal proto should bind to.
	Port int `default:"8080" yaml:"port"`

	// TSL configuration for the daemon.
	Tls struct {
		Enabled         bool   `yaml:"enabled"`
		CertificateFile string `json:"cert" yaml:"cert"`
		KeyFile         string `json:"key" yaml:"key"`
	}

	// Socket is the Unix admin socket used for local API access.
	Socket string `yaml:"socket" default:"/var/lib/sls/sls.sock"`
}

type SystemConfiguration struct {
	RootDirectory string `default:"/var/lib/protocube" yaml:"root_directory"`
	LogDirectory  string `default:"/var/log/protocube" yaml:"log_directory"`

	// Directory where software config files are stored
	Software string `default:"/var/lib/sls/software" json:"-" yaml:"software"`
	// Directory where blueprints are stored
	Blueprints string `default:"/var/lib/sls/blueprints" json:"-" yaml:"blueprints"`
	// Directory where Protocube plugins are stored
	Plugins string `default:"/var/lib/sls/plugins" json:"-" yaml:"plugins"`
}

// BlueprintConfiguration configures remote blueprint sources that are synced
// into system.blueprints before load/reload.
type BlueprintConfiguration struct {
	Sources []BlueprintSource `yaml:"sources"`
}

// BlueprintSource describes a single remote blueprint source.
type BlueprintSource struct {
	// Type of source. Currently only "git" is supported.
	Type string `yaml:"type"`
	// URL is the git repository URL (https or ssh).
	URL string `yaml:"url"`
	// Ref is a branch, tag, or commit. Defaults to "main".
	Ref string `yaml:"ref"`
	// Path is a subdirectory inside the repository to sync. Defaults to ".".
	Path string `yaml:"path"`
	// Dest is a path relative to system.blueprints where files are written. Defaults to ".".
	Dest string `yaml:"dest"`
	// Auth holds optional credentials for private repositories.
	Auth *BlueprintSourceAuth `yaml:"auth,omitempty"`
	// UpdateOnReload controls whether this source is refreshed on blueprint reload.
	// Defaults to true when omitted.
	UpdateOnReload *bool `yaml:"update_on_reload,omitempty"`
}

// BlueprintSourceAuth configures how to authenticate to a private git source.
type BlueprintSourceAuth struct {
	// Token is an inline HTTPS token (x-access-token). Prefer setting the
	// GITHUB_TOKEN environment variable so secrets are not stored in config.
	Token string `yaml:"token,omitempty"`
}

const defaultRegistryStorage = "/var/lib/sls/registry"

// RegistryConfiguration is the embedded registry store plus pull credentials
// for other registries.
type RegistryConfiguration struct {
	// Default is the public host[:port] or host/namespace prepended to short
	// volume artifacts. Set this to this Protocube (for example
	// volumes.example.com:5620 or volumes.example.com:5620/sls). Do not use
	// api.host; 0.0.0.0 is not a client address.
	Default string `yaml:"default"`
	// Insecure means clients should use HTTP (not HTTPS) for Default's host.
	Insecure bool `yaml:"insecure"`
	// Storage is the filesystem root for the embedded OCI registry.
	Storage     string               `default:"/var/lib/sls/registry" yaml:"storage"`
	Credentials []RegistryCredential `yaml:"credentials"`
}

// StoragePath returns the filesystem root for the embedded registry.
func (c RegistryConfiguration) StoragePath() string {
	if s := strings.TrimSpace(c.Storage); s != "" {
		return s
	}
	return defaultRegistryStorage
}

// RegistryCredential is a pull login for one registry host.
type RegistryCredential struct {
	Host     string `yaml:"host"`
	Username string `yaml:"username"`
	Password string `yaml:"password"`
	Insecure bool   `yaml:"insecure"`
}

// CredentialFor returns the credential for host (host or host:port), or nil.
func (c RegistryConfiguration) CredentialFor(host string) *RegistryCredential {
	host = NormalizeRegistryHost(host)
	if host == "" {
		return nil
	}
	for i := range c.Credentials {
		if strings.EqualFold(NormalizeRegistryHost(c.Credentials[i].Host), host) {
			return &c.Credentials[i]
		}
	}
	return nil
}

// ResolvePassword returns the pull password. GHCR_TOKEN wins for ghcr.io.
func (c RegistryCredential) ResolvePassword() string {
	if strings.EqualFold(NormalizeRegistryHost(c.Host), "ghcr.io") {
		if token := strings.TrimSpace(os.Getenv("GHCR_TOKEN")); token != "" {
			return token
		}
	}
	return c.Password
}

// NormalizeRegistryHost turns a user-supplied registry into a host[:port].
func NormalizeRegistryHost(host string) string {
	host = strings.TrimSpace(host)
	host = strings.TrimPrefix(host, "https://")
	host = strings.TrimPrefix(host, "http://")
	return strings.TrimRight(host, "/")
}

func normalizeRegistryConfig(c *Configuration) {
	if c == nil {
		return
	}
	c.Registry.Default = strings.Trim(NormalizeRegistryHost(c.Registry.Default), "/")
	creds := c.Registry.Credentials[:0]
	for _, cred := range c.Registry.Credentials {
		cred.Host = NormalizeRegistryHost(cred.Host)
		if cred.Host == "" {
			continue
		}
		creds = append(creds, cred)
	}
	c.Registry.Credentials = creds
}

// InitConfig Reads the configuration from the disk and then sets up the global singleton
// with all the configuration values.
func InitConfig() {
	var configPath = Path
	if !filepath.IsAbs(configPath) {
		absolutePath, err := filepath.Abs(configPath)
		if err != nil {
			log.Fatalf("config/config: failed to get path to config file: %s", err)
		}
		configPath = absolutePath
	}

	// If config file doesn't exist, create it from embedded default
	if _, err := os.Stat(configPath); os.IsNotExist(err) {
		err := writeDefaultConfig(configPath)
		if err != nil {
			exitWithConfigurationNotice()
		}
		fmt.Printf(colorstring.Color(" [blue][bold]Created default config at: [reset]%s[reset]\n\n"), configPath)
	}

	// Load the config from disk
	err := loadConfigFromFile(configPath)
	if err != nil {
		log.Fatalf("config/config: error while reading configuration file: %s", err)
	}

	if err = ConfigureDirectories(); err != nil {
		log.Errorf("config/config: failed to configure directories: %s", err)
	}
}

// ConfigureDirectories ensures that all the system directories exist on the
// system. These directories are created so that only the owner can read the data,
// and no other users.
//
// This function IS NOT thread-safe.
func ConfigureDirectories() error {
	root := config.System.RootDirectory
	log.WithField("path", root).Debug("ensuring root data directory exists")
	if err := os.MkdirAll(root, 0o700); err != nil {
		return err
	}

	log.WithField("path", config.System.Plugins).Debug("ensuring plugins directory exists")
	if err := os.MkdirAll(config.System.Plugins, 0o700); err != nil {
		return err
	}

	log.WithField("path", config.System.Blueprints).Debug("ensuring blueprints directory exists")
	if err := os.MkdirAll(config.System.Blueprints, 0o700); err != nil {
		return err
	}

	mixins := filepath.Join(config.System.Blueprints, "mixins")
	log.WithField("path", mixins).Debug("ensuring blueprint mixins directory exists")
	if err := os.MkdirAll(mixins, 0o700); err != nil {
		return err
	}

	log.WithField("path", config.System.Software).Debug("ensuring software directory exists")
	if err := os.MkdirAll(config.System.Software, 0o700); err != nil {
		return err
	}

	storage := config.Registry.StoragePath()
	log.WithField("path", storage).Debug("ensuring registry storage directory exists")
	if err := os.MkdirAll(storage, 0o700); err != nil {
		return err
	}

	return nil
}

// LoadConfigFromFile reads the configuration from the provided file and stores it in the
// global singleton for this instance.
func loadConfigFromFile(path string) error {
	bytes, err := os.ReadFile(path)
	if err != nil {
		return err
	}
	var config Configuration

	// Decode the contents of the yml into the config struct
	if err := yaml.Unmarshal(bytes, &config); err != nil {
		return err
	}
	normalizeRegistryConfig(&config)

	// Always apply defaults after decoding so missing fields get filled in.
	// This means removing a field from the YAML will cause the default to be used.
	if err := applyDefaults(&config); err != nil {
		return err
	}

	// Store this configuration in the global state.
	set(&config)
	return nil
}

func applyDefaults(c *Configuration) error {
	return defaults.Set(c)
}

// Set the global configuration instance. This is a blocking operation such that
// anything trying to set a different configuration value, or read the configuration
// will be paused until it is complete.
func set(configuration *Configuration) {
	mutex.Lock()
	defer mutex.Unlock()
	config = configuration
}

// SetForTest replaces the process-wide config. Tests only.
func SetForTest(c *Configuration) {
	set(c)
}

// Swap replaces the global configuration and returns the previous value.
func Swap(c *Configuration) *Configuration {
	mutex.Lock()
	defer mutex.Unlock()
	prev := config
	config = c
	return prev
}

func writeDefaultConfig(path string) error {
	// Ensure parent directory exists
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return err
	}

	var c Configuration
	if err := yaml.Unmarshal(defaultConfig, &c); err != nil {
		return err
	}
	if err := applyDefaults(&c); err != nil {
		return err
	}
	c.Uuid = uuid.New().String()
	out, err := yaml.Marshal(&c)
	if err != nil {
		return err
	}
	if err := os.WriteFile(path, out, 0o644); err != nil {
		return err
	}

	softwareDir := filepath.Clean(c.System.Software)
	if softwareDir == "" || softwareDir == "." {
		return nil
	}
	if err := os.MkdirAll(softwareDir, 0o700); err != nil {
		return err
	}
	// Only runs when the main config was just created (see InitConfig).
	syncDefaultSoftwareYAMLs(softwareDir)
	return nil
}

// Get returns the global configuration instance.
func Get() *Configuration {
	return config
}

// IsTelemetryEnabled returns whether outbound telemetry is enabled per the config file.
// Omitted or null telemetry_enabled defaults to true.
func (c *Configuration) IsTelemetryEnabled() bool {
	if c == nil || c.TelemetryEnabled == nil {
		return true
	}
	return *c.TelemetryEnabled
}

func exitWithConfigurationNotice() {
	fmt.Printf(colorstring.Color(`
[_red_][white][bold]Error: Configuration File Not Found[reset]

Protocube was not able to locate the configuration file, and therefore is not
able to complete its boot process. Please ensure the configuration file 
exists at the location below.

Location: %s[reset]

`), Path)
	os.Exit(1)
}

// GetTLSConfig builds the TLS config for the API server from the certificate
// and key paths in the current configuration.
func GetTLSConfig() (*tls.Config, error) {
	cfg := Get()
	return loadTLSConfig(cfg.Api.Tls.CertificateFile, cfg.Api.Tls.KeyFile)
}

func loadTLSConfig(certFile, keyFile string) (*tls.Config, error) {
	if strings.TrimSpace(certFile) == "" || strings.TrimSpace(keyFile) == "" {
		return nil, fmt.Errorf("tls: certificate and key file paths must be set when TLS is enabled")
	}
	cert, err := tls.LoadX509KeyPair(certFile, keyFile)
	if err != nil {
		return nil, fmt.Errorf("tls: failed to load certificate %q and key %q: %w", certFile, keyFile, err)
	}
	return &tls.Config{
		MinVersion:   tls.VersionTLS13,
		Certificates: []tls.Certificate{cert},
	}, nil
}
