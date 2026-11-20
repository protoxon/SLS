package logcomponent

import (
	"strings"
	"testing"
)

func TestWriteLabelAligns(t *testing.T) {
	var controller, daemon, run strings.Builder
	WriteLabel(&controller, Controller, false)
	WriteLabel(&daemon, Daemon, false)
	WriteLabel(&run, Run, false)

	if controller.Len() != daemon.Len() || daemon.Len() != run.Len() {
		t.Fatalf("widths controller=%d daemon=%d run=%d", controller.Len(), daemon.Len(), run.Len())
	}
	if got := controller.String(); got != "[controller] " {
		t.Fatalf("controller label %q", got)
	}
	if got := daemon.String(); !strings.HasPrefix(got, "[daemon]") || strings.TrimRight(got, " ") != "[daemon]" {
		t.Fatalf("daemon label %q", got)
	}
}

func TestWriteLabelEmpty(t *testing.T) {
	var b strings.Builder
	WriteLabel(&b, "", false)
	if b.Len() != 0 {
		t.Fatalf("empty label wrote %q", b.String())
	}
}

func TestComponentOf(t *testing.T) {
	cases := []struct {
		fn   string
		want string
	}{
		{"protoxon.com/sls/controller/api.(*Api).Listen", Controller},
		{"protoxon.com/sls/daemon/server.(*Server).Log", Daemon},
		{"protoxon.com/sls/run/cmd.run", Run},
		{"protoxon.com/sls/internal/process.UnmarshalJSON", ""},
		{"github.com/apex/log.(*Entry).Info", ""},
	}
	for _, tc := range cases {
		if got := componentOf(tc.fn); got != tc.want {
			t.Errorf("componentOf(%s) = %q, want %q", tc.fn, got, tc.want)
		}
	}
}
