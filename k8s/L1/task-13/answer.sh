kubectl get all
# output:
# NAME                         READY   STATUS    RESTARTS   AGE
# pod/nginx-replicaset-2gwqc   1/1     Running   0          2m33s
# pod/nginx-replicaset-59mkk   1/1     Running   0          2m33s
# pod/nginx-replicaset-jw7m2   1/1     Running   0          2m33s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   51m

# NAME                               DESIRED   CURRENT   READY   AGE
# replicaset.apps/nginx-replicaset   3         3         3       2m33s

kubectl describe replicasets.apps nginx-replicaset 
# output:
# Name:         nginx-replicaset
# Namespace:    default
# Selector:     app=nginx_app,type=front-end
# Labels:       <none>
# Annotations:  <none>
# Replicas:     3 current / 3 desired
# Pods Status:  3 Running / 0 Waiting / 0 Succeeded / 0 Failed
# Pod Template:
#   Labels:  app=nginx_app
#            type=front-end
#   Containers:
#    nginx-container:
#     Image:         nginx:latest
#     Port:          80/TCP
#     Host Port:     0/TCP
#     Environment:   <none>
#     Mounts:        <none>
#   Volumes:         <none>
#   Node-Selectors:  <none>
#   Tolerations:     <none>
# Events:
#   Type    Reason            Age    From                   Message
#   ----    ------            ----   ----                   -------
#   Normal  SuccessfulCreate  4m17s  replicaset-controller  Created pod: nginx-replicaset-59mkk
#   Normal  SuccessfulCreate  4m17s  replicaset-controller  Created pod: nginx-replicaset-2gwqc
#   Normal  SuccessfulCreate  4m17s  replicaset-controller  Created pod: nginx-replicaset-jw7m2

kubectl describe pod nginx-replicaset-2gwqc
# output:
# Name:             nginx-replicaset-2gwqc
# Namespace:        defapiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      NodePort: 30080ault
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.164.17
# Start Time:       Fri, 27 Mar 2026 14:29:05 +0000
# Labels:           app=nginx_app
#                   type=front-end
# Annotations:      <none>
# Status:           Running
# IP:               10.22.0.11
# IPs:
#   IP:           10.22.0.11
# Controlled By:  ReplicaSet/nginx-replicaset
# Containers:
#   nginx-container:
#     Container ID:   containerd://81843a620778764b892da97f27974ac183456a7f28c084d057a7ba35797754b6
#     Image:          nginx:latest
#     Image ID:       docker.io/library/nginx@sha256:7150b3a39203cb5bee612ff4a9d18774f8c7caf6399d6e8985e97e28eb751c18
#     Port:           80/TCP
#     Host Port:      0/TCP
#     State:          Running
#       Started:      Fri, 27 Mar 2026 14:29:09 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:    <none>
#     Mounts:
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-6jdhd (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       True 
#   ContainersReady             True 
#   PodScheduled                True 
# Volumes:
#   kube-api-access-6jdhd:
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
#   Type    Reason     Age    From               Message
#   ----    ------     ----   ----               -------
#   Normal  Scheduled  5m29s  default-scheduler  Successfully assigned default/nginx-replicaset-2gwqc to jump-host
#   Normal  Pulling    5m29s  kubelet            Pulling image "nginx:latest"
#   Normal  Pulled     5m26s  kubelet            Successfully pulled image "nginx:latest" in 3.309s (3.309s including waiting). Image size: 62958873 bytes.
#   Normal  Created    5m26s  kubelet            Created container: nginx-container
#   Normal  Started    5m26s  kubelet            Started container nginx-container

vi np-def.yml

cat np-def.yml
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: nginx-service
# spec:
#   type: NodePort
#   selector:
#     app: nginx_app
#     type: front-end
#   ports:
#   - port: 80
#     targetPort: 80
#     nodePort: 30080

kubectl create -f np-def.yml 
# output:
# service/nginx-service created

kubectl get svc
# output:
# NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        88m
# nginx-service   NodePort    10.43.174.96   <none>        80:30080/TCP   21s

kubectl describe service nginx-service 
# output:
# Name:                     nginx-service
# Namespace:                default
# Labels:                   <none>
# Annotations:              <none>
# Selector:                 app=nginx_app,type=front-end
# Type:                     NodePort
# IP Family Policy:         SingleStack
# IP Families:              IPv4
# IP:                       10.43.174.96
# IPs:                      10.43.174.96
# Port:                     <unset>  80/TCP
# TargetPort:               80/TCP
# NodePort:                 <unset>  30080/TCP
# Endpoints:                10.22.0.9:80,10.22.0.11:80,10.22.0.10:80
# Session Affinity:         None
# External Traffic Policy:  Cluster
# Internal Traffic Policy:  Cluster
# Events:                   <none>