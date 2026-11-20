package config

import (
	"regexp"
	"strconv"
	"strings"
	"time"

	"emperror.dev/errors"
)

var durationPattern = regexp.MustCompile(`^(\d+)(mo|y|w|d|h|m)$`)

// ParseDuration parses one positive integer and a suffix.
// m is a minute, h an hour, d a day (24h), w a week (7d),
// mo a month (30d), and y a year (365d).
func ParseDuration(s string) (time.Duration, error) {
	s = strings.ToLower(strings.TrimSpace(s))
	m := durationPattern.FindStringSubmatch(s)
	if m == nil {
		return 0, errors.Errorf("invalid duration %q", s)
	}
	n, err := strconv.ParseInt(m[1], 10, 64)
	if err != nil || n <= 0 {
		return 0, errors.Errorf("invalid duration %q", s)
	}
	unit, err := durationUnit(m[2])
	if err != nil {
		return 0, err
	}
	if n > int64(time.Duration(1<<63-1)/unit) {
		return 0, errors.Errorf("duration %q is too large", s)
	}
	return time.Duration(n) * unit, nil
}

func durationUnit(suffix string) (time.Duration, error) {
	switch suffix {
	case "m":
		return time.Minute, nil
	case "h":
		return time.Hour, nil
	case "d":
		return 24 * time.Hour, nil
	case "w":
		return 7 * 24 * time.Hour, nil
	case "mo":
		return 30 * 24 * time.Hour, nil
	case "y":
		return 365 * 24 * time.Hour, nil
	default:
		return 0, errors.Errorf("invalid duration suffix %q", suffix)
	}
}
