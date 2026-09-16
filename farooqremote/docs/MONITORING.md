# Monitoring (lightweight, no paid services)
- `FR-05-status.sh` on demand.
- Suggested cron on the VM (with approval): `*/10 * * * * /home/deploy/farooqremote/scripts/FR-02-verify.sh > /opt/farooqremote/logs/last-verify.txt 2>&1`.
- From the NAS (EX4) a cron can test `nc -z 145.241.158.114 21116` and append to a log — reuses existing hardware.
- Heavier tools (Uptime Kuma, Prometheus) stay in IDEAS-BACKLOG until there is a reason.
