ssh tony@stapp01
sudo timedatectl set-timezone America/Kentucky/Monticello
timedatectl 
# output:
#                Local time: Sun 2026-02-01 08:30:24 EST
#            Universal time: Sun 2026-02-01 13:30:24 UTC
#                  RTC time: n/a
#                 Time zone: America/Kentucky/Monticello (EST, -0500)
# System clock synchronized: yes
#               NTP service: n/a
#           RTC in local TZ: no

ssh steve@stapp02
sudo timedatectl set-timezone America/Kentucky/Monticello
timedatectl 
# output:
#                Local time: Sun 2026-02-01 08:30:24 EST
#            Universal time: Sun 2026-02-01 13:30:24 UTC
#                  RTC time: n/a
#                 Time zone: America/Kentucky/Monticello (EST, -0500)
# System clock synchronized: yes
#               NTP service: n/a
#           RTC in local TZ: no

ssh banner@stapp03
sudo timedatectl set-timezone America/Kentucky/Monticello
timedatectl 
# output:
#                Local time: Sun 2026-02-01 08:30:24 EST
#            Universal time: Sun 2026-02-01 13:30:24 UTC
#                  RTC time: n/a
#                 Time zone: America/Kentucky/Monticello (EST, -0500)
# System clock synchronized: yes
#               NTP service: n/a
#           RTC in local TZ: no