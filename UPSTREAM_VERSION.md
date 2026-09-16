# UPSTREAM VERSION — FarooqRemote-Server

| Field | Value |
|---|---|
| Farooq Remote Server version | 0.1.0 |
| Upstream repository | https://github.com/rustdesk/rustdesk-server |
| Upstream release / tag | 1.1.16 (published 2026-07-20) |
| Upstream commit (tag 1.1.16) | 73523b31cfd25d77dee862e6fc9f5e1fb5e485ef |
| Farooq origin | https://github.com/farooqmusicai/FarooqRemote-Server |
| Last upstream sync | 2026-09-16 (tags fetched; development branch to be created from tag 1.1.16) |
| Local patches | none in upstream code. All Farooq additions live in `farooqremote/`, `.github/workflows/farooqremote-ci.yml` and the root files VERSION, UPSTREAM_VERSION.md, CHANGELOG.md, PROJECT-STATUS.md, IDEAS-BACKLOG.md, LEGAL-NOTES.md, THIRD-PARTY-NOTICES.md, SOURCE-AVAILABILITY.md, SECURITY.md |
| Deployment artefacts used | upstream release assets `rustdesk-server-hbbs_1.1.16_arm64.deb`, `rustdesk-server-hbbr_1.1.16_arm64.deb` (Path B) or image `rustdesk/rustdesk-server:1.1.16` (Path A) — upstream builds, not Farooq builds |

Notes: the upstream source is kept unmodified so future `git merge upstream/master` (or a newer tag) stays conflict-free. Farooq-specific material is isolated in `farooqremote/`.
