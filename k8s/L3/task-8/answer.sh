cat mysql_deployment.yml 
# output:
# apiVersion: apps/v1 
# kind: PersistentVolume            
# metadata:
#   name: mysql-pv
#   labels: 
#   type: local 
# spec:
#   storageClassName: standard      
#   capacity:
#     storage: 250Mi
#   accessModes: 
#     - ReadWriteOnce
#   hostPath:                       
#   path: "/mnt/data" 
#   persistentVolumeReclaimPolicy:  
#   -  Retain  
# ---    
# apiVersion: apps/v1 
# kind: PersistentVolumeClaim 
# metadata:                          
#   name: mysql-pv-claim
#   labels:
#   app: mysql-app 
# spec:                              
#   storageClassName: standard       
#   accessModes:
#     - ReadWriteOnce                
#   resources:
#     requests: 
#       storage: 250MB 
# ---
# apiVersion: v1                    
# kind: Service                      
# metadata:
#   name: mysql         
#   labels:             
#     app: mysql-app
# spec:
#   type: NodePort
#   ports:
#     - targetPort: 3306
#       port: 3306
#       nodePort: 30011
#   selector:    
#     app: mysql-app
#   tier: mysql
# ---
# apiVersion: v1 
# kind: Deployment            
# metadata:
#   name: mysql-deployment       
#   labels:                       
#     app: mysql-app 
# spec:
#   selector:
#     matchLabels:
#       app: mysql-app
#     tier: mysql 
#   strategy:
#     type: Recreate
#   template:                    
#     metadata:
#       labels:                  
#         app: mysql-app
#       tier: mysql 
#     spec:                       
#       containers: 
#       - images: mysql:5.6 
#         name: mysql
#         env:                        
#         - name: MYSQL_ROOT_PASSWORD 
#           valueFrom:                
#           secretKeyRef: 
#             name: mysql-root-pass 
#               key: password 
#         - name: MYSQL_DATABASE
#           valueFrom:
#           secretKeyRef: 
#             name: mysql-db-url 
#               key: database 
#         - name: MYSQL_USER
#           valueFrom:
#             secretKeyRef:
#               name: mysql-user-pass
#               key: username
#         - name: MYSQL_PASSWORD
#           valueFrom:
#             secretKeyRef:
#               name: mysql-user-pass
#               key: password
#         ports:
#         - containerPort: 3306        
#           name: mysql
#         volumeMounts:
#         - name: mysql-persistent-storage 
#           mountPath: /var/lib/mysql
#       volumes:                       
#       - name: mysql-persistent-storage
#           persistentVolumeClaim:
#           claimName: mysql-pv-claim

k get secrets
# output:
# NAME              TYPE     DATA   AGE
# mysql-db-url      Opaque   1      6m33s
# mysql-root-pass   Opaque   1      6m33s
# mysql-user-pass   Opaque   2      6m33s

vi mysql_deployment.yml 

cat mysql_deployment.yml
# output:
# apiVersion: v1                          
# kind: PersistentVolume                  
# metadata:
#   name: mysql-pv
#   labels:
#     type: local
# spec:
#   storageClassName: standard
#   capacity:
#     storage: 250Mi
#   accessModes:
#     - ReadWriteOnce                     
#   hostPath:
#     path: "/mnt/data"
#   persistentVolumeReclaimPolicy: Retain 
# ---
# apiVersion: v1                          
# kind: PersistentVolumeClaim             
# metadata:
#   name: mysql-pv-claim
#   labels:
#     app: mysql-app
# spec:
#   storageClassName: standard
#   accessModes:
#     - ReadWriteOnce                     
#   resources:
#     requests:
#       storage: 250Mi                    
# ---
# apiVersion: v1
# kind: Service
# metadata:
#   name: mysql
#   labels:
#     app: mysql-app                      
# spec:
#   type: NodePort
#   ports:
#     - targetPort: 3306
#       port: 3306
#       nodePort: 30011
#   selector:
#     app: mysql-app                      
#     tier: mysql
# ---
# apiVersion: apps/v1                    
# kind: Deployment
# metadata:
#   name: mysql-deployment
#   labels:
#     app: mysql-app                      
# spec:
#   selector:
#     matchLabels:                        
#       app: mysql-app                    
#       tier: mysql
#   strategy:
#     type: Recreate
#   template:
#     metadata:
#       labels:
#         app: mysql-app
#         tier: mysql
#     spec:
#       containers:
#       - image: mysql:5.6
#         name: mysql
#         env:
#         - name: MYSQL_ROOT_PASSWORD
#           valueFrom:
#             secretKeyRef:
#               name: mysql-root-pass     
#               key: password
#         - name: MYSQL_DATABASE
#           valueFrom:
#             secretKeyRef:
#               name: mysql-db-url        
#               key: database
#         - name: MYSQL_USER
#           valueFrom:
#             secretKeyRef:
#               name: mysql-user-pass     
#               key: username
#         - name: MYSQL_PASSWORD
#           valueFrom:
#             secretKeyRef:
#               name: mysql-user-pass     
#               key: password
#         ports:
#         - containerPort: 3306
#           name: mysql
#         volumeMounts:
#         - name: mysql-persistent-storage
#           mountPath: /var/lib/mysql
#       volumes:
#       - name: mysql-persistent-storage
#         persistentVolumeClaim:          
#           claimName: mysql-pv-claim     

k create -f .
# output:
# persistentvolume/mysql-pv created
# persistentvolumeclaim/mysql-pv-claim created
# service/mysql created
# deployment.apps/mysql-deployment created

k get all
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/mysql-deployment-7f7b95d9f9-89bw7   1/1     Running   0          28s

# NAME                 TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE
# service/kubernetes   ClusterIP   10.43.0.1      <none>        443/TCP          42m
# service/mysql        NodePort    10.43.82.248   <none>        3306:30011/TCP   28s

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/mysql-deployment   1/1     1            1           28s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/mysql-deployment-7f7b95d9f9   1         1         1       28s

k get pv
# NAME       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS   CLAIM                    STORAGECLASS   VOLUMEATTRIBUTESCLASS   REASON   AGE
# mysql-pv   250Mi      RWO            Retain           Bound    default/mysql-pv-claim   standard       <unset>                          44s

k get pvc
# NAME             STATUS   VOLUME     CAPACITY   ACCESS MODES   STORAGECLASS   VOLUMEATTRIBUTESCLASS   AGE
# mysql-pv-claim   Bound    mysql-pv   250Mi      RWO            standard       <unset>                 48s 
