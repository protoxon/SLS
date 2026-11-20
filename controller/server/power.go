package server

import "protoxon.com/sls/internal/process"

// Status is the server power state string
// (environment.ProcessOfflineState, ProcessStartingState, etc.).
type Status = string

// Process state constants matching daemon/environment:
// ProcessOfflineState, ProcessStartingState, ProcessRunningState, ProcessStoppingState.
// ProcessUnknownState is set by Controller when the node disconnects and the
// process state can no longer be observed.
const (
	ProcessOfflineState  = process.Offline
	ProcessStartingState = process.Starting
	ProcessRunningState  = process.Running
	ProcessStoppingState = process.Stopping
	ProcessUnknownState  = process.Unknown
)
