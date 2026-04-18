vi pod-def.yaml

cat pod-def.yaml 
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   name: envars
# spec:
#   containers:
#   - name: fieldref-container
#     image: nginx:latest
#     command: [ "/bin/sh", "-c" ]
#     args:
#     - while true; do
#         echo '';
#         printenv NODE_NAME POD_NAME;
#         printenv POD_IP POD_SERVICE_ACCOUNT;
#         sleep 10;
#       done;
#     env:
#     - name: NODE_NAME
#       valueFrom:
#         fieldRef:
#           fieldPath: spec.nodeName
#     - name: POD_NAME
#       valueFrom:
#         fieldRef: 
#           fieldPath: metadata.name
#     - name: POD_IP
#       valueFrom:
#         fieldRef: 
#           fieldPath: status.podIP
#     - name: POD_SERVICE_ACCOUNT
#       valueFrom:
#         fieldRef:
#           fieldPath: spec.serviceAccountName
#   restartPolicy: Never

k create -f .
# output:
# pod/envars created

k logs pods/envars 
# output:

# jump-host
# envars
# 10.22.0.9
# default

# jump-host
# envars
# 10.22.0.9
# default