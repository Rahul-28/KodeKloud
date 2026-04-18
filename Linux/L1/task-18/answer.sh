ssh steve@stapp02

sudo yum install -y policycoreutils selinux-policy-targeted selinux-policy libselinux-utils setroubleshoot-server

sudo vi /etc/sysconfig/selinux 

sestatus
# SELinux status:                 disabled

sudo setenforce 0

sudo getenforce
# Disabled