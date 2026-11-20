package system

import shared "protoxon.com/sls/internal/system"

type SinkName = shared.SinkName

const (
	LogSink     = shared.LogSink
	InstallSink = shared.InstallSink
)

type SinkPool = shared.SinkPool

func NewSinkPool() *SinkPool { return shared.NewSinkPool() }
