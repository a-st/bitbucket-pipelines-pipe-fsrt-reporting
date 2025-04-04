#!/usr/bin/env bash

source "$(dirname "$0")/common.sh"

validate() {
  # requrired system parameters
  BITBUCKET_CLONE_DIR=${BITBUCKET_CLONE_DIR:?'BITBUCKET_CLONE_DIR variable missing.'}
  BITBUCKET_REPO_SLUG=${BITBUCKET_REPO_SLUG:?'BITBUCKET_REPO_SLUG variable missing.'}

  # optional parameters
  DEBUG=${DEBUG:="false"}
}

run() {
    set +e

    echo "OPTIONS: ${FSRT_OPTIONS}"
    echo "DIRS: ${FSRT_DIRS}"

    /fsrt $FSRT_OPTIONS $FSRT_DIRS

    set -e
}

info "Starting pipe execution..."
enable_debug
validate
run
