package print

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io"
	"strings"

	"gopkg.in/yaml.v3"
)

// View renders the human-readable form of a value.
type View interface {
	Render(w io.Writer, s *Style) error
}

// Printer writes a value as a table, JSON, or YAML.
type Printer struct {
	w      io.Writer
	output string
	style  *Style
}

// New returns a printer for output (table, json, or yaml).
func New(w io.Writer, output string) (*Printer, error) {
	output = strings.ToLower(strings.TrimSpace(output))
	if output == "" {
		output = "table"
	}
	switch output {
	case "table", "json", "yaml":
	default:
		return nil, fmt.Errorf("unknown output format %q (want table, json, or yaml)", output)
	}
	return &Printer{w: w, output: output, style: newStyle(w)}, nil
}

// Write prints raw as JSON or YAML, or renders human for table output.
func (p *Printer) Write(raw any, human View) error {
	switch p.output {
	case "json":
		return writeJSON(p.w, raw)
	case "yaml":
		return writeYAML(p.w, raw)
	default:
		if human == nil {
			return fmt.Errorf("missing table view")
		}
		return human.Render(p.w, p.style)
	}
}

func writeJSON(w io.Writer, v any) error {
	b, err := json.Marshal(v)
	if err != nil {
		return err
	}
	var buf bytes.Buffer
	if err := json.Indent(&buf, b, "", "  "); err != nil {
		return err
	}
	if err := buf.WriteByte('\n'); err != nil {
		return err
	}
	_, err = w.Write(buf.Bytes())
	return err
}

// writeYAML encodes v with encoding/json first so yaml.v3 keeps json tag names.
func writeYAML(w io.Writer, v any) error {
	b, err := json.Marshal(v)
	if err != nil {
		return err
	}
	var node yaml.Node
	if err := yaml.Unmarshal(b, &node); err != nil {
		return err
	}
	blockStyle(&node)
	enc := yaml.NewEncoder(w)
	enc.SetIndent(2)
	if err := enc.Encode(&node); err != nil {
		_ = enc.Close()
		return err
	}
	return enc.Close()
}

// blockStyle clears flow style copied from the JSON document so mappings
// print as YAML blocks, and prints object keys without JSON quotes.
func blockStyle(n *yaml.Node) {
	if n == nil {
		return
	}
	switch n.Kind {
	case yaml.DocumentNode, yaml.SequenceNode:
		n.Style = 0
		for _, child := range n.Content {
			blockStyle(child)
		}
	case yaml.MappingNode:
		n.Style = 0
		for i := 0; i+1 < len(n.Content); i += 2 {
			n.Content[i].Style = 0
			blockStyle(n.Content[i+1])
		}
	}
}
