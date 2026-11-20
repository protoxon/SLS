package log

import (
	"os"
	"path"
	"path/filepath"

	"github.com/NYTimes/logrotate"
	"github.com/apex/log"
	"github.com/apex/log/handlers/multi"
	"protoxon.com/sls/cli/config"
	"protoxon.com/sls/cli/log/cli"
)

// InitLogging configures the global Apex logger.
// Logs are written to the console and to a rotating file next to the CLI config.
func InitLogging() {
	cfgPath, err := config.ConfigPath()
	if err != nil {
		log.Fatalf("log/log: failed to resolve config path: %s", err)
	}
	dir := filepath.Join(filepath.Dir(cfgPath), "logs")
	if err := os.MkdirAll(path.Join(dir, "install"), 0o700); err != nil {
		log.Fatalf("log/log: failed to create install directory path: %s", err)
	}
	p := filepath.Join(dir, "sls.log")
	w, err := logrotate.NewFile(p)
	if err != nil {
		log.Fatalf("log/log: failed to create sls log: %s", err)
	}
	log.SetLevel(log.InfoLevel)
	log.SetHandler(multi.New(cli.Default, cli.New(w.File, false)))
	log.WithField("path", p).Info("writing log files to disk")
}
