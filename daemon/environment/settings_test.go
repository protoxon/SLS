package environment

import (
	"testing"

	"protoxon.com/sls/daemon/config"
)

func TestAsContainerResourcesHonorsStamps(t *testing.T) {
	prev := config.Get()
	config.Set(&config.Configuration{})
	t.Cleanup(func() { config.Set(prev) })

	stamped := Limits{MemoryLimit: 6144, MemoryReservation: 5222, MemoryMax: 6451}
	got := stamped.AsContainerResources()
	if got.Memory != 6451*1024*1024 || got.MemoryReservation != 5222*1024*1024 {
		t.Fatalf("stamped resources memory=%d reservation=%d", got.Memory, got.MemoryReservation)
	}
	if got.CPUQuota != 0 {
		t.Fatalf("cpu limit 0 installed a quota: %d", got.CPUQuota)
	}

	plain := Limits{MemoryLimit: 6144}
	fallback := plain.AsContainerResources()
	if fallback.Memory != plain.BoundedMemoryLimit() {
		t.Fatalf("unstamped hard cap = %d", fallback.Memory)
	}
	if fallback.MemoryReservation != 6144*1024*1024 {
		t.Fatalf("unstamped reservation = %d", fallback.MemoryReservation)
	}
}
