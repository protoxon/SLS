package api

import (
	"bytes"
	"encoding/json"
	"fmt"
	"strings"
)

// formatGlobalEvent turns one global event websocket frame into a single line.
// Status, crash, deletion, and install match the messages vSLS shows in debug mode.
func formatGlobalEvent(payload []byte) string {
	var ev struct {
		Topic string          `json:"Topic"`
		Data  json.RawMessage `json:"Data"`
	}
	if err := json.Unmarshal(payload, &ev); err != nil || ev.Topic == "" {
		return strings.TrimSpace(string(payload))
	}
	id, body := eventBody(ev.Data)
	switch ev.Topic {
	case "status":
		return fmt.Sprintf("[DEBUG] Server (%s) changed status to: %s", id, statusText(body))
	case "crash":
		if line, ok := formatCrash(id, body); ok {
			return line
		}
	case "deleted":
		return fmt.Sprintf("Server %s was deleted", id)
	case "install":
		return fmt.Sprintf("[DEBUG] Server (%s) install changed to: %s", id, statusText(body))
	}
	extra := compactJSON(ev.Data)
	if extra == "" {
		return ev.Topic
	}
	return ev.Topic + " " + extra
}

func eventBody(data json.RawMessage) (string, json.RawMessage) {
	var body struct {
		ServerID string          `json:"server_id"`
		Payload  json.RawMessage `json:"payload"`
	}
	if err := json.Unmarshal(data, &body); err != nil {
		return "", bytes.TrimSpace(data)
	}
	return body.ServerID, body.Payload
}

func statusText(payload json.RawMessage) string {
	if text, ok := jsonString(payload); ok {
		return text
	}
	var obj map[string]any
	if err := json.Unmarshal(payload, &obj); err == nil {
		for _, key := range []string{"value", "status"} {
			if text, ok := obj[key].(string); ok {
				return text
			}
		}
	}
	if text := compactJSON(payload); text != "" {
		return text
	}
	return ""
}

func formatCrash(id string, payload json.RawMessage) (string, bool) {
	var crash struct {
		Reason    string `json:"reason"`
		ExitCode  *int   `json:"exit_code"`
		Timestamp string `json:"timestamp"`
	}
	if err := json.Unmarshal(payload, &crash); err != nil {
		return "", false
	}
	if crash.Reason == "" && crash.ExitCode == nil && crash.Timestamp == "" {
		return "", false
	}
	code := 0
	if crash.ExitCode != nil {
		code = *crash.ExitCode
	}
	return fmt.Sprintf("Server %s crashed: Reason=%s, ExitCode=%d, Timestamp=%s", id, crash.Reason, code, crash.Timestamp), true
}

func jsonString(raw json.RawMessage) (string, bool) {
	raw = bytes.TrimSpace(raw)
	if len(raw) == 0 || string(raw) == "null" {
		return "", false
	}
	var text string
	if err := json.Unmarshal(raw, &text); err != nil {
		return "", false
	}
	return text, true
}

func compactJSON(raw json.RawMessage) string {
	raw = bytes.TrimSpace(raw)
	if len(raw) == 0 || string(raw) == "null" {
		return ""
	}
	var buf bytes.Buffer
	if err := json.Compact(&buf, raw); err != nil {
		return string(raw)
	}
	return buf.String()
}
