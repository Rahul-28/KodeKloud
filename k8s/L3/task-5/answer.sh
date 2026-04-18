k create secret generic news --from-file=/opt/news.txt
# output:
# secret/news created

k describe secret news
# output:
# Name:         news
# Namespace:    default
# Labels:       <none>
# Annotations:  <none>

# Type:  Opaque

# Data
# ====
# news.txt:  7 bytes

k get secrets news -o yaml
# output:
# apiVersion: v1
# data:
#   news.txt: NWVjdXIzCg==
# kind: Secret
# metadata:
#   creationTimestamp: "2026-04-18T10:32:06Z"
#   name: news
#   namespace: default
#   resourceVersion: "1673"
#   uid: a577236f-27cd-4a79-90f0-c2eec59d1350
# type: Opaque

vi pod-def.yaml

cat pod-def.yaml
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   name: secret-xfusion
# spec:
#   containers:
#   - name: secret-container-xfusion
#     image: debian:latest
#     command: [ "/bin/bash", "-c" ]
#     args:
#     - "sleep 1000"
#     volumeMounts:
#     - name: secret
#       mountPath: /opt/games
#   volumes:
#   - name: secret
#     secret:
#       secretName: news

k create -f pod-def.yml 
# output:
# pod/secret-xfusion created

k exec -it pods/secret-xfusion -c secret-container-xfusion -- cat /opt/games/news.txt
# output:
# 5ecur3