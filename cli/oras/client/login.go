package client

import (
	"context"
	"io"
	"os"
	"strings"

	"emperror.dev/errors"
	"golang.org/x/term"
	"oras.land/oras-go/v2/registry/remote"
	"oras.land/oras-go/v2/registry/remote/auth"
	"oras.land/oras-go/v2/registry/remote/credentials"
)

var (
	errUsernameRequired = errors.New("username is required")
	errPasswordRequired = errors.New("password is required")
	errPasswordConflict = errors.New("only one of --password and --password-stdin can be used")
)

// NormalizeRegistry turns a user-supplied registry into a host[:port].
func NormalizeRegistry(registry string) string {
	registry = strings.TrimSpace(registry)
	registry = strings.TrimPrefix(registry, "https://")
	registry = strings.TrimPrefix(registry, "http://")
	registry = strings.TrimRight(registry, "/")
	switch registry {
	case "index.docker.io", "registry-1.docker.io":
		return dockerHub
	default:
		return registry
	}
}

// Login validates cred against registry and writes it to the SLS credential file.
func Login(ctx context.Context, registry string, cred auth.Credential, opts Options) error {
	store, err := openPrimaryStore()
	if err != nil {
		return err
	}
	return loginRegistry(ctx, store, registry, cred, opts.PlainHTTP)
}

func loginRegistry(ctx context.Context, store credentials.Store, registry string, cred auth.Credential, plainHTTP bool) error {
	registry = NormalizeRegistry(registry)
	if !plainHTTP && usePlainHTTPFromConfig(registry) {
		plainHTTP = true
	}
	reg, err := remote.NewRegistry(registry)
	if err != nil {
		return errors.Wrap(err, "failed to create registry client")
	}
	reg.PlainHTTP = plainHTTP
	if err := credentials.Login(ctx, store, reg, cred); err != nil {
		return err
	}
	return nil
}

// ReadCredential builds a credential from flags or an interactive prompt.
func ReadCredential(username, password string, passwordStdin bool, in io.Reader, errOut io.Writer) (auth.Credential, error) {
	if password != "" && passwordStdin {
		return auth.EmptyCredential, errPasswordConflict
	}
	if passwordStdin {
		body, err := io.ReadAll(in)
		if err != nil {
			return auth.EmptyCredential, err
		}
		password = strings.TrimRight(string(body), "\r\n")
		if password == "" {
			return auth.EmptyCredential, errPasswordRequired
		}
		return credentialFromUserPass(username, password), nil
	}
	if username == "" {
		if !canPromptReader(in, errOut) {
			if password != "" {
				return credentialFromUserPass("", password), nil
			}
			return auth.EmptyCredential, errUsernameRequired
		}
		if _, err := io.WriteString(errOut, "Username: "); err != nil {
			return auth.EmptyCredential, err
		}
		var err error
		username, err = readLine(in)
		if err != nil {
			return auth.EmptyCredential, err
		}
		if username == "" {
			return auth.EmptyCredential, errUsernameRequired
		}
	}
	if password == "" {
		if !canPromptReader(in, errOut) {
			return auth.EmptyCredential, errPasswordRequired
		}
		if _, err := io.WriteString(errOut, "Password: "); err != nil {
			return auth.EmptyCredential, err
		}
		var err error
		password, err = readSecret(in)
		if err != nil {
			return auth.EmptyCredential, err
		}
		if password == "" {
			return auth.EmptyCredential, errPasswordRequired
		}
	}
	return credentialFromUserPass(username, password), nil
}

func canPromptReader(in io.Reader, errOut io.Writer) bool {
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
