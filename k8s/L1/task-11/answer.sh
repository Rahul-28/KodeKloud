kubectl get all
# output:
# NAME            READY   STATUS             RESTARTS   AGE
# pod/webserver   1/2     ImagePullBackOff   0          88s

# NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        14m
# service/nginx-service   NodePort    10.43.19.142   <none>        80:30008/TCP   88s

kubectl describe pod/webserver
# output:
# Name:             webserver
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.13.81
# Start Time:       Wed, 25 Mar 2026 16:45:23 +0000
# Labels:           app=web-app
# Annotations:      <none>
# Status:           Pending
# IP:               10.22.0.9
# IPs:
#   IP:  10.22.0.9
# Containers:
#   nginx-container:
#     Container ID:   
#     Image:          nginx:latests
#     Image ID:       
#     Port:           <none>
#     Host Port:      <none>
#     State:          Waiting
#       Reason:       ImagePullBackOff
#     Ready:          False
#     Restart Count:  0
#     Environment:    <none>
#     Mounts:
#       /var/log/nginx from shared-logs (rw)
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-dnjsk (ro)
#   sidecar-container:
#     Container ID:  containerd://65c57e121e127f9242be43a48076a198af296d409024243836b4ea1648d7ea55
#     Image:         ubuntu:latest
#     Image ID:      docker.io/library/ubuntu@sha256:186072bba1b2f436cbb91ef2567abca677337cfc786c86e107d25b7072feef0c
#     Port:          <none>
#     Host Port:     <none>
#     Command:
#       sh
#       -c
#       while true; do cat /var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done
#     State:          Running
#       Started:      Wed, 25 Mar 2026 16:45:26 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:    <none>
#     Mounts:
#       /var/log/nginx from shared-logs (rw)
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-dnjsk (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       False 
#   ContainersReady             False 
#   PodScheduled                True 
# Volumes:
#   shared-logs:
#     Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
#     Medium:     
#     SizeLimit:  <unset>
#   kube-api-access-dnjsk:
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
#   Type     Reason     Age                 From               Message
#   ----     ------     ----                ----               -------
#   Normal   Scheduled  2m9s                default-scheduler  Successfully assigned default/webserver to jump-host
#   Normal   Pulling    2m8s                kubelet            Pulling image "ubuntu:latest"
#   Normal   Pulled     2m6s                kubelet            Successfully pulled image "ubuntu:latest" in 1.438s (1.438s including waiting). Image size: 29741401 bytes.
#   Normal   Created    2m6s                kubelet            Created container: sidecar-container
#   Normal   Started    2m6s                kubelet            Started container sidecar-container
#   Normal   Pulling    43s (x4 over 2m9s)  kubelet            Pulling image "nginx:latests"
#   Warning  Failed     42s (x4 over 2m8s)  kubelet            Failed to pull image "nginx:latests": rpc error: code = NotFound desc = failed to pull and unpack image "docker.io/library/nginx:latests": failed to resolve reference "docker.io/library/nginx:latests": docker.io/library/nginx:latests: not found
#   Warning  Failed     42s (x4 over 2m8s)  kubelet            Error: ErrImagePull
#   Normal   BackOff    3s (x8 over 2m6s)   kubelet            Back-off pulling image "nginx:latests"
#   Warning  Failed     3s (x8 over 2m6s)   kubelet            Error: ImagePullBackOff

kubectl get pods
# output:
# NAME        READY   STATUS    RESTARTS   AGE
# webserver   2/2     Running   0          5m5s