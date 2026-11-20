package system

import (
	"math"
	"testing"
	"time"
)

func TestParseCPUStat(t *testing.T) {
	text := "cpu  100 0 50 850 20 0 5 10 0 0\ncpu0 50 0 25 425 10 0 2 5 0 0\n"
	got := ParseCPUStat(text)
	if !got.OK || got.User != 100 || got.Nice != 0 || got.System != 50 || got.Idle != 850 || got.IOWait != 20 || got.IRQ != 0 || got.SoftIRQ != 5 || got.Steal != 10 {
		t.Fatalf("%#v", got)
	}
	if got.Work() != 165 || got.Total() != 1035 {
		t.Fatalf("work=%d total=%d", got.Work(), got.Total())
	}
}

func TestBusyPercentExcludesIOWaitFromBusy(t *testing.T) {
	prev := CPUStat{User: 100, System: 50, Idle: 800, IOWait: 50, SoftIRQ: 0, OK: true}
	// +100 work, +100 idle, +100 iowait → work/total = 100/300
	next := CPUStat{User: 180, System: 70, Idle: 900, IOWait: 150, SoftIRQ: 0, OK: true}
	busy, ok := BusyPercent(prev, next)
	if !ok {
		t.Fatal("expected busy percent")
	}
	if math.Abs(busy-100.0/3.0) > 0.01 {
		t.Fatalf("busy=%v want ~33.33", busy)
	}
}

func TestUpdateEMASeedsThenMoves(t *testing.T) {
	first := updateEMA(0, 50, 0.1, false)
	if first != 50 {
		t.Fatalf("seed=%v", first)
	}
	next := updateEMA(first, 100, 0.5, true)
	if math.Abs(next-75) > 0.001 {
		t.Fatalf("ema=%v", next)
	}
}

func TestEmaAlpha(t *testing.T) {
	a := emaAlpha(1, 10)
	want := 1 - math.Exp(-0.1)
	if math.Abs(a-want) > 1e-9 {
		t.Fatalf("alpha=%v want %v", a, want)
	}
}

func TestBusyStaleAfterWarmup(t *testing.T) {
	s := NewSampler("/", nil)
	s.markBusyUnavailable()
	if s.BusyStale() {
		t.Fatal("warm-up should not be stale immediately")
	}
	s.mu.Lock()
	s.busyMissingSince = time.Now().Add(-busyWarnAfter - time.Second)
	s.mu.Unlock()
	if !s.BusyStale() {
		t.Fatal("expected stale after busyWarnAfter")
	}
	s.mu.Lock()
	s.busyOK = true
	s.busyMissingSince = time.Time{}
	s.mu.Unlock()
	if s.BusyStale() {
		t.Fatal("available busy should not be stale")
	}
}
