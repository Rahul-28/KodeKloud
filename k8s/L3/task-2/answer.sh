vi php.ini

cat php.ini 
# output:
# variables_order = "EGPCS"

k create cm php-config --from-file=php.ini
# output:
# configmap/php-config created

k get cm php-config 
# output:
# NAME         DATA   AGE
# php-config   1      7s

k describe cm php-config 
# output:
# Name:         php-config
# Namespace:    default
# Labels:       <none>
# Annotations:  <none>

# Data
# ====
# php.ini:
# ----
# variables_order = "EGPCS"



# BinaryData
# ====

# Events:  <none>

k get secrets 
# output:
# NAME              TYPE     DATA   AGE
# mysql-db-url      Opaque   1      9m52s
# mysql-host        Opaque   1      9m52s
# mysql-root-pass   Opaque   1      9m52s
# mysql-user-pass   Opaque   2      9m52s

vi delpoy-def.yaml

cat delpoy-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: lamp-wp         
#   labels:
#     app: lamp
#     tier: frontend
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: lamp
#       tier: frontend
#   template:
#     metadata:
#       labels:
#         app: lamp
#         tier: frontend
#     spec:
#       containers:
#       - name: httpd-php-container
#         image: webdevops/php-apache:alpine-3-php7
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
#         - name: MYSQL_HOST
#           valueFrom:
#             secretKeyRef:
#               name: mysql-host
#               key: host
#         volumeMounts:
#         - name: php-mount
#           mountPath: /opt/docker/etc/php/php.ini
#           subPath: php.ini            

#       - name: mysql-container
#         image: mysql:5.6
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
#         - name: MYSQL_HOST
#           valueFrom:
#             secretKeyRef:
#               name: mysql-host
#               key: host

#       volumes:                        
#       - name: php-mount
#         configMap:
#           name: php-config

vi lamp-service.yaml

cat lamp-service.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: lamp-service
#   labels:
#     app: lamp
# spec:
#   type: NodePort
#   selector:
#     app: lamp
#     tier: frontend
#   ports:
#   - port: 80       
#     targetPort: 80
#     nodePort: 30008

vi mysql-service.yaml 
cat mysql-service.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: mysql-service
#   labels:
#     app: lamp
# spec:
#   type: ClusterIP
#   selector:
#     app: lamp
#   ports:
#   - protocol: TCP       
#     port: 3306
#     targetPort: 3306

vi /tmp/index.php 

cat /tmp/index.php 
# output:
# <?php
# $dbname = $_ENV['MYSQL_DATABASE'];   
# $dbuser = $_ENV['MYSQL_USER'];       
# $dbpass = $_ENV['MYSQL_PASSWORD'];   
# $dbhost = $_ENV['MYSQL_HOST'];       
# 
# $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");
# $test_query = "SHOW TABLES FROM $dbname";
# $result = mysqli_query($test_query);
# if ($result->connect_error) {
#    die("Connection failed: " . $conn->connect_error);
# }
# echo "Connected successfully";
# ?>

kubectl create -f .
# output:
# deployment.apps/lamp-wp created
# service/lamp-service created
# service/mysql-service created

k get all
# output:
# NAME                           READY   STATUS    RESTARTS   AGE
# pod/lamp-wp-6855cbc7df-2cgjz   2/2     Running   0          49s

# NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1       <none>        443/TCP        34m
# service/lamp-service    NodePort    10.43.135.232   <none>        80:30008/TCP   49s
# service/mysql-service   ClusterIP   10.43.3.61      <none>        3306/TCP       49s

# NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/lamp-wp   1/1     1            1           49s

# NAME                                 DESIRED   CURRENT   READY   AGE
# replicaset.apps/lamp-wp-6855cbc7df   1         1         1       49s

kubectl cp /tmp/index.php lamp-wp-6855cbc7df-2cgjz:/app/index.php -c httpd-php-container
# no output