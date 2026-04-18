vi cron-def.yml

cat cron-def.yml
# output:
# apiVersion: batch/v1
# kind: CronJob
# metadata:
#   name: nautilus
# spec:
#   schedule: "*/12 * * * *"
#   jobTemplate:
#     spec:
#       template:
#         metadata:
#           name: cron-nautilus
#         spec:
#           containers:
#             - name: cron-nautilus
#               image: httpd:latest
#               command:
#                 - /bin/bash
#                 - -c
#                 - echo Welcome to xfusioncorp!
#           restartPolicy: OnFailure

kubectl apply -f cron-def.yml 
# output:
# cronjob.batch/nautilus created

kubectl get all
# output:
# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.43.0.1    <none>        443/TCP   58m

# NAME                     SCHEDULE       TIMEZONE   SUSPEND   ACTIVE   LAST SCHEDULE   AGE
# cronjob.batch/nautilus   */12 * * * *   <none>     False     0        <none>          28s