kubectl get all
# output:
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/nginx-deployment-7795857fdb-2wcss   1/1     Running   0          2m
# pod/nginx-deployment-7795857fdb-qqqh9   1/1     Running   0          2m
# pod/nginx-deployment-7795857fdb-tdhxb   1/1     Running   0          2m4s

# NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        23m
# service/nginx-service   NodePort    10.43.128.79   <none>        80:30008/TCP   2m14s

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/nginx-deployment   3/3     3            3           2m14s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/nginx-deployment-7795857fdb   3         3         3       2m4s
# replicaset.apps/nginx-deployment-fc677cbc9    0         0         0       2m14s

kubectl describe deployments.apps nginx-deployment 
# output (note the image):
# Name:                   nginx-deployment
# Namespace:              default
# CreationTimestamp:      Thu, 19 Mar 2026 15:28:02 +0000
# Labels:                 app=nginx-app
#                         type=front-end
# Annotations:            deployment.kubernetes.io/revision: 2
#                         kubernetes.io/change-cause: kubectl set image deployment nginx-deployment nginx-container=nginx:alpine --record=true
# Selector:               app=nginx-app
# Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
# StrategyType:           RollingUpdate
# MinReadySeconds:        0
# RollingUpdateStrategy:  25% max unavailable, 25% max surge
# Pod Template:
#   Labels:  app=nginx-app
#   Containers:
#    nginx-container:
#     Image:         nginx:alpine
#     Port:          <none>
#     Host Port:     <none>
#     Environment:   <none>
#     Mounts:        <none>
#   Volumes:         <none>
#   Node-Selectors:  <none>
#   Tolerations:     <none>
# Conditions:
#   Type           Status  Reason
#   ----           ------  ------
#   Available      True    MinimumReplicasAvailable
#   Progressing    True    NewReplicaSetAvailable
# OldReplicaSets:  nginx-deployment-fc677cbc9 (0/0 replicas created)
# NewReplicaSet:   nginx-deployment-7795857fdb (3/3 replicas created)
# Events:
#   Type    Reason             Age    From                   Message
#   ----    ------             ----   ----                   -------
#   Normal  ScalingReplicaSet  2m39s  deployment-controller  Scaled up replica set nginx-deployment-fc677cbc9 from 0 to 3
#   Normal  ScalingReplicaSet  2m29s  deployment-controller  Scaled up replica set nginx-deployment-7795857fdb from 0 to 1
#   Normal  ScalingReplicaSet  2m26s  deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 3 to 2
#   Normal  ScalingReplicaSet  2m25s  deployment-controller  Scaled up replica set nginx-deployment-7795857fdb from 1 to 2
#   Normal  ScalingReplicaSet  2m25s  deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 2 to 1
#   Normal  ScalingReplicaSet  2m25s  deployment-controller  Scaled up replica set nginx-deployment-7795857fdb from 2 to 3
#   Normal  ScalingReplicaSet  2m24s  deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 1 to 0

kubectl rollout undo deployment nginx-deployment
# output:
# deployment.apps/nginx-deployment rolled back

kubectl describe deployments.apps nginx-deployment
# output (note the image):
# Name:                   nginx-deployment
# Namespace:              default
# CreationTimestamp:      Thu, 19 Mar 2026 15:28:02 +0000
# Labels:                 app=nginx-app
#                         type=front-end
# Annotations:            deployment.kubernetes.io/revision: 3
# Selector:               app=nginx-app
# Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
# StrategyType:           RollingUpdate
# MinReadySeconds:        0
# RollingUpdateStrategy:  25% max unavailable, 25% max surge
# Pod Template:
#   Labels:  app=nginx-app
#   Containers:
#    nginx-container:
#     Image:         nginx:1.16
#     Port:          <none>
#     Host Port:     <none>
#     Environment:   <none>
#     Mounts:        <none>
#   Volumes:         <none>
#   Node-Selectors:  <none>
#   Tolerations:     <none>
# Conditions:
#   Type           Status  Reason
#   ----           ------  ------
#   Available      True    MinimumReplicasAvailable
#   Progressing    True    NewReplicaSetAvailable
# OldReplicaSets:  nginx-deployment-7795857fdb (0/0 replicas created)
# NewReplicaSet:   nginx-deployment-fc677cbc9 (3/3 replicas created)
# Events:
#   Type    Reason             Age              From                   Message
#   ----    ------             ----             ----                   -------
#   Normal  ScalingReplicaSet  4m32s            deployment-controller  Scaled up replica set nginx-deployment-fc677cbc9 from 0 to 3
#   Normal  ScalingReplicaSet  4m22s            deployment-controller  Scaled up replica set nginx-deployment-7795857fdb from 0 to 1
#   Normal  ScalingReplicaSet  4m19s            deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 3 to 2
#   Normal  ScalingReplicaSet  4m18s            deployment-controller  Scaled up replica set nginx-deployment-7795857fdb from 1 to 2
#   Normal  ScalingReplicaSet  4m18s            deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 2 to 1
#   Normal  ScalingReplicaSet  4m18s            deployment-controller  Scaled up replica set nginx-deployment-7795857fdb from 2 to 3
#   Normal  ScalingReplicaSet  4m17s            deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 1 to 0
#   Normal  ScalingReplicaSet  11s              deployment-controller  Scaled up replica set nginx-deployment-fc677cbc9 from 0 to 1
#   Normal  ScalingReplicaSet  9s               deployment-controller  Scaled down replica set nginx-deployment-7795857fdb from 3 to 2
#   Normal  ScalingReplicaSet  7s (x4 over 9s)  deployment-controller  (combined from similar events): Scaled down replica set nginx-deployment-7795857fdb from 1 to 0
