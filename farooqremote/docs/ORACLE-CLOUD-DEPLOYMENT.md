# Oracle Cloud deployment (Phase 2) — Farooq runs, AI writes

Preconditions: `0-docs/0005` preflight passed and its output is filed as `0006`; Farooq chose Path B (deb, default) or Path A (docker).

1. **OCI console (by hand)** — VCN → Security List of fm2-stream → Add Ingress Rules:
   `0.0.0.0/0` TCP 21115 · `0.0.0.0/0` TCP 21116 · `0.0.0.0/0` UDP 21116 · `0.0.0.0/0` TCP 21117. Description "FarooqRemote". Do not touch existing rules. Never press Upgrade.
2. **Copy the kit to the VM** (from HOME-01, same way FM2 scripts go): the `farooqremote/` folder to `/home/deploy/farooqremote/`.
3. **Env file**: `sudo mkdir -p /opt/farooqremote && sudo cp farooqremote/.env.example /opt/farooqremote/.env && sudo nano /opt/farooqremote/.env` — set `FAROOQ_REMOTE_HOST` and `FAROOQ_REMOTE_RELAY` to `145.241.158.114` / `145.241.158.114:21117` until DNS exists (see DNS-SETUP.md).
4. **Install**: `cd farooqremote/scripts && sudo ./FR-01-install.sh` (Path A: `sudo FAROOQ_REMOTE_PATH=docker ./FR-01-install.sh`). Expected end: three ports listening, public key printed.
5. **Backup the key now**: `sudo ./FR-03-backup.sh` → copy the tarball off the VM into `Y:\FA-020-farooqremote\1-working\backups\` (private, never into Git or 0-docs).
6. **Reboot test** (only at a quiet time for Farooq Music): `sudo reboot`, then `./FR-02-verify.sh` — services must be back.
7. File all output as `0-docs/0007-PHASE-2-INSTALL-OUTPUT.txt`.

What can go wrong: port already used (script stops before installing) · `aarch64` check fails (wrong VM) · UFW active but rule not applied (rerun step 3 of the script) · no key after 20 s (`FR-05-status.sh` shows the log).
Undo: `sudo ./FR-07-uninstall.sh` (keys kept), remove the 4 OCI rules by hand.
