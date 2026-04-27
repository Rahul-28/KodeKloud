vi cm.yaml

cat cm.yaml 
# output:
# apiVersion: v1
# kind: ConfigMap
# metadata:
#   name: my-redis-config
# data:
#   redis-config: |
#     maxmemory 2mb
    
vi deploy-def.yaml

cat deploy-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: redis-deployment
#   labels:
#     app: redis
# spec:
#   replicas: 1
#   selector:
#      matchLabels:
#        app: redis
#   template:
#     metadata:
#       labels:
#         app: redis
#     spec:
#       containers:
#           - name: redis-container
#             image: redis:alpine
#             command:
#               - redis-server
#               - "/redis-master/redis.conf"
#             env:
#               - name: MASTER
#                 value: "true"
#             ports:
#               - containerPort: 6379
#             resources:
#               requests:
#                 cpu: "1"
#             volumeMounts:
#               - mountPath: /redis-master-data
#                 name: data
#               - mountPath: /redis-master
#                 name: config
#       volumes:
#         - name: data
#           emptyDir: {}
#         - name: config
#           configMap:
#             name: my-redis-config
#             items:
#               - key: redis-config
#                 path: redis.conf

k apply -f cm.yaml 
# configmap/my-redis-config created

# k describe cm my-redis-config 
# Name:         my-redis-config
# Namespace:    default
# Labels:       <none>
# Annotations:  <none>

# Data
# ====
# redis-config:
# ----
# maxmemory 2mb



# BinaryData
# ====

# Events:  <none>

kubectl apply -f deploy-def.yaml
# deployment.apps/redis-deployment created

kubectl get deployment redis-deploymentnt
# NAME               READY   UP-TO-DATE   AVAILABLE   AGE
# redis-deployment   1/1     1            1           22s

kubectl exec -it redis-deployment-dccf7c64-9rcr9 -- redis-cli ping
# PONG

kubectl exec -it redis-deployment-dccf7c64-9rcr9 -- redis-cli config get maxmemory
# 1) "maxmemory"
# 2) "2097152"