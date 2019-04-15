eval $(minikube docker-env)
./mvnw package -Pnative -Dnative-image.docker-build=true
docker build -t rafabene/cloudnative -f src/main/docker/Dockerfile.native .
kubectl delete pods -l app=myjenkins && echo "Deploy cloudnative using deploy-kb8s.sh"%