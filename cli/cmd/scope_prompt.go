package cmd

import (
	"fmt"
	"io"
	"strings"

	"github.com/charmbracelet/huh"
	"protoxon.com/api"
)

func selectScopes(grantable []api.ScopeInfo, in io.Reader, out io.Writer) ([]string, error) {
	if len(grantable) == 0 {
		return nil, fmt.Errorf("no scopes can be granted with this token")
	}
	if !canPrompt(in, out) {
		return nil, fmt.Errorf("interactive scope selection requires a TTY; pass --scopes")
	}

	options := make([]huh.Option[string], 0, len(grantable))
	for _, info := range grantable {
		label := fmt.Sprintf("%s  %s — %s", info.Group, info.Scope, info.Description)
		options = append(options, huh.NewOption(label, info.Scope))
	}

	var selected []string
	form := huh.NewForm(
		huh.NewGroup(
			huh.NewMultiSelect[string]().
				Title("Scopes").
				Description("Space to toggle, enter to confirm. A token can only grant these scopes to others if it includes tokens:write.").
				Options(options...).
				Value(&selected).
				Validate(func(v []string) error {
					if len(v) == 0 {
						return fmt.Errorf("select at least one scope")
					}
					return nil
				}),
		),
	)
	if err := form.Run(); err != nil {
		return nil, err
	}
	return selected, nil
}

func parseScopeList(s string) []string {
	if strings.TrimSpace(s) == "" {
		return nil
	}
	parts := strings.Split(s, ",")
	out := make([]string, 0, len(parts))
	for _, p := range parts {
		p = strings.TrimSpace(p)
		if p != "" {
			out = append(out, p)
		}
	}
	return out
}
