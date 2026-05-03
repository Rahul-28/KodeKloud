vi mysql-pv.yml

cat mysql-pv.yml 
# output:
# apiVersion: v1
# kind: PersistentVolume
# metadata: 
#   name: mysql-pv
# spec:
#   capacity:
#     storage: "250Mi"
#   storageClassName: manual
#   accessModes:
#   - ReadWriteOnce
#   hostPath:
#     path: "/mnt/data"

vi mysql-pv-claim.yml

cat mysql-pv-claim.yml 
# output:
# apiVersion: v1
# kind: PersistentVolumeClaim
# metadata:
#   name: mysql-pv-claim
# spec:
#   storageClassName: manual
#   accessModes:
#   - ReadWriteOnce
#   resources:
#     requests:
#       storage: "250Mi"

vi mysql-root-pass.yml

cat mysql-root-pass.yml 
# output:
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-root-pass
# type: Opaque
# stringData:
#   password: YUIidhb667

vi mysql-user-pass.yml

cat mysql-user-pass.yml 
# output
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-user-pass
# type: Opaque
# stringData:
#   username: kodekloud_cap 
#   password: TmPcZjtRQx

vi mysql-db-url.yml

cat mysql-db-url.yml 
# output:
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-db-url
# type: Opaque
# stringData:
#   database: kodekloud_db5

vi deploy-def.yml

cat deploy-def.yml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: mysql-deployment
#   labels:
#     app: mysql
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: db
#   template:
#     metadata:
#       labels:
#         app: db
#     spec:
#       volumes:
#         - name: mysql-pv
#           persistentVolumeClaim:
#             claimName: mysql-pv-claim
#       containers:
#         - name: mysql-container
#           image: mysql:latest
#           env:
#             - name: MYSQL_ROOT_PASSWORD
#               valueFrom:
#                 secretKeyRef:
#                   name: mysql-root-pass
#                   key: password
#             - name: MYSQL_DATABASE
#               valueFrom: 
#                 secretKeyRef:
#                   name: mysql-db-url
#                   key: database
#             - name: MYSQL_USER
#               valueFrom:
#                 secretKeyRef:
#                   name: name: mysql-user-pass
#                   key: username
#             - name: MYSQL_PASSWORD 
#               valueFrom:
#                 secretKeyRef:
#                   name: mysql-user-pass
#                   key: password
#           volumeMounts:
#             - mountPath: "/var/lib/mysql"
#               name: mysql-pv
      
vi node-service.yml

cat node-service.yml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: mysql
#   labels:
#     app: mysql
# spec:
#   type: NodePort
#   selector:
#     labels:
#       app: db
#   ports:
#     - port: 3306
#       targetPort: 3306
#       nodePort: 30007

ls
# output:
# deploy-def.yml       mysql-pv-claim.yml   mysql-root-pass.yml  node-service.yml
# mysql-db-url.yml     mysql-pv.yml         mysql-user-pass.yml

mkdir secrets
# output:
# mv mysql-root-pass.yml ./secrets/
# mv mysql-user-pass.yml ./secrets/
# mv mysql-db-url.yml ./secrets/

ls
# deploy-def.yml      mysql-pv.yml        secrets
# mysql-pv-claim.yml  node-service.yml

cd secrets/
k create -f .
# output:
# secret/mysql-root-pass created
# secret/mysql-user-pass created
# secret/mysql-db-url created

cd ..
ls
# output:
# deploy-def.yml      mysql-pv.yml        secrets
# mysql-pv-claim.yml  node-service.yml

k create -f .
# output:
# persistentvolumeclaim/mysql-pv-claim created
# persistentvolume/mysql-pv created
# service/mysql created
# deployment.apps/mysql-deployment created

k get all
# output:
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/mysql-deployment-59f67b9ff4-gbgzk   1/1     Running   0          25s

# NAME                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
# service/kubernetes   ClusterIP   10.43.0.1       <none>        443/TCP          98m
# service/mysql        NodePort    10.43.218.251   <none>        3306:30007/TCP   2m40s

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/mysql-deployment   1/1     1            1           25s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/mysql-deployment-59f67b9ff4   1         1         1       25s

k get pv
# output:
# NAME       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                    STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
# mysql-pv   250Mi      RWO            Retain           Bound    default/mysql-pv-claim   manual         <unset>                          

# k get pvc
# NAME             STATUS   VOLUME     CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
# mysql-pv-claim   Bound    mysql-pv   250Mi      RWO            manual         <unset>                 3m6s

kubectl get secrets
# output:
# NAME              TYPE     DATA   AGE
# mysql-db-url      Opaque   1      4m14s
# mysql-root-pass   Opaque   1      5m2s
# mysql-user-pass   Opaque   2      5m2s

kubectl describe pv mysql-pv
# output:
# Name:            mysql-pv
# Labels:          <none>
# Annotations:     pv.kubernetes.io/bound-by-controller: yes
# Finalizers:      [kubernetes.io/pv-protection]
# StorageClass:    manual
# Status:          Bound  
# Claim:           default/mysql-pv-claim
# Reclaim Policy:  Retain
# Access Modes:    RWO
# VolumeMode:      Filesystem
# Capacity:        250Mi
# Node Affinity:   <none>
# Message:         
# Source:
#     Type:          HostPath (bare host directory volume)
#     Path:          /mnt/data
#     HostPathType:  
# Events:            <none>

# kubectl describe pvc mysql-pv-claim
# Name:          mysql-pv-claim
# Namespace:     default
# StorageClass:  manual
# Status:        Bound
# Volume:        mysql-pv
# Labels:        <none>
# Annotations:   pv.kubernetes.io/bind-completed: yes
#                pv.kubernetes.io/bound-by-controller: yes
# Finalizers:    [kubernetes.io/pvc-protection]
# Capacity:      250Mi
# Access Modes:  RWO
# VolumeMode:    Filesystem
# Used By:       mysql-deployment-59f67b9ff4-gbgzk
# Events:
#   Type     Reason              Age    From                         Message
#   ----     ------              ----   ----                         -------
#   Warning  ProvisioningFailed  4m44s  persistentvolume-controller  storageclass.storage.k8s.io "manual" not found

kubectl describe pod mysql-deployment-59f67b9ff4-gbgzk 
# output:
# Name:             mysql-deployment-59f67b9ff4-gbgzk
# Namespace:        default
# Priority:         0
# Service Account:  default
# Node:             jump-host/10.244.164.9
# Start Time:       Sun, 03 May 2026 09:35:43 +0000
# Labels:           app=db
#                   pod-template-hash=59f67b9ff4
# Annotations:      <none>
# Status:           Running
# IP:               10.22.0.9
# IPs:
#   IP:           10.22.0.9
# Controlled By:  ReplicaSet/mysql-deployment-59f67b9ff4
# Containers:
#   mysql-container:
#     Container ID:   containerd://8cea179e406c442b75fc1840200550fbaea965368cc9e62ac4e5dcd400666936
#     Image:          mysql:latest
#     Image ID:       docker.io/library/mysql@sha256:c9e48b0c008f1936d4139d1c0dcd5950a9dbe57d4d40f383013cde432fa6d6aa
#     Port:           <none>
#     Host Port:      <none>
#     State:          Running
#       Started:      Sun, 03 May 2026 09:35:57 +0000
#     Ready:          True
#     Restart Count:  0
#     Environment:
#       MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-root-pass'>  Optional: false
#       MYSQL_DATABASE:       <set to the key 'database' in secret 'mysql-db-url'>     Optional: false
#       MYSQL_USER:           <set to the key 'username' in secret 'mysql-user-pass'>  Optional: false
#       MYSQL_PASSWORD:       <set to the key 'password' in secret 'mysql-user-pass'>  Optional: false
#     Mounts:
#       /var/lib/mysql from mysql-pv (rw)
#       /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-rqbk4 (ro)
# Conditions:
#   Type                        Status
#   PodReadyToStartContainers   True 
#   Initialized                 True 
#   Ready                       True 
#   ContainersReady             True 
#   PodScheduled                True 
# Volumes:
#   mysql-pv:
#     Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
#     ClaimName:  mysql-pv-claim
#     ReadOnly:   false
#   kube-api-access-rqbk4:
#     Type:                    Projected (a volume that contains injected data from multiple sources)
#     TokenExpirationSeconds:  3607
#     ConfigMapName:           kube-root-ca.crt
#     Optional:                false
#     DownwardAPI:             true
# QoS Class:                   BestEffort
# Node-Selectors:              <none>
# Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
#                              node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
# Events:
#   Type    Reason     Age    From               Message
#   ----    ------     ----   ----               -------
#   Normal  Scheduled  3m7s   default-scheduler  Successfully assigned default/mysql-deployment-59f67b9ff4-gbgzk to jump-host
#   Normal  Pulling    3m7s   kubelet            Pulling image "mysql:latest"
#   Normal  Pulled     2m53s  kubelet            Successfully pulled image "mysql:latest" in 13.665s (13.665s including waiting). Image size: 273463263 bytes.
#   Normal  Created    2m53s  kubelet            Created container: mysql-container
#   Normal  Started    2m53s  kubelet            Started container mysql-container