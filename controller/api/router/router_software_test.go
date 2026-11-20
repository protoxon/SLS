package router

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/api/router/middleware"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/software"
)

func TestGetAllSoftwareAndOne(t *testing.T) {
	gin.SetMode(gin.TestMode)
	reg := software.NewRegistry()
	reg.Register(&software.Software{
		Id:           "paper",
		Name:         "Paper",
		DockerImages: map[string]string{"java_21": "ghcr.io/example/java:21"},
		StopCommand:  "stop",
		Invocation:   "java -jar server.jar",
		OnlineSignal: "Done",
	})
	reg.Register(&software.Software{Id: "vanilla", Name: "Vanilla"})

	prev := config.Get()
	config.SetForTest(&config.Configuration{
		Registry: config.RegistryConfiguration{Storage: t.TempDir()},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	rt := New(&Resources{SoftwareRegistry: reg})
	rt.Handler = rt.Configure()
	w := httptest.NewRecorder()
	c, _ := gin.CreateTestContext(w)
	c.Request = httptest.NewRequest(http.MethodGet, "/api/software?per_page=10", nil)
	rt.getAllSoftware(c)
	if w.Code != http.StatusOK {
		t.Fatalf("list status %d body %s", w.Code, w.Body.String())
	}
	var listed struct {
		Meta struct {
			Pagination struct {
				Total int `json:"total"`
			} `json:"pagination"`
		} `json:"meta"`
		Data []software.Software `json:"data"`
	}
	if err := json.Unmarshal(w.Body.Bytes(), &listed); err != nil {
		t.Fatal(err)
	}
	if listed.Meta.Pagination.Total != 2 || len(listed.Data) != 2 {
		t.Fatalf("list: %+v", listed)
	}
	if listed.Data[0].Id != "paper" || listed.Data[1].Id != "vanilla" {
		t.Fatalf("order: %+v", listed.Data)
	}
	if listed.Data[0].StopCommand != "stop" || listed.Data[0].DockerImages["java_21"] == "" {
		t.Fatalf("paper: %+v", listed.Data[0])
	}

	w = httptest.NewRecorder()
	c, _ = gin.CreateTestContext(w)
	c.Request = httptest.NewRequest(http.MethodGet, "/api/software/paper", nil)
	c.Params = gin.Params{{Key: "software", Value: "paper"}}
	c.Set("logger", log.WithField("test", true))
	middleware.SoftwareExists(reg)(c)
	if c.IsAborted() {
		t.Fatalf("paper lookup aborted: %s", w.Body.String())
	}
	getSoftware(c)
	if w.Code != http.StatusOK {
		t.Fatalf("get status %d body %s", w.Code, w.Body.String())
	}
	var one software.Software
	if err := json.Unmarshal(w.Body.Bytes(), &one); err != nil {
		t.Fatal(err)
	}
	if one.Id != "paper" || one.Name != "Paper" {
		t.Fatalf("software: %+v", one)
	}

	w = httptest.NewRecorder()
	c, _ = gin.CreateTestContext(w)
	c.Request = httptest.NewRequest(http.MethodGet, "/api/software/missing", nil)
	c.Params = gin.Params{{Key: "software", Value: "missing"}}
	c.Set("logger", log.WithField("test", true))
	middleware.SoftwareExists(reg)(c)
	if !c.IsAborted() || w.Code != http.StatusNotFound {
		t.Fatalf("missing software status %d aborted %v", w.Code, c.IsAborted())
	}
}
