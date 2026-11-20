//go:build linux

package system

import (
	"context"
	"fmt"
	"os"
	"runtime"
	"strings"

	"github.com/acobaugh/osrelease"
	"github.com/docker/docker/api/types"
	"github.com/docker/docker/api/types/system"
	"github.com/docker/docker/client"
	"github.com/docker/docker/pkg/parsers/kernel"
	"golang.org/x/sys/unix"
	"protoxon.com/sls/internal/api"
	"protoxon.com/sls/internal/version"
)

// DefaultTCPCC returns the default TCP congestion control algorithm on Linux.
// If reading fails, it returns "unknown".
func DefaultTCPCC() string {
	data, err := os.ReadFile("/proc/sys/net/ipv4/tcp_congestion_control")
	if err != nil {
		return "unknown"
	}
	return strings.TrimSpace(string(data))
}

func HasCapSysAdmin() (bool, error) {
	var hdr unix.CapUserHeader
	var data unix.CapUserData

	hdr.Version = unix.LINUX_CAPABILITY_VERSION_3
	hdr.Pid = 0

	if err := unix.Capget(&hdr, &data); err != nil {
		return false, fmt.Errorf("capget failed: %w", err)
	}

	const CapSysAdmin = 21
	mask := uint32(1) << (CapSysAdmin % 32)
	effective := data.Effective & mask

	return effective != 0, nil
}

type Information = api.HostInformation
type DockerInformation = api.DockerInformation
type DockerCgroups = api.DockerCgroups
type DockerContainers = api.DockerContainers
type DockerStorage = api.DockerStorage
type DockerRunc = api.DockerRunc
type System = api.System

func GetSystemInformation() (*Information, error) {
	k, err := kernel.GetKernelVersion()
	if err != nil {
		return nil, err
	}

	dockerVersion, info, err := GetDockerInfo(context.Background())
	if err != nil {
		return nil, err
	}

	release, err := osrelease.Read()
	if err != nil {
		return nil, err
	}

	var os string
	if release["PRETTY_NAME"] != "" {
		os = release["PRETTY_NAME"]
	} else if release["NAME"] != "" {
		os = release["NAME"]
	} else {
		os = info.OperatingSystem
	}

	var filesystem string
	for _, v := range info.DriverStatus {
		if v[0] != "Backing Filesystem" {
			continue
		}
		filesystem = v[1]
		break
	}

	return &Information{
		Version: version.Version,
		Docker: DockerInformation{
			Version: dockerVersion.Version,
			Cgroups: DockerCgroups{
				Driver:  info.CgroupDriver,
				Version: info.CgroupVersion,
			},
			Containers: DockerContainers{
				Total:   info.Containers,
				Running: info.ContainersRunning,
				Paused:  info.ContainersPaused,
				Stopped: info.ContainersStopped,
			},
			Storage: DockerStorage{
				Driver:     info.Driver,
				Filesystem: filesystem,
			},
			Runc: DockerRunc{
				Version: info.RuncCommit.ID,
			},
		},
		System: System{
			Architecture:  runtime.GOARCH,
			CPUThreads:    runtime.NumCPU(),
			MemoryBytes:   info.MemTotal,
			KernelVersion: k.String(),
			OS:            os,
			OSType:        runtime.GOOS,
		},
	}, nil
}

func GetDockerInfo(ctx context.Context) (types.Version, system.Info, error) {
	// TODO: find a way to re-use the client from the docker environment.
	c, err := client.NewClientWithOpts(client.FromEnv, client.WithAPIVersionNegotiation())
	if err != nil {
		return types.Version{}, system.Info{}, err
	}
	defer c.Close()

	dockerVersion, err := c.ServerVersion(ctx)
	if err != nil {
		return types.Version{}, system.Info{}, err
	}

	dockerInfo, err := c.Info(ctx)
	if err != nil {
		return types.Version{}, system.Info{}, err
	}

	return dockerVersion, dockerInfo, nil
}
