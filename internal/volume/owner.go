package volume

import (
	"os"
	"path/filepath"
	"slices"

	"emperror.dev/errors"
)

// Owner is a uid/gid applied to dest trees and CAS objects during unpack.
type Owner struct {
	Uid int
	Gid int
}

func mkdirAllOwned(path string, owner *Owner) error {
	if path == "" || path == "." {
		return nil
	}
	path = filepath.Clean(path)
	var missing []string
	for p := path; ; {
		_, err := os.Lstat(p)
		if err == nil {
			break
		}
		if !os.IsNotExist(err) {
			return err
		}
		missing = append(missing, p)
		next := filepath.Dir(p)
		if next == p {
			break
		}
		p = next
	}
	for _, m := range slices.Backward(missing) {
		if err := os.Mkdir(m, 0o755); err != nil && !os.IsExist(err) {
			return err
		}
		if err := chownPath(m, owner); err != nil {
			return err
		}
	}
	return nil
}

func chownPath(path string, owner *Owner) error {
	if owner == nil || path == "" {
		return nil
	}
	if err := os.Chown(path, owner.Uid, owner.Gid); err != nil {
		return errors.Wrapf(err, "failed to chown %s", path)
	}
	return nil
}
