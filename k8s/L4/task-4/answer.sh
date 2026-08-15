vi pv.yml

cat pv.yml
# output
# apiVersion: v1
# kind: PersistentVolume
# metadata:
#   name: drupal-mysql-pv
# spec:
#   capacity:
#     storage: 5Gi
#   accessModes:
#     - ReadWriteOnce
#   storageClassName: manual
#   hostPath:
#     path: /drupal-mysql-data
#     type: DirectoryOrCreate


vi pvc.yml

cat pvc.yml
# output:
# apiVersion: v1
# kind: PersistentVolumeClaim
# metadata:
#   name: drupal-mysql-pvc
# spec:
#   accessModes:
#     - ReadWriteOnce
#   storageClassName: manual
#   resources:
#     requests:
#       storage: 3Gi

vi deployment-drupal-mysql

cat deployment-drupal-mysql
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: drupal-mysql
#   labels:
#     app: drupal-mysql
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: drupal-mysql
#   template:
#     metadata:
#       labels:
#         app: drupal-mysql
#     spec:
#       volumes:
#         - name: drupal-mysql-volume
#           persistentVolumeClaim:
#             claimName: drupal-mysql-pvc
#       containers:
#         - name: drupal-mysql-container
#           image: mysql:5.7
#           env:
#             - name: MYSQL_ROOT_PASSWORD
#               valueFrom:
#                 secretKeyRef:
#                   name: mysql-secret
#                   key: password
#           ports:
#             - containerPort: 3306
#           volumeMounts:
#             - name: drupal-mysql-volume
#               mountPath: /var/lib/mysql

vi deployment-drupal

cat deployment-drupal
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: drupal
#   labels:
#     app: drupal
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: drupal
#   template:
#     metadata:
#       labels:
#         app: drupal
#     spec:
#       containers:
#         - name: drupal-container
#           image: drupal:8.6
#           env:
#             - name: MYSQL_ROOT_PASSWORD
#               valueFrom:
#                 secretKeyRef:
#                   name: mysql-secret
#                   key: password
#           ports:
#             - containerPort: 80

vi np-service.yml

cat np-service.yml
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: drupal-service
# spec:
#   type: NodePort
#   selector:
#     app: drupal
#   ports:
#     - port: 80
#       targetPort: 80
#       nodePort: 30095

vi np-service.yml

cat np-service.yml
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: drupal-mysql-service
# spec:
#   selector:
#     app: drupal-mysql
#   ports:
#     - port: 3306
#       targetPort: 3306

vi mysql-secret.yaml

cat mysql-secret.yaml
# output:
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-secret
# type: Opaque
# stringData:
#   password: Admin123

k apply -f .
# output:
# persistentvolume/drupal-mysql-pv created
# persistentvolumeclaim/drupal-mysql-pvc created
# secret/mysql-secret created
# deployment.apps/drupal-mysql created
# deployment.apps/drupal created
# service/drupal-service created
# service/drupal-mysql-service created

k get all
# output:
# NAME                                READY   STATUS    RESTARTS   AGE
# pod/drupal-bb89988c8-8pszn          1/1     Running   0          24s
# pod/drupal-mysql-6c9b5757f7-rvp9g   1/1     Running   0          24s

# NAME                           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
# service/drupal-mysql-service   ClusterIP   10.43.86.78     <none>        3306/TCP       24s
# service/drupal-service         NodePort    10.43.171.126   <none>        80:30095/TCP   24s
# service/kubernetes             ClusterIP   10.43.0.1       <none>        443/TCP        40m

# NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/drupal         1/1     1            1           24s
# deployment.apps/drupal-mysql   1/1     1            1           24s

# NAME                                      DESIRED   CURRENT   READY   AGE
# replicaset.apps/drupal-bb89988c8          1         1         1       24s
# replicaset.apps/drupal-mysql-6c9b5757f7   1         1         1       24s

k get secrets
# output:
# NAME           TYPE     DATA   AGE
# mysql-secret   Opaque   1      76s
