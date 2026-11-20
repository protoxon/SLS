package models

import "protoxon.com/sls/internal/api"

// ServerConfiguration is the runtime document fetched from Controller.
type ServerConfiguration = api.ServerConfiguration

type State = api.State
type Copy = api.Copy
type Volume = api.Volume
type VolumeMode = api.VolumeMode

const (
	VolumeModeCOW = api.VolumeModeCOW
	VolumeModeRO  = api.VolumeModeRO
	VolumeModeRW  = api.VolumeModeRW
)
