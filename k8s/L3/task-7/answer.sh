vi mysql-root-pass.yml

cat mysql-root-pass.yml
# output:
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-root-pass
# type: Opaque
# stringData:
#   password: R00t

vi mysql-user-pass.yml

cat mysql-user-pass .yml
# output:
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-user-pass
# type: Opaque
# stringData:
#   username: kodekloud_tim
#   password: YchZHRcLkL

vi mysql-db-url.yml

cat mysql-db-url.yml
# output:
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-db-url
# type: Opaque
# stringData:
#   database: kodekloud_db_5

vi mysql-host.yml

cat mysql-host.yml
# output:
# apiVersion: v1
# kind: Secret
# metadata:
#   name: mysql-host
# type: Opaque
# stringData:
#   host: 127.0.0.1

echo 'variables_order = "EGPCS"' >> php.ini

k create cm php-config --from-file=php.ini
# output:
# configmap/php-config created

k create -f .
# output:
# secret/mysql-db-url created
# secret/mysql-host created
# secret/mysql-root-password created
# secret/mysql-user-pass created

vi deploy-def.yaml

cat deploy-def.yaml 
# output:
apiVersion: apps/v1
kind: Deployment
metadata:
  name: lemp-wp
  labels:
    app: lemp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: lemp
  template:
    metadata:
      labels:
        app: lemp
    spec:
      containers:
      - name: nginx-php-container
        image: webdevops/php-nginx:alpine-3-php7
        volumeMounts:
        - name: php-config
          mountPath: /opt/docker/etc/php/php.ini
          subPath: php.ini
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-root-pass
              key: password
        - name: MYSQL_DATABASE
          valueFrom: 
            secretKeyRef:
              name: mysql-db-url
              key: database
        - name: MYSQL_USER
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: username
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: password
        - name: MYSQL_HOST
          valueFrom:
            secretKeyRef:
              name: mysql-host
              key: host
      - name: mysql-container
        image: mysql:5.6
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-root-pass
              key: password
        - name: MYSQL_DATABASE
          valueFrom: 
            secretKeyRef:
              name: mysql-db-url
              key: database
        - name: MYSQL_USER
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: username
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: password
        - name: MYSQL_HOST
          valueFrom:
            secretKeyRef:
              name: mysql-host
              key: host
      volumes:
      - name: php-config
        configMap:
          name: php-config

vi node-service.yaml

cat node-service.yaml
# output:
apiVersion: v1
kind: Service
metadata:
  name: lemp-service
  labels:
    app: lemp
spec: 
  selector:
    app: lemp
  type: NodePort
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 30008

vi mysql-service.yaml
s
cat mysql-service.yaml
# output:
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
spec:
  selector:
    app: lemp
  ports:
  - port: 3306
    targetPort: 3306

cat /tmp/index.php
# output:
# <?php
# $dbname = $_ENV['MYSQL_DATABASE'];   
# $dbuser = $_ENV['MYSQL_USER'];       
# $dbpass = $_ENV['MYSQL_PASSWORD'];   
# $dbhost = $_ENV['MYSQL_HOST']; 

# $connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");

# $test_query = "SHOW TABLES FROM $dbname";
# $result = mysqli_query($test_query);

# if ($result->connect_error) {
#    die("Connection failed: " . $conn->connect_error);
# }
#   echo "Connected successfully";

vi /tmp/index.php

cat /tmp/index.php 
# output:
# <?php
# $dbname = $_ENV['MYSQL_DATABASE'];
# $dbuser = $_ENV['MYSQL_USER'];
# $dbpass = $_ENV['MYSQL_PASSWORD'];
# $dbhost = $_ENV['MYSQL_HOST'];

# $connect = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname) or die("Unable to Connect to '$dbhost'");
# $test_query = "SHOW TABLES FROM $dbname";
# $result = mysqli_query($connect, $test_query);

# if (!$connect) {
#    die("Connection failed: " . mysqli_connect_error());
# }
# echo "Connected successfully";
# ?>

k create -f deploy-def.yaml 
# output:
# deployment.apps/lemp-wp created

k create -f node-service.yaml 
# output:
# service/lemp-service created

k create -f mysql-service.yaml 
# output:
# service/mysql-service created

k get all
# output:
# NAME                           READY   STATUS    RESTARTS   AGE
# pod/lemp-wp-6fbdf899ff-rnq7b   2/2     Running   0          26s

# NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1       <none>        443/TCP        43m
# service/lemp-service    NodePort    10.43.120.178   <none>        80:30008/TCP   16s
# service/mysql-service   ClusterIP   10.43.59.33     <none>        3306/TCP       3s

# NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/lemp-wp   1/1     1            1           26s

# NAME                                 DESIRED   CURRENT   READY   AGE
# replicaset.apps/lemp-wp-6fbdf899ff   1         1         1       26s

k cp /tmp/index.php lemp-wp-6fbdf899ff-rnq7b:/app/index.php -c nginx-php-container
# no output