#!/usr/bin/env bash
# Backup keys + data + config to $FR_ROOT/backups (rotating, keep 14). Never uploads anywhere.
. "$(dirname "$0")/FR-00-common.sh"; need_root
ts=$(date +%Y%m%d-%H%M%S); out="$FR_ROOT/backups/farooqremote-$ts.tar.gz"
extra=(); [ -f "$FR_ROOT/compose.yml" ] && extra=(compose.yml)
tar -czf "$out" -C "$FR_ROOT" data .env "${extra[@]}" 2>/dev/null || true
chmod 600 "$out"; echo "backup: $out ($(du -h "$out" | cut -f1))"
ls -t "$FR_ROOT"/backups/farooqremote-*.tar.gz | tail -n +15 | xargs -r rm -f
echo "restore test: ./FR-04-restore.sh --dry-run $out"
