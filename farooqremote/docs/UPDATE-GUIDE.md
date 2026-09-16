# Update guide
1. Read the upstream release notes for the new tag. Check the arm64 `.deb` (or image) exists.
2. Update this repo first: fetch upstream tag in the browser (GitHub "Sync fork" is NOT used — see BRANCHING.md), bump `UPSTREAM_VERSION.md`, `CHANGELOG.md`, `.env.example`, `compose.yml`.
3. On the VM: `sudo ./FR-06-update.sh <new version>` — it backs up, installs, restarts, verifies.
4. Test one direct and one relay session from an official client.
5. Rollback if needed: ROLLBACK.md.
