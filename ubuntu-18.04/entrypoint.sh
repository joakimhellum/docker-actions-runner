#!/bin/bash
set -e

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN environment variable must be set" >&2
  exit 1
fi

if [ -z "$REPO_URL" ]; then
  echo "Error: REPO_URL environment variable must be set" >&2
  exit 1
fi

remove() {
  if [ -e config.sh ]; then
    ./config.sh remove --unattended --token "$GITHUB_TOKEN"
  fi
}

trap 'remove; exit 130' INT
trap 'remove; exit 143' TERM

if [ ! -e .runner ]; then
  ./config.sh --unattended \
    --agent "${RUNNER_NAME:-$(hostname)}" \
    --url "$REPO_URL" \
    --token "$GITHUB_TOKEN" \
    --work "${WORK_FOLDER:-_work}" \
    --replace
fi

./run.sh "$*" & wait $!
