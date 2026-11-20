package docker

import (
	"bufio"
	"context"
	"strings"
	"time"

	"emperror.dev/errors"
	"github.com/apex/log"
	"github.com/buger/jsonparser"
	"github.com/containerd/platforms"
	"github.com/docker/docker/api/types/image"
	"github.com/docker/docker/client"
	"protoxon.com/sls/daemon/config"
)

// registryAuthB64ForImage returns the X-Registry-Auth header for pull operations.
func registryAuthB64ForImage(img string) string {
	var registryAuth *config.RegistryConfiguration
	for registry, c := range config.Get().Docker.Registries {
		if !strings.HasPrefix(img, registry) {
			continue
		}
		log.WithField("registry", registry).Debug("using authentication for registry")
		registryAuth = &c
		break
	}
	if registryAuth == nil {
		return ""
	}
	b64, err := registryAuth.Base64()
	if err != nil {
		log.WithError(err).Error("failed to get registry auth credentials")
		return ""
	}
	return b64
}

func hostPlatformPullString() string {
	return platforms.Format(platforms.DefaultSpec())
}

// ErrPullStalled means Docker sent no pull progress for pullStallTimeout.
var ErrPullStalled = errors.New("environment/docker: image pull stalled")

var (
	// pullStallTimeout cancels a pull that reports no progress for this long.
	pullStallTimeout = 2 * time.Minute
	// pullLogInterval paces the info log of pull progress.
	pullLogInterval = 10 * time.Second
	// fallbackListTimeout bounds the local image check after a failed pull.
	fallbackListTimeout = 30 * time.Second
)

// PullImage streams an ImagePull until completion. onStatus receives combined
// status+progress lines when non-nil. The pull is cancelled with ErrPullStalled
// when Docker reports no progress for pullStallTimeout.
func PullImage(ctx context.Context, cli *client.Client, img string, onStatus func(status string)) error {
	ctx, cancel := context.WithCancelCause(ctx)
	defer cancel(nil)
	stall := time.AfterFunc(pullStallTimeout, func() {
		cancel(errors.Wrapf(ErrPullStalled, "no progress for %s pulling %q; is the registry reachable from this node", pullStallTimeout, img))
	})
	defer stall.Stop()

	err := pullImage(ctx, cli, img, func(status string) {
		stall.Reset(pullStallTimeout)
		if onStatus != nil {
			onStatus(status)
		}
	})
	if err != nil && errors.Is(context.Cause(ctx), ErrPullStalled) {
		return context.Cause(ctx)
	}
	return err
}

func pullImage(ctx context.Context, cli *client.Client, img string, onStatus func(status string)) error {
	opts := image.PullOptions{
		All:          false,
		Platform:     hostPlatformPullString(),
		RegistryAuth: registryAuthB64ForImage(img),
	}
	log.WithField("image", img).Info("pulling docker image")
	out, err := cli.ImagePull(ctx, img, opts)
	if err != nil {
		return err
	}
	defer out.Close()

	var lastLog time.Time
	scanner := bufio.NewScanner(out)
	for scanner.Scan() {
		b := scanner.Bytes()
		// Docker reports most pull failures in the stream after a 200 response.
		if msg, _ := jsonparser.GetString(b, "error"); msg != "" {
			return errors.New(msg)
		}
		status, _ := jsonparser.GetString(b, "status")
		progress, _ := jsonparser.GetString(b, "progress")
		line := strings.TrimSpace(status + " " + progress)
		onStatus(line)
		if time.Since(lastLog) >= pullLogInterval {
			lastLog = time.Now()
			log.WithField("image", img).WithField("status", line).Info("pulling docker image")
		}
	}
	return scanner.Err()
}

// PullImageWithOfflineFallback pulls img; if the pull fails (e.g. network), it
// continues when the same tag exists locally. A cancelled ctx skips the
// fallback because the caller is no longer waiting for the image.
func PullImageWithOfflineFallback(ctx context.Context, cli *client.Client, img string, onStatus func(status string)) error {
	err := PullImage(ctx, cli, img, onStatus)
	if err == nil {
		log.WithField("image", img).Info("completed docker image pull")
		return nil
	}
	if errors.Is(ctx.Err(), context.Canceled) {
		return errors.Wrapf(err, "environment/docker: pull of %q was cancelled", img)
	}

	listCtx, cancel := context.WithTimeout(context.WithoutCancel(ctx), fallbackListTimeout)
	defer cancel()
	images, ierr := cli.ImageList(listCtx, image.ListOptions{})
	if ierr != nil {
		return errors.Wrapf(err, "environment/docker: failed to pull %q (checking local images also failed: %v)", img, ierr)
	}

	for _, im := range images {
		for _, t := range im.RepoTags {
			if t != img {
				continue
			}
			log.WithFields(log.Fields{
				"image": img,
				"err":   err.Error(),
			}).Warn("unable to pull requested image from remote source, however the image exists locally")
			return nil
		}
	}

	return errors.Wrapf(err, "environment/docker: failed to pull %q", img)
}

// pullTimeout is the maximum time allowed for a single image pull.
const pullTimeout = 15 * time.Minute
