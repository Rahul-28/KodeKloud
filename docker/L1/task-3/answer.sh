ssh tony@stapp01

docker ps -a
# output
# CONTAINER ID   IMAGE     COMMAND               CREATED         STATUS         PORTS     NAMES
# b6ad9051d1f9   busybox   "tail -f /dev/null"   8 minutes ago   Up 8 minutes             kke-container

docker stop b6a
# output => b6a

docker rm b6a
# output => b6a
