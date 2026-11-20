package snapshot

import "emperror.dev/errors"

// Expand returns snapshots in mount order, highest precedence first.
// requested is the caller's list. Each snapshot's Requires are appended
// after it when they are not already in the result.
func Expand(requested []string, load func(id string) (Config, error)) ([]Config, error) {
	seen := map[string]struct{}{}
	var out []Config
	var walk func(id string) error
	walk = func(id string) error {
		if id == "" {
			return errors.New("snapshot id is empty")
		}
		if _, ok := seen[id]; ok {
			return nil
		}
		seen[id] = struct{}{}
		cfg, err := load(id)
		if err != nil {
			return err
		}
		if cfg.ID == "" {
			cfg.ID = id
		}
		out = append(out, cfg)
		for _, dep := range cfg.Requires {
			if err := walk(dep); err != nil {
				return err
			}
		}
		return nil
	}
	for _, id := range requested {
		if err := walk(id); err != nil {
			return nil, err
		}
	}
	return out, nil
}
