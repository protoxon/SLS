package message

import (
	"fmt"
	"time"

	"github.com/mitchellh/colorstring"
	"protoxon.com/sls/internal/version"
)

// Start prints the SLS banner. name is the application shown beside the
// version, such as "Controller" or "Daemon". An empty name prints the version alone.
func Start(name string) {
	logo := fmt.Sprintf(`
[green]  ___ _    ___
[green] / __| |  / __|[red] %s
[green] \__ \ |__\__ \[dark_gray] Server Launch System
[green] |___/____|___/[light_blue] Copyright © 2022 - %d [magenta]%s

[light_blue]Website: [reset]https://protoxon.com
[light_blue] Source: [reset]https://github.com/protoxon/SLS
[light_blue]License: [reset]https://github.com/protoxon/SLS/blob/main/LICENSE

[light_blue]This software is made available under the terms of the [magenta]APGL-3.0[light_blue] license.
[light_blue]The above copyright notice and this permission notice shall be included
[light_blue]in all copies or substantial portions of the Software.

`, versionLabel(name), time.Now().Year(), version.Authors)

	fmt.Print(colorstring.Color(logo))
}

func versionLabel(name string) string {
	label := "v" + version.Version
	if name != "" {
		label = name + " " + label
	}
	return label
}
