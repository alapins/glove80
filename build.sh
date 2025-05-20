#!/bin/bash

set -euo pipefail

IMAGE=glove80-zmk-config-docker
# BRANCH="${1:-main}"
BRANCH="${1:-pull/36/head}"

docker build -t "$IMAGE" .
docker run --rm -v "$PWD:/config" -e UID="$(id -u)" -e GID="$(id -g)" -e BRANCH="$BRANCH" "$IMAGE"
