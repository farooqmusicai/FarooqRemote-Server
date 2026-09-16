# SECURITY — FarooqRemote-Server

Report a problem to the owner (Farooq Music) — contact address to be published with the first release.

Rules that hold for everyone touching this deployment:
- The server private key `id_ed25519` is never committed, logged, pasted or screenshotted. Only `id_ed25519.pub` is shared.
- No secrets in `.env` committed files; `.env.example` holds placeholders only.
- Web-client ports 21118/21119 stay closed (owner decision 2026-09-16).
- 21114 is never opened (Pro/API port, not used by OSS).
- Version pinned (1.1.16). Updates go through `farooqremote/docs/UPDATE-GUIDE.md` with a backup first and a rollback path.
- The host is a shared production VM (Farooq Music 2.0). Nothing here may touch nginx, PostgreSQL, PHP or ports 22/80/443.
