package remote

import (
	"context"
	"fmt"
)

func (c *client) SetInstallationStatus(ctx context.Context, uuid string, phase string) error {
	_, err := Post[d](c, ctx, "/internal/event/servers/"+uuid+"/install-status", phase)
	return err
}

func (c *client) GetInstallationScript(ctx context.Context, id string) (InstallationScript, error) {
	var config InstallationScript
	res, err := Get[InstallationScript](c, ctx, fmt.Sprintf("/internal/servers/%s/install", id), nil)
	if err != nil {
		return config, err
	}
	return res, nil
}
