package log

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/NYTimes/logrotate"
	"github.com/apex/log"
	"github.com/apex/log/handlers/multi"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/log/cli"
)

// LogPath is the rotating controller log file for the loaded configuration.
func LogPath() string {
	return filepath.Join(config.Get().System.LogDirectory, "controller.log")
}

// FileHandler opens the controller log file without replacing the process logger.
// sls run attaches this handler next to the daemon log.
func FileHandler() (log.Handler, error) {
	dir := config.Get().System.LogDirectory
	if err := os.MkdirAll(dir, 0755); err != nil {
		return nil, fmt.Errorf("log/log: failed to create log directory: %w", err)
	}
	w, err := logrotate.NewFile(LogPath())
	if err != nil {
		return nil, fmt.Errorf("log/log: failed to create controller log: %w", err)
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
