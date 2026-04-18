vi pv.yml

cat pv.yml
# output:
# apiVersion: v1
# kind: PersistentVolume
# metadata:
#   name: pv-datacenter
#   labels:
#     app: pv
# spec:
#   storageClassName: manual
#   capacity:
#     storage: 4Gi
#   accessModes:
#   - ReadWriteOnce
#   hostPath:
#     path: "/mnt/finance"

vi pvc.yml

cat pvc.yml
# output:
# apiVersion: v1
# kind: PersistentVolumeClaim
# metadata:
#   name: pvc-datacenter
# spec:
#   storageClassName: manual
#   accessModes:
#   - ReadWriteOnce
#   resources:
#     requests:
#       storage: 1Gi

vi pod-def.yml

cat pod-def.yml
# output:
# kind: Pod
# metadata:
#   name: pod-datacenter
#   labels:
#     app: httpd
# spec:
#   volumes:
#     - name: pv-datacenter
#       persistentVolumeClaim:
#         claimName: pvc-datacenter
#   containers:
#     - name: container-datacenter
#       image: httpd:latest
#       ports:
#         - containerPort: 80
#           name: "http-server"
#       volumeMounts:
#         - mountPath: "/mnt/finance" 
#           name: pv-datacenter


vi node-service.yml

cat node-service.yml
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: web-datacenter
# spec:
#   type: NodePort
#   selector:
#     app: httpd
#   ports:
#     - port: 80
#       targetPort: 80
#       nodePort: 30008

k create -f pv.yml 
# output:
# persistentvolume/pv-datacenter created


k create -f pvc.yml 
# output:
# persistentvolumeclaim/pvc-datacenter created

k apply -f pod-def.yml 
# output:
# pod/pod-datacenter created

k apply -f node-service.yml 
# output:
# service/web-datacenter created

k get all
# output:
# NAME                 READY   STATUS    RESTARTS   AGE
# pod/pod-datacenter   1/1     Running   0          48s

# NAME                     TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes       ClusterIP   10.43.0.1      <none>        443/TCP        114m
# service/web-datacenter   NodePort    10.43.65.112   <none>        80:30008/TCP   21s

k get pv
# output:
# NAME            CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                    STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
# pv-datacenter   4Gi        RWO            Retain           Bound    default/pvc-datacenter   manual         <unset>                          3m2s

k get pvc
# output:
# NAME             STATUS   VOLUME          CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
# pvc-datacenter   Bound    pv-datacenter   4Gi        RWO            manual         <unset>                 116s