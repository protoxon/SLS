package auth

import (
	"fmt"
	"strconv"
	"strings"
	"time"
)

// ParseExpiresIn parses durations like "24h", "7d", and "30d".
// An empty string is not valid; callers that want no expiry should skip this.
func ParseExpiresIn(s string) (time.Duration, error) {
	s = strings.TrimSpace(s)
	if s == "" || strings.EqualFold(s, "never") {
		return 0, fmt.Errorf("expiration is empty")
	}
	if before, ok := strings.CutSuffix(s, "d"); ok {
		n, err := strconv.Atoi(before)
		if err != nil {
			return 0, fmt.Errorf("invalid days: %w", err)
		}
		if n < 0 {
			return 0, fmt.Errorf("expiration must be positive")
		}
		return time.Duration(n) * 24 * time.Hour, nil
	}
	d, err := time.ParseDuration(s)
	if err != nil {
		return 0, err
	}
	if d < 0 {
		return 0, fmt.Errorf("expiration must be positive")
	}
	return d, nil
}
