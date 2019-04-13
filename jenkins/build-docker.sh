eval $(minikube docker-env)
docker build -t rafabene/myjenkins .
kubectl delete pods -l app=myjenkins && echo "Deploy jenkins using deploy-kb8s.sh"