package cmd

import (
	"errors"
	"fmt"
	"strings"

	"github.com/spf13/cobra"
	"github.com/spf13/pflag"
)

// usageError is a bad invocation: wrong arguments, an unknown flag, or an
// unknown command. Its message is the full Docker-style usage text.
type usageError struct {
	msg string
}

func (e *usageError) Error() string { return e.msg }

func exactArgs(n int) cobra.PositionalArgs {
	return func(cmd *cobra.Command, args []string) error {
		if len(args) == n {
			return nil
		}
		return usageErrorf(cmd, "'%s' requires %d %s", cmd.CommandPath(), n, plural(n, "argument"))
	}
}

func minimumNArgs(n int) cobra.PositionalArgs {
	return func(cmd *cobra.Command, args []string) error {
		if len(args) >= n {
			return nil
		}
		return usageErrorf(cmd, "'%s' requires at least %d %s", cmd.CommandPath(), n, plural(n, "argument"))
	}
}

func maximumNArgs(n int) cobra.PositionalArgs {
	return func(cmd *cobra.Command, args []string) error {
		if len(args) <= n {
			return nil
		}
		return usageErrorf(cmd, "'%s' requires at most %d %s", cmd.CommandPath(), n, plural(n, "argument"))
	}
}

func rangeArgs(min, max int) cobra.PositionalArgs {
	return func(cmd *cobra.Command, args []string) error {
		if len(args) >= min && len(args) <= max {
			return nil
		}
		return usageErrorf(cmd, "'%s' requires at least %d and at most %d %s", cmd.CommandPath(), min, max, plural(max, "argument"))
	}
}

func noArgs(cmd *cobra.Command, args []string) error {
	if len(args) == 0 {
		return nil
	}
	if cmd.HasSubCommands() {
		return usageErrorf(cmd, "unknown command: %s %s", cmd.CommandPath(), args[0])
	}
	return usageErrorf(cmd, "'%s' accepts no arguments", cmd.CommandPath())
}

func flagError(cmd *cobra.Command, err error) error {
	if err == nil || err == pflag.ErrHelp {
		return err
	}
	return usageErrorf(cmd, "%s", err)
}

func usageErrorf(cmd *cobra.Command, format string, args ...any) error {
	reason := fmt.Sprintf(format, args...)
	msg := fmt.Sprintf("%s: %s\n\nUsage:  %s\n\nSee '%s --help' for more information",
		binName(cmd), reason, usageLine(cmd), cmd.CommandPath())
	return &usageError{msg: msg}
}

// cliUsageMessage returns the text to print for a usage failure.
// Unknown-command errors from cobra are rewritten into the same shape.
func cliUsageMessage(cmd *cobra.Command, err error) (string, bool) {
	var usage *usageError
	if errors.As(err, &usage) {
		return usage.Error(), true
	}
	if cmd == nil || !strings.HasPrefix(err.Error(), "unknown command ") {
		return "", false
	}
	reason := strings.TrimRight(err.Error(), "\n")
	return fmt.Sprintf("%s: %s\n\nUsage:  %s\n\nSee '%s --help' for more information",
		binName(cmd), reason, usageLine(cmd), cmd.CommandPath()), true
}

func binName(cmd *cobra.Command) string {
	return cmd.Root().Name()
}

func plural(n int, word string) string {
	if n == 1 {
		return word
	}
	return word + "s"
}

func usageLine(cmd *cobra.Command) string {
	rest := strings.TrimSpace(cmd.Use)
	if name := cmd.Name(); strings.HasPrefix(rest, name) {
		rest = strings.TrimSpace(rest[len(name):])
	}
	line := cmd.CommandPath()
	if cmd.HasAvailableFlags() {
		line += " [OPTIONS]"
	}
	if rest != "" {
		line += " " + rest
	} else if cmd.HasAvailableSubCommands() {
		line += " COMMAND"
	}
	return line
}
