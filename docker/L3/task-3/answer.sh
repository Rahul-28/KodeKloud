docker pull nginx:alpine
# output:
# alpine: Pulling from library/nginx
# 589002ba0eae: Pull complete 
# bca5d04786e1: Pull complete 
# 3e2c181db1b0: Pull complete 
# 6b7b6c7061b7: Pull complete 
# 399d0898a94e: Pull complete 
# 955a8478f9ac: Pull complete 
# 6d397a54a185: Pull complete 
# 5e7756927bef: Pull complete 
# Digest: sha256:1d13701a5f9f3fb01aaa88cef2344d65b6b5bf6b7d9fa4cf0dca557a8d7702ba
# Status: Downloaded newer image for nginx:alpine
# docker.io/library/nginx:alpine

docker run -d -p 3004:80 --name beta nginx:alpine
# output:
# aad54b08fe6bb8fb0b568b7b9e0e3eb3d43eec2cac407f8c35c1ac3096c95c0b

curl localhost:3004
# output;
# <!DOCTYPE html>
# <html>
# <head>
# <title>Welcome to nginx!</title>
# <style>
# html { color-scheme: light dark; }
# body { width: 35em; margin: 0 auto;
# font-family: Tahoma, Verdana, Arial, sans-serif; }
# </style>
# </head>
# <body>
# <h1>Welcome to nginx!</h1>
# <p>If you see this page, the nginx web server is successfully installed and
# working. Further configuration is required.</p>

# <p>For online documentation and support please refer to
# <a href="http://nginx.org/">nginx.org</a>.<br/>
# Commercial support is available at
# <a href="http://nginx.com/">nginx.com</a>.</p>

# <p><em>Thank you for using nginx.</em></p>
# </body>
# </html>