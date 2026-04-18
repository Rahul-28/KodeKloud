ssh banner@stapp03

ls -ltr /tmp/xfusioncorp.sh    
# output => ---------- 1 root root 40 Jan 26 07:56 /tmp/xfusioncorp.sh

sudo chmod 555 /tmp/xfusioncorp.sh 

ls -ltr /tmp/xfusioncorp.sh    
# output => -r-xr-xr-x 1 root root 40 Jan 26 07:57 /tmp/xfusioncorp.sh

Note:
The script must have read permissions too to be executed.