package blueprint

import (
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"testing"

	githttp "github.com/go-git/go-git/v5/plumbing/transport/http"
	"protoxon.com/sls/controller/config"
)

func TestSyncGitSource(t *testing.T) {
	repo := t.TempDir()
	writeGitRepo(t, repo, map[string]string{
		"lobby.yaml":    "blueprint:\n  id: lobby\n  name: Lobby\n",
		"nested/x.yaml": "mixin:\n  id: base\n  name: Base\n",
	})

	root := t.TempDir()
	sources := []config.BlueprintSource{{
		Type: "git",
		URL:  repo,
		Ref:  "master",
		Path: ".",
		Dest: "from-git",
	}}

	SyncSources(root, sources, false)

	got := filepath.Join(root, "from-git", "lobby.yaml")
	if _, err := os.Stat(got); err != nil {
		t.Fatalf("expected synced file: %v", err)
	}

	writeFile(t, filepath.Join(repo, "lobby.yaml"), "blueprint:\n  id: lobby\n  name: Lobby Updated\n")
	run(t, repo, "git", "add", "-A")
	run(t, repo, "git", "commit", "-m", "update")

	SyncSources(root, sources, true)
	data, err := os.ReadFile(got)
	if err != nil {
		t.Fatal(err)
	}
	if !strings.Contains(string(data), "Lobby Updated") {
		t.Fatalf("expected updated content, got %q", data)
	}
}

func TestSyncGitSourceSubpath(t *testing.T) {
	repo := t.TempDir()
	writeGitRepo(t, repo, map[string]string{
		"pack/a.yaml":  "blueprint:\n  id: a\n  name: A\n",
		"other/b.yaml": "blueprint:\n  id: b\n  name: B\n",
	})

	root := t.TempDir()
	SyncSources(root, []config.BlueprintSource{{
		Type: "git",
		URL:  repo,
		Ref:  "master",
		Path: "pack",
		Dest: "imported",
	}}, false)

	if _, err := os.Stat(filepath.Join(root, "imported", "a.yaml")); err != nil {
		t.Fatalf("expected pack file: %v", err)
	}
	if _, err := os.Stat(filepath.Join(root, "imported", "b.yaml")); !os.IsNotExist(err) {
		t.Fatal("did not expect other/b.yaml to be synced")
	}
}

func TestSyncRemovesStaleManifestFiles(t *testing.T) {
	repo := t.TempDir()
	writeGitRepo(t, repo, map[string]string{
		"keep.yaml": "blueprint:\n  id: keep\n  name: Keep\n",
		"gone.yaml": "blueprint:\n  id: gone\n  name: Gone\n",
	})

	root := t.TempDir()
	sources := []config.BlueprintSource{{
		Type: "git",
		URL:  repo,
		Ref:  "master",
		Dest: "d",
	}}
	SyncSources(root, sources, false)

	run(t, repo, "git", "rm", "gone.yaml")
	run(t, repo, "git", "commit", "-m", "remove")

	SyncSources(root, sources, true)
	if _, err := os.Stat(filepath.Join(root, "d", "keep.yaml")); err != nil {
		t.Fatalf("expected keep.yaml: %v", err)
	}
	if _, err := os.Stat(filepath.Join(root, "d", "gone.yaml")); !os.IsNotExist(err) {
		t.Fatal("expected gone.yaml to be removed")
	}
}

func TestSyncSkipsUpdateOnReloadFalse(t *testing.T) {
	repo := t.TempDir()
	writeGitRepo(t, repo, map[string]string{
		"x.yaml": "blueprint:\n  id: x\n  name: X\n",
	})

	root := t.TempDir()
	falseVal := false
	sources := []config.BlueprintSource{{
		Type:           "git",
		URL:            repo,
		Ref:            "master",
		Dest:           "d",
		UpdateOnReload: &falseVal,
	}}

	SyncSources(root, sources, false)

	writeFile(t, filepath.Join(repo, "x.yaml"), "blueprint:\n  id: x\n  name: Y\n")
	run(t, repo, "git", "add", "-A")
	run(t, repo, "git", "commit", "-m", "update")

	SyncSources(root, sources, true)
	data, err := os.ReadFile(filepath.Join(root, "d", "x.yaml"))
	if err != nil {
		t.Fatal(err)
	}
	if strings.Contains(string(data), "name: Y") {
		t.Fatal("source with update_on_reload:false should not refresh on reload")
	}
}

func TestSyncContinuesAfterSourceFailure(t *testing.T) {
	good := t.TempDir()
	writeGitRepo(t, good, map[string]string{
		"ok.yaml": "blueprint:\n  id: ok\n  name: OK\n",
	})

	root := t.TempDir()
	SyncSources(root, []config.BlueprintSource{
		{Type: "git", URL: filepath.Join(t.TempDir(), "missing.git"), Ref: "master", Dest: "bad"},
		{Type: "git", URL: good, Ref: "master", Dest: "good"},
	}, false)

	if _, err := os.Stat(filepath.Join(root, "good", "ok.yaml")); err != nil {
		t.Fatalf("expected good source to sync after earlier failure: %v", err)
	}
	if _, err := os.Stat(filepath.Join(root, "bad")); !os.IsNotExist(err) {
		t.Fatal("did not expect bad dest to exist")
	}
}

func TestSyncSkipsDuplicateDest(t *testing.T) {
	first := t.TempDir()
	writeGitRepo(t, first, map[string]string{
		"a.yaml": "blueprint:\n  id: a\n  name: A\n",
	})
	second := t.TempDir()
	writeGitRepo(t, second, map[string]string{
		"b.yaml": "blueprint:\n  id: b\n  name: B\n",
	})

	root := t.TempDir()
	SyncSources(root, []config.BlueprintSource{
		{Type: "git", URL: first, Ref: "master", Dest: "shared"},
		{Type: "git", URL: second, Ref: "master", Dest: "shared"},
	}, false)

	if _, err := os.Stat(filepath.Join(root, "shared", "a.yaml")); err != nil {
		t.Fatalf("expected first source file: %v", err)
	}
	if _, err := os.Stat(filepath.Join(root, "shared", "b.yaml")); !os.IsNotExist(err) {
		t.Fatal("duplicate dest source should be skipped")
	}
}

func TestSyncPrunesReplacedSource(t *testing.T) {
	oldRepo := t.TempDir()
	writeGitRepo(t, oldRepo, map[string]string{
		"services/compose.yaml": "services: {}\n",
		"common.yaml":           "blueprint:\n  id: old\n  name: Old\n",
	})
	newRepo := t.TempDir()
	writeGitRepo(t, newRepo, map[string]string{
		"lobby.yaml":  "blueprint:\n  id: lobby\n  name: Lobby\n",
		"common.yaml": "blueprint:\n  id: common\n  name: Common\n",
	})

	root := t.TempDir()
	SyncSources(root, []config.BlueprintSource{{Type: "git", URL: oldRepo, Ref: "master"}}, false)
	manual := filepath.Join(root, "manual.yaml")
	writeFile(t, manual, "blueprint:\n  id: manual\n  name: Manual\n")

	SyncSources(root, []config.BlueprintSource{{Type: "git", URL: newRepo, Ref: "master"}}, true)

	if _, err := os.Stat(filepath.Join(root, "services")); !os.IsNotExist(err) {
		t.Fatal("expected the old source's files and empty directory to be removed")
	}
	for _, keep := range []string{"lobby.yaml", "common.yaml", "manual.yaml"} {
		if _, err := os.Stat(filepath.Join(root, keep)); err != nil {
			t.Fatalf("expected %s to remain: %v", keep, err)
		}
	}
	entries, err := os.ReadDir(filepath.Join(root, sourcesCacheDir))
	if err != nil {
		t.Fatal(err)
	}
	newKey := specFor(config.BlueprintSource{URL: newRepo, Ref: "master"}).cacheKey()
	for _, e := range entries {
		if !strings.HasPrefix(e.Name(), newKey) {
			t.Fatalf("expected old clone and manifest to be removed, found %s", e.Name())
		}
	}
}

func TestSyncPrunesChangedDest(t *testing.T) {
	repo := t.TempDir()
	writeGitRepo(t, repo, map[string]string{"x.yaml": "blueprint:\n  id: x\n  name: X\n"})

	root := t.TempDir()
	SyncSources(root, []config.BlueprintSource{{Type: "git", URL: repo, Ref: "master", Dest: "a"}}, false)
	SyncSources(root, []config.BlueprintSource{{Type: "git", URL: repo, Ref: "master", Dest: "b"}}, true)

	if _, err := os.Stat(filepath.Join(root, "a")); !os.IsNotExist(err) {
		t.Fatal("expected the old dest to be removed")
	}
	if _, err := os.Stat(filepath.Join(root, "b", "x.yaml")); err != nil {
		t.Fatalf("expected file in the new dest: %v", err)
	}
}

func TestSyncKeepsRemovedSourceFilesWhenASourceFails(t *testing.T) {
	repo := t.TempDir()
	writeGitRepo(t, repo, map[string]string{"x.yaml": "blueprint:\n  id: x\n  name: X\n"})

	root := t.TempDir()
	SyncSources(root, []config.BlueprintSource{{Type: "git", URL: repo, Ref: "master"}}, false)
	SyncSources(root, []config.BlueprintSource{
		{Type: "git", URL: filepath.Join(t.TempDir(), "typo.git"), Ref: "master"},
	}, true)

	if _, err := os.Stat(filepath.Join(root, "x.yaml")); err != nil {
		t.Fatalf("expected files to stay while the replacement source fails: %v", err)
	}
}

func TestSyncPrunesWhenAllSourcesRemoved(t *testing.T) {
	repo := t.TempDir()
	writeGitRepo(t, repo, map[string]string{"x.yaml": "blueprint:\n  id: x\n  name: X\n"})

	root := t.TempDir()
	SyncSources(root, []config.BlueprintSource{{Type: "git", URL: repo, Ref: "master"}}, false)
	SyncSources(root, nil, true)

	if _, err := os.Stat(filepath.Join(root, "x.yaml")); !os.IsNotExist(err) {
		t.Fatal("expected files to be removed once no sources are configured")
	}
}

func TestSyncPrunesManifestWithoutDest(t *testing.T) {
	root := t.TempDir()
	key := "0123456789abcdef"
	writeFile(t, filepath.Join(root, "services", "compose.yaml"), "services: {}\n")
	writeFile(t, filepath.Join(root, sourcesCacheDir, key+manifestExt), "services/compose.yaml\n")

	SyncSources(root, nil, true)

	if _, err := os.Stat(filepath.Join(root, "services")); !os.IsNotExist(err) {
		t.Fatal("expected files from a manifest without a dest to be removed")
	}
	if _, err := os.Stat(filepath.Join(root, sourcesCacheDir, key+manifestExt)); !os.IsNotExist(err) {
		t.Fatal("expected the manifest to be removed")
	}
}

func TestSyncKeepsManifestWithoutDestWhenFilesMissing(t *testing.T) {
	root := t.TempDir()
	key := "0123456789abcdef"
	writeFile(t, filepath.Join(root, "a.yaml"), "x")
	manifest := filepath.Join(root, sourcesCacheDir, key+manifestExt)
	writeFile(t, manifest, "a.yaml\nmissing.yaml\n")

	SyncSources(root, nil, true)

	if _, err := os.Stat(filepath.Join(root, "a.yaml")); err != nil {
		t.Fatalf("expected a.yaml to stay when the dest cannot be inferred: %v", err)
	}
	if _, err := os.Stat(manifest); err != nil {
		t.Fatalf("expected the manifest to stay for manual cleanup: %v", err)
	}
}

func TestMirrorTreeIgnoresEscapingManifestEntries(t *testing.T) {
	dst := t.TempDir()
	src := t.TempDir()
	outside := t.TempDir()
	victim := filepath.Join(outside, "victim.txt")
	writeFile(t, victim, "secret")
	writeFile(t, filepath.Join(src, "ok.yaml"), "x")

	rel, err := filepath.Rel(dst, victim)
	if err != nil {
		t.Fatal(err)
	}
	manifest := filepath.Join(t.TempDir(), "m.files")
	if err := os.WriteFile(manifest, []byte(filepath.ToSlash(rel)+"\n"), 0o600); err != nil {
		t.Fatal(err)
	}

	if err := mirrorTree(src, dst, manifest, manifestMeta{Dest: "."}); err != nil {
		t.Fatalf("mirrorTree: %v", err)
	}
	if _, err := os.Stat(victim); err != nil {
		t.Fatalf("victim should still exist: %v", err)
	}
	if _, err := os.Stat(filepath.Join(dst, "ok.yaml")); err != nil {
		t.Fatalf("expected mirrored file: %v", err)
	}
}

func TestGitAuthIgnoresTokenForSSH(t *testing.T) {
	auth, err := gitAuth("git@github.com:org/repo.git", "secret-token")
	if err != nil {
		// SSH agent may be unavailable; the important part is we did not fall
		// back to HTTP basic auth for an SSH URL.
		return
	}
	if _, ok := auth.(*githttp.BasicAuth); ok {
		t.Fatal("SSH URL must not use HTTP token auth")
	}
}

func TestGitAuthUsesTokenForHTTPS(t *testing.T) {
	auth, err := gitAuth("https://github.com/org/repo.git", "secret-token")
	if err != nil {
		t.Fatal(err)
	}
	ba, ok := auth.(*githttp.BasicAuth)
	if !ok {
		t.Fatalf("expected BasicAuth, got %T", auth)
	}
	if ba.Password != "secret-token" {
		t.Fatalf("unexpected password %q", ba.Password)
	}
}

func TestResolveSourceToken(t *testing.T) {
	t.Setenv("GITHUB_TOKEN", "")

	if got := resolveSourceToken(nil); got != "" {
		t.Fatalf("nil auth, empty env: got %q", got)
	}
	if got := resolveSourceToken(&config.BlueprintSourceAuth{Token: "inline"}); got != "inline" {
		t.Fatalf("inline only: got %q", got)
	}

	t.Setenv("GITHUB_TOKEN", "from-env")
	if got := resolveSourceToken(&config.BlueprintSourceAuth{Token: "inline"}); got != "from-env" {
		t.Fatalf("GITHUB_TOKEN should win: got %q", got)
	}
	if got := resolveSourceToken(nil); got != "from-env" {
		t.Fatalf("GITHUB_TOKEN without auth block: got %q", got)
	}
}

func TestResolveUnderRootRejectsEscape(t *testing.T) {
	root := t.TempDir()
	if _, err := resolveUnderRoot(root, "../outside"); err == nil {
		t.Fatal("expected escape to fail")
	}
}

func writeGitRepo(t *testing.T, dir string, files map[string]string) {
	t.Helper()
	run(t, dir, "git", "init", "-b", "master")
	run(t, dir, "git", "config", "user.email", "test@example.com")
	run(t, dir, "git", "config", "user.name", "test")
	for name, body := range files {
		writeFile(t, filepath.Join(dir, name), body)
	}
	run(t, dir, "git", "add", "-A")
	run(t, dir, "git", "commit", "-m", "initial")
}

func writeFile(t *testing.T, path, body string) {
	t.Helper()
	if err := os.MkdirAll(filepath.Dir(path), 0o700); err != nil {
		t.Fatal(err)
	}
	if err := os.WriteFile(path, []byte(body), 0o644); err != nil {
		t.Fatal(err)
	}
}

func run(t *testing.T, dir string, name string, args ...string) {
	t.Helper()
	cmd := exec.Command(name, args...)
	cmd.Dir = dir
	out, err := cmd.CombinedOutput()
	if err != nil {
		t.Fatalf("%s %v: %v\n%s", name, args, err, out)
	}
}
