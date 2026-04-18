docker pull busybox:musl
# output:
# musl: Pulling from library/busybox
# 5bfa213ad291: Pull complete 
# Digest: sha256:19b646668802469d968a05342a601e78da4322a414a7c09b1c9ee25165042138
# Status: Downloaded newer image for busybox:musl
# docker.io/library/busybox:musl

docker tag busybox:musl busybox:news
# no output

docker images
# output:
# REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
# busybox      musl      0188a8de47ca   16 months ago   1.51MB
# busybox      news      0188a8de47ca   16 months ago   1.51MB