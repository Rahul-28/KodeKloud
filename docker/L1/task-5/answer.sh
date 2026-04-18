docker ps -a 
# output: (container not running)
# CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS                     PORTS     NAMES
# 7c637bdac304   httpd     "httpd-foreground"   7 minutes ago   Exited (0) 6 minutes ago             nautilus

docker start 7c637bdac304
# output
# 7c637bdac304

docker ps -a
# output: (container now running)
# CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS          PORTS                  NAMES
# 7c637bdac304   httpd     "httpd-foreground"   8 minutes ago   Up 21 seconds   0.0.0.0:8080->80/tcp   nautilus

curl http://localhost:8080/
# output (check if it working properly)
# Welcome to xFusionCorp Industries![tony@stapp01 ~]$ 

note:
# if you want to get the container details like volume mounted, use the command docker inspect <contianer_id>