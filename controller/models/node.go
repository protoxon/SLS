package models

import "protoxon.com/sls/internal/api"

type NodeData = api.NodeData
type NodeRegistration = api.NodeRegistration
type NodeRegistrationResponse = api.NodeRegistrationResponse
type HeartbeatResponse = api.HeartbeatResponse
type Allocation = api.Allocation
type DockerInformation = api.DockerInformation
type DockerCgroups = api.DockerCgroups
type DockerContainers = api.DockerContainers
type DockerStorage = api.DockerStorage
type DockerRunc = api.DockerRunc
type System = api.System
type Information = api.HostInformation

type NodeState struct {
	Id      string `gorm:"primaryKey"`
	Drained bool   `gorm:"not null;default:false"`
}
