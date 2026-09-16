#!/usr/bin/env bash
# Update to a NEW pinned version: sudo ./FR-06-update.sh 1.1.17  — backup first, then install, then verify. Rollback = FR-04-restore + reinstall old version.
. "$(dirname "$0")/FR-00-common.sh"; need_root
new="${1:?usage: FR-06-update.sh <version>}"
echo "current $FR_VER -> new $new. Backup first."; "$(dirname "$0")/FR-03-backup.sh"
sed -i "s/^FAROOQ_REMOTE_UPSTREAM_VERSION=.*/FAROOQ_REMOTE_UPSTREAM_VERSION=$new/" "$FR_ENV"
if [ "$FR_PATH" = docker ]; then
  sed -i "s#rustdesk/rustdesk-server:.*#rustdesk/rustdesk-server:$new#" "$FR_ROOT/compose.yml"
  (cd "$FR_ROOT" && docker compose --env-file "$FR_ENV" pull && docker compose --env-file "$FR_ENV" up -d)
else
  cd /tmp || exit 1; for p in hbbr hbbs; do f="rustdesk-server-${p}_${new}_arm64.deb"; curl -fsSLO "https://github.com/rustdesk/rustdesk-server/releases/download/${new}/${f}"; apt-get install -y "./$f"; done
  systemctl daemon-reload; systemctl restart rustdesk-hbbr rustdesk-hbbs
fi
"$(dirname "$0")/FR-02-verify.sh"; echo "Record the new version + commit in UPSTREAM_VERSION.md and CHANGELOG.md."
