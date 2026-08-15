vi np-service.yml

cat np-service.yml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: node-service
# spec:
#   type: NodePort
#   selector:
#     app: nginx-phpfpm
#   ports:
#     - port: 8099
#       targetPort: 8099
#       nodePort: 30012

vi cm.yml

cat  cm.yml 
# output:
# apiVersion: v1
# kind: ConfigMap
# metadata:
#   name: nginx-config
# data:
#   nginx.conf: |
#     events {}

#     http {
#         server {
#             listen 8099;
#             root   /var/www/html;
#             index  index.html index.htm index.php;

#             location / {
#                 try_files $uri $uri/ =404;
#             }

#             location ~ \.php$ {
#                 fastcgi_pass 127.0.0.1:9000;
#                 fastcgi_index index.php;
#                 fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#                 include fastcgi_params;
#             }
#         }
#     }

vi pod.yml

cat pod.yml 
# output:
# apiVersion: v1
# kind: Pod
# metadata:
#   name: nginx-phpfpm
#   labels:
#     app: nginx-phpfpm
# spec:
#   volumes:
#     - name: shared-files
#       emptyDir: {}
#     - name: nginx-config-volume
#       configMap:
#         name: nginx-config
#   containers:
#     - name: nginx-container
#       image: nginx:latest
#       volumeMounts:
#         - name: shared-files
#           mountPath: /var/www/html
#         - name: nginx-config-volume
#           mountPath: /etc/nginx/nginx.conf
#           subPath: nginx.conf
#     - name: php-fpm-container
#       image: php:8.2-fpm-alpine
#       volumeMounts:
#         - name: shared-files
#           mountPath: /var/www/html

k apply -f .
# configmap/nginx-config created
# service/node-service created
# pod/nginx-phpfpm created

k cp /opt/index.php nginx-phpfpm:/var/www/html/index.php -c nginx-container
# no output