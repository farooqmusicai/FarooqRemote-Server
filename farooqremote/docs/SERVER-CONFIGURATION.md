# Server configuration

All settings live in `/opt/farooqremote/.env` (template: `farooqremote/.env.example`).

| Variable | Meaning |
|---|---|
| `FAROOQ_REMOTE_HOST` | hostname/IP clients type as ID server |
| `FAROOQ_REMOTE_RELAY` | `host:21117` that hbbs advertises (`hbbs -r`) |
| `FAROOQ_REMOTE_UPSTREAM_VERSION` | pinned upstream version (1.1.16) |
| `FAROOQ_REMOTE_ROOT` | `/opt/farooqremote` |
| `FAROOQ_REMOTE_ENCRYPTED_ONLY` | `1` adds `-k _` to hbbs/hbbr: only clients with the correct public key may connect. Turn on after all clients are configured. |
| `FAROOQ_REMOTE_PATH` | `deb` or `docker` (set in the shell when running FR-01, or in .env) |

Path B applies these through systemd drop-ins `/etc/systemd/system/rustdesk-hbb{s,r}.service.d/farooqremote.conf` (working dir `/opt/farooqremote/data`, `ExecStart` with `-r`). Logs: `/var/log/rustdesk-server/` and `journalctl -u rustdesk-hbbs`.
Path A applies them through `compose.yml` variables.
Change a value → edit `.env` → Path B: rerun the drop-in part of FR-01 (or `sudo ./FR-01-install.sh` again, it is idempotent for an existing install) · Path A: `docker compose up -d`.
