package cmd

import (
	"fmt"
	"strings"
	"time"

	"github.com/spf13/cobra"
	"protoxon.com/api"
)

var (
	tokenNoInteractive bool
	tokenName          string
	tokenDescription   string
	tokenScopes        string
	tokenExpires       string
	tokenReason        string
)

var tokenCmd = &cobra.Command{
	Use:   "token",
	Short: "Manage Protocube access tokens",
}

var tokenCreateCmd = &cobra.Command{
	Use:           "create",
	Short:         "Create a token",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runTokenCreate,
}

var tokenListCmd = &cobra.Command{
	Use:           "list",
	Short:         "List tokens",
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runTokenList,
}

var tokenShowCmd = &cobra.Command{
	Use:           "show <id>",
	Short:         "Show a token",
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runTokenShow,
}

var tokenRevokeCmd = &cobra.Command{
	Use:           "revoke <id>",
	Short:         "Revoke a token",
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runTokenRevoke,
}

var tokenDeleteCmd = &cobra.Command{
	Use:           "delete <id>",
	Short:         "Delete a token",
	Args:          exactArgs(1),
	SilenceUsage:  true,
	SilenceErrors: true,
	RunE:          runTokenDelete,
}

func init() {
	addAPIFlags(tokenCmd)

	tokenCreateCmd.Flags().StringVar(&tokenName, "name", "", "token name")
	tokenCreateCmd.Flags().StringVar(&tokenDescription, "description", "", "token description")
	tokenCreateCmd.Flags().StringVar(&tokenScopes, "scopes", "", "comma-separated scopes")
	tokenCreateCmd.Flags().StringVar(&tokenExpires, "expires", "", "expiration duration (24h, 7d, 30d) or never")
	tokenCreateCmd.Flags().BoolVar(&tokenNoInteractive, "no-interactive", false, "disable prompts and use flags")

	tokenRevokeCmd.Flags().StringVar(&tokenReason, "reason", "", "revocation reason")

	tokenCmd.AddCommand(tokenCreateCmd, tokenListCmd, tokenShowCmd, tokenRevokeCmd, tokenDeleteCmd)
	rootCmd.AddCommand(tokenCmd)
}

func runTokenCreate(cmd *cobra.Command, _ []string) error {
	client, err := apiClient()
	if err != nil {
		return err
	}
	info, err := client.Auth(cmdCtx(cmd))
	if err != nil {
		return err
	}

	name := tokenName
	description := tokenDescription
	expires := tokenExpires
	scopes := parseScopeList(tokenScopes)

	interactive := !tokenNoInteractive && canPrompt(cmd.InOrStdin(), cmd.ErrOrStderr())
	if interactive {
		if name, err = promptLine(cmd.InOrStdin(), cmd.ErrOrStderr(), "Name", name); err != nil {
			return err
		}
		if description, err = promptLine(cmd.InOrStdin(), cmd.ErrOrStderr(), "Description", description); err != nil {
			return err
		}
		if expires, err = promptLine(cmd.InOrStdin(), cmd.ErrOrStderr(), "Expires (never, 7d, 30d, 24h)", defaultString(expires, "never")); err != nil {
			return err
		}
		if len(scopes) == 0 {
			scopes, err = selectScopes(info.Grantable, cmd.InOrStdin(), cmd.ErrOrStderr())
			if err != nil {
				return err
			}
		}
	}
	if name == "" {
		return fmt.Errorf("name is required")
	}
	if len(scopes) == 0 {
		return fmt.Errorf("scopes are required")
	}

	created, err := client.CreateToken(cmdCtx(cmd), api.CreateTokenRequest{
		Name:        name,
		Description: description,
		Scopes:      scopes,
		ExpiresIn:   normalizeExpires(expires),
	})
	if err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Token: %s\n", created.TokenValue)
	fmt.Fprintf(cmd.OutOrStdout(), "ID:    %s\n", created.ID)
	fmt.Fprintf(cmd.OutOrStdout(), "Name:  %s\n", created.Name)
	return nil
}

func runTokenList(cmd *cobra.Command, _ []string) error {
	client, err := apiClient()
	if err != nil {
		return err
	}
	tokens, err := client.ListTokens(cmdCtx(cmd))
	if err != nil {
		return err
	}
	if len(tokens) == 0 {
		fmt.Fprintln(cmd.OutOrStdout(), "No tokens found.")
		return nil
	}
	fmt.Fprintln(cmd.OutOrStdout(), writeTokenTable(tokens))
	return nil
}

func runTokenShow(cmd *cobra.Command, args []string) error {
	client, err := apiClient()
	if err != nil {
		return err
	}
	tok, err := client.GetToken(cmdCtx(cmd), args[0])
	if err != nil {
		return err
	}
	fmt.Fprint(cmd.OutOrStdout(), formatToken(tok))
	return nil
}

func runTokenRevoke(cmd *cobra.Command, args []string) error {
	client, err := apiClient()
	if err != nil {
		return err
	}
	tok, err := client.RevokeToken(cmdCtx(cmd), args[0], tokenReason)
	if err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Revoked %s\n", tok.ID)
	return nil
}

func runTokenDelete(cmd *cobra.Command, args []string) error {
	client, err := apiClient()
	if err != nil {
		return err
	}
	if err := client.DeleteToken(cmdCtx(cmd), args[0]); err != nil {
		return err
	}
	fmt.Fprintf(cmd.OutOrStdout(), "Deleted %s\n", args[0])
	return nil
}

func writeTokenTable(tokens []api.Token) string {
	idW, nameW, prefixW, scopeW, expW := len("ID"), len("Name"), len("Prefix"), len("Scopes"), len("Expires")
	rows := make([][]string, 0, len(tokens))
	for _, tok := range tokens {
		name := tok.Name
		if len(name) > 36 {
			name = name[:34] + ".."
		}
		scopes := strings.Join(tok.Scopes, ",")
		exp := "never"
		if tok.ExpiresAt != nil {
			exp = tok.ExpiresAt.Local().Format("2006-01-02 15:04")
		}
		if tok.Revoked {
			exp += " revoked"
		}
		row := []string{tok.ID, name, tok.Prefix, scopes, exp}
		rows = append(rows, row)
		idW = max(idW, len(row[0]))
		nameW = max(nameW, len(row[1]))
		prefixW = max(prefixW, len(row[2]))
		scopeW = max(scopeW, len(row[3]))
		expW = max(expW, len(row[4]))
	}
	var b strings.Builder
	fmt.Fprintf(&b, "%-*s   %-*s   %-*s   %-*s   %-*s\n", idW, "ID", nameW, "Name", prefixW, "Prefix", scopeW, "Scopes", expW, "Expires")
	for _, row := range rows {
		fmt.Fprintf(&b, "%-*s   %-*s   %-*s   %-*s   %-*s\n", idW, row[0], nameW, row[1], prefixW, row[2], scopeW, row[3], expW, row[4])
	}
	return b.String()
}

func formatToken(tok api.Token) string {
	var b strings.Builder
	fmt.Fprintf(&b, "ID:          %s\n", tok.ID)
	fmt.Fprintf(&b, "Name:        %s\n", tok.Name)
	fmt.Fprintf(&b, "Prefix:      %s\n", tok.Prefix)
	fmt.Fprintf(&b, "Scopes:      %s\n", strings.Join(tok.Scopes, ", "))
	fmt.Fprintf(&b, "Description: %s\n", tok.Description)
	fmt.Fprintf(&b, "Revoked:     %t\n", tok.Revoked)
	if tok.ExpiresAt != nil {
		fmt.Fprintf(&b, "Expires:     %s\n", tok.ExpiresAt.Local().Format(time.RFC3339))
	} else {
		fmt.Fprintln(&b, "Expires:     never")
	}
	if tok.LastUsedAt != nil {
		fmt.Fprintf(&b, "Last used:   %s\n", tok.LastUsedAt.Local().Format(time.RFC3339))
	}
	fmt.Fprintf(&b, "Created:     %s\n", tok.CreatedAt.Local().Format(time.RFC3339))
	return b.String()
}
