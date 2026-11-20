package environment

import "protoxon.com/sls/internal/api"

// Allocations is the resolved port mapping stored with a server. Releasing a
// claimed port is the controller server's job, not a field of this document.
type Allocations = api.Allocations
