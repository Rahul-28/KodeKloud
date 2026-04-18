kubectl create namespace devops
# namespace/devops created

vi dep-def.yaml

cat dep-def.yaml
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: httpd-deploy
# spec:
#   replicas: 3
#   strategy:
#     type: RollingUpdate
#     rollingUpdate:
#       maxSurge: 1
#       maxUnavailable: 2
#   selector:
#     matchLabels:
#       app: httpd
#   template:
#     metadata:
#       labels:
#         app: httpd
#     spec:
#       containers:
#       - name: httpd
#         image: httpd:2.4.27
#         ports: 
#         - containerPort: 80

vi np-def.yaml

cat np-def.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: httpd-service
# spec:
#   type: NodePort
#   selector:
#     app: httpd
#   ports:
#     - port: 80
#       targetPort: 80
#       nodePort: 30008

kubectl create -f dep-def.yaml --namespace=devops
# output:
# deployment.apps/httpd-deploy created

kubectl create -f np-def.yaml --namespace=devops
# output:
# service/httpd-service created

kubectl get all --namespace=devops
# output:
# NAME                                READY   STATUS    RESTARTS   AGE
# pod/httpd-deploy-7798d5d474-7lnbx   1/1     Running   0          116s
# pod/httpd-deploy-7798d5d474-82bnq   1/1     Running   0          116s
# pod/httpd-deploy-7798d5d474-dndvg   1/1     Running   0          116s

# NAME                    TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/httpd-service   NodePort   10.43.161.83   <none>        80:30008/TCP   38s

# NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/httpd-deploy   3/3     3            3           116s

# NAME                                      DESIRED   CURRENT   READY   AGE
# replicaset.apps/httpd-deploy-7798d5d474   3         3         3       116s

kubectl rollout status deployment httpd-deploy --namespace=devops
# output:
# deployment "httpd-deploy" successfully rolled out

kubectl rollout history deployment httpd-deploy --namespace=devops
# output:
# deployment.apps/httpd-deploy 
# REVISION  CHANGE-CAUSE
# 1         <none>

kubectl edit deployment/httpd-deploy --namespace=devops
# output:
# deployment.apps/httpd-deploy edited

kubectl rollout history deployment httpd-deploy --namespace=devopsdeployment.apps/httpd-deploy 
# output:
# REVISION  CHANGE-CAUSE
# 1         <none>
# 2         <none>

kubectl rollout undo deployment/httpd-deploy --namespace=devops --to-revision=1
# output:
# deployment.apps/httpd-deploy rolled back

kubectl rollout history deployments/httpd-deploy --namespace=devops
# output:
# deployment.apps/httpd-deploy 
# REVISION  CHANGE-CAUSE
# 2         <none>
# 3         <none>
