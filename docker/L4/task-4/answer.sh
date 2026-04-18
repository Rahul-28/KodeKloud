ssh banner@stapp03

sudo su -

cd /node_app

vi Dockerfile

cat Dockerfile
# output:

# FROM Node: latest

# WORKDIR /app

# COPY package*.json .

# RUN npm install

# COPY . .

# EXPOSE 3003

# CMD [ "node", "server.js" ]

docker build -t nautilus/node-web-app .
# output:
# [+] Building 33.9s (10/10) FINISHED                               docker:default
#  => [internal] load build definition from Dockerfile                        0.0s
#  => => transferring dockerfile: 159B                                        0.0s
#  => [internal] load metadata for docker.io/library/node:latest              1.5s
#  => [internal] load .dockerignore                                           0.0s
#  => => transferring context: 2B                                             0.0s
#  => [1/5] FROM docker.io/library/node:latest@sha256:2e45682ea560ac050cca0  18.0s
#  => => resolve docker.io/library/node:latest@sha256:2e45682ea560ac050cca0f  0.1s
#  => => sha256:f07e37fa53ecd92de0d9bdca14f3f59c47733ddf9ff7 6.75kB / 6.75kB  0.0s
#  => => sha256:fa27031269f0a970255d56a9e793fc2a9d6bb09146 64.40MB / 64.40MB  2.0s
#  => => sha256:2e45682ea560ac050cca0fd1ff5e82457a717a98e95e 5.14kB / 5.14kB  0.0s
#  => => sha256:6a7e0620566c7dfbe5d3c9a7601d116556ec17a021 48.49MB / 48.49MB  1.5s
#  => => sha256:aab3b37e4807fe48145826511e16a527bbc4695222 24.04MB / 24.04MB  1.3s
#  => => sha256:9512b5a82daae8a6c59a676b7673816b05186c123e4c 2.49kB / 2.49kB  0.0s
#  => => sha256:c032818082ff938f43355abf00f71e5531be1979 211.51MB / 211.51MB  5.1s
#  => => extracting sha256:6a7e0620566c7dfbe5d3c9a7601d116556ec17a021b3e824f  2.1s
#  => => sha256:7d9b1711a8b633c1076a64942a16439eec2303a3fa2a 3.32kB / 3.32kB  1.8s
#  => => sha256:2b172aa0e1d06ca2da74098724ee45b6c61f388820 57.65MB / 57.65MB  3.0s
#  => => sha256:87d7324ba69493ed03da6fb02617800fbe743123b924 1.25MB / 1.25MB  2.3s
#  => => sha256:5623e3ca1a5cf5a7cc7b1396f92e1bfff8db69173f2ca89c 447B / 447B  2.6s
#  => => extracting sha256:aab3b37e4807fe48145826511e16a527bbc4695222ceb9666  1.1s
#  => => extracting sha256:fa27031269f0a970255d56a9e793fc2a9d6bb091463cd5e63  2.6s
#  => => extracting sha256:c032818082ff938f43355abf00f71e5531be197952a109867  6.8s
#  => => extracting sha256:7d9b1711a8b633c1076a64942a16439eec2303a3fa2a4a311  0.0s
#  => => extracting sha256:2b172aa0e1d06ca2da74098724ee45b6c61f388820c2ec48c  2.0s
#  => => extracting sha256:87d7324ba69493ed03da6fb02617800fbe743123b92490561  0.1s
#  => => extracting sha256:5623e3ca1a5cf5a7cc7b1396f92e1bfff8db69173f2ca89c3  0.0s
#  => [internal] load build context                                           0.1s
#  => => transferring context: 870B                                           0.0s
#  => [2/5] WORKDIR /app                                                      0.1s
#  => [3/5] COPY package*.json .                                              0.1s
#  => [4/5] RUN npm install                                                   9.0s
#  => [5/5] COPY . .                                                          0.1s
#  => exporting to image                                                      4.8s
#  => => exporting layers                                                     4.8s
#  => => writing image sha256:e47832492db4f77c2c3665cfc84950d40960bc9a4fb201  0.0s
#  => => naming to docker.io/nautilus/node-web-app  

docker images
# output:
# REPOSITORY              TAG       IMAGE ID       CREATED              SIZE
# nautilus/node-web-app   latest    e47832492db4   About a minute ago   1.14GB

docker run --name nodeapp_nautilus -d -p 8095:3003 nautilus/node-web-app 
# output:
# b5a300238ac39e9bb4cd5f7ed4c7686a0a18d5fe655245383ef737fd199515d8

curl http://localhost:8095
# output:
# Welcome to xFusionCorp Industries![root@stapp03 node_app]# 