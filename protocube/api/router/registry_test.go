package router

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
	"protoxon.com/sls/protocube/config"
)

func TestGetNodeRegistryEmpty(t *testing.T) {
	gin.SetMode(gin.TestMode)
	prev := config.Get()
	config.SetForTest(&config.Configuration{})
	t.Cleanup(func() { config.SetForTest(prev) })
	w := httptest.NewRecorder()
	c, _ := gin.CreateTestContext(w)
	getNodeRegistry(c)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d", w.Code)
	}
	var snap config.Snapshot
	if err := json.Unmarshal(w.Body.Bytes(), &snap); err != nil {
		t.Fatal(err)
	}
	if snap.Credentials == nil {
		t.Fatal("credentials should be []")
	}
}

func TestGetNodeRegistryUsesConfig(t *testing.T) {
	gin.SetMode(gin.TestMode)
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{
			Default: "ghcr.io/jessefaler",
			Credentials: []config.RegistryCredential{
				{Host: "ghcr.io", Username: "jesse", Password: "pat"},
			},
		},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	w := httptest.NewRecorder()
	c, _ := gin.CreateTestContext(w)
	getNodeRegistry(c)
	var snap config.Snapshot
	if err := json.Unmarshal(w.Body.Bytes(), &snap); err != nil {
		t.Fatal(err)
	}
	if len(snap.Credentials) != 1 || snap.Revision == "" || len(snap.Insecure) != 0 {
		t.Fatalf("got %+v", snap)
	}
	if snap.Credentials[0].Password != "pat" {
		t.Fatalf("password %q", snap.Credentials[0].Password)
	}
}

func TestGetNodeRegistryInsecureDefault(t *testing.T) {
	gin.SetMode(gin.TestMode)
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{
			Default:  "localhost:5000/sls",
			Insecure: true,
		},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	w := httptest.NewRecorder()
	c, _ := gin.CreateTestContext(w)
	getNodeRegistry(c)
	var snap config.Snapshot
	if err := json.Unmarshal(w.Body.Bytes(), &snap); err != nil {
		t.Fatal(err)
	}
	if len(snap.Insecure) != 1 || snap.Insecure[0] != "localhost:5000" {
		t.Fatalf("insecure %+v", snap.Insecure)
	}
	if len(snap.Credentials) != 0 {
		t.Fatalf("credentials %+v", snap.Credentials)
	}
}
