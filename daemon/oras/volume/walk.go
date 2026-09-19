package volume

import (
	"io/fs"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"emperror.dev/errors"
)

type fileRef struct {
	Abs   string
	Rel   string
	Size  int64
	Mode  uint32
	Mtime int64
}

func listFiles(root string) ([]fileRef, error) {
	var files []fileRef
	err := filepath.WalkDir(root, func(path string, d fs.DirEntry, err error) error {
		if err != nil {
			return err
		}
		rel, err := filepath.Rel(root, path)
		if err != nil {
			return err
		}
		rel = filepath.ToSlash(rel)
		if rel == slsDir || strings.HasPrefix(rel, slsDir+"/") {
			if d.IsDir() {
				return fs.SkipDir
			}
			return nil
		}
		if rel == "." {
			return nil
		}
		if err := validateRelPath(rel); err != nil {
			return err
		}
		if d.Type()&os.ModeSymlink != 0 {
			return nil
		}
		if d.IsDir() {
			return nil
		}
		info, err := d.Info()
		if err != nil {
			return err
		}
		if !info.Mode().IsRegular() {
			return nil
		}
		files = append(files, fileRef{
			Abs:   path,
			Rel:   rel,
			Size:  info.Size(),
			Mode:  uint32(info.Mode().Perm()),
			Mtime: info.ModTime().Unix(),
		})
		return nil
	})
	if err != nil {
		return nil, errors.Wrap(err, "failed to walk volume")
	}
	sort.Slice(files, func(i, j int) bool { return files[i].Rel < files[j].Rel })
	return files, nil
}

func groupKey(rel string) string {
	before, _, ok := strings.Cut(rel, "/")
	if !ok {
		return ""
	}
	return before
}

func validateRelPath(rel string) error {
	if rel == "" || rel == "." || rel == ".." {
		return errors.Errorf("invalid path %q", rel)
	}
	if strings.HasPrefix(rel, "/") || strings.Contains(rel, "\\") {
		return errors.Errorf("invalid path %q", rel)
	}
	for part := range strings.SplitSeq(rel, "/") {
		if part == "" || part == "." || part == ".." {
			return errors.Errorf("invalid path %q", rel)
		}
	}
	return nil
}

func groupFiles(files []fileRef) [][]fileRef {
	order := make([]string, 0)
	groups := map[string][]fileRef{}
	for _, file := range files {
		key := groupKey(file.Rel)
		if _, ok := groups[key]; !ok {
			order = append(order, key)
		}
		groups[key] = append(groups[key], file)
	}
	out := make([][]fileRef, 0, len(order))
	for _, key := range order {
		out = append(out, groups[key])
	}
	return out
}
