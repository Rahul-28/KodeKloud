docker ps
# output:
# CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS              PORTS     NAMES
# d3db4c845079   ubuntu    "/bin/bash"   About a minute ago   Up About a minute             ubuntu_latest

docker commit ubuntu_latest official:nautilus
# output:
# sha256:108451d5e2e1fff96a49ac2afd85e345d226c0b049c9a029ce554fe5c8f3d801

docker images
# output:
# REPOSITORY   TAG        IMAGE ID       CREATED          SIZE
# official     nautilus   108451d5e2e1   23 seconds ago   137MB
# ubuntu       latest     bbdabce66f1b   9 days ago       78.1MB