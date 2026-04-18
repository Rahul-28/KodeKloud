kubectl run webserver --image=nginx:latest -o yaml >pod-def.yaml

vi pod-def.yaml 

cat pod-def.yaml 
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   creationTimestamp: "2026-03-31T13:58:00Z"
#   generation: 1
#   labels:
#     run: webserver
#   name: webserver
#   namespace: default
#   resourceVersion: "1575"
#   uid: 0081a4d4-edd5-425e-98b6-2b1a4ad74811
# spec:
#   containers:
#   - image: nginx:latest
#     imagePullPolicy: Always
#     name: nginx-container
#     resources: {}
#     terminationMessagePath: /dev/termination-log
#     terminationMessagePolicy: File
#     volumeMounts:
#     - mountPath: /var/log/nginx
#       name: shared-logs
#     - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
#       name: kube-api-access-5cnxq
#       readOnly: true
#   - image: ubuntu:latest
#     imagePullPolicy: Always
#     name: sidecar-container
#     command: [ "/bin/sh", "-c" ]
#     args:
#     - "while true; do cat /var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done"
#     resources: {}
#     terminationMessagePath: /dev/termination-log
#     terminationMessagePolicy: File
#     volumeMounts:
#     - mountPath: /var/log/nginx
#       name: shared-logs
#     - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
#       name: kube-api-access-5cnxq
#       readOnly: true
#   dnsPolicy: ClusterFirst
#   enableServiceLinks: true
#   preemptionPolicy: PreemptLowerPriority
#   priority: 0
#   restartPolicy: Always
#   schedulerName: default-scheduler
#   securityContext: {}
#   serviceAccount: default
#   serviceAccountName: default
#   terminationGracePeriodSeconds: 30
#   tolerations:
#   - effect: NoExecute
#     key: node.kubernetes.io/not-ready
#     operator: Exists
#     tolerationSeconds: 300
#   - effect: NoExecute
#     key: node.kubernetes.io/unreachable
#     operator: Exists
#     tolerationSeconds: 300
#   volumes:
#   - name: shared-logs
#     emptyDir: {}
#   - name: kube-api-access-5cnxq
#     projected:
#       defaultMode: 420
#       sources:
#       - serviceAccountToken:
#           expirationSeconds: 3607
#           path: token
#       - configMap:
#           items:
#           - key: ca.crt
#             path: ca.crt
#           name: kube-root-ca.crt
#       - downwardAPI:
#           items:
#           - fieldRef:
#               apiVersion: v1
#               fieldPath: metadata.namespace
#             path: namespace
# status:
#   phase: Pending
#   qosClass: BestEffort

kubectl get all
# output:
# NAME            READY   STATUS    RESTARTS   AGE
# pod/webserver   1/1     Running   0          8m24s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   55m

kubectl delete pod webserver 
# output:
# pod "webserver" deleted from default namespace

kubectl create -f pod-def.yaml 
# output:
# pod/webserver created

kubectl exec -it webserver -c sidecar-container -- cat /var/log/nginx/error.log
# output:
# 2026/03/31 14:08:07 [notice] 1#1: using the "epoll" event method
# 2026/03/31 14:08:07 [notice] 1#1: nginx/1.29.7
# 2026/03/31 14:08:07 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
# 2026/03/31 14:08:07 [notice] 1#1: OS: Linux 6.8.0-94-generic
# 2026/03/31 14:08:07 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
# 2026/03/31 14:08:07 [notice] 1#1: start worker processes
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 78
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 79
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 80
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 81
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 82
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 83
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 84
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 85
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 86
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 87
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 88
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 89
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 90
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 91
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 92
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 93

kubectl exec -it webserver -c nginx-container -- cat /var/log/nginx/error.log
# output:
# 2026/03/31 14:08:07 [notice] 1#1: using the "epoll" event method
# 2026/03/31 14:08:07 [notice] 1#1: nginx/1.29.7
# 2026/03/31 14:08:07 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
# 2026/03/31 14:08:07 [notice] 1#1: OS: Linux 6.8.0-94-generic
# 2026/03/31 14:08:07 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
# 2026/03/31 14:08:07 [notice] 1#1: start worker processes
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 78
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 79
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 80
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 81
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 82
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 83
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 84
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 85
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 86
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 87
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 88
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 89
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 90
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 91
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 92
# 2026/03/31 14:08:07 [notice] 1#1: start worker process 93