package configenv

import (
	"strings"
	"testing"
)

type testConfig struct {
	Remote struct {
		Url   string `yaml:"url"`
		Token string `yaml:"token"`
	} `yaml:"remote"`
	Port     int      `yaml:"port"`
	Enabled  bool     `yaml:"enabled"`
	Password string   `yaml:"password"`
	Quoted   string   `yaml:"quoted"`
	Hosts    []string `yaml:"hosts"`
}

func TestUnmarshalExpandsValues(t *testing.T) {
	t.Setenv("SLS_TEST_TOKEN", "secret")
	t.Setenv("SLS_TEST_HOST", "core.slpriv")
	t.Setenv("SLS_TEST_PORT", "5620")
	t.Setenv("SLS_TEST_ENABLED", "true")
	var cfg testConfig
	err := Unmarshal([]byte(`
remote:
  url: "http://${SLS_TEST_HOST}:${SLS_TEST_PORT}"
  token: ${SLS_TEST_TOKEN}
port: ${SLS_TEST_PORT}
enabled: ${SLS_TEST_ENABLED}
hosts:
  - ${SLS_TEST_HOST}:5000
`), &cfg)
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Remote.Url != "http://core.slpriv:5620" || cfg.Remote.Token != "secret" {
		t.Fatalf("remote: %+v", cfg.Remote)
	}
	if cfg.Port != 5620 || !cfg.Enabled {
		t.Fatalf("port %d enabled %t", cfg.Port, cfg.Enabled)
	}
	if len(cfg.Hosts) != 1 || cfg.Hosts[0] != "core.slpriv:5000" {
		t.Fatalf("hosts: %v", cfg.Hosts)
	}
}

func TestUnmarshalValueCannotChangeStructure(t *testing.T) {
	t.Setenv("SLS_TEST_PASSWORD", "x\nport: 1\nenabled: true")
	var cfg testConfig
	if err := Unmarshal([]byte("password: ${SLS_TEST_PASSWORD}\n"), &cfg); err != nil {
		t.Fatal(err)
	}
	if cfg.Password != "x\nport: 1\nenabled: true" || cfg.Port != 0 || cfg.Enabled {
		t.Fatalf("injected: %+v", cfg)
	}
}

func TestUnmarshalKeepsSecretsAsStrings(t *testing.T) {
	for _, v := range []string{"~", "null", "", "0123", "true"} {
		t.Setenv("SLS_TEST_PASSWORD", v)
		var cfg testConfig
		if err := Unmarshal([]byte("password: ${SLS_TEST_PASSWORD}\n"), &cfg); err != nil {
			t.Fatalf("%q: %v", v, err)
		}
		if cfg.Password != v {
			t.Fatalf("%q decoded as %q", v, cfg.Password)
		}
	}
}

func TestUnmarshalLeavesOtherDollarSigns(t *testing.T) {
	var cfg testConfig
	err := Unmarshal([]byte(`
password: "pa$$word$HOME"
quoted: "$${SLS_TEST_UNSET} ${not a name}"
# token: ${SLS_TEST_UNSET_COMMENT}
`), &cfg)
	if err != nil {
		t.Fatal(err)
	}
	if cfg.Password != "pa$$word$HOME" {
		t.Fatalf("password: %q", cfg.Password)
	}
	if cfg.Quoted != "${SLS_TEST_UNSET} ${not a name}" {
		t.Fatalf("quoted: %q", cfg.Quoted)
	}
}

func TestUnmarshalUnsetVariable(t *testing.T) {
	var cfg testConfig
	err := Unmarshal([]byte("port: 1\npassword: ${SLS_TEST_UNSET_A}\nquoted: ${SLS_TEST_UNSET_B}\n"), &cfg)
	if err == nil {
		t.Fatal("expected an error")
	}
	for _, want := range []string{"SLS_TEST_UNSET_A (line 2)", "SLS_TEST_UNSET_B (line 3)"} {
		if !strings.Contains(err.Error(), want) {
			t.Fatalf("error %q is missing %q", err, want)
		}
	}
}

func TestUnmarshalExpandsAnchorOnce(t *testing.T) {
	t.Setenv("SLS_TEST_ESCAPED", "wrong")
	var cfg struct {
		A string `yaml:"a"`
		B string `yaml:"b"`
	}
	if err := Unmarshal([]byte("a: &v $${SLS_TEST_ESCAPED}\nb: *v\n"), &cfg); err != nil {
		t.Fatal(err)
	}
	if cfg.A != "${SLS_TEST_ESCAPED}" || cfg.B != "${SLS_TEST_ESCAPED}" {
		t.Fatalf("%+v", cfg)
	}
}

func TestUnmarshalEmpty(t *testing.T) {
	var cfg testConfig
	if err := Unmarshal(nil, &cfg); err != nil {
		t.Fatal(err)
	}
}
