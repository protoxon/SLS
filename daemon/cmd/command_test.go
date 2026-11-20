package cmd

import (
	"strings"
	"testing"
)

func TestPrivilegeNotice(t *testing.T) {
	notice := privilegeNotice("run")
	if !strings.Contains(notice, "Error: Insufficient Privileges") {
		t.Fatalf("notice = %s", notice)
	}
	if !strings.Contains(notice, "Run with sudo or grant the CAP_SYS_ADMIN capability: sudo sls run") {
		t.Fatalf("notice = %s", notice)
	}
	daemon := privilegeNotice("run daemon")
	if !strings.Contains(daemon, "sudo sls run daemon") {
		t.Fatalf("notice = %s", daemon)
	}
	if strings.Contains(daemon, "sudo sls run\n") {
		t.Fatal("daemon notice named the combined run command")
	}
}
