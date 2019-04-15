eval $(minikube docker-env)
docker build -t rafabene/myjenkins .
kubectl delete pods -l app=myjenkins --force --grace-period=0 || echo "Deploy jenkins using deploy-kb8s.sh"