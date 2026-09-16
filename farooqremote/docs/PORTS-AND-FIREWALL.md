# Ports and firewall

| Port | Proto | Service | Open? | Where |
|---|---|---|---|---|
| 21115 | TCP | hbbs NAT type test | yes | OCI security list + UFW (if active) |
| 21116 | TCP | hbbs ID / hole punch | yes | same |
| 21116 | UDP | hbbs registration / heartbeat | yes | same |
| 21117 | TCP | hbbr relay | yes | same |
| 21118, 21119 | TCP | web client websockets | **no** — owner decision 2026-09-16; upstream warns forwarded-IP headers can be forged when exposed directly | — |
| 21114 | TCP | Pro API | **no** — OSS only | — |
| 22, 80, 443 | TCP | SSH / Farooq Music nginx | already open, not ours | — |

Two firewalls exist: the OCI security list (cloud edge) and UFW on Ubuntu. Both must allow a port. `FR-01-install.sh` handles UFW only if UFW is active; OCI rules are always added by hand in the console.
If the web client is ever wanted: reverse proxy on 443 with real-IP headers, backend 21118/21119 bound to localhost only, separate security review — new phase, new approval.
