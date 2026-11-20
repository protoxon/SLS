package environment

import (
	"emperror.dev/errors"
	"github.com/creasty/defaults"
	"protoxon.com/sls/internal/api"
)

func CopyLimits(orig *Limits) *Limits {
	if orig == nil {
		return nil
	}

	c := &Limits{}

	if orig.MemoryLimit != nil {
		val := *orig.MemoryLimit
		c.MemoryLimit = &val
	}
	if orig.Swap != nil {
		val := *orig.Swap
		c.Swap = &val
	}
	if orig.IoWeight != nil {
		val := *orig.IoWeight
		c.IoWeight = &val
	}
	if orig.CpuLimit != nil {
		val := *orig.CpuLimit
		c.CpuLimit = &val
	}
	if orig.DiskSpace != nil {
		val := *orig.DiskSpace
		c.DiskSpace = &val
	}
	if orig.Threads != nil {
		val := *orig.Threads
		c.Threads = &val
	}
	if orig.OOMDisabled != nil {
		val := *orig.OOMDisabled
		c.OOMDisabled = &val
	}

	return c
}

// MergeLimits merges override into base. Non-nil fields in override replace base.
// If base is nil, it starts as an empty Limits. If override is nil, base is returned unchanged.
func MergeLimits(base *Limits, override *Limits) *Limits {
	if override == nil {
		return base
	}
	if base == nil {
		base = &Limits{}
	}
	if override.MemoryLimit != nil {
		base.MemoryLimit = override.MemoryLimit
	}
	if override.Swap != nil {
		base.Swap = override.Swap
	}
	if override.IoWeight != nil {
		base.IoWeight = override.IoWeight
	}
	if override.CpuLimit != nil {
		base.CpuLimit = override.CpuLimit
	}
	if override.DiskSpace != nil {
		base.DiskSpace = override.DiskSpace
	}
	if override.Threads != nil {
		base.Threads = override.Threads
	}
	if override.OOMDisabled != nil {
		base.OOMDisabled = override.OOMDisabled
	}

	return base
}

// ResolveLimits fills nil override fields from their defaults and returns the
// concrete limits the daemon runs. A nil OOMDisabled stays true.
func ResolveLimits(in *Limits) (api.Limits, error) {
	copied := CopyLimits(in)
	if copied == nil {
		copied = &Limits{}
	}
	if err := ValidateLimits(copied); err != nil {
		return api.Limits{}, err
	}
	oom := true
	if copied.OOMDisabled != nil {
		oom = *copied.OOMDisabled
	}
	return api.Limits{
		MemoryLimit: derefInt64(copied.MemoryLimit),
		Swap:        derefInt64(copied.Swap),
		IoWeight:    derefUint16(copied.IoWeight),
		CpuLimit:    derefInt64(copied.CpuLimit),
		DiskSpace:   derefInt64(copied.DiskSpace),
		Threads:     derefString(copied.Threads),
		OOMDisabled: oom,
	}, nil
}

// LimitOverridesFrom maps resolved limits back to the public admin API shape.
func LimitOverridesFrom(in api.Limits) *Limits {
	mem := in.MemoryLimit
	swap := in.Swap
	io := in.IoWeight
	cpu := in.CpuLimit
	disk := in.DiskSpace
	threads := in.Threads
	oom := in.OOMDisabled
	return &Limits{
		MemoryLimit: &mem,
		Swap:        &swap,
		IoWeight:    &io,
		CpuLimit:    &cpu,
		DiskSpace:   &disk,
		Threads:     &threads,
		OOMDisabled: &oom,
	}
}

func derefInt64(v *int64) int64 {
	if v == nil {
		return 0
	}
	return *v
}

func derefUint16(v *uint16) uint16 {
	if v == nil {
		return 0
	}
	return *v
}

func derefString(v *string) string {
	if v == nil {
		return ""
	}
	return *v
}

// ValidateLimits validates limits and sets defaults for nil fields.
func ValidateLimits(limit *Limits) error {
	if err := defaults.Set(limit); err != nil {
		return err
	}

	if limit.IoWeight != nil && *limit.IoWeight != 0 && (*limit.IoWeight < 10 || *limit.IoWeight > 1000) {
		return errors.New("io_weight must be 0 or between 10 and 1000")
	}

	return nil
}
