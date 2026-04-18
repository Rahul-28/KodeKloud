vi job-def.yml

cat job-def.yml 
# output:
# apiVersion: batch/v1
# kind: Job
# metadata:
#   name: countdown-devops
# spec:
#   template:
#     metadata:
#       name: countdown-devops
#     spec:
#       containers:
#       - name: container-countdown-devops
#         image: fedora:latest
#         command: [ "sleep", "5" ]
#       restartPolicy: Never

kubectl apply -f job-def.yml 
# output:
# job.batch/countdown-nautilus created

kubectl get all
# output:
# NAME                           READY   STATUS      RESTARTS   AGE
# pod/countdown-nautilus-z9lq2   0/1     Completed   0          10s

# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   34m

# NAME                           STATUS    COMPLETIONS   DURATION   AGE
# job.batch/countdown-nautilus   Running   0/1           10s        10s