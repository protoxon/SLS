// Package configenv decodes YAML config files with ${NAME} environment
// variable references expanded.
package configenv

import (
	"fmt"
	"os"
	"regexp"
	"strings"

	"gopkg.in/yaml.v3"
)

// reference matches ${NAME} or the escape $${, which yields a literal ${.
// A bare $ is left alone so values such as passwords may contain it.
var reference = regexp.MustCompile(`\$\$\{|\$\{([A-Za-z_][A-Za-z0-9_]*)\}`)

// Unmarshal decodes data into out after expanding ${NAME} in scalar values.
// Expansion runs on the parsed document, so a variable can only replace a
// value. It cannot add keys or change structure, and comments and keys are
// not expanded. An unset variable is an error. A variable set to "" is not.
func Unmarshal(data []byte, out any) error {
	var doc yaml.Node
	if err := yaml.Unmarshal(data, &doc); err != nil {
		return err
	}
	if len(doc.Content) == 0 {
		return nil
	}
	var missing []string
	expandNode(&doc, &missing)
	if len(missing) > 0 {
		return fmt.Errorf("config: environment variables are not set: %s", strings.Join(missing, ", "))
	}
	return doc.Decode(out)
}

func expandNode(n *yaml.Node, missing *[]string) {
	switch n.Kind {
	case yaml.DocumentNode, yaml.SequenceNode:
		for _, c := range n.Content {
			expandNode(c, missing)
		}
	case yaml.MappingNode:
		for i := 1; i < len(n.Content); i += 2 {
			expandNode(n.Content[i], missing)
		}
	case yaml.ScalarNode:
		expandScalar(n, missing)
	}
	// Alias nodes point at their anchor, which is expanded where it is defined.
}

func expandScalar(n *yaml.Node, missing *[]string) {
	if !strings.Contains(n.Value, "${") {
		return
	}
	value := reference.ReplaceAllStringFunc(n.Value, func(m string) string {
		if m == "$${" {
			return "${"
		}
		name := m[2 : len(m)-1]
		v, ok := os.LookupEnv(name)
		if !ok {
			*missing = append(*missing, fmt.Sprintf("%s (line %d)", name, n.Line))
		}
		return v
	})
	if value == n.Value {
		return
	}
	n.Value = value
	// A plain value is retyped from its expanded text so port: ${PORT} can fill
	// an int. Quoted or tagged values stay strings. A value that expands to
	// null-like text (~, null, or nothing) stays a string so a secret is not
	// dropped.
	if n.Style == 0 {
		n.Tag = ""
		if n.ShortTag() == "!!null" {
			n.Tag = "!!str"
		}
	}
}
