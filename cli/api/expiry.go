package api

import (
	"fmt"
	"strconv"
	"strings"
	"time"
)

func ParseExpiresIn(s string) (time.Duration, error) {
	s = strings.TrimSpace(s)
	if s == "" || strings.EqualFold(s, "never") {
		return 0, fmt.Errorf("expiration is empty")
	}
	if strings.HasSuffix(s, "d") {
		n, err := strconv.Atoi(strings.TrimSuffix(s, "d"))
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
