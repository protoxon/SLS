package token

import (
	"context"
	"os"
	"path/filepath"
	"testing"

	"github.com/grokify/coreforge/identity/apikey"
	"gopkg.in/yaml.v3"
)

type fakeKeys struct {
	valid   map[string]struct{}
	created int
	last    apikey.CreateKeyRequest
}

func (f *fakeKeys) Validate(_ context.Context, key string) (*apikey.APIKey, error) {
	if _, ok := f.valid[key]; ok {
		return &apikey.APIKey{Name: localNodeName}, nil
	}
	return nil, apikey.ErrInvalidKey
}

func (f *fakeKeys) Create(_ context.Context, req apikey.CreateKeyRequest) (*apikey.GeneratedKey, error) {
	f.created++
	f.last = req
	key := "sls_local_node_token"
	if f.valid == nil {
		f.valid = map[string]struct{}{}
	}
	f.valid[key] = struct{}{}
	return &apikey.GeneratedKey{Key: key}, nil
}

func TestEnsure(t *testing.T) {
	tests := []struct {
		name    string
		token   string
		valid   bool
		wantNew bool
	}{
		{name: "reuse valid", token: "sls_existing", valid: true, wantNew: false},
		{name: "empty", token: "", wantNew: true},
		{name: "placeholder", token: PlaceholderToken, wantNew: true},
		{name: "rejected", token: "sls_stale", valid: false, wantNew: true},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			path := filepath.Join(t.TempDir(), "daemon.yml")
			writeDaemonConfig(t, path, "node-uuid", tt.token)
			keys := &fakeKeys{valid: map[string]struct{}{}}
			if tt.valid {
				keys.valid[tt.token] = struct{}{}
			}
			got, err := Ensure(context.Background(), keys, path)
			if err != nil {
				t.Fatal(err)
			}
			if tt.wantNew {
				if keys.created != 1 {
					t.Fatalf("created = %d", keys.created)
				}
				if got != "sls_local_node_token" {
					t.Fatalf("token = %s", got)
				}
				if keys.last.Name != localNodeName || len(keys.last.Scopes) != 1 || keys.last.Scopes[0] != "node" {
					t.Fatalf("create request = %#v", keys.last)
				}
				if keys.last.ExpiresIn != nil {
					t.Fatal("token expires")
				}
			} else {
				if keys.created != 0 {
					t.Fatalf("created = %d", keys.created)
				}
				if got != tt.token {
					t.Fatalf("token = %s", got)
				}
			}
			again, err := Ensure(context.Background(), keys, path)
			if err != nil {
				t.Fatal(err)
			}
			if again != got {
				t.Fatalf("second token = %s, want %s", again, got)
			}
			if keys.created > 1 || (!tt.wantNew && keys.created != 0) {
				t.Fatalf("created after second ensure = %d", keys.created)
			}

			info, err := os.Stat(path)
			if err != nil {
				t.Fatal(err)
			}
			if info.Mode().Perm() != 0o600 {
				t.Fatalf("mode = %o", info.Mode().Perm())
			}
			var cfg struct {
				UUID   string `yaml:"uuid"`
				Remote struct {
					URL   string `yaml:"url"`
					Token string `yaml:"token"`
				} `yaml:"remote"`
				API struct {
					URL string `yaml:"url"`
					TLS struct {
						Enabled bool `yaml:"enabled"`
					} `yaml:"tls"`
				} `yaml:"api"`
			}
			data, err := os.ReadFile(path)
			if err != nil {
				t.Fatal(err)
			}
			if err := yaml.Unmarshal(data, &cfg); err != nil {
				t.Fatal(err)
			}
			if cfg.UUID != "node-uuid" || cfg.Remote.URL != "http://127.0.0.1:5620" || cfg.Remote.Token != got {
				t.Fatalf("config after ensure = %#v", cfg)
			}
			if cfg.API.URL != "http://127.0.0.1:5585" || cfg.API.TLS.Enabled {
				t.Fatalf("api after ensure = %#v", cfg.API)
			}
		})
	}
}

func TestRequireConfigured(t *testing.T) {
	if err := RequireConfigured(""); err == nil {
		t.Fatal("empty token accepted")
	}
	if err := RequireConfigured(PlaceholderToken); err == nil {
		t.Fatal("placeholder accepted")
	}
	if err := RequireConfigured(" sls_real "); err != nil {
		t.Fatal(err)
	}
}

func writeDaemonConfig(t *testing.T, path, id, token string) {
	t.Helper()
	body := "uuid: " + id + "\n" +
		"remote:\n" +
		"  url: \"http://127.0.0.1:5620\"\n" +
		"  token: \"" + token + "\"\n" +
		"api:\n" +
		"  url: \"http://127.0.0.1:5585\"\n" +
		"  tls:\n" +
		"    enabled: false\n"
	if err := os.WriteFile(path, []byte(body), 0o644); err != nil {
		t.Fatal(err)
	}
}
