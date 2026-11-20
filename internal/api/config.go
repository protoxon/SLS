package api

// ConfigFile is a configuration patch applied to one server file.
type ConfigFile struct {
	Parser string                 `yaml:"parser" json:"parser"`
	Find   map[string]interface{} `yaml:"find" json:"find"`
}
