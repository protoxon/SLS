package router

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"testing"

	"github.com/gin-gonic/gin"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/software"
)

func TestReloadErrorsNilSliceEncodesEmptyArray(t *testing.T) {
	body := blueprintReloadResponse{Errors: reloadErrors[blueprint.LoadError](nil)}
	data, err := json.Marshal(body)
	if err != nil {
		t.Fatal(err)
	}
	var decoded struct {
		Errors []blueprint.LoadError `json:"errors"`
	}
	if err := json.Unmarshal(data, &decoded); err != nil {
		t.Fatal(err)
	}
	if decoded.Errors == nil {
		t.Fatalf("errors encoded as null: %s", data)
	}
	if len(decoded.Errors) != 0 {
		t.Fatalf("errors: %+v", decoded.Errors)
	}
}

func TestPostReloadEmptyDirectories(t *testing.T) {
	gin.SetMode(gin.TestMode)
	blueprints := t.TempDir()
	softwareDir := t.TempDir()
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		System: config.SystemConfiguration{
			Blueprints: blueprints,
			Software:   softwareDir,
		},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	rt := New(&Resources{
		BlueprintRegistry: blueprint.NewBlueprintRegistry(),
		MixinRegistry:     blueprint.NewMixinRegistry(),
		SoftwareRegistry:  software.NewRegistry(),
	})

	blueprintBody := postReload(t, rt.postReloadBlueprints)
	if blueprintBody.Blueprints != 0 || blueprintBody.Mixins != 0 {
		t.Fatalf("blueprint counts: %+v", blueprintBody)
	}
	if blueprintBody.Errors == nil {
		t.Fatal("blueprint errors encoded as null")
	}
	if len(blueprintBody.Errors) != 0 {
		t.Fatalf("blueprint errors: %+v", blueprintBody.Errors)
	}

	softwareBody := postReload(t, rt.postReloadSoftware)
	if softwareBody.Software != 0 {
		t.Fatalf("software count: %+v", softwareBody)
	}
	if softwareBody.Errors == nil || len(softwareBody.Errors) != 0 {
		t.Fatalf("software errors: %+v", softwareBody.Errors)
	}
}

func TestPostReloadReportsSkippedFiles(t *testing.T) {
	gin.SetMode(gin.TestMode)
	blueprints := t.TempDir()
	softwareDir := t.TempDir()
	if err := os.WriteFile(filepath.Join(blueprints, "broken.yml"), []byte("blueprint:\n  id: broken\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(filepath.Join(softwareDir, "broken.yml"), []byte("software:\n  id: broken\n"), 0o644); err != nil {
		t.Fatal(err)
	}
	prev := config.Get()
	config.SetForTest(&config.Configuration{
		System: config.SystemConfiguration{
			Blueprints: blueprints,
			Software:   softwareDir,
		},
	})
	t.Cleanup(func() { config.SetForTest(prev) })

	rt := New(&Resources{
		BlueprintRegistry: blueprint.NewBlueprintRegistry(),
		MixinRegistry:     blueprint.NewMixinRegistry(),
		SoftwareRegistry:  software.NewRegistry(),
	})

	blueprintBody := postReload(t, rt.postReloadBlueprints)
	if blueprintBody.Blueprints != 0 || len(blueprintBody.Errors) != 1 {
		t.Fatalf("blueprint reload: %+v", blueprintBody)
	}
	if blueprintBody.Errors[0].Kind != "blueprint" || blueprintBody.Errors[0].Path != "broken.yml" {
		t.Fatalf("blueprint error: %+v", blueprintBody.Errors[0])
	}

	softwareBody := postReload(t, rt.postReloadSoftware)
	if softwareBody.Software != 0 || len(softwareBody.Errors) != 1 {
		t.Fatalf("software reload: %+v", softwareBody)
	}
	if softwareBody.Errors[0].Kind != "software" || softwareBody.Errors[0].Path != "broken.yml" {
		t.Fatalf("software error: %+v", softwareBody.Errors[0])
	}
}

type reloadPayload struct {
	Blueprints int                   `json:"blueprints"`
	Mixins     int                   `json:"mixins"`
	Software   int                   `json:"software"`
	Errors     []blueprint.LoadError `json:"errors"`
}

func postReload(t *testing.T, handler func(*gin.Context)) reloadPayload {
	t.Helper()
	w := httptest.NewRecorder()
	c, _ := gin.CreateTestContext(w)
	c.Request = httptest.NewRequest(http.MethodPost, "/reload", nil)
	handler(c)
	if w.Code != http.StatusOK {
		t.Fatalf("status %d body %s", w.Code, w.Body.String())
	}
	var body reloadPayload
	if err := json.Unmarshal(w.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode %s: %v", w.Body.String(), err)
	}
	return body
}
