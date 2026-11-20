//go:build !linux && !darwin && !freebsd

package plugins

import "github.com/apex/log"

func LoadPlugins(sls *SLS) error {
	if sls != nil && sls.PluginsDir != "" {
		log.Info("controller plugins are not supported on this operating system")
	}
	return nil
}

func DisableAll() {}
