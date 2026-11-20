package devconfig

import (
	_ "embed"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"text/template"

	"github.com/google/uuid"
)

//go:embed controller.yml
var controllerConfig []byte

//go:embed daemon.yml
var daemonConfig []byte

var (
	controllerTmpl = template.Must(template.New("controller.yml").Parse(string(controllerConfig)))
	daemonTmpl     = template.Must(template.New("daemon.yml").Parse(string(daemonConfig)))
)

// Layout is the on-disk tree for sls run -dev.
type Layout struct {
	Root             string
	ControllerConfig string
	DaemonConfig     string
	Socket           string
}

// DefaultDir is ~/.sls/dev.
func DefaultDir() (string, error) {
	home, err := os.UserHomeDir()
	if err != nil {
		return "", fmt.Errorf("dev config: home directory: %w", err)
	}
	return filepath.Join(home, ".sls", "dev"), nil
}

// Ensure creates the dev tree and writes config files that are not already there.
// A second call keeps both UUIDs and any token already stored in the daemon file.
func Ensure(root string) (Layout, error) {
	if root == "" {
		return Layout{}, fmt.Errorf("dev config: directory is empty")
	}
	if err := os.MkdirAll(root, 0o700); err != nil {
		return Layout{}, fmt.Errorf("dev config: create %s: %w", root, err)
	}
	layout := Layout{
		Root:             root,
		ControllerConfig: filepath.Join(root, "controller.yml"),
		DaemonConfig:     filepath.Join(root, "daemon.yml"),
		Socket:           filepath.Join(root, "sls.sock"),
	}
	controllerBody, err := render(controllerTmpl, controllerValues(layout))
	if err != nil {
		return Layout{}, err
	}
	daemonBody, err := render(daemonTmpl, daemonValues(layout))
	if err != nil {
		return Layout{}, err
	}
	if err := writeIfMissing(layout.ControllerConfig, controllerBody, 0o644); err != nil {
		return Layout{}, err
	}
	if err := writeIfMissing(layout.DaemonConfig, daemonBody, 0o600); err != nil {
		return Layout{}, err
	}
	return layout, nil
}

func writeIfMissing(path, body string, mode os.FileMode) error {
	if _, err := os.Stat(path); err == nil {
		return nil
	} else if !os.IsNotExist(err) {
		return fmt.Errorf("dev config: stat %s: %w", path, err)
	}
	if err := os.WriteFile(path, []byte(body), mode); err != nil {
		return fmt.Errorf("dev config: write %s: %w", path, err)
	}
	return nil
}

func controllerValues(layout Layout) map[string]string {
	root := layout.Root
	return map[string]string{
		"UUID":         uuid.NewString(),
		"Socket":       strconv.Quote(layout.Socket),
		"Root":         strconv.Quote(root),
		"LogDirectory": strconv.Quote(filepath.Join(root, "log", "controller")),
		"Blueprints":   strconv.Quote(filepath.Join(root, "blueprints")),
		"Software":     strconv.Quote(filepath.Join(root, "software")),
		"Plugins":      strconv.Quote(filepath.Join(root, "plugins")),
		"Storage":      strconv.Quote(filepath.Join(root, "registry")),
	}
}

func daemonValues(layout Layout) map[string]string {
	root := layout.Root
	daemonRoot := filepath.Join(root, "daemon")
	return map[string]string{
		"UUID":         uuid.NewString(),
		"Root":         strconv.Quote(daemonRoot),
		"LogDirectory": strconv.Quote(filepath.Join(root, "log", "daemon")),
		"Data":         strconv.Quote(filepath.Join(daemonRoot, "data")),
		"Volumes":      strconv.Quote(filepath.Join(daemonRoot, "volumes")),
		"Servers":      strconv.Quote(filepath.Join(daemonRoot, "servers")),
		"TmpDirectory": strconv.Quote(filepath.Join(daemonRoot, "tmp")),
	}
}

func render(tmpl *template.Template, data any) (string, error) {
	var b strings.Builder
	if err := tmpl.Execute(&b, data); err != nil {
		return "", fmt.Errorf("dev config: render %s: %w", tmpl.Name(), err)
	}
	return b.String(), nil
}
