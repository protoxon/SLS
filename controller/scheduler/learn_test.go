package scheduler

import (
	"math"
	"testing"
	"time"
)

func TestLearningCurvePassesThroughItsPoints(t *testing.T) {
	cfg := Normalize(DefaultConfig())
	if got := learnedWeight(0, cfg); got != 0 {
		t.Errorf("at zero: %.3f", got)
	}
	for _, p := range cfg.MemoryLearning {
		if got := learnedWeight(p.After, cfg); math.Abs(got-p.Learned) > 1e-9 {
			t.Errorf("at %s: %.3f, want %.3f", p.After, got, p.Learned)
		}
	}
	if got := learnedWeight(48*time.Hour, cfg); got != 1 {
		t.Errorf("long after the last point: %.3f", got)
	}
}

// The default curve stays slow through the first minute and reaches full
// trust at five minutes. The middle of that window rises faster than the
// start. It never goes backwards, and it holds after the last point.
func TestDefaultLearningIsAnSCurve(t *testing.T) {
	cfg := Normalize(DefaultConfig())
	rise := func(from, to time.Duration) float64 {
		return learnedWeight(to, cfg) - learnedWeight(from, cfg)
	}
	start := rise(0, time.Minute)
	middle := rise(3*time.Minute, 4*time.Minute)
	t.Logf("first minute %.3f, fourth minute %.3f", start, middle)
	if start >= middle {
		t.Errorf("not steeper in the middle: first minute %.3f, fourth %.3f", start, middle)
	}
	if start > 0.05 {
		t.Errorf("learned %.3f in the first minute, want a slow start", start)
	}
	if got := learnedWeight(5*time.Minute, cfg); got != 1 {
		t.Errorf("at five minutes: %.3f, want full trust", got)
	}
	if got := learnedWeight(6*time.Minute, cfg); got != 1 {
		t.Errorf("after five minutes: %.3f, want the weight to hold", got)
	}
	prev := 0.0
	for at := time.Duration(0); at <= 6*time.Minute; at += 10 * time.Second {
		w := learnedWeight(at, cfg)
		if w < prev || w > 1 {
			t.Fatalf("at %s: %.4f after %.4f", at, w, prev)
		}
		prev = w
	}
}

// A configured curve is sorted, clamped to [0, 1], and never decreasing.
// Points without a valid time are dropped, and an empty curve is the default.
func TestLearningScheduleIsNormalized(t *testing.T) {
	cfg := Normalize(Config{MemoryLearning: []LearnPoint{
		{After: 10 * time.Minute, Learned: 1.5},
		{After: 0, Learned: 0.5},
		{After: 2 * time.Minute, Learned: 0.6},
		{After: 5 * time.Minute, Learned: 0.4},
	}})
	want := []LearnPoint{
		{After: 2 * time.Minute, Learned: 0.6},
		{After: 5 * time.Minute, Learned: 0.6},
		{After: 10 * time.Minute, Learned: 1},
	}
	if len(cfg.MemoryLearning) != len(want) {
		t.Fatalf("curve %+v", cfg.MemoryLearning)
	}
	for i := range want {
		if cfg.MemoryLearning[i] != want[i] {
			t.Fatalf("curve %+v, want %+v", cfg.MemoryLearning, want)
		}
	}
	if got := Normalize(Config{}).MemoryLearning; len(got) != len(defaultLearning()) {
		t.Fatalf("empty curve normalized to %+v", got)
	}
}
