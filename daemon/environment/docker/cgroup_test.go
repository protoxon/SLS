package docker

import (
	"testing"

	"github.com/docker/docker/api/types/container"
	"protoxon.com/sls/internal/api"
)

func TestSetCPUDelta(t *testing.T) {
	e := &Environment{}
	var s api.ServerSample
	e.setCPUDelta(&s, 5_000)
	if s.CPUDeltaUsec != 0 {
		t.Fatalf("first sample delta = %d", s.CPUDeltaUsec)
	}
	e.setCPUDelta(&s, 8_000)
	if s.CPUDeltaUsec != 3_000 {
		t.Fatalf("delta = %d", s.CPUDeltaUsec)
	}
}

func TestDockerMemoryMatchesWorkingSet(t *testing.T) {
	got := calculateDockerMemory(container.MemoryStats{
		Usage: 800 << 20,
		Stats: map[string]uint64{"inactive_file": 200 << 20},
	})
	if got != 600<<20 {
		t.Fatalf("got %d", got)
	}
}
