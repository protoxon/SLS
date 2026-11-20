package cmd

import (
	"path/filepath"
	"testing"

	controllerconfig "protoxon.com/sls/controller/config"
	daemonconfig "protoxon.com/sls/daemon/config"
	"protoxon.com/sls/run/devconfig"
)

func TestApplyPeerSocketsOnlyWhenBothSidesRun(t *testing.T) {
	prevController := runController
	prevDaemon := runDaemon
	prevDev := dev
	t.Cleanup(func() {
		runController = prevController
		runDaemon = prevDaemon
		dev = prevDev
	})

	controllerPrev := controllerconfig.Get()
	root := t.TempDir()
	controllerconfig.SetForTest(&controllerconfig.Configuration{
		System: controllerconfig.SystemConfiguration{RootDirectory: root},
	})
	t.Cleanup(func() { controllerconfig.SetForTest(controllerPrev) })

	daemonPrev := daemonconfig.Get()
	daemonconfig.Set(&daemonconfig.Configuration{
		Api:       daemonconfig.ApiConfiguration{Url: "http://127.0.0.1:5585", Host: "127.0.0.1", Port: 5585},
		RemoteApi: daemonconfig.RemoteApi{Url: "http://127.0.0.1:5620"},
	})
	t.Cleanup(func() { daemonconfig.Set(daemonPrev) })

	runController, runDaemon = true, false
	dev = false
	applyPeerSockets(devconfig.Layout{})
	if !remoteTokenRequired() {
		t.Fatal("node token was skipped with only the controller")
	}
	if controllerconfig.Get().Api.Socket.ActivePath() != "" || daemonconfig.Get().Api.Socket.ActivePath() != "" || daemonconfig.Get().RemoteApi.Socket.ActivePath() != "" {
		t.Fatal("peer sockets were set with only the controller")
	}

	runController, runDaemon = false, true
	applyPeerSockets(devconfig.Layout{})
	if controllerconfig.Get().Api.Socket.ActivePath() != "" || daemonconfig.Get().Api.Socket.ActivePath() != "" || daemonconfig.Get().RemoteApi.Socket.ActivePath() != "" {
		t.Fatal("peer sockets were set with only the daemon")
	}

	runController, runDaemon = true, true
	dev = true
	devRoot := t.TempDir()
	applyPeerSockets(devconfig.Layout{Root: devRoot})
	if got, want := controllerconfig.Get().Api.Socket.ActivePath(), filepath.Join(devRoot, "controller.sock"); got != want {
		t.Fatalf("dev controller socket = %s", got)
	}
	if got, want := daemonconfig.Get().Api.Socket.ActivePath(), filepath.Join(devRoot, "daemon.sock"); got != want {
		t.Fatalf("dev daemon socket = %s", got)
	}
	if daemonconfig.Get().RemoteApi.Socket.ActivePath() != controllerconfig.Get().Api.Socket.ActivePath() {
		t.Fatal("daemon remote socket does not match the controller socket")
	}
	if daemonconfig.Get().RemoteApi.Url != "http://127.0.0.1:5620" || daemonconfig.Get().Api.Url != "http://127.0.0.1:5585" {
		t.Fatal("peer sockets changed the HTTP origins")
	}

	dev = false
	applyPeerSockets(devconfig.Layout{})
	if got, want := controllerconfig.Get().Api.Socket.ActivePath(), filepath.Join(root, "run", "controller.sock"); got != want {
		t.Fatalf("controller socket = %s", got)
	}
	if got, want := daemonconfig.Get().Api.Socket.ActivePath(), filepath.Join(root, "run", "daemon.sock"); got != want {
		t.Fatalf("daemon socket = %s", got)
	}
	if daemonconfig.Get().RemoteApi.Socket.ActivePath() != filepath.Join(root, "run", "controller.sock") {
		t.Fatalf("remote socket = %s", daemonconfig.Get().RemoteApi.Socket.ActivePath())
	}
	if remoteTokenRequired() {
		t.Fatal("node token still required when the controller socket is enabled")
	}
}
