# Production Dockerfile. Should only be built in Travis after code is built.
FROM uasatucla/docker-paradigm-dev
COPY . /workspace
