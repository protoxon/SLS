// Package nodesync runs a real controller and a real daemon over HTTP and
// checks that the controller's server records and the daemon's live server
// set stay in agreement when a request, a response, or a load fails.
package nodesync

import (
	"net/http"
	"testing"
)

func TestHealthyCreateAndDelete(t *testing.T) {
	c := newCluster(t)
	id := c.createHealthy()
	docker.run(id)

	if status := c.delete(id, false); status != http.StatusOK {
		t.Fatalf("delete returned %d", status)
	}
	c.requireGone(id, "healthy delete")
}

// A server whose load fails during the on-connect sync is skipped while its
// container keeps running. The controller still has the record, so a delete
// must be able to remove it without waiting for another reconnect.
func TestDeleteServerSkippedBySync(t *testing.T) {
	c := newCluster(t)
	id := c.createHealthy()
	docker.run(id)

	restore := c.hideBaseFolder()
	c.startDaemon()
	restore()
	if c.nodeHas(id) || !c.controllerHas(id) {
		t.Fatalf("setup did not skip the server: %s", c.describe(id))
	}

	c.deleteEventually(id)
}

// Force delete on a reachable node that only lacks the server in memory
// must not leave its container running with no controller record.
func TestForceDeleteServerSkippedBySync(t *testing.T) {
	c := newCluster(t)
	id := c.createHealthy()
	docker.run(id)

	restore := c.hideBaseFolder()
	c.startDaemon()
	restore()

	if status := c.delete(id, true); status != http.StatusOK {
		t.Fatalf("force delete returned %d", status)
	}
	c.requireGone(id, "force delete")
}

// A server skipped by one sync is loaded by the next one. This is how a
// restart recovered the servers before, and it must keep working.
func TestReconnectLoadsServerSkippedBySync(t *testing.T) {
	c := newCluster(t)
	id := c.createHealthy()
	docker.run(id)

	restore := c.hideBaseFolder()
	c.startDaemon()
	restore()
	c.reconnect()

	if !c.nodeHas(id) || !c.controllerHas(id) {
		t.Fatalf("reconnect did not load the skipped server: %s", c.describe(id))
	}
}

// The node accepts the create connection and drops it before handling it,
// and the follow-up presence check fails the same way.
func TestCreateDroppedAndPresenceCheckFails(t *testing.T) {
	c := newCluster(t)
	c.toNode.on(http.MethodPost, `^/api/servers$`, reset)
	c.toNode.on(http.MethodGet, `^/api/servers/[^/]+/status$`, reset)
	status, id := c.create()
	c.toNode.clear()

	c.requireCreateOutcome(status, id)
}

// The node creates the server but the response is lost, and the follow-up
// presence check fails.
func TestCreateResponseLostAndPresenceCheckFails(t *testing.T) {
	c := newCluster(t)
	c.toNode.on(http.MethodPost, `^/api/servers$`, loseResponse)
	c.toNode.on(http.MethodGet, `^/api/servers/[^/]+/status$`, reset)
	status, id := c.create()
	c.toNode.clear()

	c.requireCreateOutcome(status, id)
}

// The node creates the server but the response is lost, and the presence
// check succeeds. The controller already recovers from this.
func TestCreateResponseLostAndPresenceCheckSucceeds(t *testing.T) {
	c := newCluster(t)
	c.toNode.on(http.MethodPost, `^/api/servers$`, loseResponse)
	status, id := c.create()
	c.toNode.clear()

	if status != http.StatusAccepted {
		t.Fatalf("create returned %d", status)
	}
	c.requireCreateOutcome(status, id)
}

// The create reaches the node only after the controller gave up and its
// presence check saw no server, so the controller drops the record and the
// node then creates the server anyway.
func TestCreateDeliveredAfterControllerGaveUp(t *testing.T) {
	c := newCluster(t)
	release := make(chan struct{})
	c.toNode.on(http.MethodPost, `^/api/servers$`, deliverLate(release))
	status, id := c.create()
	c.toNode.clear()
	close(release)
	c.toNode.pending.Wait()

	c.requireCreateOutcome(status, id)
}

// The node deletes the server but its deleted event is rejected by the
// controller, so the controller keeps a record for a server that no longer
// exists and the next sync recreates it on the node.
func TestDeletedEventRejected(t *testing.T) {
	c := newCluster(t)
	id := c.createHealthy()
	docker.run(id)

	c.toController.on(http.MethodPost, `/internal/event/servers/[^/]+/deleted$`, respond(http.StatusTooManyRequests))
	status := c.delete(id, false)
	c.toController.clear()
	if status != http.StatusOK {
		t.Fatalf("delete returned %d", status)
	}

	c.requireGone(id, "delete with rejected event")
	c.reconnect()
	c.requireGone(id, "reconnect after delete with rejected event")
}
