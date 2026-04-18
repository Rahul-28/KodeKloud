vi dep-def.yaml

cat dep-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: node-app
#   labels:
#     app: node
# spec:
#   replicas: 2
#   selector:
#     matchLabels:
#       app: node
#   template:
#     metadata:
#       labels:
#         app: node
#     spec:
#       containers:
#       - name: node-container
#         image: kodekloud/centos-ssh-enabled:node
#         ports:
#         - containerPort: 8080

vi np-def.yaml 

cat np-def.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: node-service
#   labels:
#     app: node
# spec:
#   type: NodePort
#   selector: 
#     app: node
#   ports:
#   - port: 8080
#     targetPort: 8080
#     nodePort: 30012

kubectl create -f .
# output:
# deployment.apps/node-app created
# service/node-service created

kubectl get all
# output:
# NAME                           READY   STATUS    RESTARTS   AGE
# pod/node-app-75888cf7c-dnstg   1/1     Running   0          55s
# pod/node-app-75888cf7c-k726m   1/1     Running   0          55s

# NAME                   TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
# service/kubernetes     ClusterIP   10.43.0.1      <none>        443/TCP          37m
# service/node-service   NodePort    10.43.39.106   <none>        8080:30012/TCP   55s

# NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/node-app   2/2     2            2           55s

# NAME                                 DESIRED   CURRENT   READY   AGE
# replicaset.apps/node-app-75888cf7c   2         2         2       55s
