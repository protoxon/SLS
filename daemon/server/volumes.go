package server

import (
	"context"
	"fmt"
	"path/filepath"
	"sort"
	"strings"

	"emperror.dev/errors"
	"github.com/opencontainers/go-digest"
	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
	"protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/environment"
	"protoxon.com/sls/daemon/internal/overlay"
	"protoxon.com/sls/daemon/models"
	"protoxon.com/sls/daemon/oras/store"
	"protoxon.com/sls/daemon/oras/volume"
	"protoxon.com/sls/daemon/server/filesystem"
	"protoxon.com/sls/daemon/system"
)

// PullVolume resolves and unpacks a volume artifact into the given store.
func PullVolume(ctx context.Context, st *store.Store, reference string) (string, ocispec.Descriptor, error) {
	if st == nil {
		return "", ocispec.Descriptor{}, errors.New("volume store not configured")
	}
	res, err := st.Ensure(ctx, reference, false, nil)
	return res.Path, res.Descriptor, err
}

func applyMountDefaults(v *models.Volume, dest string) {
	mount, err := volume.ReadMount(dest)
	if err != nil {
		return
	}
	if v.Target == "" {
		v.Target = mount.Target
	}
	if v.Mode == "" && mount.Mode != string(models.VolumeModeRW) {
		v.Mode = models.VolumeMode(mount.Mode)
	}
	if v.Mode == "" || (v.Artifact != "" && v.Mode == models.VolumeModeRW) {
		v.Mode = models.VolumeModeCOW
	}
}

func volumeName(v models.Volume) string {
	if v.Name != "" {
		return v.Name
	}
	return v.Artifact
}

func (s *Server) validateVolumes() error {
	for _, v := range s.volumes {
		if err := validateVolumeSpec(v); err != nil {
			return err
		}
	}
	return nil
}

// probeVolumes checks each artifact volume is on disk or resolvable. It does
// not pull. Create uses this so a missing or unreachable volume fails the
// request instead of a later background start.
func (s *Server) probeVolumes(ctx context.Context) error {
	if ctx == nil {
		ctx = context.Background()
	}
	st := s.volumeStore
	var cancel context.CancelFunc
	ctx, cancel = context.WithTimeout(ctx, store.ProbeTimeout)
	defer cancel()
	for _, v := range s.volumes {
		if v.Artifact == "" {
			continue
		}
		if st == nil {
			return errors.New("volume store not configured")
		}
		if d, ok := store.DigestFromSource(v.Source); ok {
			has, err := st.Has(d)
			if err != nil {
				return err
			}
			if has {
				continue
			}
		}
		if err := st.Probe(ctx, v.Artifact); err != nil {
			return errors.Wrapf(err, "failed to probe volume %s", volumeName(v))
		}
	}
	return nil
}

// initVolumes pulls/pins artifacts if needed, then configures overlay lowerdirs and
// bind mounts. Later starts skip this entirely.
func (s *Server) initVolumes(ctx context.Context) error {
	if s.volumesConfigured {
		return nil
	}
	if err := s.EnsureVolumes(ctx); err != nil {
		return err
	}
	if err := s.configureMounts(); err != nil {
		return err
	}
	s.volumesConfigured = true
	s.applyVolumeMounts()
	return nil
}

// applyVolumeMounts copies the wired volume binds into the environment so the
// next container create sees them. Limits and other settings are left as-is.
func (s *Server) applyVolumeMounts() {
	if s.Environment == nil {
		return
	}
	cfg := s.Environment.Config()
	cfg.SetSettings(environment.Settings{
		Mounts:      s.Mounts(),
		Allocations: cfg.Allocations(),
		Limits:      cfg.Limits(),
		Labels:      cfg.Labels(),
	})
}

// configureMounts builds RO/RW binds and COW overlay lowerdirs from s.volumes.
// The root server overlay is created in InitServer, this only attaches volumes.
func (s *Server) configureMounts() error {
	if s.fs == nil {
		return errors.New("server filesystem is not initialized")
	}
	ov := s.fs.Overlay()
	if ov == nil {
		return errors.New("server overlay is not initialized")
	}
	volume := s.fs.Path()
	cfg := config.Get()
	if cfg == nil {
		return errors.New("daemon configuration is not loaded")
	}
	volumesRoot := filepath.Join(cfg.System.Volumes)

	volumeMounts := make([]Mount, 0, len(s.volumes))
	for _, v := range s.volumes {
		switch v.Mode {
		case models.VolumeModeCOW:
			continue
		case models.VolumeModeRO, models.VolumeModeRW:
			if v.Mode == models.VolumeModeRW && store.IsCacheRel(v.Source) {
				return errors.Wrapf(ErrInvalidServerConfig, "volume '%s': cannot mount the volume cache read-write", volumeName(v))
			}
			absResolved, err := resolveVolumeDir(v, volumesRoot)
			if err != nil {
				return err
			}
			target := filepath.Clean(v.Target)
			if target == "." {
				target = "/"
			}
			containerTarget := filepath.Join("/home/container", strings.TrimPrefix(target, "/"))
			volumeMounts = append(volumeMounts, Mount(environment.Mount{
				Source:   absResolved,
				Target:   containerTarget,
				ReadOnly: v.Mode == models.VolumeModeRO,
			}))
		default:
			return errors.Wrapf(ErrInvalidServerConfig, "invalid volume mode %s for volume %s", v.Mode, volumeName(v))
		}
	}
	s.cfg.VolumeMounts = volumeMounts

	cowGroups := make(map[string][]models.Volume)
	for _, v := range s.volumes {
		if v.Mode == models.VolumeModeCOW {
			cowGroups[v.Target] = append(cowGroups[v.Target], v)
		}
	}

	targets := make([]string, 0, len(cowGroups))
	for target := range cowGroups {
		targets = append(targets, target)
	}
	sort.Slice(targets, func(i, j int) bool {
		di, dj := cowTargetDepth(targets[i]), cowTargetDepth(targets[j])
		if di != dj {
			return di < dj
		}
		return targets[i] < targets[j]
	})

	for _, target := range targets {
		vols := cowGroups[target]
		if len(vols) == 0 {
			continue
		}
		sources := make([]string, 0, len(vols))
		for _, v := range vols {
			absResolved, err := resolveVolumeDir(v, volumesRoot)
			if err != nil {
				return err
			}
			sources = append(sources, absResolved)
		}
		cleanTarget := filepath.Clean(target)
		if isRootCowTarget(cleanTarget) {
			if err := ov.SetRootVolumeLowers(sources); err != nil {
				return err
			}
			continue
		}
		name := system.PathId(target)
		overlayTarget := filepath.Join(volume, strings.TrimPrefix(cleanTarget, "/"))
		ov.EnsureOverlay(name, sources, overlayTarget)
	}
	return nil
}

func isRootCowTarget(target string) bool {
	c := filepath.Clean(target)
	return c == "/" || c == "." || c == ""
}

func cowTargetDepth(target string) int {
	if isRootCowTarget(target) {
		return 0
	}
	c := strings.Trim(filepath.Clean(target), "/")
	if c == "" {
		return 0
	}
	return strings.Count(c, "/") + 1
}

func resolveVolumeDir(v models.Volume, volumesRoot string) (string, error) {
	name := volumeName(v)
	resolved := filepath.Join(volumesRoot, filepath.Clean(v.Source))
	absResolved, err := filepath.Abs(resolved)
	if err != nil {
		return "", errors.Wrapf(ErrInvalidServerConfig, "volume '%s': invalid source path: %s", name, v.Source)
	}
	if !filesystem.WithinPath(absResolved, volumesRoot) {
		return "", errors.Wrapf(ErrInvalidServerConfig, "volume '%s': invalid source path: %s source path must be under %s", name, v.Source, volumesRoot)
	}
	if exists, err := overlay.DirExists(absResolved); err != nil {
		return "", errors.Wrapf(err, "volume '%s': failed to check source path: %s", name, absResolved)
	} else if !exists {
		return "", errors.Wrapf(ErrInvalidServerConfig, "volume '%s': source path does not exist: %s", name, absResolved)
	}
	return absResolved, nil
}

// EnsureVolumes pulls artifact volumes the first time they are needed and
// pins that digest until the server is deleted. Later starts and daemon
// restarts reuse the pinned tree without resolving the tag.
func (s *Server) EnsureVolumes(ctx context.Context) error {
	if len(s.volumes) == 0 {
		return nil
	}
	st := s.volumeStore
	if st == nil {
		return errors.New("volume store not configured")
	}
	root := st.Root
	pins, err := st.LoadPins(s.id)
	if err != nil {
		return err
	}
	pinByName := make(map[string]store.Pin, len(pins))
	for _, p := range pins {
		pinByName[p.Name] = p
	}

	next := make([]store.Pin, 0, len(s.volumes))
	keep := make([]digest.Digest, 0, len(s.volumes))
	for i := range s.volumes {
		v := s.volumes[i]
		if err := validateVolumeSpec(v); err != nil {
			return err
		}
		if v.Artifact == "" {
			s.volumes[i] = v
			continue
		}
		name := volumeName(v)
		log := s.Log().WithField("volume", name)
		var res store.Result
		if p, ok := pinByName[name]; ok && p.Artifact == v.Artifact && p.Digest != "" {
			res, err = st.EnsurePinned(ctx, v.Artifact, p.Digest, false, log)
			if err != nil {
				// Do not fall back to LatestLocal. That is the newest tree for
				// this tag on the node, which may belong to another server.
				return errors.Wrapf(err, "failed to ensure pinned volume %s", name)
			}
		} else {
			res, err = st.Ensure(ctx, v.Artifact, false, log)
			if err != nil {
				local, used, lerr := useLocalVolume(st, v.Artifact, err)
				if lerr != nil {
					return lerr
				}
				if !used {
					return errors.Wrapf(err, "failed to pull volume %s", name)
				}
				s.logVolumePullFallback(name, err)
				res = local
			}
		}
		rel, err := filepath.Rel(root, res.Path)
		if err != nil {
			return err
		}
		v.Source = filepath.ToSlash(rel)
		applyMountDefaults(&v, res.Path)
		s.volumes[i] = v
		next = append(next, store.Pin{
			Name:     name,
			Artifact: v.Artifact,
			Digest:   res.Descriptor.Digest,
			Source:   v.Source,
		})
		keep = append(keep, res.Descriptor.Digest)
	}
	if err := st.SavePins(s.id, next); err != nil {
		return err
	}
	dropped, err := st.ReconcileRefs(s.id, keep)
	if err != nil {
		return err
	}
	if dropped {
		if err := st.GC(); err != nil {
			return err
		}
	}
	return nil
}

func useLocalVolume(st *store.Store, artifact string, pullErr error) (store.Result, bool, error) {
	if !store.IsRegistryUnavailable(pullErr) {
		return store.Result{}, false, nil
	}
	return st.LatestLocal(artifact)
}

func (s *Server) logVolumePullFallback(name string, pullErr error) {
	msg := fmt.Sprintf("Failed to pull volume %s: could not connect to the registry. Using the local copy.", name)
	if errors.Is(pullErr, store.ErrNotFound) {
		msg = fmt.Sprintf("Failed to pull volume %s: not found in the registry. Using the local copy.", name)
	}
	s.Log().WithError(pullErr).WithField("volume", name).Warn("using local volume after registry failure")
	if config.Get() != nil {
		s.PublishConsoleOutputFromDaemon(msg)
	}
}

func (s *Server) releaseVolumeRefs() error {
	st := s.volumeStore
	if st == nil {
		return nil
	}
	if _, err := st.ReconcileRefs(s.id, nil); err != nil {
		return err
	}
	if err := st.DeletePins(s.id); err != nil {
		return err
	}
	return st.GC()
}

func (s *Server) unmountVolumesForDelete() error {
	fs := s.Filesystem()
	if fs == nil {
		return nil
	}
	if u := fs.UnixFS(); u != nil {
		if err := u.Close(); err != nil {
			s.Log().WithField("error", err).Warn("failed to close server filesystem during deletion")
		}
	}
	ov := fs.Overlay()
	if ov == nil {
		return nil
	}
	return ov.Unmount()
}

func validateVolumeSpec(v models.Volume) error {
	name := volumeName(v)
	if v.Artifact != "" && strings.TrimSpace(v.Source) != "" {
		if _, pinned := store.DigestFromSource(v.Source); !pinned && !store.IsCacheRel(v.Source) {
			return errors.Wrapf(ErrInvalidServerConfig, "volume '%s': cannot set both artifact and source", name)
		}
	}
	if v.Artifact != "" && v.Mode == models.VolumeModeRW {
		return errors.Wrapf(ErrInvalidServerConfig, "volume '%s': artifact volumes cannot use mode rw", name)
	}
	if v.Artifact != "" {
		return nil
	}
	if strings.TrimSpace(v.Source) == "" || strings.TrimSpace(v.Target) == "" {
		return errors.Wrapf(ErrInvalidServerConfig, "volume '%s': local volumes require source and target", name)
	}
	if store.IsCacheRel(v.Source) {
		return errors.Wrapf(ErrInvalidServerConfig, "volume '%s': source cannot be the cas or digests cache", name)
	}
	return nil
}
