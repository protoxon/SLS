package config

import (
	"bytes"
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
	"protoxon.com/sls/internal/configenv"
)

var Path = "/etc/sls/controller/config.yml"

//go:embed config.yml
var defaultConfig []byte

var (
	mutex  sync.RWMutex   // protects concurrent access to the config
	config *Configuration // global singleton configuration
)

type Configuration struct {

	// Uuid is a unique identifier for this Controller installation. It is set when
	// --init-config creates the default config file.
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
	// Controller can send to nodes.
	Registry RegistryConfiguration `yaml:"registry"`

	// AllowedOrigins is a list of allowed request origins.
	AllowedOrigins []string `json:"allowed_origins" yaml:"allowed_origins"`

	// AllowCORSPrivateNetwork sets the `Access-Control-Request-Private-Network` header which
	// allows client browsers to make requests to internal IP addresses over HTTP.
	AllowCORSPrivateNetwork bool `json:"allow_cors_private_network" yaml:"allow_cors_private_network"`

	// TelemetryEnabled controls usage reporting to protoxon.com. When nil (omitted from YAML),
	// telemetry is treated as enabled for backward compatibility.
	TelemetryEnabled *bool `yaml:"telemetry_enabled"`

	// Scheduler places new servers onto nodes.
	Scheduler SchedulerConfiguration `yaml:"scheduler"`
}

// SchedulerConfiguration is the controller-wide placement policy.
// Blueprint limits stay a single memory and CPU number. A server's memory
// charge starts at its limit and moves toward its observed peak plus
// memory_cushion_bytes as the controller watches it run. Spike room is
// memory_burst_percent of host RAM, held once per node. memory_request_ratio
// only sets the memory.low stamp. memory_overcommit_max is how many times
// schedulable RAM the sum of memory.max may reach. default_cpu_request is the
// accounting debit when a blueprint sets no cpu_limit (25 = a quarter core).
// cpu_overcommit_max is how many times schedulable CPU that sum may reach.
// CPU pressure decides first.
type SchedulerConfiguration struct {
	Algorithm           string  `yaml:"algorithm" default:"least_allocated"`
	MemoryRequestRatio  float64 `yaml:"memory_request_ratio" default:"0.85"`
	CPURequestRatio     float64 `yaml:"cpu_request_ratio" default:"0.95"`
	DefaultCPURequest   int64   `yaml:"default_cpu_request" default:"25"`
	CPUOvercommitMax    float64 `yaml:"cpu_overcommit_max" default:"4"`
	MemoryOvercommitMax float64 `yaml:"memory_overcommit_max" default:"3"`
	// MemoryCushionBytes is added to a learned server's observed peak.
	// Ordinary jitter stays on the server. Spikes draw on the node's burst
	// reserve instead.
	MemoryCushionBytes int64 `yaml:"memory_cushion_bytes" default:"268435456"`
	// MemoryBurstPercent is spike room held once per node, as a percent of
	// host RAM. It is clamped to [MemoryBurstBytes, MemoryBurstMax] and to
	// half of schedulable RAM, so it does not grow with the number of servers.
	MemoryBurstPercent float64 `yaml:"memory_burst_percent" default:"10"`
	MemoryBurstBytes   int64   `yaml:"memory_burst_bytes" default:"2147483648"`
	MemoryBurstMax     int64   `yaml:"memory_burst_max" default:"6442450944"`
	// MemoryLearning is how far a charge has moved from the limit toward its
	// learned target after the server has been running for each time. The
	// charge follows a smooth S-curve through these points. Empty uses the
	// built-in schedule.
	MemoryLearning []SchedulerLearnPoint `yaml:"memory_learning"`
	// Overallocate places a server when every live node is only past its
	// memory or CPU ledger. Free space below the disk reserve still refuses.
	Overallocate bool `yaml:"overallocate" default:"false"`
	// DiskQuotaCheck charges blueprint disk quotas at admission. Off by
	// default: servers start on a CoW overlay, so the quota is a growth cap.
	// Free space below the disk reserve still refuses. Disk PSI does not.
	DiskQuotaCheck bool `yaml:"disk_quota_check" default:"false"`

	HostReserve  SchedulerHostReserve `yaml:"host_reserve"`
	MaxMetricAge string               `yaml:"max_metric_age" default:"30s"`
	Pressure     SchedulerPressure    `yaml:"pressure"`
	Swap         SchedulerSwap        `yaml:"swap"`
}

// SchedulerLearnPoint is one point on the memory learning curve: after a
// server has been running for After, Learned of the way to its target.
type SchedulerLearnPoint struct {
	After   string  `yaml:"after"`
	Learned float64 `yaml:"learned"`
}

// SchedulerHostReserve is capacity held back for the OS and the daemon.
// Memory reserve is the larger of the percent and the byte floor.
// Disk reserve is the percent clamped between the byte floor and the byte cap.
type SchedulerHostReserve struct {
	MemoryPercent float64 `yaml:"memory_percent" default:"8"`
	MemoryBytes   int64   `yaml:"memory_bytes" default:"1073741824"`
	CPUPercent    float64 `yaml:"cpu_percent" default:"5"`
	DiskPercent   float64 `yaml:"disk_percent" default:"10"`
	DiskBytes     int64   `yaml:"disk_bytes" default:"8589934592"`
	DiskBytesMax  int64   `yaml:"disk_bytes_max" default:"34359738368"`
}

// SchedulerPressure caps are CPU and memory PSI percentages. A node is refused
// when avg60 is above the cap or avg10 is above twice the cap. Disk PSI does
// not refuse a node. Free space below the disk reserve still does.
type SchedulerPressure struct {
	MemoryFullAvg10 float64 `yaml:"memory_full_avg10" default:"1"`
	MemorySomeAvg10 float64 `yaml:"memory_some_avg10" default:"10"`
	CPUSomeAvg60    float64 `yaml:"cpu_some_avg60" default:"10"`
}

// SchedulerSwap refuses a node with sustained swap-out. Swap-in is not a veto.
// Occupancy reduces schedulable RAM. RejectOnOccupancy is the stricter ban and
// stays off.
type SchedulerSwap struct {
	MaxPagesPerSec    float64 `yaml:"max_pages_per_sec" default:"64"`
	SustainedSamples  int     `yaml:"sustained_samples" default:"2"`
	RejectOnOccupancy bool    `yaml:"reject_on_occupancy" default:"false"`
}

// ApiConfiguration defines the configuration for the API server
type ApiConfiguration struct {

	// The interface that the internal proto should bind to.
	Host string `default:"0.0.0.0" yaml:"host"`

	// The port that the internal proto should bind to.
	Port int `default:"8080" yaml:"port"`

	// Listen is the TCP listener. Omitted means enabled. Unix sockets are unaffected.
	Listen *bool `yaml:"listen" default:"true"`

	// TSL configuration for the daemon.
	Tls struct {
		Enabled         bool   `yaml:"enabled"`
		CertificateFile string `json:"cert" yaml:"cert"`
		KeyFile         string `json:"key" yaml:"key"`
	}

	// AdminSocket is the Unix socket for local CLI access. Connections here skip
	// bearer authentication.
	AdminSocket string `yaml:"admin_socket" default:"/var/lib/sls/run/sls.sock"`

	// Socket is the API listener a local daemon dials. Connections on it are a
	// local node and do not need a token. TCP still requires one.
	Socket Socket `yaml:"socket"`
}

// DefaultAPISocket is the API socket path when config omits one.
const DefaultAPISocket = "/var/lib/sls/run/controller.sock"

// Socket is a Unix API listener or dial target.
type Socket struct {
	Enabled *bool  `yaml:"enabled" default:"false"`
	Path    string `yaml:"path"`
}

// ActivePath is the socket path when this listener or dial target is enabled.
func (s Socket) ActivePath() string {
	if s.Enabled == nil || !*s.Enabled {
		return ""
	}
	return strings.TrimSpace(s.Path)
}

// Enable turns the socket on at path.
func (s *Socket) Enable(path string) {
	on := true
	s.Enabled = &on
	if strings.TrimSpace(path) != "" {
		s.Path = path
	}
}

// ListenEnabled reports whether the API binds a TCP listener.
// A missing value means enabled.
func (a ApiConfiguration) ListenEnabled() bool {
	if a.Listen == nil {
		return true
	}
	return *a.Listen
}

type SystemConfiguration struct {
	RootDirectory string `default:"/var/lib/controller" yaml:"root_directory"`
	LogDirectory  string `default:"/var/log/controller" yaml:"log_directory"`

	// Directory where software config files are stored
	Software string `default:"/var/lib/sls/software" json:"-" yaml:"software"`
	// Directory where blueprints are stored
	Blueprints string `default:"/var/lib/sls/blueprints" json:"-" yaml:"blueprints"`
	// Directory where Controller plugins are stored
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
	// volume artifacts. Set this to this Controller (for example
	// volumes.example.com:5620 or volumes.example.com:5620/sls). Do not use
	// api.host; 0.0.0.0 is not a client address.
	Default string `yaml:"default"`
	// Snapshots is the host[:port] or host/namespace for snapshot manifests.
	// Empty uses Default. The repository name is snapshots and the tag is the
	// snapshot id, so ghcr.io/myorg becomes ghcr.io/myorg/snapshots:<id>.
	Snapshots string `yaml:"snapshots,omitempty"`
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
	c.Registry.Snapshots = strings.Trim(NormalizeRegistryHost(c.Registry.Snapshots), "/")
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

// InitConfig reads the configuration from disk into the global singleton.
// A missing file is an error. Create one with sls run controller --init-config.
func InitConfig() error {
	configPath, err := resolveConfigPath(Path)
	if err != nil {
		return err
	}
	if _, err := os.Stat(configPath); err != nil {
		if os.IsNotExist(err) {
			return &missingConfig{path: configPath}
		}
		return fmt.Errorf("configuration file %s: %w", configPath, err)
	}

	if err := loadConfigFromFile(configPath); err != nil {
		return fmt.Errorf("read configuration file %s: %w", configPath, err)
	}
	if err = ConfigureDirectories(); err != nil {
		log.Errorf("config/config: failed to configure directories: %s", err)
	}
	return nil
}

// WriteDefaultConfig writes a new default controller config at path.
// An existing file is left unchanged.
func WriteDefaultConfig(path string) (string, error) {
	abs, err := resolveConfigPath(path)
	if err != nil {
		return "", err
	}
	if _, err := os.Stat(abs); err == nil {
		return "", fmt.Errorf("configuration file already exists at %s", abs)
	} else if err != nil && !os.IsNotExist(err) {
		return "", fmt.Errorf("configuration file %s: %w", abs, err)
	}

	softwareDir, err := writeDefaultConfig(abs)
	if err != nil {
		if _, statErr := os.Stat(abs); statErr == nil {
			return abs, fmt.Errorf("created default configuration at %s, but failed to finish setup: %w", abs, err)
		}
		return "", fmt.Errorf("create default configuration at %s: %w", abs, err)
	}
	if err := installDefaultSoftware(softwareDir); err != nil {
		return abs, fmt.Errorf("created default configuration at %s, but failed to create the software directory: %w", abs, err)
	}
	return abs, nil
}

func resolveConfigPath(path string) (string, error) {
	if strings.TrimSpace(path) == "" {
		path = Path
	}
	if !filepath.IsAbs(path) {
		absolute, err := filepath.Abs(path)
		if err != nil {
			return "", fmt.Errorf("configuration file path: %w", err)
		}
		path = absolute
	}
	return path, nil
}

type missingConfig struct {
	path string
}

func (e *missingConfig) Error() string {
	return missingConfigNotice("Controller", e.path, "run controller")
}

// ExitOnMissingConfig prints the configuration-file notice and exits when err
// is a missing config file. command is the sls subcommand the user ran.
// Other errors are left for the caller.
func ExitOnMissingConfig(err error, command string) {
	var missing *missingConfig
	if !errorsAs(err, &missing) {
		return
	}
	if strings.TrimSpace(command) == "" {
		command = "run controller"
	}
	fmt.Print(colorMissingConfig(missingConfigNotice("Controller", missing.path, command)))
	os.Exit(1)
}

func errorsAs(err error, target **missingConfig) bool {
	for err != nil {
		if missing, ok := err.(*missingConfig); ok {
			*target = missing
			return true
		}
		unwrap, ok := err.(interface{ Unwrap() error })
		if !ok {
			return false
		}
		err = unwrap.Unwrap()
	}
	return false
}

func missingConfigNotice(subject, path, command string) string {
	return fmt.Sprintf(`
Error: Configuration File Not Found

%s was not able to locate the configuration file, and therefore is not
able to complete its boot process. Please ensure the configuration file 
exists at the location below.

Location: %s

Create default config file with: sls %s --init-config
`, subject, path, command)
}

func colorMissingConfig(notice string) string {
	return strings.Replace(notice, "Error: Configuration File Not Found",
		colorstring.Color("[_red_][white][bold]Error: Configuration File Not Found[reset]"), 1)
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
	if err := configenv.Unmarshal(bytes, &config); err != nil {
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
	if err := defaults.Set(c); err != nil {
		return err
	}
	if strings.TrimSpace(c.Api.Socket.Path) == "" {
		c.Api.Socket.Path = DefaultAPISocket
	}
	return nil
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

func writeDefaultConfig(path string) (string, error) {
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return "", err
	}
	body, err := renderDefaultConfig()
	if err != nil {
		return "", err
	}
	var c Configuration
	if err := yaml.Unmarshal(body, &c); err != nil {
		return "", err
	}
	if err := os.WriteFile(path, body, 0o644); err != nil {
		return "", err
	}
	return filepath.Clean(c.System.Software), nil
}

// renderDefaultConfig is the embedded config.yml with a new installation id.
func renderDefaultConfig() ([]byte, error) {
	const placeholder = `uuid: ""`
	if !bytes.Contains(defaultConfig, []byte(placeholder)) {
		return nil, fmt.Errorf("default config is missing the uuid placeholder")
	}
	id := uuid.New().String()
	return bytes.Replace(defaultConfig, []byte(placeholder), []byte("uuid: "+id), 1), nil
}

func installDefaultSoftware(softwareDir string) error {
	if softwareDir == "" || softwareDir == "." {
		return nil
	}
	if err := os.MkdirAll(softwareDir, 0o700); err != nil {
		return err
	}
	syncDefaultSoftwareYAMLs(softwareDir)
	return nil
}

// Get returns the global configuration instance.
func Get() *Configuration {
	return config
}

// Update performs an in-situ update of the global configuration object.
func Update(callback func(c *Configuration)) {
	mutex.Lock()
	defer mutex.Unlock()
	if config == nil || callback == nil {
		return
	}
	callback(config)
}

// IsTelemetryEnabled returns whether outbound telemetry is enabled per the config file.
// Omitted or null telemetry_enabled defaults to true.
func (c *Configuration) IsTelemetryEnabled() bool {
	if c == nil || c.TelemetryEnabled == nil {
		return true
	}
	return *c.TelemetryEnabled
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
