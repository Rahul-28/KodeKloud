kubectl run httpd-pod --image=httpd:latest --dry-run=client -o yaml > pod-def.yaml

vi pod-def.yaml 

cat pod-def.yaml 
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   labels:
#     run: httpd-pod
#   name: httpd-pod
# spec:
#   containers:
#   - image: httpd:latest
#     name: httpd-container
#     resources:
#       requests:
#         memory: "15Mi"
#         cpu: "100m"
#       limits:
#         memory: "20Mi"
#         cpu: "100m"
#   dnsPolicy: ClusterFirst
#   restartPolicy: Always
# status: {}

kubectl apply -f pod-def.yaml 
# output:
# pod/httpd-pod created

kubectl get pods
# output (to check limits and requests under containers):
# NAME        READY   STATUS    RESTARTS   AGE
# httpd-pod   1/1     Running   0          88s

# kubectl describe pods httpd-pod
# Name:             httpd-pod
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.73.182
# Start Time:       Tue, 17 Mar 2026 03:17:41 +0000
# Labels:           run=httpd-pod
# Annotations:      <none>
# Status:           Running
# IP:               10.22.0.9
# IPs:
#   IP:  10.22.0.9
# Containers:
#   httpd-container:
#     Container ID:   containerd://f98de184396eec46574618d3d2a3a0ae5414c2461957317c6d267f485e5ffb61
#     Image:          httpd:latest
#     Image ID:       docker.io/library/httpd@sha256:331548c5249bdeced0f048bc2fb8c6b6427d2ec6508bed9c1fec6c57d0b27a60
#     Port:           <none>
#     Host Port:      <none>
#     State:          Running
#       Started:      Tue, 17 Mar 2026 03:17:46 +0000
#     Ready:          True
#     Restart Count:  0
#     Limits:
#       cpu:     100m
#       memory:  20Mi
#     Requests:
#       cpu:        100m
#       memory:     15Mi
#     Environment:  <none>
#     Mounts:
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-npntn (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       True 
#   ContainersReady             True 
#   PodScheduled                True 
# Volumes:
#   kube-api-access-npntn:
#     Type:                    Projected (a volume that contains injected data from multiple sources)
#     TokenExpirationSeconds:  3607
#     ConfigMapName:           kube-root-ca.crt
#     Optional:                false
#     DownwardAPI:             true
# QoS Class:                   Burstable
# Node-Selectors:              <none>
# Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                              node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
# Events:
#   Type    Reason     Age   From               Message
#   ----    ------     ----  ----               -------
#   Normal  Scheduled  2m1s  default-scheduler  Successfully assigned default/httpd-pod to jump-host
#   Normal  Pulling    2m1s  kubelet            Pulling image "httpd:latest"
#   Normal  Pulled     117s  kubelet            Successfully pulled image "httpd:latest" in 3.478s (3.478s including waiting). Image size: 45239959 bytes.
#   Normal  Created    117s  kubelet            Created container: httpd-container
#   Normal  Started    117s  kubelet            Started container httpd-container