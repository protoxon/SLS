package server

import (
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

// Running time starts when the status becomes running, not when the server
// starts booting. Leaving running stops it, and the time already counted is
// kept for the next run.
func TestObservedTimeCountsOnlyWhileRunning(t *testing.T) {
	s := &Server{id: "a"}
	start := time.Date(2026, 1, 1, 0, 0, 0, 0, time.UTC)
	beat := func(i int) {
		s.observeUsage(api.ServerSample{ID: "a", MemoryCurrent: 100}, start.Add(time.Duration(i)*10*time.Second))
	}
	s.noteStatus(ProcessStartingState, start)
	for i := 0; i <= 6; i++ {
		beat(i)
	}
	if _, observed := s.learnedUsage(); observed != 0 {
		t.Fatalf("counted %s while starting", observed)
	}
	s.noteStatus(ProcessRunningState, start.Add(65*time.Second))
	for i := 7; i <= 12; i++ {
		beat(i)
	}
	if _, observed := s.learnedUsage(); observed != 55*time.Second {
		t.Fatalf("counted %s, want the 55s since the server became running", observed)
	}
	s.noteStatus(ProcessStoppingState, start.Add(125*time.Second))
	for i := 13; i <= 20; i++ {
		beat(i)
	}
	if _, observed := s.learnedUsage(); observed != 55*time.Second {
		t.Fatalf("counted %s after the server stopped running", observed)
	}
}

// A silent node adds at most one heartbeat gap when samples resume.
func TestObservedTimeCapsHeartbeatGaps(t *testing.T) {
	s := &Server{id: "a"}
	start := time.Date(2026, 1, 1, 0, 0, 0, 0, time.UTC)
	s.noteStatus(ProcessRunningState, start)
	s.observeUsage(api.ServerSample{ID: "a", MemoryCurrent: 100}, start.Add(10*time.Second))
	s.observeUsage(api.ServerSample{ID: "a", MemoryCurrent: 100}, start.Add(2*time.Hour))
	if _, observed := s.learnedUsage(); observed != 10*time.Second+maxObservedGap {
		t.Fatalf("counted %s across a two hour silence", observed)
	}
}

// The peak is the most the server has used, including the cgroup's own
// high-water mark, and it survives the server stopping.
func TestPeakKeepsHighestUse(t *testing.T) {
	s := &Server{id: "a"}
	at := time.Now()
	s.observeUsage(api.ServerSample{ID: "a", MemoryCurrent: 300, MemoryPeak: 500}, at)
	s.observeUsage(api.ServerSample{ID: "a", MemoryCurrent: 200, MemoryPeak: 200}, at.Add(10*time.Second))
	if peak, _ := s.learnedUsage(); peak != 500 {
		t.Fatalf("peak %d", peak)
	}
}

// A heartbeat only teaches the servers placed on the node that sent it.
func TestObserveUsageIgnoresOtherNodes(t *testing.T) {
	a := capacityNode(t, "a")
	b := capacityNode(t, "b")
	m := capacityManager(a, b)
	s, err := admitPaper(m, "a")
	if err != nil {
		t.Fatal(err)
	}
	m.ObserveUsage("b", []api.ServerSample{{ID: s.Id(), MemoryCurrent: 1 << 30}}, time.Now())
	if peak, _ := s.learnedUsage(); peak != 0 {
		t.Fatalf("node b's heartbeat set peak %d on a server placed on a", peak)
	}
}

// A stopped server keeps what was learned about it. It is charged at its
// learned charge, not its limit, and that charge still has to fit in the
// node's free memory because it is not running.
func TestStoppedServerKeepsLearnedUsage(t *testing.T) {
	n := capacityNode(t, "a")
	m := capacityManager(n)
	s, err := admitPaper(m, "a")
	if err != nil {
		t.Fatal(err)
	}
	watch(m, n, []string{s.Id()}, 48*time.Hour)
	peak, observed := s.learnedUsage()
	heartbeat(n, 30*gib, time.Now().Add(2*time.Second))
	m.mutex.RLock()
	view := m.nodeView(n)
	m.mutex.RUnlock()
	if len(view.Servers) != 1 {
		t.Fatalf("%d residents", len(view.Servers))
	}
	r := view.Servers[0]
	if r.Peak != peak || r.Observed != observed || r.MemoryCurrent != 0 {
		t.Fatalf("stopped resident %+v, learned peak %d observed %s", r, peak, observed)
	}
}

// Learned usage is written once per change.
func TestDirtyUsageIsTakenOnce(t *testing.T) {
	s := &Server{id: "a"}
	s.observeUsage(api.ServerSample{ID: "a", MemoryCurrent: 100}, time.Now())
	if _, ok := s.takeDirtyUsage(); !ok {
		t.Fatal("new peak was not dirty")
	}
	if _, ok := s.takeDirtyUsage(); ok {
		t.Fatal("usage stayed dirty after it was taken")
	}
	s.markUsageDirty()
	if u, ok := s.takeDirtyUsage(); !ok || u.PeakBytes != 100 {
		t.Fatalf("failed write was not retried: %+v %v", u, ok)
	}
}
