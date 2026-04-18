ssh banner@stapp03

docker pull nginx:latest
# output:
# latest: Pulling from library/nginx
# 206356c42440: Pull complete 
# b47f187216b6: Pull complete 
# 1ad233904a11: Pull complete 
# eedda9fd8786: Pull complete 
# 35ff83c394d6: Pull complete 
# 17d0911eaf62: Pull complete 
# df0b66c867e4: Pull complete 
# Digest: sha256:0236ee02dcbce00b9bd83e0f5fbc51069e7e1161bd59d99885b3ae1734f3392e
# Status: Downloaded newer image for nginx:latest
# docker.io/library/nginx:latest

docker run -d --name official -v /opt/itadmin:/tmp nginx:latest
# output:
# 3bf1c9504b3557b1e361f6781f6e146aed45b96acd8b430d4add8991961c02cd

cp /tmp/sample.txt /opt/itadmin

ls /opt/itadmin/
# output:
# sample.txt

docker exec -it 3bf /bin/bash

#inside container
root@3bf1c9504b35:/# cd /tmp
root@3bf1c9504b35:/tmp# ls
# output:
# sample.txt