# Architecture

```
Farooq Remote client A                          Farooq Remote client B
        |  register / heartbeat (21116 udp)              |
        v                                                v
   hbbs — ID / rendezvous / NAT test (21115 tcp, 21116 tcp+udp)   on fm2-stream
        |
        +-- direct P2P (hole punch) ------------------------> B
        |
        +-- fallback: hbbr relay (21117 tcp) -----------------> B
```
- `hbbs` (signal): device IDs, online state, NAT type test, hole-punch coordination. Stores `id_ed25519` (private, identity of the server) and `id_ed25519.pub` (given to every client), plus a small sqlite db (`db_v2.sqlite3`) in `/opt/farooqremote/data`.
- `hbbr` (relay): forwards already-encrypted session traffic when direct connection fails. Sees ciphertext only.
- Both are unmodified upstream 1.1.16 binaries. Farooq Remote adds configuration, scripts, docs — no code changes.
- Shared VM: nginx/PostgreSQL/PHP of Farooq Music 2.0 are untouched; no port overlap (80/443 vs 21115–21117).
- Not deployed: web client (21118/21119), Pro API (21114).
