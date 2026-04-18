kubectl get all
# output:
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/nginx-deployment-6655dc8cfb-7sxn7   1/1     Running   0          2m30s
# pod/nginx-deployment-6655dc8cfb-hcjc7   1/1     Running   0          2m35s
# pod/nginx-deployment-6655dc8cfb-r2h2d   1/1     Running   0          2m29s

# NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        32m
# service/nginx-service   NodePort    10.43.84.191   <none>        80:30008/TCP   12m

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/nginx-deployment   3/3     3            3           12m

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/nginx-deployment-6655dc8cfb   3         3         3       2m35s
# replicaset.apps/nginx-deployment-fc677cbc9    0         0         0       12m

kubectl edit deployment nginx-deployment

kubectl describe deployment nginx-deployment
# output:
# Name:                   nginx-deployment
# Namespace:              default
# CreationTimestamp:      Wed, 18 Mar 2026 14:21:10 +0000
# Labels:                 app=nginx-app
#                         type=front-end
# Annotations:            deployment.kubernetes.io/revision: 2
# Selector:               app=nginx-app
# Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
# StrategyType:           RollingUpdate
# MinReadySeconds:        0
# RollingUpdateStrategy:  25% max unavailable, 25% max surge
# Pod Template:
#   Labels:  app=nginx-app
#   Containers:
#    nginx-container:
#     Image:         nginx:1.19
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
# NewReplicaSet:   nginx-deployment-6655dc8cfb (3/3 replicas created)
# Events:
#   Type    Reason             Age   From                   Message
#   ----    ------             ----  ----                   -------
#   Normal  ScalingReplicaSet  10m   deployment-controller  Scaled up replica set nginx-deployment-fc677cbc9 from 0 to 3
#   Normal  ScalingReplicaSet  12s   deployment-controller  Scaled up replica set nginx-deployment-6655dc8cfb from 0 to 1
#   Normal  ScalingReplicaSet  7s    deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 3 to 2
#   Normal  ScalingReplicaSet  7s    deployment-controller  Scaled up replica set nginx-deployment-6655dc8cfb from 1 to 2
#   Normal  ScalingReplicaSet  6s    deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 2 to 1
#   Normal  ScalingReplicaSet  6s    deployment-controller  Scaled up replica set nginx-deployment-6655dc8cfb from 2 to 3
#   Normal  ScalingReplicaSet  5s    deployment-controller  Scaled down replica set nginx-deployment-fc677cbc9 from 1 to 0