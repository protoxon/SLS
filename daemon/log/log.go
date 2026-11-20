package log

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/NYTimes/logrotate"
	"github.com/apex/log"
	"github.com/apex/log/handlers/multi"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/log/cli"
)

// LogPath is the rotating daemon log file for the loaded configuration.
func LogPath() string {
	return filepath.Join(config.Get().System.LogDirectory, "sls.log")
}

// FileHandler opens the daemon log file without replacing the process logger.
// It also creates the install log directory. sls run attaches this
// handler next to the controller log.
func FileHandler() (log.Handler, error) {
	dir := config.Get().System.LogDirectory
	if err := os.MkdirAll(filepath.Join(dir, "install"), 0o700); err != nil {
		return nil, fmt.Errorf("log/log: failed to create install directory path: %w", err)
	}
	w, err := logrotate.NewFile(LogPath())
	if err != nil {
		return nil, fmt.Errorf("log/log: failed to create sls log: %w", err)
	}
	return cli.New(w.File, false), nil
}

// InitLogging Configures the global Apex logger.
// Logs are written to both the console (with colors) and a rotating log file.
// The log level is set to INFO by default, or DEBUG if enabled in the config.
// This allows logging from anywhere in the codebase without passing logger instances around.
func InitLogging() {
	h, err := FileHandler()
	if err != nil {
		log.Fatalf("%s", err)
	}
	log.SetLevel(log.InfoLevel)
	if config.Get().Debug {
		log.SetLevel(log.DebugLevel)
	}
	log.SetHandler(multi.New(cli.Default, h))
	log.WithField("path", LogPath()).Info("writing log files to disk")
}
