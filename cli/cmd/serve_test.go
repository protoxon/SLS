package cmd

import (
	"testing"

	"github.com/spf13/cobra"
)

func TestLinuxOnlyError(t *testing.T) {
	for _, name := range []string{"run", "run daemon"} {
		err := linuxOnly(name)
		want := "sls " + name + " runs on Linux"
		if err == nil || err.Error() != want {
			t.Fatalf("linuxOnly(%q) = %v, want %q", name, err, want)
		}
	}
}

func TestServerCommandsRegistered(t *testing.T) {
	run := findCommand(rootCmd, "run")
	if run == nil {
		t.Fatal("sls run is not registered")
	}
	if run.GroupID != groupServer {
		t.Fatalf("sls run group = %q, want %q", run.GroupID, groupServer)
	}
	for _, name := range []string{"controller", "daemon", "agent"} {
		if findCommand(rootCmd, name) != nil {
			t.Fatalf("sls %s is still a top-level command", name)
		}
	}
	if !hasFlag(run, "dev") || !hasFlag(run, "debug") || !hasFlag(run, "init-config") {
		t.Fatal("sls run is missing --dev, --debug, or --init-config")
	}

	daemon := findCommand(run, "daemon")
	if daemon == nil {
		t.Fatal("sls run daemon is not registered")
	}
	if !hasFlag(daemon, "config") || !hasFlag(daemon, "debug") || !hasFlag(daemon, "init-config") {
		t.Fatal("sls run daemon is missing --config, --debug, or --init-config")
	}

	controller := findCommand(run, "controller")
	if controller == nil {
		t.Fatal("sls run controller is not registered")
	}
	if !hasFlag(controller, "init-config") {
		t.Fatal("sls run controller is missing --init-config")
	}
}

func findCommand(parent *cobra.Command, name string) *cobra.Command {
	for _, cmd := range parent.Commands() {
		if cmd.Name() == name {
			return cmd
		}
	}
	return nil
}

func hasFlag(cmd *cobra.Command, name string) bool {
	return cmd.Flags().Lookup(name) != nil || cmd.PersistentFlags().Lookup(name) != nil
}
