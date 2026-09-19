package volume

import "testing"

func TestManifestFragmented(t *testing.T) {
	small := Manifest{LayerMaxBytes: 400 << 20}
	for i := 0; i < 15; i++ {
		small.Layers = append(small.Layers, LayerInfo{Size: 1024})
	}
	if small.Fragmented() {
		t.Fatal("fewer than 16 layers should not warn")
	}

	healthy := Manifest{LayerMaxBytes: 400 << 20}
	for i := 0; i < 20; i++ {
		healthy.Layers = append(healthy.Layers, LayerInfo{Size: 200 << 20})
	}
	if healthy.Fragmented() {
		t.Fatal("large layers should not warn")
	}

	frag := Manifest{LayerMaxBytes: 400 << 20}
	for i := 0; i < 16; i++ {
		frag.Layers = append(frag.Layers, LayerInfo{Size: 1 << 20})
	}
	if !frag.Fragmented() {
		t.Fatal("16 tiny layers should warn")
	}
	if frag.avgLayerBytes() != 1<<20 {
		t.Fatalf("avg %d", frag.avgLayerBytes())
	}
}
