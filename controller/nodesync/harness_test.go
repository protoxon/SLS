package nodesync

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"sync"
	"testing"
	"time"

	"github.com/apex/log"
	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/grokify/coreforge/identity/apikey"
	crouter "protoxon.com/sls/controller/api/router"
	cauth "protoxon.com/sls/controller/auth"
	"protoxon.com/sls/controller/auth/scope"
	"protoxon.com/sls/controller/blueprint"
	"protoxon.com/sls/controller/client"
	cconfig "protoxon.com/sls/controller/config"
	"protoxon.com/sls/controller/environment"
	"protoxon.com/sls/controller/internal/database"
	"protoxon.com/sls/controller/node"
	cserver "protoxon.com/sls/controller/server"
	"protoxon.com/sls/controller/server/repository"
	"protoxon.com/sls/controller/software"
	dauth "protoxon.com/sls/daemon/api/auth"
	drouter "protoxon.com/sls/daemon/api/router"
	dconfig "protoxon.com/sls/daemon/config"
	"protoxon.com/sls/daemon/remote"
	dserver "protoxon.com/sls/daemon/server"
	"protoxon.com/sls/internal/api"
)

const (
	// converge is how long a test waits for the controller and node to agree.
	// A fix that reconciles on a timer needs an interval below this in tests.
	converge = 4 * time.Second
	poll     = 150 * time.Millisecond

	softwareID = "paper"
	baseFolder = "paper/1"
)

var docker = newFakeDocker()

func TestMain(m *testing.M) {
	gin.SetMode(gin.TestMode)
	log.SetLevel(log.FatalLevel)

	dockerAPI := httptest.NewServer(docker)
	os.Setenv("DOCKER_HOST", "tcp://"+strings.TrimPrefix(dockerAPI.URL, "http://"))
	os.Unsetenv("DOCKER_TLS_VERIFY")
	os.Unsetenv("DOCKER_CERT_PATH")

	root, err := os.MkdirTemp("", "nodesync-controller-")
	if err != nil {
		panic(err)
	}
	cconfig.SetForTest(&cconfig.Configuration{
		System:   cconfig.SystemConfiguration{RootDirectory: root},
		Registry: cconfig.RegistryConfiguration{Storage: filepath.Join(root, "registry")},
	})
	if err := database.Initialize(); err != nil {
		panic(err)
	}
	code := m.Run()

	dockerAPI.Close()
	_ = os.RemoveAll(root)
	os.Exit(code)
}

// fakeDocker is the subset of the Docker Engine API the daemon calls to
// inspect and remove a server container. Every other call fails.
type fakeDocker struct {
	mu         sync.Mutex
	containers map[string]bool
}

var containerPath = regexp.MustCompile(`^(?:/v[0-9.]+)?/containers/([^/]+)(/[a-z]+)?$`)

func newFakeDocker() *fakeDocker {
	return &fakeDocker{containers: map[string]bool{}}
}

func (d *fakeDocker) run(id string) {
	d.mu.Lock()
	defer d.mu.Unlock()
	d.containers[id] = true
}

func (d *fakeDocker) exists(id string) bool {
	d.mu.Lock()
	defer d.mu.Unlock()
	_, ok := d.containers[id]
	return ok
}

func (d *fakeDocker) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Api-Version", "1.44")
	w.Header().Set("Ostype", "linux")
	if strings.HasSuffix(r.URL.Path, "/_ping") {
		w.WriteHeader(http.StatusOK)
		return
	}
	m := containerPath.FindStringSubmatch(r.URL.Path)
	if m == nil {
		dockerError(w, http.StatusInternalServerError, "fake docker does not support "+r.Method+" "+r.URL.Path)
		return
	}
	id, action := m[1], m[2]
	d.mu.Lock()
	running, ok := d.containers[id]
	d.mu.Unlock()
	switch {
	case r.Method == http.MethodGet && action == "/json":
		if !ok {
			dockerError(w, http.StatusNotFound, "No such container: "+id)
			return
		}
		status := "exited"
		if running {
			status = "running"
		}
		w.Header().Set("Content-Type", "application/json")
		_ = json.NewEncoder(w).Encode(map[string]any{
			"Id":     id,
			"Name":   "/" + id,
			"State":  map[string]any{"Status": status, "Running": running},
			"Config": map[string]any{},
		})
	case r.Method == http.MethodDelete && action == "":
		if !ok {
			dockerError(w, http.StatusNotFound, "No such container: "+id)
			return
		}
		d.mu.Lock()
		delete(d.containers, id)
		d.mu.Unlock()
		w.WriteHeader(http.StatusNoContent)
	default:
		dockerError(w, http.StatusInternalServerError, "fake docker does not support "+r.Method+" "+r.URL.Path)
	}
}

func dockerError(w http.ResponseWriter, code int, msg string) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	_ = json.NewEncoder(w).Encode(map[string]string{"message": msg})
}

// faultProxy forwards HTTP traffic to a target and injects network faults
// on matching requests. Rules stay active until cleared because Go's
// transport retries an idempotent request once on a reused connection.
type faultProxy struct {
	srv *httptest.Server

	mu      sync.Mutex
	target  string
	rules   []rule
	creates []string
	seen    []string
	pending sync.WaitGroup
	done    chan struct{}
}

type rule struct {
	method string
	path   *regexp.Regexp
	fault  fault
}

type fault func(p *faultProxy, w http.ResponseWriter, r *http.Request, body []byte)

func newFaultProxy(target string) *faultProxy {
	p := &faultProxy{target: target, done: make(chan struct{})}
	p.srv = httptest.NewServer(p)
	return p
}

func (p *faultProxy) URL() string { return p.srv.URL }

func (p *faultProxy) close() {
	close(p.done)
	p.pending.Wait()
	p.srv.Close()
}

// saw reports whether a request with this method and path reached the proxy.
func (p *faultProxy) saw(method, path string) bool {
	p.mu.Lock()
	defer p.mu.Unlock()
	for _, s := range p.seen {
		if s == method+" "+path {
			return true
		}
	}
	return false
}

func (p *faultProxy) retarget(target string) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.target = target
}

func (p *faultProxy) on(method, pathPattern string, f fault) {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.rules = append(p.rules, rule{method: method, path: regexp.MustCompile(pathPattern), fault: f})
}

func (p *faultProxy) clear() {
	p.mu.Lock()
	defer p.mu.Unlock()
	p.rules = nil
}

// createdIDs returns the server ids of every create request that reached
// the proxy, including ones that were never delivered.
func (p *faultProxy) createdIDs() []string {
	p.mu.Lock()
	defer p.mu.Unlock()
	return append([]string(nil), p.creates...)
}

func (p *faultProxy) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	body, _ := io.ReadAll(r.Body)
	p.mu.Lock()
	p.seen = append(p.seen, r.Method+" "+r.URL.Path)
	if r.Method == http.MethodPost && r.URL.Path == "/api/servers" {
		var cfg struct {
			ID string `json:"id"`
		}
		if json.Unmarshal(body, &cfg) == nil && cfg.ID != "" {
			p.creates = append(p.creates, cfg.ID)
		}
	}
	var f fault
	for _, rl := range p.rules {
		if rl.method == r.Method && rl.path.MatchString(r.URL.Path) {
			f = rl.fault
			break
		}
	}
	p.mu.Unlock()
	if f == nil {
		f = pass
	}
	f(p, w, r, body)
}

func (p *faultProxy) forward(ctx context.Context, r *http.Request, body []byte) (*http.Response, []byte, error) {
	p.mu.Lock()
	target := p.target
	p.mu.Unlock()
	req, err := http.NewRequestWithContext(ctx, r.Method, target+r.URL.RequestURI(), bytes.NewReader(body))
	if err != nil {
		return nil, nil, err
	}
	req.Header = r.Header.Clone()
	res, err := http.DefaultClient.Do(req)
	if err != nil {
		return nil, nil, err
	}
	defer res.Body.Close()
	out, err := io.ReadAll(res.Body)
	return res, out, err
}

// pass forwards the request and relays the response.
func pass(p *faultProxy, w http.ResponseWriter, r *http.Request, body []byte) {
	res, out, err := p.forward(r.Context(), r, body)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadGateway)
		return
	}
	for k, v := range res.Header {
		w.Header()[k] = v
	}
	w.WriteHeader(res.StatusCode)
	_, _ = w.Write(out)
}

// reset accepts the request and closes the connection without delivering
// it or answering, like a peer that crashes mid-request.
func reset(_ *faultProxy, w http.ResponseWriter, _ *http.Request, _ []byte) {
	hangUp(w)
}

// respond answers with status without delivering the request.
func respond(status int) fault {
	return func(_ *faultProxy, w http.ResponseWriter, _ *http.Request, _ []byte) {
		w.Header().Set("Content-Type", "application/json")
		w.WriteHeader(status)
		_ = json.NewEncoder(w).Encode(map[string]string{"error": http.StatusText(status), "detail": "injected fault"})
	}
}

// loseResponse delivers the request, waits for it to finish, and then closes
// the connection so the caller never sees the answer.
func loseResponse(p *faultProxy, w http.ResponseWriter, r *http.Request, body []byte) {
	_, _, _ = p.forward(context.WithoutCancel(r.Context()), r, body)
	hangUp(w)
}

// deliverLate closes the caller's connection at once and delivers the
// request only after release is closed, like a request stuck in a queue
// that the receiver processes after the sender gave up.
func deliverLate(release <-chan struct{}) fault {
	return func(p *faultProxy, w http.ResponseWriter, r *http.Request, body []byte) {
		ctx := context.WithoutCancel(r.Context())
		req := r.Clone(ctx)
		p.pending.Add(1)
		go func() {
			defer p.pending.Done()
			select {
			case <-release:
				_, _, _ = p.forward(ctx, req, body)
			case <-p.done:
			}
		}()
		hangUp(w)
	}
}

func hangUp(w http.ResponseWriter) {
	conn, _, err := http.NewResponseController(w).Hijack()
	if err != nil {
		panic(err)
	}
	_ = conn.Close()
}

// cluster is one controller and one daemon talking over real HTTP. All
// controller-to-daemon traffic passes through toNode and all
// daemon-to-controller traffic passes through toController.
type cluster struct {
	t       *testing.T
	nodeID  string
	nodeKey string
	userKey string

	servers    *cserver.Manager
	nodes      *node.Manager
	blueprints *blueprint.BlueprintRegistry
	api        *httptest.Server

	toController *faultProxy
	toNode       *faultProxy

	daemonRoot string
	daemon     *dserver.Manager
	remote     remote.Client
	daemonAPI  *httptest.Server
	syncErr    error
	syncMu     sync.Mutex
}

func newCluster(t *testing.T) *cluster {
	t.Helper()
	c := &cluster{t: t, nodeID: uuid.NewString()}

	keys := cauth.NewKeyServiceWithStore(cauth.NewMemoryStore())
	c.nodeKey = createKey(t, keys, "node", []string{scope.Node})
	c.userKey = createKey(t, keys, "user", []string{scope.ServersRead, scope.ServersWrite})

	c.nodes = node.NewManager(client.New(client.WithHTTPClient(&http.Client{Timeout: 500 * time.Millisecond})))
	servers, err := cserver.NewManager(c.nodes)
	if err != nil {
		t.Fatal(err)
	}
	c.servers = servers
	c.nodes.SetOnNodeRegistered(func(id string, n *node.Node) {
		c.servers.AttachNodeClientToServers(id, n)
	})
	c.nodes.SetOnNodeDisconnected(func(id string, timedOut bool) {
		if timedOut {
			c.servers.DetachNodeClientFromServers(id)
			return
		}
		c.servers.DeferUnknownStatus(id)
	})

	sw := software.NewRegistry()
	sw.Register(&software.Software{Id: softwareID, Invocation: "java", StopCommand: "stop", OnlineSignal: "Done"})
	mem := int64(1024)
	c.blueprints = blueprint.NewBlueprintRegistry()
	c.blueprints.Register(&blueprint.Blueprint{
		Meta:     blueprint.Meta{ID: "bp"},
		Persists: true,
		Server: &blueprint.Server{
			Software: softwareID,
			Version:  "1",
			Image:    "img",
			Path:     baseFolder,
			Limits:   &environment.Limits{MemoryLimit: &mem},
		},
	})
	rt := crouter.New(&crouter.Resources{
		ServerManager:     c.servers,
		BlueprintRegistry: c.blueprints,
		MixinRegistry:     blueprint.NewMixinRegistry(),
		SoftwareRegistry:  sw,
		NodeManager:       c.nodes,
		KeyService:        keys,
	})
	c.api = httptest.NewServer(rt.Handler)
	c.toController = newFaultProxy(c.api.URL)
	c.toNode = newFaultProxy("")

	c.daemonRoot = t.TempDir()
	for _, dir := range []string{"data", "volumes", "snapshots", "tmp", filepath.Join("servers", baseFolder)} {
		if err := os.MkdirAll(filepath.Join(c.daemonRoot, dir), 0o755); err != nil {
			t.Fatal(err)
		}
	}
	if err := os.WriteFile(filepath.Join(c.daemonRoot, "servers", baseFolder, "server.jar"), []byte("jar"), 0o644); err != nil {
		t.Fatal(err)
	}
	cfg := &dconfig.Configuration{
		Uuid:     c.nodeID,
		Name:     "node-" + c.nodeID[:8],
		Location: "main",
		System: dconfig.SystemConfiguration{
			RootDirectory: c.daemonRoot,
			Data:          filepath.Join(c.daemonRoot, "data"),
			Servers:       filepath.Join(c.daemonRoot, "servers"),
			Volumes:       filepath.Join(c.daemonRoot, "volumes"),
			Snapshots:     filepath.Join(c.daemonRoot, "snapshots"),
			TmpDirectory:  filepath.Join(c.daemonRoot, "tmp"),
		},
		Api:         dconfig.ApiConfiguration{Url: c.toNode.URL()},
		Allocations: []dconfig.Allocation{{Address: "127.0.0.1", Alias: "127.0.0.1", Ports: "25565-25575"}},
		RemoteApi:   dconfig.RemoteApi{Url: c.toController.URL(), Token: c.nodeKey},
		RemoteQuery: dconfig.RemoteQueryConfiguration{BootServersPerPage: 50},
	}
	cfg.System.User.Uid = os.Getuid()
	cfg.System.User.Gid = os.Getgid()
	dconfig.Set(cfg)

	t.Cleanup(func() {
		c.toNode.close()
		c.toController.close()
		if c.daemonAPI != nil {
			c.daemonAPI.Close()
		}
		c.api.Close()
	})

	c.startDaemon()
	return c
}

func createKey(t *testing.T, keys *cauth.KeyService, name string, scopes []string) string {
	t.Helper()
	org := uuid.Nil
	gen, err := keys.Create(context.Background(), apikey.CreateKeyRequest{
		Name:           name,
		OwnerID:        uuid.New(),
		OrganizationID: &org,
		Scopes:         scopes,
		Environment:    apikey.EnvLive,
	})
	if err != nil {
		t.Fatal(err)
	}
	return gen.Key
}

// startDaemon boots a fresh daemon process for this node: an empty live
// server set, then register with the controller, which runs the same
// on-connect sync as daemon/cmd/root.go.
func (c *cluster) startDaemon() {
	c.t.Helper()
	if c.daemonAPI != nil {
		c.daemonAPI.Close()
	}
	rc := remote.New(c.toController.URL(),
		remote.WithCredentials(c.nodeKey),
		remote.WithHttpClient(&http.Client{Timeout: 2 * time.Second}),
	)
	m := dserver.NewManager(rc)
	rc.SetVolumeStore(m.VolumeStore())
	rc.SetOnConnected(func(ctx context.Context) {
		m.ReportStates(ctx)
		_ = rc.SyncRegistry(ctx)
		err := m.Sync(context.Background())
		c.syncMu.Lock()
		c.syncErr = err
		c.syncMu.Unlock()
	})
	c.daemon = m
	c.remote = rc
	c.daemonAPI = httptest.NewServer(drouter.New(&drouter.Resources{
		ServerManager: m,
		VerifyToken:   dauth.Verify,
	}).Configure())
	c.toNode.retarget(c.daemonAPI.URL)
	c.reconnect()
}

// reconnect drops the daemon's controller session with one failed heartbeat
// and registers again, as after a network blip.
func (c *cluster) reconnect() {
	c.t.Helper()
	c.toController.on(http.MethodPost, `.*`, respond(http.StatusBadRequest))
	c.remote.Heartbeat(context.Background())
	c.toController.clear()
	if err := c.remote.Register(context.Background()); err != nil {
		c.t.Fatalf("register: %v", err)
	}
	c.syncMu.Lock()
	err := c.syncErr
	c.syncMu.Unlock()
	if err != nil {
		c.t.Fatalf("on-connect sync: %v", err)
	}
	n, ok := c.nodes.Get(c.nodeID)
	if !ok {
		c.t.Fatal("node did not register with the controller")
	}
	n.SetMetrics(api.NodeMetrics{
		Timestamp: time.Now().Unix(),
		Complete:  true,
		Memory:    api.MemoryMetrics{AvailableBytes: 32 << 30},
		Disk:      api.DiskMetrics{AvailableBytes: 50 << 30},
	})
}

// hideBaseFolder makes every server of this software fail to load until the
// returned function restores the folder, like a servers share that is not
// mounted yet when the daemon boots.
func (c *cluster) hideBaseFolder() (restore func()) {
	c.t.Helper()
	dir := filepath.Join(c.daemonRoot, "servers", softwareID)
	if err := os.Rename(dir, dir+".offline"); err != nil {
		c.t.Fatal(err)
	}
	return func() {
		if err := os.Rename(dir+".offline", dir); err != nil {
			c.t.Fatal(err)
		}
	}
}

func (c *cluster) do(method, path string, body any) (int, []byte) {
	c.t.Helper()
	var rdr io.Reader
	if body != nil {
		data, err := json.Marshal(body)
		if err != nil {
			c.t.Fatal(err)
		}
		rdr = bytes.NewReader(data)
	}
	req, err := http.NewRequest(method, c.api.URL+path, rdr)
	if err != nil {
		c.t.Fatal(err)
	}
	req.Header.Set("Authorization", "Bearer "+c.userKey)
	if body != nil {
		req.Header.Set("Content-Type", "application/json")
	}
	res, err := http.DefaultClient.Do(req)
	if err != nil {
		c.t.Fatal(err)
	}
	defer res.Body.Close()
	out, _ := io.ReadAll(res.Body)
	return res.StatusCode, out
}

// create asks the controller for a server on this node. It returns the HTTP
// status and the id the controller sent to the node, which is known even
// when the create fails. The controller retries a failed create, so the
// node may see the same id more than once.
func (c *cluster) create() (int, string) {
	c.t.Helper()
	before := len(c.toNode.createdIDs())
	status, body := c.do(http.MethodPost, "/api/servers", api.CreateServerRequest{BlueprintID: "bp", NodeId: c.nodeID})
	ids := map[string]bool{}
	var id string
	for _, v := range c.toNode.createdIDs()[before:] {
		ids[v] = true
		id = v
	}
	if len(ids) != 1 {
		c.t.Fatalf("create sent %d server ids to the node (status %d: %s)", len(ids), status, body)
	}
	return status, id
}

// createHealthy creates a server with no faults and fails the test if the
// cluster does not end up with it on both sides. The node starts a new
// server in the background; that start is refused its configuration so it
// stops before touching the filesystem, and the test stands in for the
// running container with docker.run.
func (c *cluster) createHealthy() string {
	c.t.Helper()
	c.toController.on(http.MethodGet, `/internal/servers/[^/]+$`, respond(http.StatusBadRequest))
	defer c.toController.clear()
	status, id := c.create()
	if status != http.StatusAccepted {
		c.t.Fatalf("healthy create returned %d", status)
	}
	if !c.controllerHas(id) || !c.nodeHas(id) {
		c.t.Fatalf("healthy create: controller=%v node=%v", c.controllerHas(id), c.nodeHas(id))
	}
	fetch := "/api/nodes/" + c.nodeID + "/internal/servers/" + id
	if !eventually(func() bool { return c.toController.saw(http.MethodGet, fetch) }) {
		c.t.Fatal("node did not start the new server")
	}
	s, _ := c.daemon.Get(id)
	if !eventually(func() bool { return !s.ExecutingPowerAction() }) {
		c.t.Fatal("start of the new server did not finish")
	}
	return id
}

func (c *cluster) delete(id string, force bool) int {
	c.t.Helper()
	path := "/api/servers/" + id
	if force {
		path += "?force=true"
	}
	status, _ := c.do(http.MethodDelete, path, nil)
	return status
}

// controllerHas reports whether the controller serves the server or still
// stores the record that sync hands to the node. It reads state directly
// because the API rate limit is shared with the daemon's requests.
func (c *cluster) controllerHas(id string) bool {
	c.t.Helper()
	return c.servers.GetServer(id) != nil || c.recordStored(id)
}

func (c *cluster) recordStored(id string) bool {
	c.t.Helper()
	records, err := repository.GetAllServers()
	if err != nil {
		c.t.Fatal(err)
	}
	for _, r := range records {
		if r.Id == id {
			return true
		}
	}
	return false
}

// nodeHas reports whether the running daemon process has the server loaded.
func (c *cluster) nodeHas(id string) bool {
	_, ok := c.daemon.Get(id)
	return ok
}

func (c *cluster) describe(id string) string {
	return fmt.Sprintf("controller=%v node=%v container=%v", c.controllerHas(id), c.nodeHas(id), docker.exists(id))
}

// eventually polls cond until it holds or converge elapses.
func eventually(cond func() bool) bool {
	deadline := time.Now().Add(converge)
	for {
		if cond() {
			return true
		}
		if time.Now().After(deadline) {
			return false
		}
		time.Sleep(poll)
	}
}

// requireGone fails unless the server ends up absent everywhere: no
// controller record, nothing loaded on the node, and no container.
func (c *cluster) requireGone(id, why string) {
	c.t.Helper()
	if !eventually(func() bool { return !c.controllerHas(id) && !c.nodeHas(id) && !docker.exists(id) }) {
		c.t.Fatalf("%s: server %s was not removed everywhere: %s", why, id, c.describe(id))
	}
}

// requireCreateOutcome checks that a create's answer matches what it left
// behind: success means both sides have the server, failure means neither.
func (c *cluster) requireCreateOutcome(status int, id string) {
	c.t.Helper()
	if status == http.StatusAccepted {
		if !eventually(func() bool { return c.controllerHas(id) && c.nodeHas(id) }) {
			c.t.Fatalf("create returned %d but server %s is not on both sides: %s", status, id, c.describe(id))
		}
		return
	}
	if !eventually(func() bool { return !c.controllerHas(id) && !c.nodeHas(id) }) {
		c.t.Fatalf("create returned %d but server %s was left behind: %s", status, id, c.describe(id))
	}
}

// deleteEventually issues normal deletes until the controller no longer has
// the server or converge elapses, then requires it gone everywhere.
func (c *cluster) deleteEventually(id string) {
	c.t.Helper()
	var statuses []int
	eventually(func() bool {
		if !c.controllerHas(id) {
			return true
		}
		statuses = append(statuses, c.delete(id, false))
		return false
	})
	c.requireGone(id, fmt.Sprintf("delete (statuses %v)", compact(statuses)))
}

func compact(in []int) []int {
	var out []int
	for i, v := range in {
		if i == 0 || v != in[i-1] {
			out = append(out, v)
		}
	}
	return out
}
