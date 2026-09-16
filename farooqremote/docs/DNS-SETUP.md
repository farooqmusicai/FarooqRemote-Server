# DNS — remote.farooqmusic.com (planned, NOT created yet — owner decision 2026-09-16 says no DNS change now)
When approved: at the farooqmusic.com DNS provider add `A  remote  145.241.158.114  TTL 300`. No CNAME, no proxying (relay is raw TCP/UDP, not HTTP). Then set `FAROOQ_REMOTE_HOST=remote.farooqmusic.com`, `FAROOQ_REMOTE_RELAY=remote.farooqmusic.com:21117` in `.env`, rerun FR-01, verify with `dig +short remote.farooqmusic.com`.
Until then clients use the IP directly.
