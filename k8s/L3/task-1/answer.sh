k create namespace httpd-namespace-nautilus
# output:
# namespace/httpd-namespace-nautilus created

vi deploy-def.yaml

cat deploy-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: httpd-deployment-nautilus
#   labels:
#     app: httpd
# spec:
#   replicas: 2
#   selector:
#     matchLabels:
#       app: httpd
#   template:
#     metadata: 
#       labels:
#         app: httpd
#     spec:
#       containers:
#       - name: httpd-container
#         image: httpd:latest
#         ports:
#         - containerPort: 80

vi node-service.yaml

cat node-service.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: httpd-service-nautilus
#   labels:
#     app: httpd
# spec:
#    type: NodePort
#    selector:
#      app: httpd
#    ports:
#    - port: 80
#      targetPort: 80
#      nodeport: 30004

ls
# output:
# deploy-def.yaml    node-service.yaml

k create -f . --namespace=httpd-namespace-nautilus 
# output:
# deployment.apps/httpd-deployment-nautilus created
# service/httpd-service-nautilus created

k get all --namespace=httpd-namespace-nautilus 
# output:
# NAME                                             READY   STATUS    RESTARTS   AGE
# pod/httpd-deployment-nautilus-67bd6f4c7b-cbfc7   1/1     Running   0          78s
# pod/httpd-deployment-nautilus-67bd6f4c7b-ldnrz   1/1     Running   0          78s

# NAME                             TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/httpd-service-nautilus   NodePort   10.43.85.114   <none>        80:30004/TCP   21s

# NAME                                        READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/httpd-deployment-nautilus   2/2     2            2           78s

# NAME                                                   DESIRED   CURRENT   READY   AGE
# replicaset.apps/httpd-deployment-nautilus-67bd6f4c7b   2         2         2       78s