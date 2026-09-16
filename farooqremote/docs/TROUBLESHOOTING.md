# Troubleshooting
| Symptom | Check |
|---|---|
| Client ID dot stays red | `FR-02-verify.sh` ports listening? OCI rule for 21116 UDP present? key pasted exactly? |
| Connects but always "relay" | 21116 TCP + 21115 TCP reachable from both sides? symmetric NAT on one side → relay is expected |
| "Key mismatch" | client key ≠ `id_ed25519.pub`; or data dir replaced — restore |
| Service not running after reboot | `systemctl status rustdesk-hbbs` / `docker ps`; `journalctl -u rustdesk-hbbs -n 50` |
| Ports in use by something else | `sudo ss -tulpn | grep 2111` — never kill a Farooq Music process |
| High bandwidth on Oracle | relay-heavy sessions; check `FR-05-status.sh`, consider secondary relay idea |
