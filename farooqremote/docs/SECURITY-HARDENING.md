# Security hardening

Already true on fm2-stream (FA-002): SSH key login for `deploy@`, nginx with certbot, daily DB dump. Do not change SSH settings in this project — Farooq Music depends on them.

Farooq Remote specific:
- Only 21115–21117 opened; 21114/21118/21119 never.
- Private key mode 600, data dir 700, owned by root (Path B runs as root by upstream unit; a dedicated user is an upstream-compatible improvement for the ideas backlog).
- Pinned version; no `latest`.
- `FAROOQ_REMOTE_ENCRYPTED_ONLY=1` once all clients carry the key: unknown clients are refused.
- Optional later: restrict 21115–21117 in the OCI list to Qatar/GCC ranges if the user base allows; fail2ban is not useful (no password auth on these ports).
- Never on this VM: a second remote-desktop server, Pro binaries, admin panels on public ports.
