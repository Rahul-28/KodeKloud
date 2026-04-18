ssh tony@stapp01

sudo -i

cd /python_app/

vi Dockerfile

cat Dockerfile
# output:

# FROM python:latest

# WORKDIR /app

# COPY src/requirements.txt ./

# RUN pip install -r requirements.txt

# COPY src /app

# EXPOSE 6400

# RUN useradd app

# USER app

# CMD [ "python", "server.py" ]

docker build -t nautilus/python-app .
# output:
# [+] Building 37.0s (11/11) FINISHED                               docker:default
#  => [internal] load build definition from Dockerfile                        0.1s
#  => => transferring dockerfile: 226B                                        0.0s
#  => [internal] load metadata for docker.io/library/python:latest            1.5s
#  => [internal] load .dockerignore                                           0.1s
#  => => transferring context: 2B                                             0.0s
#  => [1/6] FROM docker.io/library/python:latest@sha256:7aea6827c8787754f99  23.8s
#  => => resolve docker.io/library/python:latest@sha256:7aea6827c8787754f993  0.1s
#  => => sha256:ae940add2667bc1f36a56bec63eaba412b6fb7b4e614 2.32kB / 2.32kB  0.0s
#  => => sha256:866771c43bf5eb77362eeeb163c0c825e194c2806d 49.29MB / 49.29MB  1.4s
#  => => sha256:7aea6827c8787754f99339ffed8cfc41fb09421f9c 10.95kB / 10.95kB  0.0s
#  => => sha256:d8f278e9e42ab807052d815573564c27a66903eb8fdf 6.46kB / 6.46kB  0.0s
#  => => sha256:ed881fbf1b07b42dd470cd5b56a8feb684d60879c6 25.61MB / 25.61MB  1.4s
#  => => sha256:9da421ddeb655bdfb3960e490b39373b0d1351e3ea 67.78MB / 67.78MB  2.4s
#  => => extracting sha256:866771c43bf5eb77362eeeb163c0c825e194c2806d0b69702  1.8s
#  => => sha256:a793e3c6bce826c77a6bfec52e3e42691937f0e5 236.03MB / 236.03MB  5.8s
#  => => sha256:36a6d998ca16b439abfebc56848087e395ee1ff6552b 6.09MB / 6.09MB  2.0s
#  => => sha256:ab1b8c92e1206c8483c82e4baaf3b8ed1cbce42e82 29.41MB / 29.41MB  4.0s
#  => => sha256:6052218b0e44cfb90f3a976135fe864bfd4fd24ee2696557 250B / 250B  2.7s
#  => => extracting sha256:ed881fbf1b07b42dd470cd5b56a8feb684d60879c6f8028a9  2.4s
#  => => extracting sha256:9da421ddeb655bdfb3960e490b39373b0d1351e3eaba61d01  3.5s
#  => => extracting sha256:a793e3c6bce826c77a6bfec52e3e42691937f0e5701d8efa0  9.9s
#  => => extracting sha256:36a6d998ca16b439abfebc56848087e395ee1ff6552bea59b  0.4s
#  => => extracting sha256:ab1b8c92e1206c8483c82e4baaf3b8ed1cbce42e820339311  1.0s
#  => => extracting sha256:6052218b0e44cfb90f3a976135fe864bfd4fd24ee26965579  0.1s
#  => [internal] load build context                                           0.1s
#  => => transferring context: 401B                                           0.0s
#  => [2/6] WORKDIR /app                                                      0.1s
#  => [3/6] COPY src/requirements.txt ./                                      0.1s
#  => [4/6] RUN pip install -r requirements.txt                               4.0s
#  => [5/6] COPY src /app                                                     0.2s
#  => [6/6] RUN useradd app                                                   0.7s
#  => exporting to image                                                      6.2s
#  => => exporting layers                                                     6.1s
#  => => writing image sha256:63e66aed5d7e7956b6a4807cbc9614888b6e0fbcb1940b  0.0s
#  => => naming to docker.io/nautilus/python-app 

docker run --name pythonapp_nautilus -d -p 8091:5000 nautilus/python-app
# output:
# 59bd1a644221b05b14b44bf456183ca27c1011e46682492d89bd144322de66e8

docker ps
# output:
# CONTAINER ID   IMAGE                 COMMAND              CREATED          STATUS          PORTS                                       NAMES
# 59bd1a644221   nautilus/python-app   "python server.py"   44 seconds ago   Up 42 seconds   0.0.0.0:8091->5000/tcp, :::8091->5000/tcp   pythonapp_nautilus

docker images
# output:
# REPOSITORY            TAG       IMAGE ID       CREATED         SIZE
# nautilus/python-app   latest    63e66aed5d7e   2 minutes ago   1.13GB

curl http://localhost:8091/
# output:
Welcome to xFusionCorp Industries!