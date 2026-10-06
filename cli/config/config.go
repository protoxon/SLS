package config

import (
	"os"
	"os/user"
	"path/filepath"

	"gopkg.in/yaml.v3"
)

const (
	credentialsEnv = "SLS_CREDENTIALS"
	configEnv      = "SLS_CONFIG"
	apiURLEnv      = "SLS_API_URL"
	tokenEnv       = "SLS_TOKEN"
	socketEnv      = "SLS_SOCKET"

	DefaultSocket = "/var/lib/sls/sls.sock"
	DefaultAPIURL = "https://localhost:5620"
)

type File struct {
	API      API      `yaml:"api"`
	Registry Registry `yaml:"registry,omitempty"`
}

// Registry is the CLI's saved default registry.
type Registry struct {
	// Default is a registry host or host/namespace used when a reference omits one.
	Default string `yaml:"default,omitempty"`
	// Insecure means use HTTP instead of HTTPS for Default's host.
	Insecure bool `yaml:"insecure,omitempty"`
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
	if err != nil {
		if !os.IsNotExist(err) {
			return cfg, err
		}
	} else if err := yaml.Unmarshal(data, &cfg); err != nil {
		return cfg, err
	}
	if v := os.Getenv(apiURLEnv); v != "" {
		cfg.API.URL = v
	}
	if v := os.Getenv(tokenEnv); v != "" {
		cfg.API.Token = v
	}
	if v := os.Getenv(socketEnv); v != "" {
		cfg.API.Socket = v
	}
	return cfg, nil
}

func Save(cfg File) error {
	path, err := ConfigPath()
	if err != nil {
		return err
	}
	if err := os.MkdirAll(filepath.Dir(path), 0o700); err != nil {
		return err
	}
	data, err := yaml.Marshal(cfg)
	if err != nil {
		return err
	}
	return os.WriteFile(path, data, 0o600)
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
