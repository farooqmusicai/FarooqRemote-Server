# Branching and how files reach GitHub (browser only — Nizam rule)

Baseline: upstream tag `1.1.16` = commit `73523b31cfd25d77dee862e6fc9f5e1fb5e485ef`.

1. On github.com/farooqmusicai/FarooqRemote-Server → branch dropdown → Tags → `1.1.16` → open the dropdown again, type `farooq/develop`, "Create branch farooq/develop from 1.1.16".
2. Set `farooq/develop` as the default branch (Settings → General → Default branch) so uploads and future work land there. `master` stays as the upstream mirror.
3. Upload the kit: on branch `farooq/develop` → Add file → Upload files → drag the `farooqremote` folder, the `.github/workflows/farooqremote-ci.yml` file and the root files (VERSION, UPSTREAM_VERSION.md, CHANGELOG.md, PROJECT-STATUS.md, IDEAS-BACKLOG.md, LEGAL-NOTES.md, THIRD-PARTY-NOTICES.md, SOURCE-AVAILABILITY.md, SECURITY.md) from `Y:\FA-020-farooqremote\1-working\FarooqRemote-Server\`.
   Commit summary: `Add Farooq Remote server deployment kit (0.1.0, upstream 1.1.16)`
   Description: `Pinned Path A/B install scripts, docs, notices; no upstream code changed.`
4. Releases later: tag `v0.1.0` on `farooq/develop` after Phase 3 passes; `main` may be created from it as the stable branch.
5. Upstream sync later: create a branch from the new upstream tag, upload the kit again (it is self-contained), compare, switch default.

The `1-working` clone on Y: is a reading copy; nothing is pushed from it (no credentials on the NAS by rule).
