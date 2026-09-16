# Test plan — server
| # | Test | Pass | Phase |
|---|---|---|---|
| S1 | hbbs + hbbr active after install | FR-02 shows both active | 2 |
| S2 | ports 21115/21116 tcp+udp/21117 listening; 21114/21118/21119 closed | FR-02 | 2 |
| S3 | key files present, 600/700 perms | FR-02 | 2 |
| S4 | services back after VM reboot | FR-02 after reboot | 2 |
| S5 | backup created, restore dry-run lists files | FR-03, FR-04 --dry-run | 2 |
| S6 | full restore on VM | FR-04 then FR-02 | 8 |
| S7 | official client registers (green dot) from outside Oracle | screenshot | 3 |
| S8 | direct session (same LAN) | session info says direct | 3 |
| S9 | relay session (different networks) | session info says relay | 3 |
| S10 | file transfer + clipboard + unattended | manual | 3 |
| S11 | update to next tag + rollback | FR-06, ROLLBACK | 8 |
| S12 | 3 simultaneous sessions, CPU/RAM on VM noted | FR-05 | 8 |
