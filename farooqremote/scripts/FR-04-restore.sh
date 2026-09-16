#!/usr/bin/env bash
# Restore from a backup tarball. --dry-run lists contents only. Stops services, restores, starts, verifies.
. "$(dirname "$0")/FR-00-common.sh"; need_root
dry=0; [ "${1:-}" = "--dry-run" ] && { dry=1; shift; }
f="${1:?usage: FR-04-restore.sh [--dry-run] backup.tar.gz}"; [ -f "$f" ] || { echo "no such file"; exit 1; }
tar -tzf "$f"; [ $dry = 1 ] && exit 0
"$(dirname "$0")/FR-03-backup.sh"   # safety copy of current state first
if [ "$FR_PATH" = docker ]; then (cd "$FR_ROOT" && docker compose down); else systemctl stop rustdesk-hbbs rustdesk-hbbr; fi
tar -xzf "$f" -C "$FR_ROOT"; chmod 700 "$FR_ROOT/data"; chmod 600 "$FR_ROOT/data/id_ed25519" 2>/dev/null || true
if [ "$FR_PATH" = docker ]; then (cd "$FR_ROOT" && docker compose --env-file "$FR_ENV" up -d); else systemctl start rustdesk-hbbr rustdesk-hbbs; fi
"$(dirname "$0")/FR-02-verify.sh"
