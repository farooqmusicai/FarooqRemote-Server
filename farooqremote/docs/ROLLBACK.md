# Rollback
- Path B: `sudo ./FR-04-restore.sh <backup before update>` then `sudo ./FR-06-update.sh 1.1.16` (or the previous pinned version) — apt installs the older `.deb` over the newer one.
- Path A: set the old tag in `/opt/farooqremote/compose.yml`, `docker compose up -d`, then restore data if the update changed the db format.
- Keys never change during an update; if clients suddenly fail with key errors, the data dir was replaced — restore the backup.
