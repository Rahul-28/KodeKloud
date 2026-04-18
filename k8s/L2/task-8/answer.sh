kubectl create namespace tomcat-namespace-nautilus
# output:
# namespace/tomcat-namespace-nautilus created

vi dep-def.yaml

cat dep-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: tomcat-deployment-nautilus
#   labels:
#     app: tomcat
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: tomcat
#   template:
#     metadata:
#       labels:
#         app: tomcat
#     spec:
#       containers:
#         - name: tomcat-container-nautilus
#           image: kodekloud/centos-ssh-enabled:tomcat
#           ports:
#           - containerPort: 8080

vi np-def.yaml

cat np-def.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: tomcat-service-nautilus
#   labels:
#     app: tomcat
# spec:
#   type: Nodeport
#   selector:
#     app: tomcat
#   ports:
#   - port: 8080
#     targetPort: 8080
#     nodePort: 32227          

kubectl create -f . --namespace=tomcat-namespace-nautilus
# output:
# deployment.apps/tomcat-deployment-nautilus created
# service/tomcat-service-nautilus created

kubectl get all --namespace=tomcat-namespace-nautilus
# output:
# NAME                                             READY   STATUS    RESTARTS   AGE
# pod/tomcat-deployment-nautilus-df9678d45-t4jlm   1/1     Running   0          61s

# NAME                              TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
# service/tomcat-service-nautilus   NodePort   10.43.249.252   <none>        8080:32227/TCP   28s

# NAME                                         READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/tomcat-deployment-nautilus   1/1     1            1           61s

# NAME                                                   DESIRED   CURRENT   READY   AGE
# replicaset.apps/tomcat-deployment-nautilus-df9678d45   1         1         1       61s