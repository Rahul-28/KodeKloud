k edit deployments.apps python-deployment-xfusion 
# deployment.apps/python-deployment-xfusion edited
changed image: poroko/flask-app-demo to poroko/flask-demo-app

k edit svc python-service-xfusion 
service/python-service-xfusion edited
changed port: 8080 to port: 5000 (flask default port)