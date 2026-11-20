package server

import (
	"context"
	"errors"
	"testing"

	"protoxon.com/sls/daemon/environment"
)

// notifyClient records whether each Controller report got a live context.
type notifyClient struct {
	recordingClient
	deletedErr, phaseErr error
	deleted, phased      bool
	deletedReason        string
}

func (c *notifyClient) ServerDeleted(ctx context.Context, _, reason string) error {
	c.deleted, c.deletedErr, c.deletedReason = true, ctx.Err(), reason
	return ctx.Err()
}

func TestDeleteAfterFailureReportsReason(t *testing.T) {
	rec := &notifyClient{}
	s, err := New(rec)
	if err != nil {
		t.Fatal(err)
	}
	s.id = "abc"
	s.Environment = &reportEnv{state: environment.ProcessOfflineState}
	removed := false
	s.Remove = func() { removed = true }

	s.deleteAfterFailure(PowerActionStart, errors.New("failed to mount filesystem: invalid argument"))

	if !removed {
		t.Fatal("server was not removed")
	}
	if want := "start failed: failed to mount filesystem: invalid argument"; rec.deletedReason != want {
		t.Fatalf("reason = %q, want %q", rec.deletedReason, want)
	}
}

func (c *notifyClient) SetInstallationStatus(ctx context.Context, _ string, _ string) error {
	c.phased, c.phaseErr = true, ctx.Err()
	return ctx.Err()
}

func TestControllerReportsOutliveServerContext(t *testing.T) {
	rec := &notifyClient{}
	s, err := New(rec)
	if err != nil {
		t.Fatal(err)
	}
	s.id = "abc"
	s.Environment = &reportEnv{state: environment.ProcessOfflineState}
	s.CtxCancel()

	if err := s.SyncInstallState(InstallStatusFailed); err != nil {
		t.Fatalf("install phase report after cancel: %v", err)
	}
	s.CleanupForDestroy("")

	if !rec.phased || rec.phaseErr != nil {
		t.Fatalf("install phase report: sent=%v ctx err=%v", rec.phased, rec.phaseErr)
	}
	if !rec.deleted || rec.deletedErr != nil {
		t.Fatalf("deletion report: sent=%v ctx err=%v", rec.deleted, rec.deletedErr)
	}
}
