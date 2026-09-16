# Disaster recovery scenarios
| # | Scenario | Action |
|---|---|---|
| 1 | `.env` or drop-in deleted | rerun `FR-01-install.sh` (idempotent) or restore backup |
| 2 | Broken update | ROLLBACK.md |
| 3 | fm2-stream VM down | this is Farooq Music's VM — FA-002 recovery first; Farooq Remote comes back with it (services enabled at boot) |
| 4 | Disk corruption | rebuild per FA-002, then `FR-01-install.sh` + `FR-04-restore.sh` from the NAS copy |
| 5 | New VM (only if Oracle ever forces it — never created voluntarily) | same as 4; public IP changes → clients re-point (DNS makes this painless) |
| 6 | DNS change | update `.env` relay/host, rerun FR-01, clients using the hostname need nothing |
| 7 | Key lost, no backup | new key is generated on start; every client must get the new public key — avoid by backing up on day one |
| 8 | Full rebuild | steps 4 + CLIENT-CONNECTION.md |
