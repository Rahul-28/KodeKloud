kubectl create namespace nautilus
# output:
# namespace/nautilus created

kubectl run time-check --image=busybox:latest --namespace=nautilus --dry-run=client -o yaml > pod-def.yml

cat pod-def.yml 
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   labels:
#     run: time-check
#   name: time-check
#   namespace: nautilus
# spec:
#   containers:
#   - image: busybox:latest
#     name: time-check
#     command: ["/bin/sh", "-c"]  
#     args:
#       - "while true; do date; sleep $TIME_FREQ; done >> /opt/finance/time/time-check.log" 
#     env:
#       - name: TIME_FREQ
#         valueFrom:
#           configMapKeyRef:
#             name: time-config
#             key: TIME_FREQ  
#     volumeMounts:                 
#       - name: log-volume
#         mountPath: "/opt/finance/time"
#   volumes:                       
#     - name: log-volume
#       emptyDir: {}
#   dnsPolicy: ClusterFirst
#   restartPolicy: Always

cat cm-def.yml
# output:
# apiVersion: v1
# kind: ConfigMap
# metadata:
#   name: time-config
#   namespace: nautilus
# data:
#   TIME_FREQ: "12"

kubectl create -f cm-def.yml 
# output:
# configmap/time-config created

kubectl create -f pod-def.yml 
# output:
# pod/time-check created

kubectl  get all --namespace=nautilus
# output:
# NAME             READY   STATUS    RESTARTS   AGE
# pod/time-check   1/1     Running   0          20s

kubectl get configmaps --namespace=nautilus
# output:
# NAME               DATA   AGE
# kube-root-ca.crt   1      2m44s
# time-config        1      2m2s

kubectl exec -it time-check -n nautilus -- cat /opt/finance/time/time-check.log
# output:
# Tue Mar 24 18:07:36 UTC 2026
# Tue Mar 24 18:07:48 UTC 2026
# Tue Mar 24 18:08:00 UTC 2026
# Tue Mar 24 18:08:12 UTC 2026
# Tue Mar 24 18:08:24 UTC 2026
# Tue Mar 24 18:08:36 UTC 2026
# Tue Mar 24 18:08:48 UTC 2026
# Tue Mar 24 18:09:00 UTC 2026
# Tue Mar 24 18:09:12 UTC 2026
# Tue Mar 24 18:09:24 UTC 2026
# Tue Mar 24 18:09:36 UTC 2026
# Tue Mar 24 18:09:48 UTC 2026