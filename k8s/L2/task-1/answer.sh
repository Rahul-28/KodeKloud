kubectl run volume-share-nautlius --image=debian:latest -o yaml > pod-def.yaml

kubectl get all
# output:
# NAME                        READY   STATUS             RESTARTS      AGE
# pod/volume-share-nautlius   0/1     CrashLoopBackOff   2 (25s ago)   42s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   36m

cat pod-def.yaml 
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   creationTimestamp: "2026-03-31T09:43:22Z"
#   generation: 1
#   labels:
#     run: volume-share-nautilus
#   name: volume-share-nautilus
#   namespace: default
#   resourceVersion: "1374"
#   uid: 3f789df2-f7f4-449f-b0b1-37174ba79890
# spec:
#   containers:
#   - image: debian:latest
#     imagePullPolicy: Always
#     name: volume-container-nautilus-1
#     resources: {}
#     terminationMessagePath: /dev/termination-log
#     terminationMessagePolicy: File
#     command: [ "/bin/sh", "-c" ]
#     args:
#     - "sleep 1000"
#     volumeMounts:
#     - mountPath: /tmp/media
#       name: volume-share
#     - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
#       name: kube-api-access-h4s87
#       readOnly: true
#   - image: debian:latest
#     imagePullPolicy: Always
#     name: volume-container-nautilus-2
#     resources: {}
#     terminationMessagePath: /dev/termination-log
#     terminationMessagePolicy: File
#     command: [ "/bin/sh", "-c" ]
#     args:
#     - "sleep 1000"
#     volumeMounts:
#     - mountPath: /tmp/cluster
#       name: volume-share
#     - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
#       name: kube-api-access-h4s87
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
#   - name: volume-share
#     emptyDir: {}
#   - name: kube-api-access-h4s87
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

kubectl delete pod volume-share-nautlius 
# output:
# pod "volume-share-nautlius" deleted from default namespace

kubectl create -f pod-def.yaml 
# output:
# pod/volume-share-nautilus created


kubectl get pod
# output:
# NAME                    READY   STATUS    RESTARTS   AGE
# volume-share-nautilus   2/2     Running   0          28s

kubectl exec -it volume-share-nautilus -c volume-container-nautilus-1 -- /bin/bash
# inside the container volume-container-nautilus-1:
# root@volume-share-nautilus:/# cd /tmp/media
# root@volume-share-nautilus:/tmp/media# touch media.txt
# root@volume-share-nautilus:/tmp/media# echo "Welcome to xFusionCorp Industries" > media.txt 
# root@volume-share-nautilus:/tmp/media# cat media.txt 
# Welcome to xFusionCorp Industries
# root@volume-share-nautilus:/tmp/media# exit
# exit

kubectl exec -it volume-share-nautilus -c volume-container-nautilus-2 -- /bin/bash
# inside the container volume-container-nautilus-2:
# root@volume-share-nautilus:/# cat /tmp/cluster/media.txt 
# Welcome to xFusionCorp Industries
# root@volume-share-nautilus:/# 
