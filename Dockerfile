# syntax=docker/dockerfile:1
# Stage 1 (Build)
FROM golang:1.27.2-alpine AS builder

# Install system dependencies
RUN apk add --update --no-cache git make mailcap
WORKDIR /app/

# Cache Go modules layers cleanly
COPY go.mod go.sum /app/
RUN go mod download

# Copy the rest of the source code
COPY . /app/

# Declare ARG here so it only invalidates cache for the compilation step
ARG VERSION

# Compile using BuildKit cache mounts for Go compiler and module speeds
RUN --mount=type=cache,target=/root/.cache/go-build \
    --mount=type=cache,target=/go/pkg/mod \
    CGO_ENABLED=0 go build \
    -ldflags="-s -w -X protoxon.com/sls/internal/version.Version=$VERSION" \
    -v \
    -trimpath \
    -o sls \
    ./cmd/sls

# Generate OS release identification for distroless
RUN echo "ID=\"distroless\"" > /etc/os-release

# Stage 2 (Final Image)
FROM gcr.io/distroless/static:latest

# Copy system configurations from builder
COPY --from=builder /etc/os-release /etc/os-release
COPY --from=builder /etc/mime.types /etc/mime.types

# Copy the compiled binary
COPY --from=builder /app/sls /usr/bin/

# Select the role with the command, e.g. `run controller` or `run daemon`
ENTRYPOINT ["/usr/bin/sls"]
CMD ["--help"]
