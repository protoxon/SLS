package server

import (
	"testing"

	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/internal/api"
)

func TestDeleteRefusesInProgressSnapshot(t *testing.T) {
	s := &Server{snapshotRunning: true}
	if err := s.Delete(); err != ErrSnapshotInProgress {
		t.Fatalf("error: %v", err)
	}
}

func TestStartSnapshotRejectsCommandsWhenStopped(t *testing.T) {
	s := &Server{Environment: &reportEnv{state: environment.ProcessOfflineState}}
	err := s.StartSnapshot(api.CreateSnapshotRequest{
		ID:        "snap",
		Reference: "localhost:5000/sls/snapshots:snap",
		Pre:       []string{"save-off"},
	})
	if err != ErrSnapshotCommands {
		t.Fatalf("error: %v", err)
	}
}

func TestStartSnapshotAllowsRunningServerWithoutCommands(t *testing.T) {
	s := &Server{Environment: &reportEnv{state: environment.ProcessRunningState}}
	err := s.StartSnapshot(api.CreateSnapshotRequest{
		ID:        "snap",
		Reference: "localhost:5000/sls/snapshots:snap",
	})
	if err == ErrSnapshotCommands {
		t.Fatal("commands were not requested")
	}
	if err == nil {
		t.Fatal("expected the snapshot to fail before the overlay exists")
	}
}

func TestSendSnapshotCommandsStopsOnFailure(t *testing.T) {
	env := &scriptEnv{reportEnv: reportEnv{state: environment.ProcessRunningState}, failAt: 2}
	s := &Server{Environment: env}
	sent, err := s.sendSnapshotCommands([]string{"save-off", "save-all", "extra"})
	if err == nil {
		t.Fatal("expected a send failure")
	}
	if sent != 1 || len(env.commands) != 2 || env.commands[0] != "save-off" || env.commands[1] != "save-all" {
		t.Fatalf("sent %d commands %v", sent, env.commands)
	}
}

type scriptEnv struct {
	reportEnv
	commands []string
	failAt   int
}

func (e *scriptEnv) SendCommand(command string) error {
	e.commands = append(e.commands, command)
	if e.failAt > 0 && len(e.commands) >= e.failAt {
		return errorsNew("stdin closed")
	}
	return nil
}

func errorsNew(msg string) error {
	return &plainError{msg}
}

type plainError struct{ msg string }

func (e *plainError) Error() string { return e.msg }
