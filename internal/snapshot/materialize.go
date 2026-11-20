package snapshot

import (
	"context"
	"encoding/json"
	"os"
	"path/filepath"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"golang.org/x/sys/unix"
	"oras.land/oras-go/v2/content"
	"protoxon.com/sls/internal/volume"
)

const manifestName = "manifest.json"

// Materialize unpacks desc into root. Each target becomes root/<name>, which
// is the directory mounted as an overlay lowerdir. SkipSidecar is forced so
// the lowerdir does not contain a .sls directory.
func Materialize(ctx context.Context, src content.Fetcher, desc ocispec.Descriptor, root string, opts volume.UnpackOptions) (Config, error) {
	cfg, err := Fetch(ctx, src, desc)
	if err != nil {
		return Config{}, err
	}
	cfg.Digest = desc.Digest.String()
	if err := applyConfig(ctx, src, desc.Digest, root, cfg, opts); err != nil {
		return Config{}, err
	}
	return cfg, nil
}

// WriteLocal writes cfg and applies its non-regular entries under root.
// Regular files are already in the target directories. The origin node uses
// this after capture and pack so later starts do not pull the snapshot back.
func WriteLocal(root string, cfg Config, owner *volume.Owner) error {
	if err := os.MkdirAll(root, 0o755); err != nil {
		return err
	}
	if err := lchownPath(root, owner); err != nil {
		return err
	}
	for _, target := range cfg.Targets {
		dir := targetDir(root, target.Name)
		if err := applySpecial(dir, target, owner); err != nil {
			return err
		}
	}
	return writeManifest(root, cfg)
}

// ReadLocal loads the manifest written beside the target directories.
func ReadLocal(root string) (Config, error) {
	b, err := os.ReadFile(filepath.Join(root, manifestName))
	if err != nil {
		return Config{}, errors.Wrap(err, "failed to read snapshot manifest")
	}
	var cfg Config
	if err := json.Unmarshal(b, &cfg); err != nil {
		return Config{}, errors.Wrap(err, "failed to parse snapshot manifest")
	}
	return cfg, nil
}

func applyConfig(ctx context.Context, src content.Fetcher, artifact digest.Digest, root string, cfg Config, opts volume.UnpackOptions) error {
	opts.SkipSidecar = true
	if err := os.MkdirAll(root, 0o755); err != nil {
		return err
	}
	for _, target := range cfg.Targets {
		dir := targetDir(root, target.Name)
		if err := volume.UnpackManifest(ctx, src, artifact, target.Files, dir, opts); err != nil {
			return errors.Wrapf(err, "failed to unpack snapshot target %s", target.Target)
		}
		if err := applySpecial(dir, target, opts.Owner); err != nil {
			return err
		}
	}
	return writeManifest(root, cfg)
}

func applySpecial(dir string, target Target, owner *volume.Owner) error {
	if err := os.MkdirAll(dir, 0o755); err != nil {
		return err
	}
	if err := lchownPath(dir, owner); err != nil {
		return err
	}
	for _, rel := range target.Dirs {
		path := filepath.Join(dir, filepath.FromSlash(rel))
		if err := os.MkdirAll(path, 0o755); err != nil {
			return errors.Wrapf(err, "failed to create snapshot directory %s", rel)
		}
		if err := lchownPath(path, owner); err != nil {
			return err
		}
	}
	for _, rel := range target.Opaque {
		path := filepath.Join(dir, filepath.FromSlash(rel))
		if err := os.MkdirAll(path, 0o755); err != nil {
			return err
		}
		if err := unix.Lsetxattr(path, "trusted.overlay.opaque", []byte("y"), 0); err != nil {
			return errors.Wrapf(err, "failed to mark opaque directory %s", rel)
		}
		if err := lchownPath(path, owner); err != nil {
			return err
		}
	}
	for _, link := range target.Symlinks {
		path := filepath.Join(dir, filepath.FromSlash(link.Path))
		if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
			return err
		}
		if err := lchownPath(filepath.Dir(path), owner); err != nil {
			return err
		}
		if err := os.RemoveAll(path); err != nil {
			return err
		}
		if err := os.Symlink(link.Target, path); err != nil {
			return errors.Wrapf(err, "failed to create symlink %s", link.Path)
		}
		if err := lchownPath(path, owner); err != nil {
			return err
		}
	}
	for _, rel := range target.Whiteouts {
		if err := writeWhiteout(dir, rel, owner); err != nil {
			return err
		}
	}
	return nil
}

func lchownPath(path string, owner *volume.Owner) error {
	if owner == nil || path == "" || owner.Uid < 0 {
		return nil
	}
	if err := unix.Lchown(path, owner.Uid, owner.Gid); err != nil {
		return errors.Wrapf(err, "failed to chown %s", path)
	}
	return nil
}

func writeWhiteout(dir, rel string, owner *volume.Owner) error {
	path := filepath.Join(dir, filepath.FromSlash(rel))
	if err := os.MkdirAll(filepath.Dir(path), 0o755); err != nil {
		return err
	}
	if err := lchownPath(filepath.Dir(path), owner); err != nil {
		return err
	}
	if err := os.RemoveAll(path); err != nil {
		return err
	}
	if err := unix.Mknod(path, unix.S_IFCHR|0o644, 0); err != nil {
		return errors.Wrapf(err, "failed to create whiteout %s", rel)
	}
	return lchownPath(path, owner)
}

func writeManifest(root string, cfg Config) error {
	b, err := json.MarshalIndent(cfg, "", "  ")
	if err != nil {
		return err
	}
	tmp := filepath.Join(root, manifestName+".tmp")
	if err := os.WriteFile(tmp, append(b, '\n'), 0o644); err != nil {
		return errors.Wrap(err, "failed to write snapshot manifest")
	}
	if err := os.Rename(tmp, filepath.Join(root, manifestName)); err != nil {
		return errors.Wrap(err, "failed to replace snapshot manifest")
	}
	return nil
}

func targetDir(root, name string) string {
	return filepath.Join(root, name)
}
