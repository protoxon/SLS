package system

import "testing"

func TestParsePSI(t *testing.T) {
	text := "some avg10=1.50 avg60=0.25 avg300=0.00 total=100\nfull avg10=0.10 avg60=0.00 avg300=0.00 total=4\n"
	got := ParsePSI(text)
	if !got.HasSome || !got.HasFull || got.SomeAvg10 != 1.5 || got.SomeAvg60 != 0.25 || got.FullAvg10 != 0.1 {
		t.Fatalf("%#v", got)
	}
	cpu := ParsePSI("some avg10=4.00 avg60=2.00 avg300=1.00 total=9\n")
	if !cpu.HasSome || cpu.HasFull || cpu.SomeAvg10 != 4 {
		t.Fatalf("%#v", cpu)
	}
}

func TestParseVMStat(t *testing.T) {
	got := ParseVMStat("pswpin 10\npswpout 4\nnr_free_pages 1\n")
	if !got.OK || got.SwapIn != 10 || got.SwapOut != 4 {
		t.Fatalf("%#v", got)
	}
}

func TestParseMemInfo(t *testing.T) {
	text := "MemTotal:       1024 kB\nMemAvailable:    512 kB\nBuffers:         10 kB\nCached:          20 kB\nSReclaimable:    5 kB\nSwapTotal:      256 kB\nSwapFree:       128 kB\n"
	got := ParseMemInfo(text)
	if !got.OK || got.TotalBytes != 1024*1024 || got.AvailableBytes != 512*1024 || got.CacheBytes != 35*1024 || got.SwapTotalBytes != 256*1024 || got.SwapFreeBytes != 128*1024 {
		t.Fatalf("%#v", got)
	}
}
