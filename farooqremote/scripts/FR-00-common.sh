#!/usr/bin/env bash
# Shared helpers. Sourced by the other FR scripts. Read-only.
set -euo pipefail
# shellcheck disable=SC1090,SC2034
FR_ROOT="${FAROOQ_REMOTE_ROOT:-/opt/farooqremote}"
FR_ENV="$FR_ROOT/.env"
if [ -f "$FR_ENV" ]; then set -a; . "$FR_ENV"; set +a; fi
FR_VER="${FAROOQ_REMOTE_UPSTREAM_VERSION:-1.1.16}"
FR_RELAY="${FAROOQ_REMOTE_RELAY:-}"
FR_PATH="${FAROOQ_REMOTE_PATH:-deb}"     # deb (Path B, default) or docker (Path A)
say(){ printf '\n== %s\n' "$*"; }
need_root(){ [ "$(id -u)" -eq 0 ] || { echo "run with sudo"; exit 1; }; }
