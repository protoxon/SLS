package token

import (
	"context"
	"fmt"
	"os"
	"strings"

	"github.com/google/uuid"
	"github.com/grokify/coreforge/identity/apikey"
	"gopkg.in/yaml.v3"
	"protoxon.com/sls/controller/auth/scope"
	"protoxon.com/sls/internal/configenv"
)

// PlaceholderToken is the daemon config default before an operator sets a real key.
const PlaceholderToken = "API_KEY"

const localNodeName = "local-node"

// KeyService is the controller API-key surface dev mode needs.
type KeyService interface {
	Validate(ctx context.Context, key string) (*apikey.APIKey, error)
	Create(ctx context.Context, req apikey.CreateKeyRequest) (*apikey.GeneratedKey, error)
}

// RequireConfigured reports whether a production daemon config has a real node token.
// Dev mode mints one instead of calling this.
func RequireConfigured(token string) error {
	token = strings.TrimSpace(token)
	if token == "" || token == PlaceholderToken {
		return fmt.Errorf("daemon remote.token is unset. Create a node token and set remote.token in the daemon config, or run sls run -dev to generate a local one")
	}
	return nil
}

// Ensure returns the daemon's node token, creating and saving one when the
// current value is missing, still the placeholder, or no longer valid.
// The plaintext is stored only in the daemon config. The controller keeps a hash.
func Ensure(ctx context.Context, keys KeyService, path string) (string, error) {
	if keys == nil {
		return "", fmt.Errorf("node token: key service is nil")
	}
	current, err := readToken(path)
	if err != nil {
		return "", err
	}
	if current != "" && current != PlaceholderToken {
		if _, err := keys.Validate(ctx, current); err == nil {
			if err := os.Chmod(path, 0o600); err != nil {
				return "", fmt.Errorf("node token: chmod %s: %w", path, err)
			}
			return current, nil
		}
	}

	org := uuid.Nil
	generated, err := keys.Create(ctx, apikey.CreateKeyRequest{
		Name:           localNodeName,
		OwnerID:        uuid.New(),
		OrganizationID: &org,
		Scopes:         []string{scope.Node},
		Description:    "Local node started by sls run -dev",
		Environment:    apikey.EnvLive,
	})
	if err != nil {
		return "", fmt.Errorf("node token: create: %w", err)
	}
	if generated == nil || strings.TrimSpace(generated.Key) == "" {
		return "", fmt.Errorf("node token: create returned an empty key")
	}
	if err := writeToken(path, generated.Key); err != nil {
		return "", err
	}
	return generated.Key, nil
}

func readToken(path string) (string, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return "", fmt.Errorf("node token: read %s: %w", path, err)
	}
	var cfg struct {
		Remote struct {
			Token string `yaml:"token"`
		} `yaml:"remote"`
	}
	if err := configenv.Unmarshal(data, &cfg); err != nil {
		return "", fmt.Errorf("node token: parse %s: %w", path, err)
	}
	return strings.TrimSpace(cfg.Remote.Token), nil
}

func writeToken(path, token string) error {
	data, err := os.ReadFile(path)
	if err != nil {
		return fmt.Errorf("node token: read %s: %w", path, err)
	}
	var doc yaml.Node
	if err := yaml.Unmarshal(data, &doc); err != nil {
		return fmt.Errorf("node token: parse %s: %w", path, err)
	}
	if doc.Kind != yaml.DocumentNode || len(doc.Content) == 0 || doc.Content[0].Kind != yaml.MappingNode {
		return fmt.Errorf("node token: %s is not a mapping", path)
	}
	root := doc.Content[0]
	remote := mapValue(root, "remote")
	if remote == nil {
		remote = &yaml.Node{Kind: yaml.MappingNode}
		root.Content = append(root.Content,
			&yaml.Node{Kind: yaml.ScalarNode, Tag: "!!str", Value: "remote"},
			remote,
		)
	}
	if remote.Kind != yaml.MappingNode {
		return fmt.Errorf("node token: remote in %s is not a mapping", path)
	}
	setMapScalar(remote, "token", token)
	out, err := yaml.Marshal(&doc)
	if err != nil {
		return fmt.Errorf("node token: encode %s: %w", path, err)
	}
	if err := os.WriteFile(path, out, 0o600); err != nil {
		return fmt.Errorf("node token: write %s: %w", path, err)
	}
	if err := os.Chmod(path, 0o600); err != nil {
		return fmt.Errorf("node token: chmod %s: %w", path, err)
	}
	return nil
}

func mapValue(mapping *yaml.Node, key string) *yaml.Node {
	for i := 0; i < len(mapping.Content)-1; i += 2 {
		if mapping.Content[i].Value == key {
			return mapping.Content[i+1]
		}
	}
	return nil
}

func setMapScalar(mapping *yaml.Node, key, value string) {
	for i := 0; i < len(mapping.Content)-1; i += 2 {
		if mapping.Content[i].Value == key {
			mapping.Content[i+1].Kind = yaml.ScalarNode
			mapping.Content[i+1].Tag = "!!str"
			mapping.Content[i+1].Value = value
			mapping.Content[i+1].Content = nil
			return
		}
	}
	mapping.Content = append(mapping.Content,
		&yaml.Node{Kind: yaml.ScalarNode, Tag: "!!str", Value: key},
		&yaml.Node{Kind: yaml.ScalarNode, Tag: "!!str", Value: value},
	)
}
