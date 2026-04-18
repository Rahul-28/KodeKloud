kubectl describe configMap nginx-config
# output:
# Name:         nginx-config
# Namespace:    default
# Labels:       <none>
# Annotations:  <none>

# Data
# ====
# nginx.conf:
# ----
# events {
# }
# http {
#   server {
#     listen 8099 default_server;
#     listen [::]:8099 default_server;

#     # Set nginx to serve files from the shared volume!
#     root /var/www/html;
#     index  index.html index.htm index.php;
#     server_name _;
#     location / {
#       try_files $uri $uri/ =404;
#     }
#     location ~ \.php$ {
#       include fastcgi_params;
#       fastcgi_param REQUEST_METHOD $request_method;
#       fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#       fastcgi_pass 127.0.0.1:9000;
#     }
#   }
# }



# BinaryData
# ====

# Events:  <none>

kubectl describe pod nginx-phpfpm
# output:
# Name:             nginx-phpfpm
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.97.143
# Start Time:       Mon, 30 Mar 2026 17:59:18 +0000
# Labels:           app=php-app
# Annotations:      <none>
# Status:           Running
# IP:               10.22.0.9
# IPs:
#   IP:  10.22.0.9
# Containers:
#   php-fpm-container:
#     Container ID:   containerd://63592a6f19eaf36a904c75fcc29d3657f80abfa2ca8094059742b8b79a8710a4
#     Image:          php:7.2-fpm-alpine
#     Image ID:       docker.io/library/php@sha256:2e2d92415f3fc552e9a62548d1235f852c864fcdc94bcf2905805d92baefc87f
#     Port:           <none>
#     Host Port:      <none>
#     State:          Running
#       Started:      Mon, 30 Mar 2026 17:59:21 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:    <none>
#     Mounts:
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-4n4zv (ro)
#       /var/www/html from shared-files (rw)
#   nginx-container:
#     Container ID:   containerd://34ceff17505246faddac5defaf3401a064d6bda0390f01ddeaf35d527f73dbde
#     Image:          nginx:latest
#     Image ID:       docker.io/library/nginx@sha256:7150b3a39203cb5bee612ff4a9d18774f8c7caf6399d6e8985e97e28eb751c18
#     Port:           <none>
#     Host Port:      <none>
#     State:          Running
#       Started:      Mon, 30 Mar 2026 17:59:25 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:    <none>
#     Mounts:
#       /etc/nginx/nginx.conf from nginx-config-volume (rw,path="nginx.conf")
#       /usr/share/nginx/html from shared-files (rw)
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-4n4zv (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       True 
#   ContainersReady             True 
#   PodScheduled                True 
# Volumes:
#   shared-files:
#     Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
#     Medium:     
#     SizeLimit:  <unset>
#   nginx-config-volume:
#     Type:      ConfigMap (a volume populated by a ConfigMap)
#     Name:      nginx-config
#     Optional:  false
#   kube-api-access-4n4zv:
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
#   Normal  Scheduled  92s   default-scheduler  Successfully assigned default/nginx-phpfpm to jump-host
#   Normal  Pulling    92s   kubelet            Pulling image "php:7.2-fpm-alpine"
#   Normal  Pulled     90s   kubelet            Successfully pulled image "php:7.2-fpm-alpine" in 2.414s (2.414s including waiting). Image size: 30733687 bytes.
#   Normal  Created    90s   kubelet            Created container: php-fpm-container
#   Normal  Started    90s   kubelet            Started container php-fpm-container
#   Normal  Pulling    90s   kubelet            Pulling image "nginx:latest"
#   Normal  Pulled     86s   kubelet            Successfully pulled image "nginx:latest" in 3.307s (3.307s including waiting). Image size: 62958873 bytes.
#   Normal  Created    86s   kubelet            Created container: nginx-container
#   Normal  Started    86s   kubelet            Started container nginx-container

kubectl get pod nginx-phpfpm -o yaml > pod-def.yaml
# creates a file named pod-def.yaml with the YAML definition of the nginx-phpfpm pod

vi pod-def.yaml 

kubectl delete -f pod-def.yaml 
# pod "nginx-phpfpm" deleted from default namespace

kubectl create -f pod-def.yaml 
# pod/nginx-phpfpm created

kubectl cp /home/thor/index.php nginx-phpfpm:/var/www/html -c nginx-container

kubectl exec -it nginx-phpfpm -c nginx-container -- cat /var/www/html/index.php
# <?php
# phpinfo();
# ?>

kubectl exec -it nginx-phpfpm -c php-fpm-container -- cat /var/www/html/index.php
# <?php
# phpinfo();
# ?>