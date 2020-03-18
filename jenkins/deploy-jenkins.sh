eval $(minikube docker-env)
docker build -t rafabene/myjenkins .
kubectl delete pods -n cicd -l app=myjenkins --force --grace-period=0 || echo "Deploy jenkins using deploy-kb8s.sh"
kubectl apply -f Deployment.yaml
kubectl apply -f Service.yaml
kubectl create rolebinding -n cicd my-sa-admin --clusterrole=admin --serviceaccount=cicd:default || echo "Security already configured"