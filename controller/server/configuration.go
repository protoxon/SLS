package server

import (
	"maps"
	"path/filepath"

	"emperror.dev/errors"
	"github.com/apex/log"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/models"
	"protoxon.com/sls/controller/software"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/process"
)

func softwareChoice(bp *blueprint.Blueprint, overrides *models.ServerOverrides) (id, version, folder string) {
	if bp == nil || bp.Server == nil {
		return "", "", ""
	}
	id = bp.Server.Software
	version = bp.Server.Version
	folder = bp.Server.Path
	if overrides == nil {
		return id, version, folder
	}
	if overrides.Software != nil {
		id = *overrides.Software
	}
	if overrides.Version != nil {
		version = *overrides.Version
	}
	if overrides.Software != nil || overrides.Version != nil {
		folder = filepath.Join(id, version)
	}
	return id, version, folder
}

// BuildServerConfiguration constructs a servers runtime configuration and installation script
func BuildServerConfiguration(s *Server, bp *blueprint.Blueprint, swr *software.Registry, alloc environment.Allocations) (*models.ServerConfiguration, *software.InstallationScript, error) {
	effectiveSoftware, effectiveVersion, serverFolder := softwareChoice(bp, s.Overrides)

	sw := swr.Get(effectiveSoftware)
	if sw == nil {
		return nil, nil, errors.Errorf("software not found: %s", effectiveSoftware)
	}

	matcher, err := process.NewOutputLineMatcher(sw.OnlineSignal)
	if err != nil {
		return nil, nil, errors.Wrapf(err, "failed to create output line matcher for the start configuration: %s", sw.OnlineSignal)
	}

	// Convert software, blueprint, and optional request override patches
	// to config file patches (overrides merge/override when applied last).
	var overrideConfigs map[string]blueprint.ConfigFile
	if s.Overrides != nil && s.Overrides.Configs != nil {
		overrideConfigs = s.Overrides.Configs
	}
	configFiles, cfgErr := GetConfigFiles(sw, bp, overrideConfigs)

	// log any errors that occurred when converting configuration patches
	if cfgErr != nil {
		log.WithError(cfgErr).Warn("an error occurred while converting config patches for server " + s.Id())
	}

	pc := &process.ProcessConfiguration{
		Startup: struct {
			Done      []*process.OutputLineMatcher `json:"done"`
			StripAnsi bool                         `json:"strip_ansi"`
		}{
			Done:      []*process.OutputLineMatcher{matcher},
			StripAnsi: false,
		},
		Stop: process.ProcessStopConfiguration{
			Type:  "command",
			Value: sw.StopCommand,
		},
		ConfigurationFiles: configFiles,
	}

	// Handle Overrides
	persists := bp.Persists
	// We need to make a copy of the limits so we don't mutate the blueprints default limits
	limits := environment.CopyLimits(bp.Server.Limits)
	if s.Overrides != nil {
		if s.Overrides.Persists != nil {
			persists = *s.Overrides.Persists
		}
		limits = environment.MergeLimits(limits, s.Overrides.Limits)
	}
	resolvedLimits, err := environment.ResolveLimits(limits)
	if err != nil {
		return nil, nil, errors.Wrap(err, "failed to resolve server limits")
	}

	image := bp.Server.Image
	if s.Overrides != nil && s.Overrides.Image != nil {
		image = *s.Overrides.Image
	}
	// If no explicit image is set on the blueprint or via overrides,
	// fall back to the software's image mappings selection.
	if image == "" {
		selectedImage, err := sw.ImageForVersion(effectiveVersion)
		if err != nil {
			return nil, nil, errors.Wrapf(err, "failed to select image for version %s", effectiveVersion)
		}
		image = selectedImage
	}

	var env map[string]string
	if s.Overrides != nil {
		env = s.Overrides.Env
	}
	effectiveState := blueprint.MergeState(bp.State, env)

	cfg := models.ServerConfiguration{
		Id:                   s.Id(),
		ProcessConfiguration: pc,
		Image:                image,
		Invocation:           sw.Invocation,
		Limits:               resolvedLimits,
		State:                resolvedState(effectiveState),
		ServerFolder:         serverFolder,
		Allocations:          alloc,
		Persists:             persists,
		SoftwareId:           sw.Id,
		SoftwareVersion:      effectiveVersion,
		HasInstallScript:     sw.InstallScript.Script != "",
		SkipInstallScript:    sw.InstallScript.SkipScripts,
	}

	installScript := sw.InstallScript
	return &cfg, &installScript, nil
}

func resolvedState(in *blueprint.State) api.State {
	if in == nil {
		return api.State{}
	}
	out := api.State{}
	if len(in.Env) > 0 {
		out.Env = maps.Clone(in.Env)
	}
	if len(in.Volumes) > 0 {
		out.Volumes = make([]api.Volume, len(in.Volumes))
		for i, v := range in.Volumes {
			out.Volumes[i] = api.Volume{
				Name:     v.Name,
				Artifact: v.Artifact,
				Source:   v.Source,
				Path:     v.Path,
				Target:   v.Target,
				Mode:     api.VolumeMode(v.Mode),
			}
		}
	}
	if len(in.Mounts) > 0 {
		out.Mounts = make([]api.Mount, len(in.Mounts))
		for i, m := range in.Mounts {
			out.Mounts[i] = api.Mount{Target: m.Target, Source: m.Source, ReadOnly: m.ReadOnly}
		}
	}
	if len(in.Copy) > 0 {
		out.Copy = make([]api.Copy, len(in.Copy))
		for i, c := range in.Copy {
			out.Copy[i] = api.Copy{Source: c.Source, Target: c.Target}
		}
	}
	return out
}
