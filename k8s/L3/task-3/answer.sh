vi deploy-def.yaml 

cat deploy-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: ic-deploy-datacenter
#   labels:
#     app: ic-datacenter
# spec:
#   replicas: 1
#   selector: 
#     matchLabels:
#       app: ic-datacenter
#   template:
#     metadata:
#       labels:
#         app: ic-datacenter
#     spec:
#       initContainers:
#       - name: ic-msg-datacenter
#         image: fedora:latest
#         command: [ "/bin/bash", "-c" ]
#         args:
#         - "echo Init Done - Welcome to xFusionCorp Industries > /ic/media"
#         volumeMounts: 
#         - name: ic-volume-datacenter
#           mountPath: /ic
#       containers:
#       - name: ic-main-datacenter
#         image: fedora:latest
#         command: [ "/bin/bash", "-c" ]
#         args:
#         - "while true; do cat /ic/media; sleep 5; done"
#         volumeMounts:
#         - name: ic-volume-datacenter
#           mountPath: /ic
#       volumes:
#       - name: ic-volume-datacenter
#         emptyDir: {}

k create -f . 
# deployment.apps/ic-deploy-datacenter created

k logs ic-deploy-datacenter-5dbcd499bf-j8g58 -c ic-main-datacenter
# Init Done - Welcome to xFusionCorp Industries
# Init Done - Welcome to xFusionCorp Industries
# Init Done - Welcome to xFusionCorp Industries
# Init Done - Welcome to xFusionCorp Industries
# Init Done - Welcome to xFusionCorp Industries
# Init Done - Welcome to xFusionCorp Industries
# Init Done - Welcome to xFusionCorp Industries
# Init Done - Welcome to xFusionCorp Industries