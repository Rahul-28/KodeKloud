sudo vi /opt/docker/Dockerfile

#inside /opt/docker/Dockerfile
```
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/Listen 80/Listen 6400/' /etc/apache2/ports.conf

EXPOSE 6400

CMD ["apache2ctl", "-D", "FOREGROUND"]
```

# after saving /opt/docker/Dockerfile
docker build -t nautilus-apache /opt/docker
# output:
# [+] Building 25.1s (7/7) FINISHED                                 docker:default
#  => [internal] load build definition from Dockerfile                        0.0s
#  => => transferring dockerfile: 327B                                        0.0s
#  => [internal] load metadata for docker.io/library/ubuntu:24.04             0.0s
#  => [internal] load .dockerignore                                           0.0s
#  => => transferring context: 2B                                             0.0s
#  => CACHED [1/3] FROM docker.io/library/ubuntu:24.04                        0.0s
#  => [2/3] RUN apt-get update     && apt-get install -y apache2     && apt  21.4s
#  => [3/3] RUN sed -i 's/Listen 80/Listen 6400/' /etc/apache2/ports.conf     1.6s 
#  => exporting to image                                                      2.0s 
#  => => exporting layers                                                     2.0s 
#  => => writing image sha256:994e9bd015e4dd94e124b68414ba4ac136f2bccaed8d30  0.0s 
#  => => naming to docker.io/library/nautilus-apache                          0.0s 

docker images         
# output:                   
# REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
# nautilus-apache   latest    994e9bd015e4   10 seconds ago   199MB
# ubuntu            24.04     602eb6fb314b   10 months ago    78.1MB

docker run -d -p 6400:6400 nautilus-apache
# output:
# 5ffa5b1b7d280946869f9eabdfc9f25b49e944497331ca010aa9186917d60856

docker exec -it 5ffa5b1b7d280946869f9eabdfc9f25b49e944497331ca010aa9186917d60856 /bin/bash

root@5ffa5b1b7d28:/# service apache2 status
# output:
# * apache2 is running

root@5ffa5b1b7d28:/# exit
# output:
# exit

#running curl in host machine
curl localhost:6400

#output:
# A full html file
