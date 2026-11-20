package server

import (
	"reflect"
	"testing"

	"github.com/creasty/defaults"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/scheduler"
)

// Without a loaded config the controller falls back to DefaultConfig. That
// fallback must be the same policy the config file defaults to.
func TestDefaultConfigMatchesConfigFileDefaults(t *testing.T) {
	var c config.Configuration
	if err := defaults.Set(&c.Scheduler); err != nil {
		t.Fatal(err)
	}
	prev := config.Swap(&c)
	defer config.Swap(prev)

	got := schedulerConfig()
	want := scheduler.Normalize(scheduler.DefaultConfig())
	if !reflect.DeepEqual(got, want) {
		t.Fatalf("config file defaults\n%+v\nDefaultConfig\n%+v", got, want)
	}
}
