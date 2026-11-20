package remote

import (
	"encoding/json"
	"io"
	"net/http"
	"net/url"
	"strings"
	"testing"
)

// Only an explicit 412 Unregistered means the node must register. A 404 on a
// node route is a missing resource, such as a server the controller deleted.
func TestIsUnregistered(t *testing.T) {
	cases := []struct {
		status int
		body   string
		want   bool
	}{
		{http.StatusPreconditionFailed, `{"detail":"Unregistered"}`, true},
		{http.StatusPreconditionFailed, `{"detail":"something else"}`, false},
		{http.StatusNotFound, `{"detail":"resource not found"}`, false},
	}
	for _, tc := range cases {
		u, _ := url.Parse("http://controller/api/nodes/n1/internal/servers/abc")
		resp := &Response{&http.Response{
			StatusCode: tc.status,
			Body:       io.NopCloser(strings.NewReader(tc.body)),
			Request:    &http.Request{URL: u},
		}}
		if got := isUnregistered(resp); got != tc.want {
			t.Errorf("status %d body %s: isUnregistered = %v, want %v", tc.status, tc.body, got, tc.want)
		}
	}
}

func TestRegistrationJSONKeepsConsoleProxyFalse(t *testing.T) {
	off := false
	raw, err := json.Marshal(NodeRegistration{Id: "n", ConsoleProxy: &off})
	if err != nil {
		t.Fatal(err)
	}
	var got map[string]any
	if err := json.Unmarshal(raw, &got); err != nil {
		t.Fatal(err)
	}
	value, ok := got["console_proxy"].(bool)
	if !ok || value {
		t.Fatalf("console_proxy = %#v", got["console_proxy"])
	}
}
