package api

import "testing"

func TestFormatGlobalEvent(t *testing.T) {
	cases := []struct {
		name    string
		payload string
		want    string
	}{
		{
			name:    "status",
			payload: `{"Topic":"status","Data":{"server_id":"abc","payload":"running"}}`,
			want:    "[DEBUG] Server (abc) changed status to: running",
		},
		{
			name:    "crash",
			payload: `{"Topic":"crash","Data":{"server_id":"abc","payload":{"reason":"oom","exit_code":137,"timestamp":"2026-10-06T20:33:01Z"}}}`,
			want:    "Server abc crashed: Reason=oom, ExitCode=137, Timestamp=2026-10-06T20:33:01Z",
		},
		{
			name:    "deleted",
			payload: `{"Topic":"deleted","Data":{"server_id":"abc","payload":null}}`,
			want:    "Server abc was deleted",
		},
		{
			name:    "installing",
			payload: `{"Topic":"install","Data":{"server_id":"abc","payload":"installing"}}`,
			want:    "[DEBUG] Server (abc) install changed to: installing",
		},
		{
			name:    "install completed",
			payload: `{"Topic":"install","Data":{"server_id":"abc","payload":"completed"}}`,
			want:    "[DEBUG] Server (abc) install changed to: completed",
		},
		{
			name:    "install failed",
			payload: `{"Topic":"install","Data":{"server_id":"abc","payload":"failed"}}`,
			want:    "[DEBUG] Server (abc) install changed to: failed",
		},
		{
			name:    "other",
			payload: `{"Topic":"backup completed","Data":{"server_id":"abc","payload":{"id":"1"}}}`,
			want:    `backup completed {"server_id":"abc","payload":{"id":"1"}}`,
		},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			if got := formatGlobalEvent([]byte(tc.payload)); got != tc.want {
				t.Fatalf("got %q want %q", got, tc.want)
			}
		})
	}
}
