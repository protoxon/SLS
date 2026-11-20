GIT_COMMIT := $(shell git rev-parse --short=7 HEAD 2>/dev/null)
GIT_DIRTY := $(if $(shell git status --porcelain 2>/dev/null),+CHANGES)
ifeq ($(GIT_COMMIT),)
GIT_COMMIT := unknown
GIT_DIRTY :=
endif
BUILD_DATE := $(shell TZ=UTC0 git show -s --format=%cd --date=format-local:'%Y-%m-%dT%H:%M:%SZ' HEAD 2>/dev/null)

LDFLAGS := -s -w -X protoxon.com/sls/internal/version.GitCommit=$(GIT_COMMIT)$(GIT_DIRTY)
ifneq ($(BUILD_DATE),)
LDFLAGS += -X protoxon.com/sls/internal/version.BuildDate=$(BUILD_DATE)
endif
ifneq ($(origin VERSION),undefined)
LDFLAGS += -X protoxon.com/sls/internal/version.Version=$(VERSION)
endif

.PHONY: all sls test clean

all: sls

sls:
	CGO_ENABLED=0 go build -trimpath -ldflags '$(LDFLAGS)' -o sls ./cmd/sls

test:
	go test ./...

clean:
	rm -f sls
