package server

import (
	"emperror.dev/errors"
	"protoxon.com/sls/daemon/system"
)

var (
	ErrIsRunning = system.ExpectedError(errors.NewPlain("server is running"))
	ErrIsPaused  = system.ExpectedError(errors.NewPlain("server is paused"))
	ErrSuspended                = errors.New("server is currently in a suspended state")
	ErrInvalidServerConfig          = errors.Sentinel("invalid server configuration")
	ErrServerFolderNotFound         = errors.Sentinel("server folder not found")
	ErrInstalledServerArtifactInUse = errors.New("servers are currently using the installed server artifact")
)

type crashTooFrequent struct{}

func (e *crashTooFrequent) Error() string {
	return "server has crashed too soon after the last detected crash"
}

func IsTooFrequentCrashError(err error) bool {
	_, ok := err.(*crashTooFrequent)

	return ok
}

type serverDoesNotExist struct{}

func (e *serverDoesNotExist) Error() string {
	return "server does not exist on remote system"
}

func IsServerDoesNotExistError(err error) bool {
	_, ok := err.(*serverDoesNotExist)

	return ok
}
