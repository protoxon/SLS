package volume

import (
	"os"
	"path/filepath"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
)

const casFileMode os.FileMode = 0o644

// CASPath is the sharded object path for digest under root:
// root/<algo>/<aa>/<bb>/<hex>
func CASPath(root string, d digest.Digest) (string, error) {
	if err := d.Validate(); err != nil {
		return "", errors.Wrap(err, "invalid cas digest")
	}
	hex := d.Encoded()
	if len(hex) < 4 {
		return "", errors.New("cas digest too short")
	}
	return filepath.Join(root, d.Algorithm().String(), hex[:2], hex[2:4], hex), nil
}

func hasCAS(root string, d digest.Digest) bool {
	p, err := CASPath(root, d)
	if err != nil {
		return false
	}
	info, err := os.Lstat(p)
	return err == nil && info.Mode().IsRegular()
}

func casIfExists(root string, d digest.Digest, owner *Owner) (string, bool, error) {
	dest, err := CASPath(root, d)
	if err != nil {
		return "", false, err
	}
	info, err := os.Lstat(dest)
	if err != nil {
		if os.IsNotExist(err) {
			return dest, false, nil
		}
		return "", false, err
	}
	if !info.Mode().IsRegular() {
		return dest, false, nil
	}
	if err := chownPath(dest, owner); err != nil {
		return "", false, err
	}
	return dest, true, nil
}

func createCASTemp(root string) (string, *os.File, error) {
	tmpDir := filepath.Join(root, "tmp")
	if err := os.MkdirAll(tmpDir, 0o755); err != nil {
		return "", nil, errors.Wrap(err, "failed to create cas tmp directory")
	}
	f, err := os.CreateTemp(tmpDir, "cas-")
	if err != nil {
		return "", nil, errors.Wrap(err, "failed to create cas temp file")
	}
	return f.Name(), f, nil
}

func publishCASFile(f *os.File, tmp, dest string, owner *Owner) (string, error) {
	if err := f.Sync(); err != nil {
		f.Close()
		os.Remove(tmp)
		return "", errors.Wrap(err, "failed to sync cas object")
	}
	if err := f.Close(); err != nil {
		os.Remove(tmp)
		return "", err
	}
	if err := os.Chmod(tmp, casFileMode); err != nil {
		os.Remove(tmp)
		return "", err
	}
	if err := os.MkdirAll(filepath.Dir(dest), 0o755); err != nil {
		os.Remove(tmp)
		return "", errors.Wrap(err, "failed to create cas directory")
	}
	if err := os.Rename(tmp, dest); err != nil {
		os.Remove(tmp)
		if info, statErr := os.Lstat(dest); statErr == nil && info.Mode().IsRegular() {
			if err := chownPath(dest, owner); err != nil {
				return "", err
			}
			return dest, nil
		}
		return "", errors.Wrap(err, "failed to publish cas object")
	}
	if err := chownPath(dest, owner); err != nil {
		return "", err
	}
	return dest, nil
}

func storeCAS(root string, d digest.Digest, data []byte, owner *Owner) (string, error) {
	dest, exists, err := casIfExists(root, d, owner)
	if err != nil {
		return "", err
	}
	if exists {
		return dest, nil
	}
	if d != "" && digest.FromBytes(data) != d {
		return "", errors.New("cas payload digest mismatch")
	}
	tmp, f, err := createCASTemp(root)
	if err != nil {
		return "", err
	}
	if _, err := f.Write(data); err != nil {
		f.Close()
		os.Remove(tmp)
		return "", errors.Wrap(err, "failed to write cas object")
	}
	return publishCASFile(f, tmp, dest, owner)
}

func installFromCAS(cas, dest string, file File, copy bool, owner *Owner) error {
	final := filepath.Join(dest, filepath.FromSlash(file.Path))
	if err := mkdirAllOwned(filepath.Dir(final), owner); err != nil {
		return err
	}
	if err := os.RemoveAll(final); err != nil {
		return err
	}
	if copy {
		if err := copyFile(cas, final, casFileMode); err != nil {
			return errors.Wrap(err, "failed to copy cas object into dest")
		}
		if err := chownPath(final, owner); err != nil {
			return err
		}
		return applyMtime(final, file.Mtime)
	}
	if err := os.Link(cas, final); err != nil {
		return errors.Wrap(err, "failed to link cas object into dest")
	}
	return chownPath(final, owner)
}
