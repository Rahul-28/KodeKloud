ssh tony@stapp01

cd /opt/docker

cat Dockerfile 

# output:

# FROM httpd:2.4.43

# RUN sed -i "s/Listen 80/Listen 8080/g" /usr/local/apache2/conf.d/httpd.conf

# RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' conf.d/httpd.conf

# RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' conf.d/httpd.conf

# RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' conf.d/httpd.conf

# COPY certs/server.crt /usr/local/apache2/conf/server.crt

# COPY certs/server.key /usr/local/apache2/conf/server.key

# COPY html/index.html /usr/local/apache2/htdocs/

# <========================================>
# Note: the path of the file is not absolute path, so we provide abssolute path.
# i.e in all sed cmd, we use conf.d/httpd.conf instead of /usr/local/apache2/conf/httpd.conf
# <========================================>

# After updating,

sudo vi Dockerfile

# output:

# FROM httpd:2.4.43

# RUN sed -i 's/Listen 80/Listen 8080/g' /usr/local/apache2/conf/httpd.conf

# RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

# RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socache_shmcb.so/s/^#//g' /usr/local/apache2/conf/httpd.conf

# RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf

# COPY certs/server.crt /usr/local/apache2/conf/server.crt

# COPY certs/server.key /usr/local/apache2/conf/server.key

# COPY html/index.html /usr/local/apache2/htdocs/

docker build -t apache-img .
# output:

# [+] Building 5.5s (13/13) FINISHED                                docker:default
#  => [internal] load build definition from Dockerfile                        0.0s
#  => => transferring dockerfile: 614B                                        0.0s
#  => [internal] load metadata for docker.io/library/httpd:2.4.43             0.6s
#  => [internal] load .dockerignore                                           0.0s
#  => => transferring context: 2B                                             0.0s
#  => CACHED [1/8] FROM docker.io/library/httpd:2.4.43@sha256:cd88fee4eab37f  0.0s
#  => [internal] load build context                                           0.0s
#  => => transferring context: 157B                                           0.0s
#  => [2/8] RUN sed -i 's/Listen 80/Listen 8080/g' /usr/local/apache2/conf/h  0.5s
#  => [3/8] RUN sed -i '/LoadModule\ ssl_module modules\/mod_ssl.so/s/^#//g'  0.4s
#  => [4/8] RUN sed -i '/LoadModule\ socache_shmcb_module modules\/mod_socac  0.5s
#  => [5/8] RUN sed -i '/Include\ conf\/extra\/httpd-ssl.conf/s/^#//g' /usr/  0.4s
#  => [6/8] COPY certs/server.crt /usr/local/apache2/conf/server.crt          0.2s
#  => [7/8] COPY certs/server.key /usr/local/apache2/conf/server.key          0.2s
#  => [8/8] COPY html/index.html /usr/local/apache2/htdocs/                   0.2s
#  => exporting to image                                                      2.2s
#  => => exporting layers                                                     2.1s
#  => => writing image sha256:fac48ec1c28a1660d6fb2dbdebdd83705c8a1c100694fb  0.0s
#  => => naming to docker.io/library/apache-img                               0.0s
