package registry

import "github.com/sirupsen/logrus"

// quietMissFormatter drops expected OCI "not found" answers. A push asks
// whether the tag and each blob are already stored (404 → upload). Listing a
// namespace first probes it as a repository and gets name unknown before
// falling back to the catalog. Those are not failures.
type quietMissFormatter struct {
	base logrus.Formatter
}

func (f quietMissFormatter) Format(entry *logrus.Entry) ([]byte, error) {
	if knownMiss(entry) {
		return nil, nil
	}
	base := f.base
	if base == nil {
		base = &logrus.TextFormatter{}
	}
	return base.Format(entry)
}

func quietKnownMisses() {
	logger := logrus.StandardLogger()
	if _, ok := logger.Formatter.(quietMissFormatter); ok {
		return
	}
	logger.SetFormatter(quietMissFormatter{base: logger.Formatter})
}

func knownMiss(entry *logrus.Entry) bool {
	if entry.Message != "response completed with error" {
		return false
	}
	switch codeText(entry.Data["err.code"]) {
	case "manifest unknown", "blob unknown", "name unknown":
		return true
	default:
		return false
	}
}

func codeText(code any) string {
	switch c := code.(type) {
	case interface{ Error() string }:
		return c.Error()
	case string:
		return c
	default:
		return ""
	}
}
