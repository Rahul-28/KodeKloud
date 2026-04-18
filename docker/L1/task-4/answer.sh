ssh banner@stapp03

docker ps -a
# output
# CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
# 6346b62229b4   ubuntu    "/bin/bash"   45 seconds ago   Up 43 seconds             ubuntu_latest

docker cp help
# output
# "docker cp" requires exactly 2 arguments.
# See 'docker cp --help'.

# Usage:  docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH|-
#         docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH

# Copy files/folders between a container and the local filesystem

docker cp /tmp/nautilus.txt.gpg ubuntu_latest:/home
# output => Successfully copied 2.05kB to ubuntu_latest:/home

docker exec 6346b62229b4 ls -lh /opt/
# output: 
# total 4.0K
# -rw-r--r-- 1 root root 105 Feb 12 17:52 nautilus.txt.gpg
