package cmd

import (
	"errors"
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"protoxon.com/api"
	"protoxon.com/print"
)

// errMultipleMatches means the matches were printed and the command should stop without failing.
var errMultipleMatches = errors.New("multiple servers matched")

const serverIDCharset = "0123456789abcdefhkmnorsuvwxz"
const serverIDLength = 12

func withServer(cmd *cobra.Command, query string, fn func(*api.Client, *print.Printer, api.Server) error) error {
	return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
		server, err := resolveServer(cmd, c, p, query)
		if errors.Is(err, errMultipleMatches) {
			return nil
		}
		if err != nil {
			return err
		}
		return fn(c, p, server)
	})
}

// withEachServer runs fn for every match. Up to 10 matches each get that command's own output.
// More than 10 prints the server list instead.
func withEachServer(cmd *cobra.Command, query string, fn func(*api.Client, *print.Printer, api.Server) error) error {
	return withAPI(cmd, func(c *api.Client, p *print.Printer) error {
		return showEach(cmd, c, p, query, fn)
	})
}

func showEach(cmd *cobra.Command, c *api.Client, p *print.Printer, query string, fn func(*api.Client, *print.Printer, api.Server) error) error {
	matches, err := findServers(cmd, c, query)
	if err != nil {
		return err
	}
	if len(matches) == 1 {
		return fn(c, p, matches[0])
	}
	if len(matches) > 10 {
		return writeMatchSummary(cmd, p, matches)
	}
	for i, server := range matches {
		if i > 0 {
			if _, err := fmt.Fprintln(cmd.OutOrStdout()); err != nil {
				return err
			}
		}
		if outputFormat == "" || outputFormat == "table" {
			if _, err := fmt.Fprintf(cmd.OutOrStdout(), "%s  %s\n", server.ID, server.BlueprintID); err != nil {
				return err
			}
		}
		if err := fn(c, p, server); err != nil {
			return err
		}
	}
	return writeMatchCount(cmd, len(matches))
}

// resolveServer finds one server by full id, blueprint id, id prefix, or composite id.
// A composite id is the blueprint id, a dot, and the server id or a prefix of it
// (chunk_runner.499x92z8o8sk or chunk_runner.499).
// A full id is loaded directly. The server list is used only for other queries,
// or when a full id is not found and might be a blueprint id.
func resolveServer(cmd *cobra.Command, c *api.Client, p *print.Printer, query string) (api.Server, error) {
	matches, err := findServers(cmd, c, query)
	if err != nil {
		return api.Server{}, err
	}
	if len(matches) == 1 {
		return matches[0], nil
	}
	if err := writeMatchSummary(cmd, p, matches); err != nil {
		return api.Server{}, err
	}
	return api.Server{}, errMultipleMatches
}

func findServers(cmd *cobra.Command, c *api.Client, query string) ([]api.Server, error) {
	query = strings.TrimSpace(query)
	if query == "" {
		return nil, fmt.Errorf("server is required")
	}
	if blueprint, idPart, ok := splitComposite(query); ok && fullServerID(idPart) {
		server, err := c.GetServer(cmdCtx(cmd), idPart)
		if err == nil {
			if server.BlueprintID == blueprint {
				return []api.Server{server}, nil
			}
			return nil, fmt.Errorf("no server matching %q", query)
		}
		if !api.IsNotFound(err) {
			return nil, err
		}
		return nil, fmt.Errorf("no server matching %q", query)
	}
	if fullServerID(query) {
		server, err := c.GetServer(cmdCtx(cmd), query)
		if err == nil {
			return []api.Server{server}, nil
		}
		if !api.IsNotFound(err) {
			return nil, err
		}
	}
	servers, err := c.ListServers(cmdCtx(cmd))
	if err != nil {
		return nil, err
	}
	matches := matchServers(servers, query)
	if len(matches) == 0 {
		return nil, fmt.Errorf("no server matching %q", query)
	}
	return matches, nil
}

func writeMatchSummary(cmd *cobra.Command, p *print.Printer, matches []api.Server) error {
	if err := p.Write(matches, serverTable(matches)); err != nil {
		return err
	}
	return writeMatchCount(cmd, len(matches))
}

func writeMatchCount(cmd *cobra.Command, n int) error {
	if outputFormat != "" && outputFormat != "table" {
		return nil
	}
	_, err := fmt.Fprintf(cmd.OutOrStdout(), "\n%d servers matched\n", n)
	return err
}

func fullServerID(query string) bool {
	if len(query) != serverIDLength {
		return false
	}
	for _, r := range query {
		if !strings.ContainsRune(serverIDCharset, r) {
			return false
		}
	}
	return true
}

func splitComposite(query string) (blueprint, idPart string, ok bool) {
	dot := strings.LastIndex(query, ".")
	if dot <= 0 || dot == len(query)-1 {
		return "", "", false
	}
	idPart = query[dot+1:]
	if !serverIDPrefix(idPart) {
		return "", "", false
	}
	return query[:dot], idPart, true
}

func serverIDPrefix(s string) bool {
	if s == "" || len(s) > serverIDLength {
		return false
	}
	for _, r := range s {
		if !strings.ContainsRune(serverIDCharset, r) {
			return false
		}
	}
	return true
}

func matchComposite(servers []api.Server, blueprint, idPart string) []api.Server {
	var exact, prefix []api.Server
	for _, server := range servers {
		if server.BlueprintID != blueprint {
			continue
		}
		switch {
		case server.ID == idPart:
			exact = append(exact, server)
		case strings.HasPrefix(server.ID, idPart):
			prefix = append(prefix, server)
		}
	}
	if len(exact) > 0 {
		return exact
	}
	return prefix
}

func matchServers(servers []api.Server, query string) []api.Server {
	if blueprint, idPart, ok := splitComposite(query); ok {
		return matchComposite(servers, blueprint, idPart)
	}
	var exactID, blueprint, prefix []api.Server
	for _, server := range servers {
		switch {
		case server.ID == query:
			exactID = append(exactID, server)
		case server.BlueprintID == query:
			blueprint = append(blueprint, server)
		case strings.HasPrefix(server.ID, query):
			prefix = append(prefix, server)
		}
	}
	if len(exactID) > 0 {
		return exactID
	}
	if len(blueprint) > 0 {
		return blueprint
	}
	return prefix
}
