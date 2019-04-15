kubectl apply -f Deployment.yaml -f Service.yaml
kubectl create rolebinding my-sa-admin --clusterrole=admin --serviceaccount=cicd:default