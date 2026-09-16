# Connecting a client (Phase 3 uses the official RustDesk client first)

1. Install official RustDesk 1.4.9 on the PC (https://github.com/rustdesk/rustdesk/releases/tag/1.4.9).
2. Settings → Network → ID/Relay server:
   - ID server: `remote.farooqmusic.com` (or `145.241.158.114` before DNS)
   - Relay server: leave empty (hbbs advertises it) or `remote.farooqmusic.com:21117`
   - Key: paste the content of `id_ed25519.pub` printed by `FR-02-verify.sh`
3. Apply. The client's ID dot turns green when hbbs answers.
4. Test matrix (write results into `0-docs`): PC1→PC2 on the same LAN (expect direct) · PC1→PC2 via mobile hotspot (expect direct or relay — the session info shows which) · file transfer · clipboard · unattended (permanent password) · reboot of PC2 and reconnect.
Phase 6 will bake these values into the Farooq Remote client build so end users type nothing.
