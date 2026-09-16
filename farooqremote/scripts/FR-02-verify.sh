#!/usr/bin/env bash
# Read-only health check. Safe to run any time. Prints the PUBLIC key only.
. "$(dirname "$0")/FR-00-common.sh"
say "version pinned"; echo "$FR_VER ($FR_PATH)"
say "services"
if [ "$FR_PATH" = docker ]; then docker ps --filter name=farooqremote --format '{{.Names}}  {{.Status}}'; else systemctl is-active rustdesk-hbbs rustdesk-hbbr | paste - - ; fi
say "listening ports (expect 21115 21116 tcp+udp 21117)"; ss -tulpn | grep -E ':2111[5-7]\b' || echo "NONE LISTENING"
say "web/pro ports must be absent"; ss -tulpn | grep -E ':2111[489]\b' && echo "WARNING: unexpected port open" || echo "ok: 21114/21118/21119 closed"
say "public key (give this to clients)"; cat "$FR_ROOT/data/id_ed25519.pub" 2>/dev/null || echo "no key yet"
say "private key permissions"; ls -l "$FR_ROOT/data/id_ed25519" 2>/dev/null || echo "no private key yet"
say "disk / mem"; df -h "$FR_ROOT" | tail -1; free -h | sed -n 2p
say "latest backup"; ls -t "$FR_ROOT/backups" 2>/dev/null | head -1 || echo "none"
