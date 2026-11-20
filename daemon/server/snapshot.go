package server

import (
	"context"
	"os"
	"path/filepath"
	"strings"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/daemon/oras/client"
	"protoxon.com/sls/daemon/server/filesystem"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/snapshot"
	"protoxon.com/sls/internal/volume"
)

// ErrSnapshotCommands is returned when pre or post commands are set and the
// server process is not running.
var ErrSnapshotCommands = errors.Sentinel("snapshot commands require a running server")

// ErrSnapshotRunning is returned when this server already has a snapshot in progress.
var ErrSnapshotRunning = errors.Sentinel("snapshot already in progress")

const maxSnapshotPreDelay = 10 * time.Minute

// StartSnapshot captures this server's overlay uppers and pushes the artifact.
// The server may be running. Pre and post commands are optional stdin lines:
// pre runs before the copy, post runs after the copy and before the registry push.
func (s *Server) StartSnapshot(req api.CreateSnapshotRequest) error {
	if strings.TrimSpace(req.ID) == "" {
		return errors.New("snapshot id is required")
	}
	if strings.TrimSpace(req.Reference) == "" {
		return errors.New("snapshot reference is required")
	}
	if req.PreDelaySeconds < 0 || time.Duration(req.PreDelaySeconds)*time.Second > maxSnapshotPreDelay {
		return errors.Errorf("pre_delay_seconds must be between 0 and %d", int(maxSnapshotPreDelay/time.Second))
	}
	if snapshotHasCommands(req) && !s.processRunning() {
		return ErrSnapshotCommands
	}
	if s.fs == nil || s.fs.Overlay() == nil {
		return errors.New("server overlay is not initialized")
	}
	s.Lock()
	if s.snapshotRunning {
		s.Unlock()
		return ErrSnapshotRunning
	}
	s.snapshotRunning = true
	s.Unlock()

	go s.runSnapshot(req)
	return nil
}

func snapshotHasCommands(req api.CreateSnapshotRequest) bool {
	return len(snapshotCommands(req.Pre)) > 0 || len(snapshotCommands(req.Post)) > 0
}

func snapshotCommands(cmds []string) []string {
	out := make([]string, 0, len(cmds))
	for _, cmd := range cmds {
		cmd = strings.TrimSpace(cmd)
		if cmd != "" {
			out = append(out, cmd)
		}
	}
	return out
}

func (s *Server) processRunning() bool {
	return s.Environment != nil && s.Environment.State() == environment.ProcessRunningState
}

// sendSnapshotCommands writes each command to the server stdin.
// It stops at the first failure and returns how many commands were sent.
func (s *Server) sendSnapshotCommands(cmds []string) (int, error) {
	sent := 0
	for _, cmd := range snapshotCommands(cmds) {
		if s.Environment == nil {
			return sent, errors.New("server environment is not initialized")
		}
		if err := s.Environment.SendCommand(cmd); err != nil {
			return sent, errors.Wrapf(err, "failed to send snapshot command %q", cmd)
		}
		sent++
	}
	return sent, nil
}

func (s *Server) unmountSnapshotIfOffline() {
	if s.fs == nil || s.fs.Overlay() == nil || s.Environment == nil {
		return
	}
	if s.Environment.State() != environment.ProcessOfflineState {
		return
	}
	if err := s.fs.Overlay().Unmount(); err != nil {
		s.Log().WithError(err).Warn("failed to unmount overlay after snapshot")
	}
}

func (s *Server) runSnapshot(req api.CreateSnapshotRequest) {
	defer func() {
		s.Lock()
		s.snapshotRunning = false
		s.Unlock()
	}()
	ctx := context.Background()
	report := func(ev api.SnapshotProgress) {
		ev.ID = req.ID
		ev.Reference = req.Reference
		s.reportSnapshot(ctx, ev)
	}
	pre := snapshotCommands(req.Pre)
	post := snapshotCommands(req.Post)
	ranPre := false
	// Post runs after a copy, and also when a pre command was sent and a later
	// step failed. It does not run when pre was requested and none were sent.
	runPost := func() error {
		if len(post) == 0 || (len(pre) > 0 && !ranPre) {
			return nil
		}
		_, err := s.sendSnapshotCommands(post)
		return err
	}

	if len(pre) > 0 {
		sent, err := s.sendSnapshotCommands(pre)
		ranPre = sent > 0
		if err != nil {
			if postErr := runPost(); postErr != nil {
				s.Log().WithError(postErr).Warn("failed to run snapshot post commands")
			}
			report(api.SnapshotProgress{Phase: api.SnapshotPhaseFailed, Error: err.Error()})
			return
		}
	}
	if req.PreDelaySeconds > 0 {
		time.Sleep(time.Duration(req.PreDelaySeconds) * time.Second)
	}

	report(api.SnapshotProgress{Phase: api.SnapshotPhaseCopying})

	root := ""
	if cfg := config.Get(); cfg != nil {
		root = cfg.System.Snapshots
	}
	captured, err := s.fs.Overlay().Snapshot(filesystem.SnapshotOptions{
		ID:       req.ID,
		Root:     root,
		Targets:  req.Targets,
		Excludes: req.Excludes,
	})
	postErr := runPost()
	s.unmountSnapshotIfOffline()
	if err != nil {
		if postErr != nil {
			s.Log().WithError(postErr).Warn("failed to run snapshot post commands")
		}
		report(api.SnapshotProgress{Phase: api.SnapshotPhaseFailed, Error: err.Error()})
		return
	}
	var postWarning string
	if postErr != nil {
		postWarning = postErr.Error()
		s.Log().WithError(postErr).Warn("snapshot post command failed; pushing the captured snapshot")
	}
	cfg, err := s.snapshotConfig(req, captured)
	if err != nil {
		_ = os.RemoveAll(captured.Dir)
		report(api.SnapshotProgress{Phase: api.SnapshotPhaseFailed, Error: err.Error()})
		return
	}
	report(api.SnapshotProgress{Phase: api.SnapshotPhasePacking, Size: captured.Size})

	desc, err := pushSnapshot(ctx, req.Reference, captured.Dir, cfg)
	if err != nil {
		_ = os.RemoveAll(captured.Dir)
		report(api.SnapshotProgress{Phase: api.SnapshotPhaseFailed, Error: err.Error()})
		return
	}
	cfg.Digest = desc.Digest.String()
	if err := snapshot.WriteLocal(captured.Dir, cfg, snapshotOwner()); err != nil {
		report(api.SnapshotProgress{
			Phase:     api.SnapshotPhaseFailed,
			Error:     err.Error(),
			Digest:    desc.Digest.String(),
			Reference: req.Reference,
		})
		return
	}
	report(api.SnapshotProgress{
		Phase:           api.SnapshotPhaseReady,
		Error:           postWarning,
		Digest:          desc.Digest.String(),
		Size:            captured.Size,
		RegistrySize:    cfg.LayerBytes(),
		SoftwareID:      cfg.SoftwareID,
		SoftwareVersion: cfg.SoftwareVersion,
		ServerFolder:    cfg.ServerFolder,
		Requires:        cfg.Requires,
		Targets:         targetPins(cfg),
	})
}

func (s *Server) reportSnapshot(ctx context.Context, ev api.SnapshotProgress) {
	if s.client == nil {
		return
	}
	attempts := 1
	if ev.Phase == api.SnapshotPhaseReady || ev.Phase == api.SnapshotPhaseFailed {
		attempts = 3
	}
	var err error
	for attempt := 0; attempt < attempts; attempt++ {
		err = s.client.ReportSnapshot(ctx, ev)
		if err == nil {
			return
		}
		if attempt+1 < attempts {
			time.Sleep(time.Duration(attempt+1) * 200 * time.Millisecond)
		}
	}
	s.Log().WithError(err).WithField("snapshot", ev.ID).Warn("failed to report snapshot progress")
}

func (s *Server) snapshotConfig(req api.CreateSnapshotRequest, captured filesystem.Capture) (snapshot.Config, error) {
	cfg := snapshot.Config{
		ID:              req.ID,
		ServerID:        s.ID(),
		SoftwareID:      s.softwareID,
		SoftwareVersion: s.Config().SoftwareVersion,
		ServerFolder:    s.serverFolder,
	}
	seen := map[string]struct{}{}
	for _, layer := range captured.Layers {
		lowers, err := s.classifyLowers(layer.Lowers)
		if err != nil {
			return snapshot.Config{}, err
		}
		for _, lower := range lowers {
			if lower.Kind == snapshot.KindSnapshot && lower.SnapshotID != "" {
				if _, ok := seen[lower.SnapshotID]; !ok {
					seen[lower.SnapshotID] = struct{}{}
					cfg.Requires = append(cfg.Requires, lower.SnapshotID)
				}
			}
		}
		cfg.Targets = append(cfg.Targets, snapshot.Target{
			Target:    layer.Target,
			Name:      layer.Name,
			Whiteouts: layer.Whiteouts,
			Opaque:    layer.Opaque,
			Symlinks:  layer.Symlinks,
			Dirs:      layer.Dirs,
			Lowers:    lowers,
		})
	}
	return cfg, nil
}

func (s *Server) classifyLowers(paths []string) ([]snapshot.Lower, error) {
	cfg := config.Get()
	if cfg == nil {
		return nil, errors.New("daemon configuration is not loaded")
	}
	var pins []struct {
		name     string
		artifact string
		digest   string
		abs      string
	}
	if s.volumeStore != nil && s.ID() != "" {
		loaded, err := s.volumeStore.LoadPins(s.ID())
		if err != nil {
			return nil, err
		}
		for _, pin := range loaded {
			abs := filepath.Join(cfg.System.Volumes, filepath.FromSlash(pin.Source))
			pins = append(pins, struct {
				name     string
				artifact string
				digest   string
				abs      string
			}{pin.Name, pin.Artifact, pin.Digest.String(), filepath.Clean(abs)})
		}
	}
	serverPath := ""
	if ov := s.fs.Overlay(); ov != nil {
		serverPath = filepath.Clean(ov.ServerPath)
	}
	snaps := filepath.Clean(cfg.System.Snapshots)
	var out []snapshot.Lower
	for _, path := range paths {
		path = filepath.Clean(path)
		switch {
		case serverPath != "" && path == serverPath:
			out = append(out, snapshot.Lower{Kind: snapshot.KindServer})
		case snaps != "" && path != snaps && strings.HasPrefix(path, snaps+string(filepath.Separator)):
			rel, err := filepath.Rel(snaps, path)
			if err != nil {
				return nil, err
			}
			id := rel
			if i := strings.IndexRune(filepath.ToSlash(rel), '/'); i >= 0 {
				id = rel[:i]
			}
			out = append(out, snapshot.Lower{Kind: snapshot.KindSnapshot, SnapshotID: id})
		default:
			match := -1
			for i, pin := range pins {
				if path == pin.abs || strings.HasPrefix(path, pin.abs+string(filepath.Separator)) {
					if match < 0 || len(pin.abs) > len(pins[match].abs) {
						match = i
					}
				}
			}
			if match < 0 {
				return nil, errors.Errorf("snapshot lower %s is not a pinned volume, server folder, or snapshot", path)
			}
			pin := pins[match]
			sub, err := filepath.Rel(pin.abs, path)
			if err != nil {
				return nil, err
			}
			if sub == "." {
				sub = ""
			}
			out = append(out, snapshot.Lower{
				Kind:     snapshot.KindVolume,
				Name:     pin.name,
				Artifact: pin.artifact,
				Digest:   pin.digest,
				Path:     filepath.ToSlash(sub),
			})
		}
	}
	return out, nil
}

func targetPins(cfg snapshot.Config) []api.SnapshotTarget {
	out := make([]api.SnapshotTarget, 0, len(cfg.Targets))
	for _, target := range cfg.Targets {
		item := api.SnapshotTarget{Target: target.Target, Name: target.Name}
		for _, lower := range target.Lowers {
			item.Lowers = append(item.Lowers, api.SnapshotLower{
				Kind:       lower.Kind,
				Name:       lower.Name,
				Artifact:   lower.Artifact,
				Digest:     lower.Digest,
				Path:       lower.Path,
				Target:     lower.Target,
				SnapshotID: lower.SnapshotID,
			})
		}
		out = append(out, item)
	}
	return out
}

func pushSnapshot(ctx context.Context, reference, dir string, cfg snapshot.Config) (ocispec.Descriptor, error) {
	repository, err := client.NewRepository(reference)
	if err != nil {
		return ocispec.Descriptor{}, err
	}
	desc, err := snapshot.Pack(ctx, repository, dir, cfg, volume.PackOptions{})
	if err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to pack snapshot")
	}
	if err := repository.Tag(ctx, desc, repository.Reference.Reference); err != nil {
		return ocispec.Descriptor{}, errors.Wrap(err, "failed to tag snapshot")
	}
	log.WithField("snapshot", cfg.ID).WithField("digest", desc.Digest).Info("pushed snapshot")
	return desc, nil
}

// EnsureSnapshots materializes each configured snapshot into the local cache.
func (s *Server) EnsureSnapshots(ctx context.Context) error {
	if len(s.snapshots) == 0 {
		return nil
	}
	cfg := config.Get()
	if cfg == nil || cfg.System.Snapshots == "" {
		return errors.New("snapshot root is not configured")
	}
	var cas string
	if s.volumeStore != nil {
		cas = s.volumeStore.CASRoot()
	}
	for _, mount := range s.snapshots {
		dir := filepath.Join(cfg.System.Snapshots, mount.ID)
		if localSnapshotReady(dir, mount.Digest) {
			continue
		}
		if mount.Reference == "" {
			return errors.Errorf("snapshot %s has no registry reference", mount.ID)
		}
		repository, err := client.NewRepository(mount.Reference)
		if err != nil {
			return err
		}
		desc, err := repository.Resolve(ctx, repository.Reference.Reference)
		if err != nil {
			return errors.Wrapf(err, "failed to resolve snapshot %s", mount.ID)
		}
		if mount.Digest != "" && desc.Digest.String() != mount.Digest {
			pinned, err := digest.Parse(mount.Digest)
			if err != nil {
				return errors.Wrapf(err, "snapshot %s digest", mount.ID)
			}
			ref, err := client.ParseReference(mount.Reference)
			if err != nil {
				return err
			}
			digestRef := ref.Context().Name() + "@" + pinned.String()
			repository, err = client.NewRepository(digestRef)
			if err != nil {
				return err
			}
			desc, err = repository.Resolve(ctx, repository.Reference.Reference)
			if err != nil {
				return errors.Wrapf(err, "failed to resolve snapshot %s", mount.ID)
			}
		}
		if _, err := snapshot.Materialize(ctx, repository, desc, dir, volume.UnpackOptions{
			CASRoot:       cas,
			SkipSidecar:   true,
			DeleteMissing: true,
			// Owner matches volume unpack. Without it the lowerdir stays
			// root-owned and the container cannot copy up files such as
			// session.lock.
			Owner: snapshotOwner(),
		}); err != nil {
			os.RemoveAll(dir)
			return errors.Wrapf(err, "failed to materialize snapshot %s", mount.ID)
		}
	}
	return nil
}

func snapshotOwner() *volume.Owner {
	cfg := config.Get()
	if cfg == nil || cfg.System.User.Uid < 0 {
		return nil
	}
	return &volume.Owner{Uid: cfg.System.User.Uid, Gid: cfg.System.User.Gid}
}

func localSnapshotReady(dir, digest string) bool {
	if digest == "" {
		return false
	}
	cfg, err := snapshot.ReadLocal(dir)
	if err != nil {
		return false
	}
	return cfg.Digest == digest
}

// snapshotLowers returns snapshot directories for target, highest precedence first.
func (s *Server) snapshotLowers(target string) ([]string, error) {
	if len(s.snapshots) == 0 {
		return nil, nil
	}
	cfg := config.Get()
	if cfg == nil {
		return nil, errors.New("daemon configuration is not loaded")
	}
	target = snapshot.NormalizeTarget(target)
	var dirs []string
	for _, mount := range s.snapshots {
		local, err := snapshot.ReadLocal(filepath.Join(cfg.System.Snapshots, mount.ID))
		if err != nil {
			return nil, errors.Wrapf(err, "snapshot %s", mount.ID)
		}
		item, ok := local.TargetNamed(target)
		if !ok {
			continue
		}
		dirs = append(dirs, filepath.Join(cfg.System.Snapshots, mount.ID, item.Name))
	}
	return dirs, nil
}

// snapshotInUse reports whether any server on this daemon mounts id.
func snapshotInUse(servers []*Server, id string) bool {
	for _, s := range servers {
		if s == nil {
			continue
		}
		for _, mount := range s.snapshots {
			if mount.ID == id {
				return true
			}
		}
	}
	return false
}
