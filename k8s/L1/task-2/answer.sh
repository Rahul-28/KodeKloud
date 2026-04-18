kubectl create deployment nginx --image=nginx:latest 
# output:
# deployment.apps/nginx created

kubectl get deployments.apps 
# output:
# NAME    READY   UP-TO-DATE   AVAILABLE   AGE
# nginx   1/1     1            1           6s

kubectl get replicasets.apps 
# output:
# NAME               DESIRED   CURRENT   READY   AGE
# nginx-7c5d8bf9f7   1         1         1       43s

kubectl get pods
# output:
# NAME                     READY   STATUS    RESTARTS   AGE
# nginx-7c5d8bf9f7-vlprj   1/1     Running   0          62s
