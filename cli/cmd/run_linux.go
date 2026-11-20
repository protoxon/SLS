//go:build linux

package cmd

import (
	controllercmd "protoxon.com/sls/controller/cmd"
	daemoncmd "protoxon.com/sls/daemon/cmd"
	runcmd "protoxon.com/sls/run/cmd"
)

func init() {
	cmd := runcmd.Command()
	cmd.AddCommand(controllercmd.Command())
	cmd.AddCommand(daemoncmd.Command())
	addServerCommand(cmd)
}
