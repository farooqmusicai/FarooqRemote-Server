#!/usr/bin/env bash
# One-screen status + last 30 log lines. Read-only.
. "$(dirname "$0")/FR-00-common.sh"
"$(dirname "$0")/FR-02-verify.sh"
say "logs (last 30)"
if [ "$FR_PATH" = docker ]; then docker logs --tail 15 farooqremote-hbbs 2>&1; docker logs --tail 15 farooqremote-hbbr 2>&1
else journalctl -u rustdesk-hbbs -u rustdesk-hbbr -n 30 --no-pager; fi
