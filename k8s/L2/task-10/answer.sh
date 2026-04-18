kubectl get all
# output:
# NAME                                    READY   STATUS              RESTARTS   AGE
# pod/redis-deployment-6bc546f779-v7bvd   0/1     ContainerCreating   0          28s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   40m

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/redis-deployment   0/1     1            0           28s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/redis-deployment-6bc546f779   1         1         0       28s

kubectl describe pod redis-deployment-6bc546f779-v7bvd
# output:
# Name:             redis-deployment-6bc546f779-v7bvd
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.195.4
# Start Time:       Wed, 08 Apr 2026 03:39:02 +0000
# Labels:           app=redis
#                   pod-template-hash=6bc546f779
# Annotations:      <none>
# Status:           Pending
# IP:               
# IPs:              <none>
# Controlled By:    ReplicaSet/redis-deployment-6bc546f779
# Containers:
#   redis-container:
#     Container ID:   
#     Image:          redis:alpin
#     Image ID:       
#     Port:           6379/TCP
#     Host Port:      0/TCP
#     State:          Waiting
#       Reason:       ContainerCreating
#     Ready:          False
#     Restart Count:  0
#     Requests:
#       cpu:        300m
#     Environment:  <none>
#     Mounts:
#       /redis-master from config (rw)
#       /redis-master-data from data (rw)
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-drqgk (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   False 
#   Initialized                 True 
#   Ready                       False 
#   ContainersReady             False 
#   PodScheduled                True 
# Volumes:
#   data:
#     Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
#     Medium:     
#     SizeLimit:  <unset>
#   config:
#     Type:      ConfigMap (a volume populated by a ConfigMap)
#     Name:      redis-conig
#     Optional:  false
#   kube-api-access-drqgk:
#     Type:                    Projected (a volume that contains injected data from multiple sources)
#     TokenExpirationSeconds:  3607
#     ConfigMapName:           kube-root-ca.crt
#     Optional:                false
#     DownwardAPI:             true
# QoS Class:                   Burstable
# Node-Selectors:              <none>
# Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                              node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
# Events:
#   Type     Reason       Age                From               Message
#   ----     ------       ----               ----               -------
#   Normal   Scheduled    61s                default-scheduler  Successfully assigned default/redis-deployment-6bc546f779-v7bvd to jump-host
#   Warning  FailedMount  29s (x7 over 61s)  kubelet            MountVolume.SetUp failed for volume "config" : configmap "redis-conig" not found

kubectl get cm
# output:
# NAME               DATA   AGE
# kube-root-ca.crt   1      43m
# redis-config       2      3m17s

kubectl edit deployments.apps redis-deployment 
# output:
# deployment.apps/redis-deployment edited

kubectl get all
# output:
# NAME                                    READY   STATUS              RESTARTS   AGE
# pod/redis-deployment-6bc546f779-v7bvd   0/1     ContainerCreating   0          5m1s
# pod/redis-deployment-85cd7f84f5-wgm9r   0/1     ErrImagePull        0          119s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   45m

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/redis-deployment   0/1     1            0           5m1s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/redis-deployment-6bc546f779   1         1         0       5m1s
# replicaset.apps/redis-deployment-85cd7f84f5   1         1         0       119s

kubectl describe pod redis-deployment-85cd7f84f5-wgm9r
# output:
# Name:             redis-deployment-85cd7f84f5-wgm9r
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.195.4
# Start Time:       Wed, 08 Apr 2026 03:42:04 +0000
# Labels:           app=redis
#                   pod-template-hash=85cd7f84f5
# Annotations:      <none>
# Status:           Pending
# IP:               10.22.0.9
# IPs:
#   IP:           10.22.0.9
# Controlled By:  ReplicaSet/redis-deployment-85cd7f84f5
# Containers:
#   redis-container:
#     Container ID:   
#     Image:          redis:alpin
#     Image ID:       
#     Port:           6379/TCP
#     Host Port:      0/TCP
#     State:          Waiting
#       Reason:       ImagePullBackOff
#     Ready:          False
#     Restart Count:  0
#     Requests:
#       cpu:        300m
#     Environment:  <none>
#     Mounts:
#       /redis-master from config (rw)
#       /redis-master-data from data (rw)
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-9llpd (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       False 
#   ContainersReady             False 
#   PodScheduled                True 
# Volumes:
#   data:
#     Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
#     Medium:     
#     SizeLimit:  <unset>
#   config:
#     Type:      ConfigMap (a volume populated by a ConfigMap)
#     Name:      redis-config
#     Optional:  false
#   kube-api-access-9llpd:
#     Type:                    Projected (a volume that contains injected data from multiple sources)
#     TokenExpirationSeconds:  3607
#     ConfigMapName:           kube-root-ca.crt
#     Optional:                false
#     DownwardAPI:             true
# QoS Class:                   Burstable
# Node-Selectors:              <none>
# Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                              node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
# Events:
#   Type     Reason     Age                  From               Message
#   ----     ------     ----                 ----               -------
#   Normal   Scheduled  2m23s                default-scheduler  Successfully assigned default/redis-deployment-85cd7f84f5-wgm9r to jump-host
#   Normal   Pulling    49s (x4 over 2m23s)  kubelet            Pulling image "redis:alpin"
#   Warning  Failed     48s (x4 over 2m22s)  kubelet            Failed to pull image "redis:alpin": rpc error: code = NotFound desc = failed to pull and unpack image "docker.io/library/redis:alpin": failed to resolve reference "docker.io/library/redis:alpin": docker.io/library/redis:alpin: not found
#   Warning  Failed     48s (x4 over 2m22s)  kubelet            Error: ErrImagePull
#   Normal   BackOff    6s (x8 over 2m21s)   kubelet            Back-off pulling image "redis:alpin"
#   Warning  Failed     6s (x8 over 2m21s)   kubelet            Error: ImagePullBackOff

kubectl edit deployments.apps redis-deployment 
# output:
# deployment.apps/redis-deployment edited

kubectl get all
# output:
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/redis-deployment-5476b4ddd6-nhknn   1/1     Running   0          18s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   47m

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/redis-deployment   1/1     1            1           6m52s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/redis-deployment-5476b4ddd6   1         1         1       18s
# replicaset.apps/redis-deployment-6bc546f779   0         0         0       6m52s
# replicaset.apps/redis-deployment-85cd7f84f5   0         0         0       3m50s

kubectl exec -it redis-deployment-5476b4ddd6-nhknn -c redis-container -- ls -ltr
# output:
# total 0