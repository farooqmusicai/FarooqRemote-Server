# Backup and restore

What matters: `/opt/farooqremote/data/id_ed25519` (server identity — losing it means every client must be re-keyed), `id_ed25519.pub`, `db_v2.sqlite3` (device IDs), `.env`, `compose.yml` if Path A.

- `sudo ./FR-03-backup.sh` → `/opt/farooqremote/backups/farooqremote-YYYYMMDD-HHMMSS.tar.gz` (mode 600, keeps 14).
- Off-VM copy: include `/opt/farooqremote/backups` in the existing 03:15 Oracle→NAS backup job (FA-002) — ask before editing that job. Until then, copy manually to `Y:\FA-020-farooqremote\1-working\backups\`.
- Cron suggestion (add with approval): `15 3 * * * /home/deploy/farooqremote/scripts/FR-03-backup.sh >> /opt/farooqremote/logs/backup.log 2>&1`.
- Restore: `sudo ./FR-04-restore.sh --dry-run <file>` to list, then without `--dry-run`. The script backs up the current state first, stops services, extracts, starts, verifies.
- A backup counts only after one restore test on the VM (planned in Phase 8) — record the date in Nizam MAINTENANCE.md.
