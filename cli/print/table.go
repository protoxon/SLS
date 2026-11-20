package print

import (
	"fmt"
	"io"
	"strings"

	"github.com/charmbracelet/lipgloss"
	"github.com/charmbracelet/lipgloss/table"
)

// Column is one table column. Status columns are colored by server state.
type Column struct {
	Header string
	Status bool
}

// Table is a list rendered as aligned columns.
type Table struct {
	Columns []Column
	Rows    [][]string
}

// Fields is one object rendered as aligned key/value rows.
type Fields struct {
	Items []Field
}

// Field is one key/value row. Status values are colored by server state.
type Field struct {
	Key    string
	Value  string
	Status bool
}

// Lines prints each string on its own line.
type Lines struct {
	Text []string
}

// AsYAML renders v as YAML. Use it for documents that are not a flat object.
func AsYAML(v any) View {
	return yamlView{v: v}
}

type yamlView struct {
	v any
}

func (v yamlView) Render(w io.Writer, _ *Style) error {
	return writeYAML(w, v.v)
}

func (t Table) Render(w io.Writer, s *Style) error {
	headers := make([]string, len(t.Columns))
	statusCol := map[int]bool{}
	for i, col := range t.Columns {
		headers[i] = col.Header
		if col.Status {
			statusCol[i] = true
		}
	}
	rows := make([][]string, len(t.Rows))
	for i, row := range t.Rows {
		rows[i] = padRow(row, len(headers))
	}
	cols := len(headers)
	tbl := table.New().
		Border(lipgloss.HiddenBorder()).
		BorderTop(false).
		BorderBottom(false).
		BorderLeft(false).
		BorderRight(false).
		BorderHeader(false).
		BorderColumn(false).
		BorderRow(false).
		Wrap(false).
		Headers(headers...).
		Rows(rows...).
		StyleFunc(func(row, col int) lipgloss.Style {
			st := s.plain
			switch {
			case row == table.HeaderRow:
				st = s.header
			case statusCol[col] && row >= 0 && row < len(rows) && col < len(rows[row]):
				st = s.status(rows[row][col])
			}
			if cols > 0 && col < cols-1 {
				st = st.PaddingRight(2)
			}
			return st
		})
	out := tbl.String()
	if out != "" && !strings.HasSuffix(out, "\n") {
		out += "\n"
	}
	_, err := io.WriteString(w, out)
	return err
}

func padRow(row []string, n int) []string {
	if len(row) >= n {
		return row
	}
	out := make([]string, n)
	copy(out, row)
	return out
}

func (f Fields) Render(w io.Writer, s *Style) error {
	width := 0
	for _, item := range f.Items {
		if n := len(item.Key); n > width {
			width = n
		}
	}
	for _, item := range f.Items {
		key := s.key.Render(fmt.Sprintf("%-*s", width, item.Key))
		val := item.Value
		if item.Status {
			val = s.status(item.Value).Render(item.Value)
		}
		if _, err := fmt.Fprintf(w, "%s  %s\n", key, val); err != nil {
			return err
		}
	}
	return nil
}

func (l Lines) Render(w io.Writer, _ *Style) error {
	for _, line := range l.Text {
		if _, err := fmt.Fprintln(w, line); err != nil {
			return err
		}
	}
	return nil
}
