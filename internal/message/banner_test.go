package message

import (
	"testing"

	"protoxon.com/sls/internal/version"
)

func TestVersionLabel(t *testing.T) {
	versionText := "v" + version.Version
	tests := []struct {
		name string
		want string
	}{
		{name: "", want: versionText},
		{name: "Daemon", want: "Daemon " + versionText},
		{name: "Controller", want: "Controller " + versionText},
	}
	for _, tt := range tests {
		if got := versionLabel(tt.name); got != tt.want {
			t.Errorf("versionLabel(%q) = %q, want %q", tt.name, got, tt.want)
		}
	}
}
