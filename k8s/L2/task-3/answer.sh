vi dep-def.yaml 

cat dep-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: nginx-deployment
# spec:
#   replicas: 3
#   selector:
#     matchLabels:
#       app: nginx
#   template:
#     metadata:
#       labels:
#         app: nginx
#     spec:
#       containers:
#       - name: nginx-container
#         image: nginx:latest
#         ports:
#         - containerPort: 80

vi np-def.yaml 

cat np-def.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: nginx-service
# spec:
#   type: NodePort
#   selector:
#     app: nginx
#   ports:
#   - port: 80
#     targetPort: 80
#     nodePort: 30011

kubectl create -f .
# output:
# deployment.apps/nginx-deployment created
# service/nginx-service created

kubectl get all
# output:
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/nginx-deployment-6586c5b5fb-68d8w   1/1     Running   0          17s
# pod/nginx-deployment-6586c5b5fb-rcndh   1/1     Running   0          17s
# pod/nginx-deployment-6586c5b5fb-rtw46   1/1     Running   0          17s

# NAME                    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        32m
# service/nginx-service   NodePort    10.43.36.195   <none>        80:30011/TCP   17s

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/nginx-deployment   3/3     3            3           17s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/nginx-deployment-6586c5b5fb   3         3         3       17s