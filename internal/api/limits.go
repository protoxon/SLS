package api

// LimitOverrides is a partial resource limit. A nil field means the blueprint
// value is left unchanged. Resolved limits sent to a daemon are Limits.
type LimitOverrides struct {
	MemoryLimit *int64  `yaml:"memory_limit" json:"memory_limit" default:"4096"`
	Swap        *int64  `yaml:"swap" json:"swap" default:"0"`
	IoWeight    *uint16 `yaml:"io_weight" json:"io_weight" default:"500"`
	CpuLimit    *int64  `yaml:"cpu_limit" json:"cpu_limit" default:"0"`
	DiskSpace   *int64  `yaml:"disk_space" json:"disk_space" default:"8192"`
	Threads     *string `yaml:"threads" json:"threads" default:""`
	OOMDisabled *bool   `yaml:"oom_disabled" json:"oom_disabled" default:"true"`
}
