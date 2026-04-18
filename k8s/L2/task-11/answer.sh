k get all
# output:
# NAME                           READY   STATUS    RESTARTS   AGE
# pod/lamp-wp-5594699b75-9t55m   2/2     Running   0          84s

# NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1       <none>        443/TCP        34m
# service/lamp-service    NodePort    10.43.136.210   <none>        80:30009/TCP   84s
# service/mysql-service   ClusterIP   10.43.127.7     <none>        3306/TCP       84s

# NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/lamp-wp   1/1     1            1           84s

# NAME                                 DESIRED   CURRENT   READY   AGE
# replicaset.apps/lamp-wp-5594699b75   1         1         1       84s

k get secrets 
# output:
# NAME              TYPE     DATA   AGE
# mysql-db-url      Opaque   1      75s
# mysql-host        Opaque   1      75s
# mysql-root-pass   Opaque   1      75s
# mysql-user-pass   Opaque   2      75s

k describe pod lamp-wp-5594699b75-9t55m 
# output:
# Name:             lamp-wp-5594699b75-9t55m
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.195.238
# Start Time:       Fri, 10 Apr 2026 17:53:38 +0000
# Labels:           app=lamp
#                   pod-template-hash=5594699b75
#                   tier=frontend
# Annotations:      <none>
# Status:           Running
# IP:               10.22.0.9
# IPs:
#   IP:           10.22.0.9
# Controlled By:  ReplicaSet/lamp-wp-5594699b75
# Containers:
#   httpd-php-container:
#     Container ID:   containerd://8c3a60287e430414dc447ce02472a7649e618513c814c39ebe2f6c566019ee6d
#     Image:          webdevops/php-apache:alpine-3-php7
#     Image ID:       docker.io/webdevops/php-apache@sha256:bb68c986d4947d4cb49e2753a268e33ad3d69df29c8e9a7728090f4738d5bdb9
#     Port:           80/TCP (httpd)
#     Host Port:      0/TCP (httpd)
#     State:          Running
#       Started:      Fri, 10 Apr 2026 17:53:45 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:
#       MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
#       MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
#       MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_HOST:           <set to the key 'host' in secret 'mysql-host'>           Optional: false
#     Mounts:
#       /opt/docker/etc/php/php.ini from php-config-volume (rw,path="php.ini")
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-lxq99 (ro)
#   mysql-container:
#     Container ID:   containerd://311268e1717e5b9383c8d764ab3f9ea399ff65d382a3135099ca1df6ca6acdfe
#     Image:          mysql:5.6
#     Image ID:       docker.io/library/mysql@sha256:20575ecebe6216036d25dab5903808211f1e9ba63dc7825ac20cb975e34cfcae
#     Port:           3306/TCP (mysql)
#     Host Port:      0/TCP (mysql)
#     State:          Running
#       Started:      Fri, 10 Apr 2026 17:53:51 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:
#       MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
#       MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
#       MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_HOST:           <set to the key 'host' in secret 'mysql-host'>           Optional: false
#     Mounts:
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-lxq99 (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       True 
#   ContainersReady             True 
#   PodScheduled                True 
# Volumes:
#   php-config-volume:
#     Type:      ConfigMap (a volume populated by a ConfigMap)
#     Name:      php-config
#     Optional:  false
#   kube-api-access-lxq99:
#     Type:                    Projected (a volume that contains injected data from multiple sources)
#     TokenExpirationSeconds:  3607
#     ConfigMapName:           kube-root-ca.crt
#     Optional:                false
#     DownwardAPI:             true
# QoS Class:                   BestEffort
# Node-Selectors:              <none>
# Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                              node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
# Events:
#   Type    Reason     Age   From               Message
#   ----    ------     ----  ----               -------
#   Normal  Scheduled  103s  default-scheduler  Successfully assigned default/lamp-wp-5594699b75-9t55m to jump-host
#   Normal  Pulling    103s  kubelet            Pulling image "webdevops/php-apache:alpine-3-php7"
#   Normal  Pulled     98s   kubelet            Successfully pulled image "webdevops/php-apache:alpine-3-php7" in 5.782s (5.782s including waiting). Image size: 83754007 bytes.
#   Normal  Created    97s   kubelet            Created container: httpd-php-container
#   Normal  Started    97s   kubelet            Started container httpd-php-container
#   Normal  Pulling    97s   kubelet            Pulling image "mysql:5.6"
#   Normal  Pulled     91s   kubelet            Successfully pulled image "mysql:5.6" in 6.053s (6.054s including waiting). Image size: 102984033 bytes.
#   Normal  Created    91s   kubelet            Created container: mysql-container
#   Normal  Started    91s   kubelet            Started container mysql-container

# k describe  deployments.apps lamp-wp 
# Name:               lamp-wp
# Namespace:          default
# CreationTimestamp:  Fri, 10 Apr 2026 17:53:38 +0000
# Labels:             app=lamp
# Annotations:        deployment.kubernetes.io/revision: 1
# Selector:           app=lamp,tier=frontend
# Replicas:           1 desired | 1 updated | 1 total | 1 available | 0 unavailable
# StrategyType:       Recreate
# MinReadySeconds:    0
# Pod Template:
#   Labels:  app=lamp
#            tier=frontend
#   Containers:
#    httpd-php-container:
#     Image:      webdevops/php-apache:alpine-3-php7
#     Port:       80/TCP (httpd)
#     Host Port:  0/TCP (httpd)
#     Environment:
#       MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
#       MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
#       MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_HOST:           <set to the key 'host' in secret 'mysql-host'>           Optional: false
#     Mounts:
#       /opt/docker/etc/php/php.ini from php-config-volume (rw,path="php.ini")
#    mysql-container:
#     Image:      mysql:5.6
#     Port:       3306/TCP (mysql)
#     Host Port:  0/TCP (mysql)
#     Environment:
#       MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
#       MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
#       MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_HOST:           <set to the key 'host' in secret 'mysql-host'>           Optional: false
#     Mounts:                 <none>
#   Volumes:
#    php-config-volume:
#     Type:          ConfigMap (a volume populated by a ConfigMap)
#     Name:          php-config
#     Optional:      false
#   Node-Selectors:  <none>
#   Tolerations:     <none>
# Conditions:
#   Type           Status  Reason
#   ----           ------  ------
#   Available      True    MinimumReplicasAvailable
#   Progressing    True    NewReplicaSetAvailable
# OldReplicaSets:  <none>
# NewReplicaSet:   lamp-wp-5594699b75 (1/1 replicas created)
# Events:
#   Type    Reason             Age   From                   Message
#   ----    ------             ----  ----                   -------
#   Normal  ScalingReplicaSet  2m3s  deployment-controller  Scaled up replica set lamp-wp-5594699b75 from 0 to 1

kubectl describe svc lamp-service 
# output:
# Name:                     lamp-service
# Namespace:                default
# Labels:                   app=lamp
# Annotations:              <none>
# Selector:                 app=lamp,tier=frontend
# Type:                     NodePort
# IP Family Policy:         SingleStack
# IP Families:              IPv4
# IP:                       10.43.136.210
# IPs:                      10.43.136.210
# Port:                     <unset>  80/TCP
# TargetPort:               80/TCP
# NodePort:                 <unset>  30009/TCP
# Endpoints:                10.22.0.9:80
# Session Affinity:         None
# External Traffic Policy:  Cluster
# Internal Traffic Policy:  Cluster
# Events:                   <none>

kubectl describe svc mysql-service 
# output:
# Name:                     mysql-service
# Namespace:                default
# Labels:                   app=lamp
# Annotations:              <none>
# Selector:                 app=lamp,tier=frontend
# Type:                     ClusterIP
# IP Family Policy:         SingleStack
# IP Families:              IPv4
# IP:                       10.43.127.7
# IPs:                      10.43.127.7
# Port:                     <unset>  3306/TCP
# TargetPort:               3306/TCP
# Endpoints:                10.22.0.9:3306
# Session Affinity:         None
# Internal Traffic Policy:  Cluster
# Events:                   <none>

k describe cm php-config 
# output:
# Name:         php-config
# Namespace:    default
# Labels:       <none>
# Annotations:  <none>

# Data
# ====
# php.ini:
# ----
# variables_order = "EGPCS"



# BinaryData
# ====

# Events:  <none>

k edit svc lamp-service 
# output:
# service/lamp-service edited

k exec -it lamp-wp-5594699b75-9t55m -c httpd-php-container -- sh
# output (inside the pod's httpd=php-container):
 
# / # cat /app/index.php (syntax is wrong)
# output:
# <?php
# $dbname = $_ENV['MYSQL_DATABASE'];
# $dbuser = $_ENV['MYSQL_USER'];
# $dbpass = $_ENV[''MYSQL_PASSWORD""];
# $dbhost = $_ENV['MYSQL-HOST'];


# $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");

# $test_query = "SHOW TABLES FROM $dbname";
# $result = mysqli_query($test_query);

# if ($result->connect_error) {
#    die("Connection failed: " . $conn->connect_error);
# }
#   echo "Connected successfully";

# / # exit (back inside the host machine)

vi index.php

cat index.php 
# output (fixed syntax errors):
# <?php
# $dbname = $_ENV['MYSQL_DATABASE'];
# $dbuser = $_ENV['MYSQL_USER'];
# $dbpass = $_ENV['MYSQL_PASSWORD'];
# $dbhost = $_ENV['MYSQL_HOST'];


# $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");

# $test_query = "SHOW TABLES FROM $dbname";
# $result = mysqli_query($test_query);

# if ($result->connect_error) {
#    die("Connection failed: " . $conn->connect_error);
# }
#   echo "Connected successfully";

k create cm index --from-file=index.php
# output:
# configmap/index created

k describe cm index 
# output:
# Name:         index
# Namespace:    default
# Labels:       <none>
# Annotations:  <none>

# Data
# ====
# index.php:
# ----
# <?php
# $dbname = $_ENV['MYSQL_DATABASE'];
# $dbuser = $_ENV['MYSQL_USER'];
# $dbpass = $_ENV['MYSQL_PASSWORD'];
# $dbhost = $_ENV['MYSQL_HOST'];


# $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");

# $test_query = "SHOW TABLES FROM $dbname";
# $result = mysqli_query($test_query);

# if ($result->connect_error) {
#    die("Connection failed: " . $conn->connect_error);
# }
#   echo "Connected successfully";



# BinaryData
# ====

# Events:  <none>

k edit deployments.apps  lamp-wp 
# output (added the config map to the deployment):
# deployment.apps/lamp-wp edited


k describe pod lamp-wp-6574d995d-p5pkn 
# output:
# Name:             lamp-wp-6574d995d-p5pkn
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.195.238
# Start Time:       Fri, 10 Apr 2026 18:19:29 +0000
# Labels:           app=lamp
#                   pod-template-hash=6574d995d
#                   tier=frontend
# Annotations:      <none>
# Status:           Running
# IP:               10.22.0.10
# IPs:
#   IP:           10.22.0.10
# Controlled By:  ReplicaSet/lamp-wp-6574d995d
# Containers:
#   httpd-php-container:
#     Container ID:   containerd://bee457dab80ca4e367ae382506ab4e63f781c6ec0afc759553bff0b50032f440
#     Image:          webdevops/php-apache:alpine-3-php7
#     Image ID:       docker.io/webdevops/php-apache@sha256:bb68c986d4947d4cb49e2753a268e33ad3d69df29c8e9a7728090f4738d5bdb9
#     Port:           80/TCP (httpd)
#     Host Port:      0/TCP (httpd)
#     State:          Running
#       Started:      Fri, 10 Apr 2026 18:19:30 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:
#       MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
#       MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
#       MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_HOST:           <set to the key 'host' in secret 'mysql-host'>           Optional: false
#     Mounts:
#       /app/index.php from index (rw,path="index.php")
#       /opt/docker/etc/php/php.ini from php-config-volume (rw,path="php.ini")
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-gcrwc (ro)
#   mysql-container:
#     Container ID:   containerd://3fe5047c47779070f6f7b88bafd65dc6fd08ccd336d41dfec8ae9a748c95f20e
#     Image:          mysql:5.6
#     Image ID:       docker.io/library/mysql@sha256:20575ecebe6216036d25dab5903808211f1e9ba63dc7825ac20cb975e34cfcae
#     Port:           3306/TCP (mysql)
#     Host Port:      0/TCP (mysql)
#     State:          Running
#       Started:      Fri, 10 Apr 2026 18:19:30 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:
#       MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
#       MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
#       MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_HOST:           <set to the key 'host' in secret 'mysql-host'>           Optional: false
#     Mounts:
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-gcrwc (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       True 
#   ContainersReady             True 
#   PodScheduled                True 
# Volumes:
#   php-config-volume:
#     Type:      ConfigMap (a volume populated by a ConfigMap)
#     Name:      php-config
#     Optional:  false
#   index:
#     Type:      ConfigMap (a volume populated by a ConfigMap)
#     Name:      index
#     Optional:  false
#   kube-api-access-gcrwc:
#     Type:                    Projected (a volume that contains injected data from multiple sources)
#     TokenExpirationSeconds:  3607
#     ConfigMapName:           kube-root-ca.crt
#     Optional:                false
#     DownwardAPI:             true
# QoS Class:                   BestEffort
# Node-Selectors:              <none>
# Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                              node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
# Events:
#   Type    Reason     Age   From               Message
#   ----    ------     ----  ----               -------
#   Normal  Scheduled  17s   default-scheduler  Successfully assigned default/lamp-wp-6574d995d-p5pkn to jump-host
#   Normal  Pulled     17s   kubelet            Container image "webdevops/php-apache:alpine-3-php7" already present on machine
#   Normal  Created    16s   kubelet            Created container: httpd-php-container
#   Normal  Started    16s   kubelet            Started container httpd-php-container
#   Normal  Pulled     16s   kubelet            Container image "mysql:5.6" already present on machine
#   Normal  Created    16s   kubelet            Created container: mysql-container
#   Normal  Started    16s   kubelet            Started container mysql-container

