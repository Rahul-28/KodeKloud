kubectl get all
# output:
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/nginx-deployment-79b79679fc-pwglm   1/1     Running   0          78s

# NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1       <none>        443/TCP        31m
# service/nginx-service   NodePort    10.43.189.183   <none>        80:30008/TCP   78s

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/nginx-deployment   1/1     1            1           78s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/nginx-deployment-79b79679fc   1         1         1       78s

kubectl edit deployment nginx-deployment

kubectl edit service nginx-service
# after editing output:
# service/nginx-service edited

kubectl get all
# output:
# NAME                                    READY   STATUS    RESTARTS   AGE
# pod/nginx-deployment-6849884b5d-98ngw   1/1     Running   0          2m57s
# pod/nginx-deployment-6849884b5d-fx4sq   1/1     Running   0          2m52s
# pod/nginx-deployment-6849884b5d-hggqb   1/1     Running   0          2m57s
# pod/nginx-deployment-6849884b5d-vtb6h   1/1     Running   0          2m57s
# pod/nginx-deployment-6849884b5d-xdwvg   1/1     Running   0          2m52s

# NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
# service/kubernetes      ClusterIP   10.43.0.1       <none>        443/TCP        38m
# service/nginx-service   NodePort    10.43.189.183   <none>        80:32165/TCP   9m8s

# NAME                               READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/nginx-deployment   5/5     5            5           9m8s

# NAME                                          DESIRED   CURRENT   READY   AGE
# replicaset.apps/nginx-deployment-6849884b5d   5         5         5       2m57s
# replicaset.apps/nginx-deployment-79b79679fc   0         0         0       9m8s