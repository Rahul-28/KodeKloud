kubectl create namespace jenkins
# output:
# namespace/jenkins created

vi np-def.yaml

cat np-def.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: jenkins-service
# spec:
#   type: NodePort
#   selector:
#     app: jenkins
#   ports:
#   - port: 8080
#     targetPort: 8080
#     nodePort: 30008

vi dep-def.yaml 
cat dep-def.yaml
# output: 
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: jenkins-deployment
#   labels:
#     app: jenkins
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: jenkins
#   template:
#     metadata:
#       labels:
#         app: jenkins
#     spec:
#       containers:
#       - name: jenkins-container
#         image: jenkins/jenkins
#         ports:
#         - containerPort: 8080

kubectl create -f . --namespace=jenkins
# output:
# deployment.apps/jenkins-deployment created
# service/jenkins-service created

kubectl get all --namespace=jenkins
# output:
# NAME                                      READY   STATUS    RESTARTS   AGE
# pod/jenkins-deployment-749b885fbb-pw8f8   1/1     Running   0          23s

# NAME                      TYPE       CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
# service/jenkins-service   NodePort   10.43.37.66   <none>        8080:30008/TCP   23s

# NAME                                 READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/jenkins-deployment   1/1     1            1           23s

# NAME                                            DESIRED   CURRENT   READY   AGE
# replicaset.apps/jenkins-deployment-749b885fbb   1         1         1       23s