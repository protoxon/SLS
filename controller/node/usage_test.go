package node

import (
	"testing"
	"time"

	"protoxon.com/sls/internal/api"
)

func TestSwapOutHistoryKeepsRecentRatesAndDropsAfterAGap(t *testing.T) {
	n := New("id", "n", "loc", "http://node", "token", false)
	n.SetMetrics(api.NodeMetrics{Memory: api.MemoryMetrics{SwapOutPerSec: 10}})
	n.SetMetrics(api.NodeMetrics{Memory: api.MemoryMetrics{SwapOutPerSec: 20}})
	rates := n.SwapOutRates()
	if len(rates) != 2 || rates[0] != 10 || rates[1] != 20 {
		t.Fatalf("rates %v", rates)
	}

	now := time.Now()
	n.mutex.Lock()
	n.swapOut = []swapOutSample{{at: now, rate: 100}, {at: now.Add(10 * time.Second), rate: 80}}
	n.recordSwapOut(now.Add(50*time.Second), 90)
	n.mutex.Unlock()
	rates = n.SwapOutRates()
	if len(rates) != 1 || rates[0] != 90 {
		t.Fatalf("gap should clear history: %v", rates)
	}
}
