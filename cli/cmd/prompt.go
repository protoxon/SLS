package cmd

import (
	"bufio"
	"fmt"
	"io"
	"os"
	"strings"

	"golang.org/x/term"
)

func promptLine(in io.Reader, out io.Writer, label, def string) (string, error) {
	if def != "" {
		fmt.Fprintf(out, "%s [%s]: ", label, def)
	} else {
		fmt.Fprintf(out, "%s: ", label)
	}
	line, err := readLine(in)
	if err != nil {
		return "", err
	}
	if line == "" {
		return def, nil
	}
	return line, nil
}

func promptSecret(in io.Reader, errOut io.Writer, label string) (string, error) {
	fmt.Fprintf(errOut, "%s: ", label)
	secret, err := readSecret(in)
	if err != nil {
		return "", err
	}
	if f, ok := errOut.(*os.File); ok && term.IsTerminal(int(f.Fd())) {
		fmt.Fprintln(errOut)
	}
	return strings.TrimSpace(secret), nil
}

func readLine(in io.Reader) (string, error) {
	scanner := bufio.NewScanner(in)
	if !scanner.Scan() {
		if err := scanner.Err(); err != nil {
			return "", err
		}
		return "", io.EOF
	}
	return strings.TrimSpace(scanner.Text()), nil
}

func readSecret(in io.Reader) (string, error) {
	if f, ok := in.(*os.File); ok && term.IsTerminal(int(f.Fd())) {
		b, err := term.ReadPassword(int(f.Fd()))
		if err != nil {
			return "", err
		}
		return string(b), nil
	}
	return readLine(in)
}

func canPrompt(in io.Reader, errOut io.Writer) bool {
	return isTerminalReader(in) && isTerminalWriter(errOut)
}

func isTerminalReader(in io.Reader) bool {
	f, ok := in.(*os.File)
	return ok && term.IsTerminal(int(f.Fd()))
}

func isTerminalWriter(out io.Writer) bool {
	f, ok := out.(*os.File)
	return ok && term.IsTerminal(int(f.Fd()))
}
