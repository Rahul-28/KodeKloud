cd /opt/docker/

sudo vi docker-compose.yml

# inside docker-compose.yml

services:
  httpd:
    container_name: httpd
    ports:
      - "8085:80"
    image: httpd:latest
    volumes:
      - /opt/finance:/usr/local/apache2/htdocs


docker compose up -d
# output:
# [+] up 9/9
#  ✔ Image httpd:latest     Pulled                                             3.5s
#  ✔ Network docker_default Created                                            0.1s
#  ✔ Container httpd        Created                                            0.1s

docker ps
# output:
# CONTAINER ID   IMAGE          COMMAND              CREATED          STATUS          PORTS                                   NAMES
# e6c0eb8c2987   httpd:latest   "httpd-foreground"   15 seconds ago   Up 14 seconds   0.0.0.0:8085->80/tcp, :::8085->80/tcp   httpd

docker compose ps
# output:
# NAME      IMAGE          COMMAND              SERVICE   CREATED          STATUS          PORTS
# httpd     httpd:latest   "httpd-foreground"   httpd     55 seconds ago   Up 54 seconds   0.0.0.0:8085->80/tcp, [::]:8085->80/tcp
