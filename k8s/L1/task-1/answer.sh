kubectl run pod-nginx --image=nginx:latest --dry-run=client -o yaml >> pod.yaml

vi pod.yaml

cat pod.yaml
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   labels:
#     app: nginx_app
#   name: pod-nginx
# spec:
#   containers:
#   - image: nginx:latest
#     name: nginx-container
#     resources: {}
#   dnsPolicy: ClusterFirst
#   restartPolicy: Always
# status: {}

kubectl create -f pod.yaml 
# output:
# pod/pod-nginx created

kubectl get pods
# output:
# NAME        READY   STATUS    RESTARTS   AGE
# pod-nginx   1/1     Running   0          2m47s