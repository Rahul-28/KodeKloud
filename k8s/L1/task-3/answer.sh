kubectl create namespace dev
# output:
# namespace/dev created

kubectl get namespaces 
# output
# NAME              STATUS   AGE
# default           Active   45m
# dev               Active   3m54s
# kube-node-lease   Active   45m
# kube-public       Active   45m
# kube-system       Active   45m

kubectl run dev-nginx-pod --image=nginx:latest --namespace=dev
# output:
# pod/dev-nginx-pod created

kubectl get pods -n dev
# output:
# NAME            READY   STATUS    RESTARTS   AGE
# dev-nginx-pod   1/1     Running   0          42s