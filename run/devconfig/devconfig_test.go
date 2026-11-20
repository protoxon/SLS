package devconfig

import (
	"os"
	"path/filepath"
	"testing"

	"gopkg.in/yaml.v3"
	controllerconfig "protoxon.com/sls/controller/config"
	daemonconfig "protoxon.com/sls/daemon/config"
)

func TestEnsureKeepsIdentityAndLocalDefaults(t *testing.T) {
	root := t.TempDir()
	first, err := Ensure(root)
	if err != nil {
		t.Fatal(err)
	}
	second, err := Ensure(root)
	if err != nil {
		t.Fatal(err)
	}
	if first != second {
		t.Fatalf("layout changed on second ensure: %#v vs %#v", first, second)
	}

	controllerBefore := readFile(t, first.ControllerConfig)
	daemonBefore := readFile(t, first.DaemonConfig)
	if _, err := Ensure(root); err != nil {
		t.Fatal(err)
	}
	if got := readFile(t, first.ControllerConfig); got != controllerBefore {
		t.Fatal("controller config was rewritten")
	}
	if got := readFile(t, first.DaemonConfig); got != daemonBefore {
		t.Fatal("daemon config was rewritten")
	}

	var controller struct {
		UUID string `yaml:"uuid"`
		API  struct {
			Host        string `yaml:"host"`
			Port        int    `yaml:"port"`
			AdminSocket string `yaml:"admin_socket"`
			TLS         struct {
				Enabled bool `yaml:"enabled"`
			} `yaml:"tls"`
		} `yaml:"api"`
	}
	if err := yaml.Unmarshal([]byte(controllerBefore), &controller); err != nil {
		t.Fatal(err)
	}
	if controller.UUID == "" {
		t.Fatal("controller uuid is empty")
	}
	if controller.API.Host != "127.0.0.1" || controller.API.Port != 5620 {
		t.Fatalf("controller bind = %s:%d", controller.API.Host, controller.API.Port)
	}
	if controller.API.AdminSocket != filepath.Join(root, "sls.sock") {
		t.Fatalf("socket = %s", controller.API.AdminSocket)
	}
	if controller.API.TLS.Enabled {
		t.Fatal("controller tls is enabled")
	}

	var daemon struct {
		UUID   string `yaml:"uuid"`
		Remote struct {
			URL string `yaml:"url"`
		} `yaml:"remote"`
		API struct {
			URL  string `yaml:"url"`
			Host string `yaml:"host"`
			Port int    `yaml:"port"`
			TLS  struct {
				Enabled bool `yaml:"enabled"`
			} `yaml:"tls"`
		} `yaml:"api"`
		System struct {
			EnableLogRotate bool `yaml:"enable_log_rotate"`
			User            struct {
				Rootless struct {
					Enabled bool `yaml:"enabled"`
				} `yaml:"rootless"`
			} `yaml:"user"`
		} `yaml:"system"`
	}
	if err := yaml.Unmarshal([]byte(daemonBefore), &daemon); err != nil {
		t.Fatal(err)
	}
	if daemon.UUID == "" || daemon.UUID == controller.UUID {
		t.Fatalf("daemon uuid = %q", daemon.UUID)
	}
	if daemon.Remote.URL != "http://127.0.0.1:5620" {
		t.Fatalf("remote url = %s", daemon.Remote.URL)
	}
	if daemon.API.URL != "http://127.0.0.1:5585" || daemon.API.Host != "127.0.0.1" || daemon.API.Port != 5585 {
		t.Fatalf("daemon api = %s %s:%d", daemon.API.URL, daemon.API.Host, daemon.API.Port)
	}
	if daemon.API.TLS.Enabled {
		t.Fatal("daemon tls is enabled")
	}
	if !daemon.System.User.Rootless.Enabled {
		t.Fatal("rootless is disabled")
	}
	if daemon.System.EnableLogRotate {
		t.Fatal("log rotation is enabled")
	}

	info, err := os.Stat(first.DaemonConfig)
	if err != nil {
		t.Fatal(err)
	}
	if info.Mode().Perm() != 0o600 {
		t.Fatalf("daemon config mode = %o", info.Mode().Perm())
	}
}

func readFile(t *testing.T, path string) string {
	t.Helper()
	data, err := os.ReadFile(path)
	if err != nil {
		t.Fatal(err)
	}
	return string(data)
}

func TestDevConfigSurvivesDefaults(t *testing.T) {
	root := t.TempDir()
	layout, err := Ensure(root)
	if err != nil {
		t.Fatal(err)
	}

	daemonconfig.Path = layout.DaemonConfig
	if err := daemonconfig.InitConfig(); err != nil {
		t.Fatal(err)
	}
	daemon := daemonconfig.Get()
	if daemon.Api.Url != "http://127.0.0.1:5585" || daemon.Api.Host != "127.0.0.1" || daemon.Api.Port != 5585 {
		t.Fatalf("daemon api = %s %s:%d", daemon.Api.Url, daemon.Api.Host, daemon.Api.Port)
	}
	if daemon.RemoteApi.Url != "http://127.0.0.1:5620" {
		t.Fatalf("remote url = %s", daemon.RemoteApi.Url)
	}
	if daemon.Api.Tls.Enabled == nil || *daemon.Api.Tls.Enabled {
		t.Fatal("daemon tls defaulted back on")
	}
	if !daemon.System.User.Rootless.Enabled {
		t.Fatal("rootless defaulted off")
	}
	if daemon.Uuid == "" {
		t.Fatal("daemon uuid was dropped")
	}

	controllerconfig.Path = layout.ControllerConfig
	if err := controllerconfig.InitConfig(); err != nil {
		t.Fatal(err)
	}
	controller := controllerconfig.Get()
	if controller.Api.Host != "127.0.0.1" || controller.Api.Port != 5620 {
		t.Fatalf("controller bind = %s:%d", controller.Api.Host, controller.Api.Port)
	}
	if controller.Api.AdminSocket != layout.Socket {
		t.Fatalf("socket = %s", controller.Api.AdminSocket)
	}
	if controller.Api.Tls.Enabled {
		t.Fatal("controller tls defaulted back on")
	}
	if controller.Uuid == "" {
		t.Fatal("controller uuid was dropped")
	}
}
