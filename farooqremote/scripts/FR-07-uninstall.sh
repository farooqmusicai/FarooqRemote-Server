#!/usr/bin/env bash
# Removes services and packages/containers. KEEPS /opt/farooqremote/data and backups (keys are never deleted by a script).
. "$(dirname "$0")/FR-00-common.sh"; need_root
read -r -p "Type UNINSTALL to continue: " a; [ "$a" = UNINSTALL ] || exit 1
"$(dirname "$0")/FR-03-backup.sh"
if [ "$FR_PATH" = docker ]; then (cd "$FR_ROOT" && docker compose down); rm -f "$FR_ROOT/compose.yml"
else systemctl disable --now rustdesk-hbbs rustdesk-hbbr; apt-get remove -y rustdesk-server-hbbs rustdesk-server-hbbr; rm -rf /etc/systemd/system/rustdesk-hbb{s,r}.service.d; systemctl daemon-reload; fi
for p in 21115/tcp 21116/tcp 21116/udp 21117/tcp; do ufw delete allow $p 2>/dev/null || true; done
echo "done. Data and backups kept in $FR_ROOT. OCI ingress rules must be removed by hand."
