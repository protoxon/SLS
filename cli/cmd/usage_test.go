package cmd

import (
	"io"
	"strings"
	"testing"

	"github.com/spf13/cobra"
)

func TestUsageErrors(t *testing.T) {
	tests := []struct {
		name string
		args []string
		want string
	}{
		{
			name: "inspect missing",
			args: []string{"inspect"},
			want: `sls: 'sls inspect' requires 1 argument

Usage:  sls inspect [OPTIONS] VOLUME[:TAG]

See 'sls inspect --help' for more information`,
		},
		{
			name: "inspect extra",
			args: []string{"inspect", "vol:tag", "extra"},
			want: `sls: 'sls inspect' requires 1 argument

Usage:  sls inspect [OPTIONS] VOLUME[:TAG]

See 'sls inspect --help' for more information`,
		},
		{
			name: "console missing",
			args: []string{"console"},
			want: `sls: 'sls console' requires at least 2 arguments

Usage:  sls console [OPTIONS] SERVER COMMAND...

See 'sls console --help' for more information`,
		},
		{
			name: "console one arg",
			args: []string{"console", "1"},
			want: `sls: 'sls console' requires at least 2 arguments

Usage:  sls console [OPTIONS] SERVER COMMAND...

See 'sls console --help' for more information`,
		},
		{
			name: "push missing",
			args: []string{"push"},
			want: `sls: 'sls push' requires at least 1 and at most 2 arguments

Usage:  sls push [OPTIONS] VOLUME[:TAG] [PATH]

See 'sls push --help' for more information`,
		},
		{
			name: "login extra",
			args: []string{"login", "https://example", "extra"},
			want: `sls: 'sls login' requires at most 1 argument

Usage:  sls login [OPTIONS] [url]

See 'sls login --help' for more information`,
		},
		{
			name: "server ls extra",
			args: []string{"server", "ls", "extra"},
			want: `sls: 'sls server ls' accepts no arguments

Usage:  sls server ls [OPTIONS]

See 'sls server ls --help' for more information`,
		},
		{
			name: "unknown flag",
			args: []string{"inspect", "--nope"},
			want: `sls: unknown flag: --nope

Usage:  sls inspect [OPTIONS] VOLUME[:TAG]

See 'sls inspect --help' for more information`,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			err := execRoot(t, tt.args)
			if err == nil {
				t.Fatal("expected error")
			}
			if err.Error() != tt.want {
				t.Fatalf("got:\n%s\nwant:\n%s", err.Error(), tt.want)
			}
		})
	}
}

func TestUnknownCommandUsage(t *testing.T) {
	err := execRoot(t, []string{"inspct"})
	if err == nil {
		t.Fatal("expected error")
	}
	msg, ok := cliUsageMessage(rootCmd, err)
	if !ok {
		t.Fatalf("not a usage error: %v", err)
	}
	if !strings.Contains(msg, "sls: unknown command \"inspct\" for \"sls\"") {
		t.Fatalf("message:\n%s", msg)
	}
	if !strings.Contains(msg, "Usage:  sls [OPTIONS] COMMAND") {
		t.Fatalf("message:\n%s", msg)
	}
	if !strings.Contains(msg, "See 'sls --help' for more information") {
		t.Fatalf("message:\n%s", msg)
	}
	if !strings.Contains(msg, "inspect") {
		t.Fatalf("expected a suggestion:\n%s", msg)
	}
}

func TestArgValidatorsAcceptValidCounts(t *testing.T) {
	cmd := &cobra.Command{Use: "inspect VOLUME", RunE: func(*cobra.Command, []string) error { return nil }}
	if err := exactArgs(1)(cmd, []string{"vol"}); err != nil {
		t.Fatal(err)
	}
	if err := minimumNArgs(2)(cmd, []string{"a", "b", "c"}); err != nil {
		t.Fatal(err)
	}
	if err := maximumNArgs(1)(cmd, []string{"a"}); err != nil {
		t.Fatal(err)
	}
	if err := maximumNArgs(1)(cmd, nil); err != nil {
		t.Fatal(err)
	}
	if err := rangeArgs(1, 2)(cmd, []string{"a"}); err != nil {
		t.Fatal(err)
	}
	if err := noArgs(cmd, nil); err != nil {
		t.Fatal(err)
	}
}

func execRoot(t *testing.T, args []string) error {
	t.Helper()
	rootCmd.SetArgs(args)
	rootCmd.SetOut(io.Discard)
	rootCmd.SetErr(io.Discard)
	t.Cleanup(func() {
		rootCmd.SetArgs(nil)
		rootCmd.SetOut(nil)
		rootCmd.SetErr(nil)
	})
	return rootCmd.Execute()
}

func TestUsageLineInsertsOptions(t *testing.T) {
	parent := &cobra.Command{Use: "sls"}
	child := &cobra.Command{Use: "inspect VOLUME[:TAG]"}
	child.Flags().Bool("json", false, "json")
	parent.AddCommand(child)
	got := usageLine(child)
	want := "sls inspect [OPTIONS] VOLUME[:TAG]"
	if got != want {
		t.Fatalf("got %q want %q", got, want)
	}
}
