vi dep-def.yaml

cat dep-def.yaml 
# output:
# apiVersion: apps/v1
# kind: Deployment
# metadata:
#   name: grafana-deployment-devops
#   labels:
#     app: grafana
# spec:
#   replicas: 1
#   selector:
#     matchLabels:
#       app: grafana
#   template:
#     metadata:
#       labels:
#         app: grafana
#     spec:
#       containers:
#       - name: grafana-container
#         image: grafana/grafana
#         ports:
#         - containerPort: 3000

vi np-def.yaml

cat np-def.yaml 
# output:
# apiVersion: v1
# kind: Service
# metadata:
#   name: grafana-service
# spec:
#   type: NodePort
#   selector:
#     app: grafana
#   ports:
#   - port: 3000
#     targetPort: 3000
#     nodePort: 32000


kubectl create -f .
deployment.apps/grafana-deployment-devops created
service/grafana-service created