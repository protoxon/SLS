package scheduler

import (
	"sort"
	"time"
)

// LearnPoint says how much of the way from limit to learned target a charge
// has moved after a server has run for After.
type LearnPoint struct {
	After   time.Duration
	Learned float64
}

// defaultLearning stays slow through the first minute, while a server may
// still be booting, and reaches full trust at five minutes.
func defaultLearning() []LearnPoint {
	return []LearnPoint{
		{After: 2 * time.Minute, Learned: 0.15},
		{After: 5 * time.Minute, Learned: 1},
	}
}

// normalizeLearning sorts points by time and keeps learned shares in [0, 1]
// and never decreasing. Points at or before zero are dropped.
func normalizeLearning(points []LearnPoint) []LearnPoint {
	out := make([]LearnPoint, 0, len(points))
	for _, p := range points {
		if p.After > 0 {
			out = append(out, p)
		}
	}
	sort.SliceStable(out, func(i, j int) bool { return out[i].After < out[j].After })
	prev := 0.0
	for i := range out {
		out[i].Learned = min(max(out[i].Learned, prev), 1)
		prev = out[i].Learned
	}
	return out
}

// learnedWeight is how far a charge has moved from the limit toward the
// learned target after observed running time. It is a smooth S-curve through
// (0, 0) and the configured points: flat at the start and at the last point,
// always rising in between, never overshooting a point. After the last point
// it holds that point's share.
func learnedWeight(observed time.Duration, cfg Config) float64 {
	points := cfg.MemoryLearning
	if len(points) == 0 || observed <= 0 {
		return 0
	}
	last := points[len(points)-1]
	if observed >= last.After {
		return last.Learned
	}
	xs := make([]float64, 0, len(points)+1)
	ys := make([]float64, 0, len(points)+1)
	xs = append(xs, 0)
	ys = append(ys, 0)
	for _, p := range points {
		xs = append(xs, p.After.Seconds())
		ys = append(ys, p.Learned)
	}
	return monotoneCubic(xs, ys, observed.Seconds())
}

// monotoneCubic interpolates through increasing xs with a piecewise cubic
// whose tangents keep it monotone between points (Fritsch-Butland). The end
// tangents are flat, which gives the S shape.
func monotoneCubic(xs, ys []float64, x float64) float64 {
	n := len(xs)
	secant := make([]float64, n-1)
	for i := range secant {
		secant[i] = (ys[i+1] - ys[i]) / (xs[i+1] - xs[i])
	}
	tangent := make([]float64, n)
	for i := 1; i < n-1; i++ {
		if secant[i-1] <= 0 || secant[i] <= 0 {
			continue
		}
		h0, h1 := xs[i]-xs[i-1], xs[i+1]-xs[i]
		w0, w1 := 2*h1+h0, h1+2*h0
		tangent[i] = (w0 + w1) / (w0/secant[i-1] + w1/secant[i])
	}
	i := sort.Search(n-1, func(i int) bool { return xs[i+1] > x })
	h := xs[i+1] - xs[i]
	s := (x - xs[i]) / h
	s2, s3 := s*s, s*s*s
	return (2*s3-3*s2+1)*ys[i] + (s3-2*s2+s)*h*tangent[i] + (-2*s3+3*s2)*ys[i+1] + (s3-s2)*h*tangent[i+1]
}
