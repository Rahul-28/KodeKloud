k create namespace iron-namespace-xfusion
# namespace/iron-namespace-xfusion created

vi deploy-def.yaml

cat deploy-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: iron-gallery-deployment-xfusion
#   namespace: iron-namespace-xfusion
#   labels:
#     run: iron-gallery
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       run: iron-gallery
#   template:
#     metadata:
#       labels: 
#         run: iron-gallery
#     spec:
#       containers:
#       - name: iron-gallery-container-xfusion
#         image: kodekloud/irongallery:2.0
#         resources:
#           limits:
#             memory: "100Mi"
#             cpu: "50m"
#         volumeMounts:
#         - name: config
#           mountPath: /usr/share/nginx/html/data
#         - name: images
#           mountPath: /usr/share/nginx/html/uploads
#       volumes:
#       - name: config
#         emptyDir: {}
#       - name: images
#         emptyDir: {}


vi db-deploy-def.yaml

cat db-deploy-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: iron-db-deployment-xfusion
#   namespace: iron-namespace-xfusion
#   labels:
#     db: mariadb
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       db: mariadb
#   template:
#     metadata:
#       labels:
#         db: mariadb
#     spec:
#       containers:
#       - name: iron-db-container-xfusion
#         image: kodekloud/irondb:2.0
#         env:
#           - name: MYSQL_DATABASE
#             value: database_blog
#           - name: MYSQL_ROOT_PASSWORD
#             value: R00t
#           - name: MYSQL_PASSWORD
#             value: U5er
#           - name: MYSQL_USER
#             value: kodekloud_rob

vi db-deploy-def.yaml 

cat db-deploy-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: iron-db-deployment-xfusion
#   labels:
#     db: mariadb
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       db: mariadb
#   template:
#     metadata:
#       labels:
#         db: mariadb
#     spec:
#       containers:
#       - name: iron-db-container-xfusion
#         image: kodekloud/irondb:2.0
#         env:
#         - name: MYSQL_DATABASE
#           value: database_blog
#         - name: MYSQL_ROOT_PASSWORD
#           value: R00t@Seccure
#         - name: MYSQL_PASSWORD
#           value: U5er@Seccure
#         - name: MYSQL_USER
#           value: kodekloud_rob
#         volumeMounts:
#         - name: db
#           mountPath: /var/lib/mysql
#       volumes:
#       - name: db
#         emptyDir: {}

vi db-service.yaml 

cat db-service.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: iron-db-service-xfusion
#   namespace: iron-namespace-xfusion
# spec:
#   selector:
#     db: mariadb
#   type: ClusterIP
#   ports: 
#   - port: 3306
#     targetPort: 3306
#     protocol: TCP

cp db-service.yaml node-service.yaml

vi node-service.yaml

cat node-service.yaml
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: iron-gallery-service-xfusion
#   namespace: iron-namespace-xfusion
# spec:
#   selector:
#     run: iron-gallery
#   type: NodePort
#   ports: 
#   - port: 80
#     targetPort: 80
#     nodePort: 32678
#     protocol: TCP

k create -f .
# deployment.apps/iron-db-deployment-xfusion created
# service/iron-db-service-xfusion created
# deployment.apps/iron-gallery-deployment-xfusion created
# service/iron-gallery-service-xfusion created

k get all -n iron-namespace-xfusion
# NAME                                                   READY   STATUS    RESTARTS   AGE
# pod/iron-db-deployment-xfusion-6456bdf974-8lt7k        1/1     Running   0          25s
# pod/iron-gallery-deployment-xfusion-7896db44dc-8c2nb   1/1     Running   0          25s

# NAME                                   TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
# service/iron-db-service-xfusion        ClusterIP   10.43.76.29     <none>        3306/TCP       25s
# service/iron-gallery-service-xfusion   NodePort    10.43.132.252   <none>        80:32678/TCP   25s

# NAME                                              READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/iron-db-deployment-xfusion        1/1     1            1           25s
# deployment.apps/iron-gallery-deployment-xfusion   1/1     1            1           25s

# NAME                                                         DESIRED   CURRENT   READY   AGE
# replicaset.apps/iron-db-deployment-xfusion-6456bdf974        1         1         1       25s
# replicaset.apps/iron-gallery-deployment-xfusion-7896db44dc   1         1         1       25s