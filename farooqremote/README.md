# farooqremote/ — Farooq Remote Server deployment kit

Everything Farooq-specific lives in this folder so the upstream tree stays untouched and mergeable.

| Item | Purpose |
|---|---|
| `.env.example` | copy to `/opt/farooqremote/.env` on the VM, fill in host/relay. Never commit the real one. |
| `docker/compose.yml` | Path A — pinned `rustdesk/rustdesk-server:1.1.16`, no web ports. |
| `scripts/FR-01-install.sh` | install (Path B `.deb`+systemd default, Path A with `FAROOQ_REMOTE_PATH=docker`) |
| `scripts/FR-02-verify.sh` | read-only health check, prints the public key |
| `scripts/FR-03-backup.sh` / `FR-04-restore.sh` | rotating local backup, restore with dry-run |
| `scripts/FR-05-status.sh` | status + logs |
| `scripts/FR-06-update.sh` | move to a new pinned version, backup first |
| `scripts/FR-07-uninstall.sh` | remove services, keep keys and backups |
| `docs/` | operations manual, one file per topic |

How a change reaches the VM (Nizam rule): AI writes the script here → Farooq copies it to the VM (HOME-01, `deploy@`) → runs it → pastes the output into `0-docs` as the next numbered file. Nothing is executed on the VM by an AI.

Server host is the shared Oracle VM `fm2-stream` (ARM64, Ubuntu 24.04, also running Farooq Music 2.0). Ports used: 21115/tcp, 21116/tcp+udp, 21117/tcp. Nothing else.
