cat src.yaml

# output:
# ---
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: redis-master
#   labels:
#     app: redis-master
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: redis-master
#   template:
#     metadata:
#       labels:
#         app: redis-master
#     spec:
#       containers:
#         - name: master-redis-datacenter
#           image: redis
#           ports:
#             - containerPort: 6379
#           resources:
#             requests:
#               cpu: "100m"
#               memory: "100Mi"

# ---
# apiVersion: v1
# kind: Service
# metadata:
#   name: redis-master
# spec:
#   selector:
#     app: redis-master
#   ports:
#     - port: 6379
#       targetPort: 6379

# ---
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: redis-slave
#   labels:
#     app: redis-slave
# spec:
#   replicas: 2
#   selector:
#     matchLabels:
#       app: redis-slave
#   template:
#     metadata:
#       labels:
#         app: redis-slave
#     spec:
#       containers:
#         - name: slave-redis-datacenter
#           image: gcr.io/google_samples/gb-redisslave:v3
#           ports:
#             - containerPort: 6379
#           resources:
#             requests:
#               cpu: "100m"
#               memory: "100Mi"
#           env:
#             - name: GET_HOSTS_FROM
#               value: "dns"

# ---
# apiVersion: v1
# kind: Service
# metadata:
#   name: redis-slave
# spec:
#   selector:
#     app: redis-slave
#   ports:
#     - port: 6379
#       targetPort: 6379

# ---
# apiVersion: v1
# kind: Service
# metadata:
#   name: redis-follower
# spec:
#   selector:
#     app: redis-slave
#   ports:
#     - port: 6379
#       targetPort: 6379

# ---
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: frontend
#   labels:
#     app: frontend
# spec:
#   replicas: 3
#   selector:
#     matchLabels:
#       app: frontend
#   template:
#     metadata:
#       labels:
#         app: frontend
#     spec:
#       containers:
#         - name: php-redis-datacenter
#           image: gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff
#           ports:
#             - containerPort: 80
#           resources:
#             requests:
#               cpu: "100m"
#               memory: "100Mi"
#           env:
#             - name: GET_HOSTS_FROM
#               value: "dns"

# ---
# apiVersion: v1
# kind: Service
# metadata:
#   name: frontend
# spec:
#   type: NodePort
#   selector:
#     app: frontend
#   ports:
#     - port: 80
#       targetPort: 80
#       nodePort: 30009

k apply -f src.yml 
# output:
# deployment.apps/redis-master created
# service/redis-master created
# deployment.apps/redis-slave created
# service/redis-slave created
# service/redis-follower created
# deployment.apps/frontend created
# service/frontend created

k get all
# output:
# NAME                                READY   STATUS    RESTARTS   AGE
# pod/frontend-76cf8db799-74zv6       1/1     Running   0          2m3s
# pod/frontend-76cf8db799-gmtql       1/1     Running   0          2m3s
# pod/frontend-76cf8db799-lbblh       1/1     Running   0          2m3s
# pod/redis-master-594ffd4b64-smdbm   1/1     Running   0          2m4s
# pod/redis-slave-5476897f9-cbccr     1/1     Running   0          2m3s
# pod/redis-slave-5476897f9-zwqqq     1/1     Running   0          2m3s

# NAME                     TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/frontend         NodePort    10.43.131.41   <none>        80:30009/TCP   2m3s
# service/kubernetes       ClusterIP   10.43.0.1      <none>        443/TCP        23m
# service/redis-follower   ClusterIP   10.43.68.124   <none>        6379/TCP       2m3s
# service/redis-master     ClusterIP   10.43.251.24   <none>        6379/TCP       2m4s
# service/redis-slave      ClusterIP   10.43.61.57    <none>        6379/TCP       2m4s

# NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/frontend       3/3     3            3           2m3s
# deployment.apps/redis-master   1/1     1            1           2m4s
# deployment.apps/redis-slave    2/2     2            2           2m4s

# NAME                                      DESIRED   CURRENT   READY   AGE
# replicaset.apps/frontend-76cf8db799       3         3         3       2m3s
# replicaset.apps/redis-master-594ffd4b64   1         1         1       2m4s
# replicaset.apps/redis-slave-5476897f9     2         2         2       2m4s