cat rs-def.yml 
# output:
# apiVersion: apps/v1
# kind: ReplicaSet
# metadata:
#   name: nginx-replicaset
#   labels:
#     app: nginx_app
#     type: front-end
# spec:
#   replicas: 4
#   selector:
#     matchLabels:
#       app: nginx_app
#       type: front-end
#   template:
#     labels:
#       metadata:
#         app: nginx_app
#         type: front-end
#     spec:
#       containers:
#         - name: nginx-container
#           image: nginx:latest

kubectl create -f rs-def.yml 
# output:
# replicaset.apps/nginx-replicaset created

kubectl get all
# output:
# NAME                         READY   STATUS    RESTARTS   AGE
# pod/nginx-replicaset-888l4   1/1     Running   0          32s
# pod/nginx-replicaset-hc6h4   1/1     Running   0          32s
# pod/nginx-replicaset-nfdjq   1/1     Running   0          32s
# pod/nginx-replicaset-r4bbt   1/1     Running   0          32s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   42m

# NAME                               DESIRED   CURRENT   READY   AGE
# replicaset.apps/nginx-replicaset   4         4         4       32s