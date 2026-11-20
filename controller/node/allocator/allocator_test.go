package allocator

import (
	"strconv"
	"sync"
	"testing"

	"emperror.dev/errors"
	"protoxon.com/sls/controller/models"
)

func mustAllocator(t *testing.T, allocs []models.Allocation) *Allocator {
	t.Helper()
	a, err := NewAllocator(allocs)
	if err != nil {
		t.Fatal(err)
	}
	return a
}

func singlePool(t *testing.T, ports string) *Allocator {
	t.Helper()
	return mustAllocator(t, []models.Allocation{{
		Address: "127.0.0.1",
		Alias:   "127.0.0.1",
		Ports:   ports,
	}})
}

func take(t *testing.T, a *Allocator) (string, int) {
	t.Helper()
	got, err := a.NewAllocation()
	if err != nil {
		t.Fatalf("NewAllocation: %v", err)
	}
	if got.DefaultMapping.Ip == "" || got.DefaultMapping.Port == 0 {
		t.Fatalf("allocation missing default mapping: %+v", got)
	}
	ports := got.Mappings[got.DefaultMapping.Ip]
	if len(ports) != 1 || ports[0] != got.DefaultMapping.Port {
		t.Fatalf("mappings = %+v, default port %d", got.Mappings, got.DefaultMapping.Port)
	}
	return got.DefaultMapping.Ip, got.DefaultMapping.Port
}

func TestNewAllocatorRejectsBadRanges(t *testing.T) {
	cases := []string{
		"",
		"25565",
		"25565-25566-25567",
		"25565-abc",
		" 25565-25566",
		"25565 -25566",
		"25570-25565",
		"0-10",
		"1-65536",
		"-1-10",
	}
	for _, ports := range cases {
		t.Run(ports, func(t *testing.T) {
			_, err := NewAllocator([]models.Allocation{{
				Address: "127.0.0.1",
				Ports:   ports,
			}})
			if err == nil {
				t.Fatalf("range %q was accepted", ports)
			}
		})
	}
}

func TestNewAllocatorAcceptsInclusiveEnds(t *testing.T) {
	a := singlePool(t, "1-1")
	_, port := take(t, a)
	if port != 1 {
		t.Fatalf("port = %d, want 1", port)
	}
	a = singlePool(t, "65535-65535")
	_, port = take(t, a)
	if port != 65535 {
		t.Fatalf("port = %d, want 65535", port)
	}
}

func TestEmptyAllocatorHasNoPorts(t *testing.T) {
	for _, allocs := range [][]models.Allocation{nil, {}} {
		a := mustAllocator(t, allocs)
		if a.HasFreePort() {
			t.Fatal("empty allocator reports a free port")
		}
		if _, err := a.NewAllocation(); err == nil {
			t.Fatal("empty allocator returned a port")
		}
	}
	var a *Allocator
	if a.HasFreePort() {
		t.Fatal("nil allocator reports a free port")
	}
	if _, err := a.NewAllocation(); err == nil {
		t.Fatal("nil allocator returned a port")
	}
	a.Claim("127.0.0.1", 25565)
	a.Release("127.0.0.1", 25565)
}

func TestAllocationUsesLowestFreePort(t *testing.T) {
	a := mustAllocator(t, []models.Allocation{{
		Address:         "127.0.0.1",
		Alias:           "play.example",
		ForceOutgoingIP: true,
		Ports:           "25565-25570",
	}})

	var ports []int
	for i := 0; i < 3; i++ {
		got, err := a.NewAllocation()
		if err != nil {
			t.Fatal(err)
		}
		if got.Alias != "play.example" || !got.ForceOutgoingIP {
			t.Fatalf("allocation metadata = %+v", got)
		}
		ports = append(ports, got.DefaultMapping.Port)
	}
	if ports[0] != 25565 || ports[1] != 25566 || ports[2] != 25567 {
		t.Fatalf("ports = %v, want 25565, 25566, 25567", ports)
	}

	a.Release("127.0.0.1", 25566)
	_, port := take(t, a)
	if port != 25566 {
		t.Fatalf("hole filled with %d, want 25566", port)
	}
}

func TestPoolExhaustionAndRelease(t *testing.T) {
	a := singlePool(t, "25565-25567")
	seen := map[int]struct{}{}
	for i := 0; i < 3; i++ {
		_, port := take(t, a)
		if port < 25565 || port > 25567 {
			t.Fatalf("port %d outside 25565-25567", port)
		}
		if _, ok := seen[port]; ok {
			t.Fatalf("port %d allocated twice", port)
		}
		seen[port] = struct{}{}
	}
	if a.HasFreePort() {
		t.Fatal("exhausted pool still reports a free port")
	}
	_, err := a.NewAllocation()
	if !errors.Is(err, ErrNoFreePorts) {
		t.Fatalf("NewAllocation err = %v, want ErrNoFreePorts", err)
	}

	a.Release("127.0.0.1", 25565)
	a.Release("127.0.0.1", 25565)
	a.Release("10.0.0.9", 25565)
	if !a.HasFreePort() {
		t.Fatal("released port is still taken")
	}
	_, port := take(t, a)
	if port != 25565 {
		t.Fatalf("reused port %d, want 25565", port)
	}
	if a.HasFreePort() {
		t.Fatal("pool has a free port after the released port was taken again")
	}
}

func TestClaimKeepsAPortOutOfThePool(t *testing.T) {
	a := singlePool(t, "25565-25567")
	a.Claim("127.0.0.1", 25565)
	a.Claim("127.0.0.1", 25565)
	_, port := take(t, a)
	if port == 25565 {
		t.Fatal("claimed port was allocated")
	}

	a.Claim("127.0.0.1", 25566)
	a.Claim("127.0.0.1", 25567)
	if a.HasFreePort() {
		t.Fatal("fully claimed pool reports a free port")
	}
	if _, err := a.NewAllocation(); !errors.Is(err, ErrNoFreePorts) {
		t.Fatalf("NewAllocation err = %v, want ErrNoFreePorts", err)
	}

	a.Release("127.0.0.1", 25565)
	_, port = take(t, a)
	if port != 25565 {
		t.Fatalf("released claim returned %d, want 25565", port)
	}
}

func TestClaimOutsideThePoolDoesNotReserve(t *testing.T) {
	a := singlePool(t, "25565-25565")
	a.Claim("10.0.0.2", 25565)
	a.Claim("127.0.0.1", 1)
	a.Claim("127.0.0.1", 25566)
	_, port := take(t, a)
	if port != 25565 {
		t.Fatalf("port = %d, want 25565", port)
	}
}

func TestAddressesAndRangesDoNotSharePorts(t *testing.T) {
	a := mustAllocator(t, []models.Allocation{
		{Address: "10.0.0.1", Alias: "one", Ports: "25565-25566"},
		{Address: "10.0.0.1", Alias: "two", Ports: "25570-25571"},
		{Address: "10.0.0.2", Alias: "other", Ports: "25565-25566"},
	})
	a.Claim("10.0.0.1", 25565)
	a.Claim("10.0.0.1", 25566)
	a.Claim("10.0.0.1", 25570)
	a.Claim("10.0.0.1", 25571)

	seen := map[string]struct{}{}
	for i := 0; i < 2; i++ {
		got, err := a.NewAllocation()
		if err != nil {
			t.Fatal(err)
		}
		if got.DefaultMapping.Ip != "10.0.0.2" || got.Alias != "other" {
			t.Fatalf("allocation = %+v, want 10.0.0.2", got)
		}
		key := got.DefaultMapping.Ip + ":" + strconv.Itoa(got.DefaultMapping.Port)
		if _, ok := seen[key]; ok {
			t.Fatalf("duplicate %s", key)
		}
		seen[key] = struct{}{}
	}
	if _, err := a.NewAllocation(); !errors.Is(err, ErrNoFreePorts) {
		t.Fatalf("NewAllocation err = %v, want ErrNoFreePorts", err)
	}

	a.Release("10.0.0.2", 25565)
	if _, err := a.NewAllocation(); err != nil {
		t.Fatal(err)
	}
	_, err := a.NewAllocation()
	if !errors.Is(err, ErrNoFreePorts) {
		t.Fatalf("release on one address freed another: %v", err)
	}
}

func TestOverlappingRangesAllocateOnce(t *testing.T) {
	a := mustAllocator(t, []models.Allocation{
		{Address: "10.0.0.1", Alias: "low", Ports: "25565-25570"},
		{Address: "10.0.0.1", Alias: "high", Ports: "25568-25575"},
	})
	seen := map[int]string{}
	for {
		got, err := a.NewAllocation()
		if errors.Is(err, ErrNoFreePorts) {
			break
		}
		if err != nil {
			t.Fatal(err)
		}
		port := got.DefaultMapping.Port
		if _, ok := seen[port]; ok {
			t.Fatalf("port %d allocated twice", port)
		}
		seen[port] = got.Alias
	}
	if len(seen) != 11 {
		t.Fatalf("allocated %d ports, want 11", len(seen))
	}
	if seen[25565] != "low" || seen[25575] != "high" {
		t.Fatalf("range aliases = 25565:%s 25575:%s", seen[25565], seen[25575])
	}
}

func TestOneBadRangeRejectsTheAllocator(t *testing.T) {
	_, err := NewAllocator([]models.Allocation{
		{Address: "10.0.0.1", Ports: "25565-25566"},
		{Address: "10.0.0.2", Ports: "25570-25565"},
	})
	if err == nil {
		t.Fatal("allocator accepted an inverted range")
	}
}

func TestConcurrentAllocationsAreUnique(t *testing.T) {
	const (
		start = 40000
		end   = 40020
	)
	perAddr := end - start + 1
	a := mustAllocator(t, []models.Allocation{
		{Address: "10.0.0.1", Ports: "40000-40020"},
		{Address: "10.0.0.2", Ports: "40000-40020"},
	})
	a.Claim("10.0.0.1", start)
	a.Claim("10.0.0.2", start)

	type hold struct {
		ip   string
		port int
	}
	key := func(ip string, port int) string {
		return ip + ":" + strconv.Itoa(port)
	}

	var mu sync.Mutex
	var got []hold
	var wg sync.WaitGroup
	for i := 0; i < perAddr*4; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for {
				alloc, err := a.NewAllocation()
				if err != nil {
					return
				}
				_ = a.HasFreePort()
				mu.Lock()
				got = append(got, hold{alloc.DefaultMapping.Ip, alloc.DefaultMapping.Port})
				mu.Unlock()
			}
		}()
	}
	wg.Wait()

	seen := map[string]struct{}{}
	for _, h := range got {
		if h.port == start {
			t.Fatalf("allocated claimed port %s", key(h.ip, h.port))
		}
		k := key(h.ip, h.port)
		if _, ok := seen[k]; ok {
			t.Fatalf("duplicate allocation %s", k)
		}
		seen[k] = struct{}{}
	}
	want := (perAddr - 1) * 2
	if len(seen) != want {
		t.Fatalf("allocated %d ports, want %d", len(seen), want)
	}
	if a.HasFreePort() {
		t.Fatal("pool still shows a free port")
	}

	for i, h := range got {
		if i%2 == 0 {
			wg.Add(1)
			go func(h hold) {
				defer wg.Done()
				a.Release(h.ip, h.port)
			}(h)
		}
	}
	wg.Wait()

	again := map[string]struct{}{}
	for {
		alloc, err := a.NewAllocation()
		if errors.Is(err, ErrNoFreePorts) {
			break
		}
		if err != nil {
			t.Fatal(err)
		}
		if alloc.DefaultMapping.Port == start {
			t.Fatalf("reallocated claimed port %s:%d", alloc.DefaultMapping.Ip, alloc.DefaultMapping.Port)
		}
		k := key(alloc.DefaultMapping.Ip, alloc.DefaultMapping.Port)
		if _, ok := again[k]; ok {
			t.Fatalf("duplicate allocation %s", k)
		}
		again[k] = struct{}{}
	}
	if len(again) != want/2 {
		t.Fatalf("reallocated %d ports, want %d", len(again), want/2)
	}
}

func TestConcurrentAllocateAndRelease(t *testing.T) {
	a := mustAllocator(t, []models.Allocation{
		{Address: "10.0.0.1", Ports: "40000-40050"},
		{Address: "10.0.0.2", Ports: "40000-40050"},
	})

	var mu sync.Mutex
	inUse := map[string]struct{}{}
	var dups int
	var wg sync.WaitGroup
	for i := 0; i < 8; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for j := 0; j < 200; j++ {
				alloc, err := a.NewAllocation()
				if err != nil {
					_ = a.HasFreePort()
					continue
				}
				k := alloc.DefaultMapping.Ip + ":" + strconv.Itoa(alloc.DefaultMapping.Port)
				mu.Lock()
				if _, ok := inUse[k]; ok {
					dups++
				}
				inUse[k] = struct{}{}
				mu.Unlock()

				_ = a.HasFreePort()

				mu.Lock()
				delete(inUse, k)
				mu.Unlock()
				a.Release(alloc.DefaultMapping.Ip, alloc.DefaultMapping.Port)
			}
		}()
	}
	wg.Wait()
	if dups != 0 {
		t.Fatalf("%d ports were handed out while still checked out", dups)
	}

	seen := map[string]struct{}{}
	for {
		alloc, err := a.NewAllocation()
		if errors.Is(err, ErrNoFreePorts) {
			break
		}
		if err != nil {
			t.Fatal(err)
		}
		k := alloc.DefaultMapping.Ip + ":" + strconv.Itoa(alloc.DefaultMapping.Port)
		if _, ok := seen[k]; ok {
			t.Fatalf("duplicate allocation %s", k)
		}
		seen[k] = struct{}{}
	}
	if len(seen) != 51*2 {
		t.Fatalf("drained %d ports, want %d", len(seen), 51*2)
	}
}
