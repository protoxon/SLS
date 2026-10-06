package cmd

import (
	"fmt"
	"io"
	"math"
	"strconv"
	"strings"
	"time"

	"protoxon.com/api"
	"protoxon.com/oras/client"
	"protoxon.com/print"
)

func serverTable(servers []api.Server) print.Table {
	t := print.Table{Columns: []print.Column{
		{Header: "ID"},
		{Header: "BLUEPRINT"},
		{Header: "NODE"},
		{Header: "SOFTWARE"},
		{Header: "IMAGE"},
	}}
	for _, s := range servers {
		t.Rows = append(t.Rows, []string{
			s.ID,
			s.BlueprintID,
			nodeLabel(s.NodeName, s.NodeID),
			softwareLabel(s.SoftwareID, s.SoftwareVersion),
			s.Image,
		})
	}
	return t
}

type serverInfo struct {
	ID          string `json:"id"`
	Status      string `json:"status"`
	Blueprint   string `json:"blueprint"`
	BlueprintID string `json:"blueprint_id,omitempty"`
	Type        string `json:"type,omitempty"`
	Server      string `json:"server"`
	Node        string `json:"node"`
	CPU         string `json:"cpu"`
	Memory      string `json:"memory"`
	Uptime      string `json:"uptime"`
}

func infoView(info serverInfo) print.View {
	items := []print.Field{
		{Key: "Status", Value: info.Status, Status: true},
		{Key: "Blueprint", Value: info.Blueprint},
	}
	if info.Type != "" {
		items = append(items, print.Field{Key: "Type", Value: info.Type})
	}
	items = append(items,
		print.Field{Key: "Server", Value: info.Server},
		print.Field{Key: "Node", Value: info.Node},
		print.Field{Key: "Stats", Value: fmt.Sprintf("[Cpu: %s, Mem: %s]", info.CPU, info.Memory)},
		print.Field{Key: "Uptime", Value: info.Uptime},
	)
	return bulletFields{Items: items}
}

type bulletFields struct {
	Items []print.Field
}

func (f bulletFields) Render(w io.Writer, s *print.Style) error {
	for _, item := range f.Items {
		val := item.Value
		if item.Status {
			val = s.PaintStatus(val)
		}
		if _, err := fmt.Fprintf(w, " - %s: %s\n", s.PaintKey(item.Key), val); err != nil {
			return err
		}
	}
	return nil
}

func serverFields(s api.Server) print.Fields {
	return print.Fields{Items: []print.Field{
		{Key: "ID", Value: s.ID},
		{Key: "Blueprint", Value: s.BlueprintID},
		{Key: "Node", Value: nodeLabel(s.NodeName, s.NodeID)},
		{Key: "Node ID", Value: s.NodeID},
		{Key: "Software", Value: softwareLabel(s.SoftwareID, s.SoftwareVersion)},
		{Key: "Image", Value: s.Image},
	}}
}

func actionFields(server, action string) print.Fields {
	return print.Fields{Items: []print.Field{
		{Key: "Server", Value: server},
		{Key: "Action", Value: action},
	}}
}

type actionResult struct {
	Server string `json:"server,omitempty"`
	Node   string `json:"node,omitempty"`
	Action string `json:"action"`
	Force  bool   `json:"force,omitempty"`
}

func statusFields(st api.Status) print.Fields {
	return print.Fields{Items: []print.Field{
		{Key: "Status", Value: st.Status, Status: true},
	}}
}

func statsFields(s api.Stats) print.Fields {
	items := []print.Field{
		{Key: "State", Value: s.State, Status: true},
		{Key: "CPU", Value: fmt.Sprintf("%.1f%%", s.CPUAbsolute)},
		{Key: "Memory", Value: formatUintBytes(s.Memory) + " / " + formatUintBytes(s.MemoryLimit)},
		{Key: "Network in", Value: formatUintBytes(s.Network.RxBytes)},
		{Key: "Network out", Value: formatUintBytes(s.Network.TxBytes)},
		{Key: "Disk", Value: formatBytes(s.Disk) + " / " + formatBytes(s.MaxDisk)},
		{Key: "Overlay", Value: formatBytes(s.Overlay)},
		{Key: "Uptime", Value: formatUptime(s.Uptime)},
	}
	return print.Fields{Items: items}
}

func installFields(info api.InstallInfo) print.Fields {
	items := []print.Field{
		{Key: "Phase", Value: info.Phase},
		{Key: "Status", Value: info.Status, Status: true},
		{Key: "Container", Value: info.ContainerName},
		{Key: "Container ID", Value: info.ContainerID},
	}
	if info.ExitCode != nil {
		items = append(items, print.Field{Key: "Exit code", Value: strconv.FormatInt(*info.ExitCode, 10)})
	}
	if info.StartedAt != nil {
		items = append(items, print.Field{Key: "Started", Value: info.StartedAt.Local().Format(time.RFC3339)})
	}
	if info.FinishedAt != nil {
		items = append(items, print.Field{Key: "Finished", Value: info.FinishedAt.Local().Format(time.RFC3339)})
	}
	if info.FailureReason != "" {
		items = append(items, print.Field{Key: "Failure", Value: info.FailureReason})
	}
	return print.Fields{Items: items}
}

func blueprintTable(items []api.BlueprintSummary) print.Table {
	t := print.Table{Columns: []print.Column{
		{Header: "ID"},
		{Header: "NAME"},
		{Header: "TYPE"},
	}}
	for _, item := range items {
		t.Rows = append(t.Rows, []string{item.Meta.ID, item.Meta.Name, item.Meta.Type})
	}
	return t
}

func volumeTable(volumes []client.VolumeRef) print.Table {
	t := print.Table{Columns: []print.Column{
		{Header: "REPOSITORY"},
		{Header: "TAG"},
		{Header: "DIGEST"},
	}}
	for _, v := range volumes {
		t.Rows = append(t.Rows, []string{v.Repository, v.Tag, v.Digest.String()})
	}
	return t
}

func mixinTable(items []api.MixinSummary) print.Table {
	t := print.Table{Columns: []print.Column{
		{Header: "ID"},
		{Header: "DESCRIPTION"},
	}}
	for _, item := range items {
		t.Rows = append(t.Rows, []string{item.Meta.ID, item.Meta.Description})
	}
	return t
}

func nodeTable(nodes []api.Node) print.Table {
	t := print.Table{Columns: []print.Column{
		{Header: "ID"},
		{Header: "NAME"},
		{Header: "LOCATION"},
		{Header: "DRAINED"},
	}}
	for _, n := range nodes {
		t.Rows = append(t.Rows, []string{n.ID, n.Name, n.Location, strconv.FormatBool(n.Drained)})
	}
	return t
}

func nodeFields(d api.NodeDetails) print.Fields {
	items := []print.Field{
		{Key: "ID", Value: d.ID},
		{Key: "Name", Value: d.Name},
		{Key: "Location", Value: d.Location},
		{Key: "URL", Value: d.URL},
		{Key: "Drained", Value: strconv.FormatBool(d.Drained)},
		{Key: "Version", Value: d.Version},
		{Key: "Architecture", Value: d.System.Architecture},
		{Key: "CPU threads", Value: strconv.Itoa(d.System.CPUThreads)},
		{Key: "Memory", Value: formatBytes(d.System.MemoryBytes)},
		{Key: "Kernel", Value: d.System.KernelVersion},
		{Key: "OS", Value: d.System.OS},
		{Key: "OS type", Value: d.System.OSType},
	}
	if d.Docker != nil {
		items = append(items,
			print.Field{Key: "Docker", Value: d.Docker.Version},
			print.Field{Key: "Cgroup", Value: strings.TrimSpace(d.Docker.Cgroups.Driver + " " + d.Docker.Cgroups.Version)},
			print.Field{Key: "Containers", Value: fmt.Sprintf("%d running, %d paused, %d stopped (%d total)", d.Docker.Containers.Running, d.Docker.Containers.Paused, d.Docker.Containers.Stopped, d.Docker.Containers.Total)},
			print.Field{Key: "Storage", Value: strings.TrimSpace(d.Docker.Storage.Driver + " " + d.Docker.Storage.Filesystem)},
			print.Field{Key: "Runc", Value: d.Docker.Runc.Version},
		)
	}
	return print.Fields{Items: items}
}

func systemFields(info api.SystemInformation) print.Fields {
	return print.Fields{Items: []print.Field{
		{Key: "Version", Value: info.Version},
		{Key: "Architecture", Value: info.System.Architecture},
		{Key: "CPU threads", Value: strconv.Itoa(info.System.CPUThreads)},
		{Key: "Memory", Value: formatBytes(info.System.MemoryBytes)},
		{Key: "Kernel", Value: info.System.KernelVersion},
		{Key: "OS", Value: info.System.OS},
		{Key: "OS type", Value: info.System.OSType},
	}}
}

func nodeLabel(name, id string) string {
	if name != "" {
		return name
	}
	return id
}

func nodeInfoLabel(name, id string) string {
	short := id
	if len(short) > 8 {
		short = short[:8]
	}
	if name == "" {
		return short
	}
	if short == "" {
		return name
	}
	return name + " " + short
}

func softwareLabel(id, version string) string {
	switch {
	case id == "":
		return version
	case version == "":
		return id
	default:
		return id + " " + version
	}
}

func formatUptime(ms int64) string {
	if ms < 0 {
		return "0s"
	}
	total := ms / 1000
	days := total / 86400
	hours := (total % 86400) / 3600
	minutes := (total % 3600) / 60
	seconds := total % 60
	var b strings.Builder
	if days > 0 {
		fmt.Fprintf(&b, "%dd ", days)
	}
	if hours > 0 {
		fmt.Fprintf(&b, "%dh ", hours)
	}
	if minutes > 0 {
		fmt.Fprintf(&b, "%dm ", minutes)
	}
	fmt.Fprintf(&b, "%ds", seconds)
	return b.String()
}

func formatPercent(v float64) string {
	return fmt.Sprintf("%.2f%%", v)
}

func memoryPercent(used, limit uint64) string {
	if limit == 0 {
		return "0.00%"
	}
	return formatPercent(float64(used) / float64(limit) * 100)
}

func formatUintBytes(n uint64) string {
	if n > math.MaxInt64 {
		return strconv.FormatUint(n, 10) + " B"
	}
	return formatBytes(int64(n))
}

func formatBytes(n int64) string {
	if n < 0 {
		n = 0
	}
	const unit = 1024
	if n < unit {
		return fmt.Sprintf("%d B", n)
	}
	div, exp := int64(unit), 0
	for v := n / unit; v >= unit && exp < len("KMGTPE")-1; v /= unit {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.1f %ciB", float64(n)/float64(div), "KMGTPE"[exp])
}
