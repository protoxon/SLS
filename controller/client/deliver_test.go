package client

import (
	"context"
	"net"
	"testing"
	"time"

	"emperror.dev/errors"
)

func TestNotDeliveredIsADialFailure(t *testing.T) {
	if NotDelivered(context.DeadlineExceeded) {
		t.Fatal("a timeout after the connection was accepted was treated as undelivered")
	}
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()
	_, err := New().Node("n", "http://127.0.0.1:1", "token").Get(ctx, "/servers/x/status", nil)
	if err == nil {
		t.Fatal("closed port accepted a request")
	}
	if !NotDelivered(err) {
		t.Fatalf("connection refused was delivered: %v", err)
	}
	var op *net.OpError
	if !errors.As(err, &op) || op.Op != "dial" {
		t.Fatalf("dial error %v", err)
	}
}
