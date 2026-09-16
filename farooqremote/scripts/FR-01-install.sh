#!/usr/bin/env bash
# Farooq Remote Server — install (Phase 2). Run ONLY after 0-docs/0006 preflight is approved.
# Usage: sudo FAROOQ_REMOTE_PATH=deb ./FR-01-install.sh   (Path B, .deb + systemd, default)
#        sudo FAROOQ_REMOTE_PATH=docker ./FR-01-install.sh (Path A, Docker Compose; Docker must already exist)
# What it does: creates /opt/farooqremote, installs pinned 1.1.16, opens UFW for 21115/21116/21117 only, starts hbbs+hbbr.
# What it never does: touch nginx/PostgreSQL/PHP, open 21114/21118/21119, install Docker, change OCI rules, change DNS.
. "$(dirname "$0")/FR-00-common.sh"; need_root
[ -n "$FR_RELAY" ] || { echo "FAROOQ_REMOTE_RELAY missing in $FR_ENV"; exit 1; }
[ "$(uname -m)" = "aarch64" ] || { echo "expected aarch64, got $(uname -m) — stop"; exit 1; }
if ss -tulpn | grep -qE ':2111[567]\b'; then echo "ports 21115-21117 already in use — stop"; ss -tulpn | grep -E ':2111[567]'; exit 1; fi

say "1/5 directories"; mkdir -p "$FR_ROOT"/{data,backups,logs}; chmod 700 "$FR_ROOT/data"
say "2/5 install $FR_VER via $FR_PATH"
case "$FR_PATH" in
  deb)
    # drop-ins FIRST: the .deb postinst starts the services immediately, and they must already run in $FR_ROOT/data with the relay flag
    k=""; [ "${FAROOQ_REMOTE_ENCRYPTED_ONLY:-0}" = "1" ] && k=" -k _"
    mkdir -p /etc/systemd/system/rustdesk-hbbs.service.d /etc/systemd/system/rustdesk-hbbr.service.d
    printf '[Service]\nWorkingDirectory=%s/data\nExecStart=\nExecStart=/usr/bin/hbbs -r %s%s\n' "$FR_ROOT" "$FR_RELAY" "$k" > /etc/systemd/system/rustdesk-hbbs.service.d/farooqremote.conf
    printf '[Service]\nWorkingDirectory=%s/data\nExecStart=\nExecStart=/usr/bin/hbbr%s\n' "$FR_ROOT" "$k" > /etc/systemd/system/rustdesk-hbbr.service.d/farooqremote.conf
    systemctl daemon-reload
    cd /tmp || exit 1
    for p in hbbr hbbs; do
      f="rustdesk-server-${p}_${FR_VER}_arm64.deb"
      [ -f "$f" ] || curl -fsSLO "https://github.com/rustdesk/rustdesk-server/releases/download/${FR_VER}/${f}"
      apt-get install -y "./$f"
    done
    systemctl enable rustdesk-hbbr rustdesk-hbbs; systemctl restart rustdesk-hbbr rustdesk-hbbs ;;
  docker)
    command -v docker >/dev/null || { echo "Docker not installed — choose Path B or get approval to install Docker"; exit 1; }
    cp "$(dirname "$0")/../docker/compose.yml" "$FR_ROOT/compose.yml"
    cd "$FR_ROOT" && docker compose --env-file "$FR_ENV" pull && docker compose --env-file "$FR_ENV" up -d ;;
  *) echo "FAROOQ_REMOTE_PATH must be deb or docker"; exit 1 ;;
esac
say "3/5 UFW (only if UFW is active)"
if ufw status | grep -q 'Status: active'; then
  ufw allow 21115/tcp comment 'FarooqRemote NAT test'; ufw allow 21116/tcp comment 'FarooqRemote ID'
  ufw allow 21116/udp comment 'FarooqRemote heartbeat'; ufw allow 21117/tcp comment 'FarooqRemote relay'
else echo "UFW inactive — host firewall unchanged (OCI security list is the firewall)"; fi
say "4/5 wait for key"; for _ in $(seq 1 20); do [ -f "$FR_ROOT/data/id_ed25519.pub" ] && break; sleep 1; done
say "5/5 result"; "$(dirname "$0")/FR-02-verify.sh"
echo; echo "REMINDER: OCI ingress rules for 21115/tcp 21116/tcp 21116/udp 21117/tcp must be added in the Oracle console by hand."
