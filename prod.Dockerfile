# Production Dockerfile. Should only be built in CI after code is built.
FROM ghcr.io/uas-at-ucla/docker-paradigm-dev
COPY . /docker-paradigm
