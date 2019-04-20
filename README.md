# CI/CD example on Kubernetes
Example of Quarkus CI/CD application using Jenkins on Kubernetes

## Requirenments

- minikube v1.0.0+ <https://github.com/kubernetes/minikube/releases>

## Start the environment

```
minikube profile cicd
minikube addons enable metrics-server
minikube config set memory 8192
minikube config set cpus 3

minikube start \
  --extra-config=controller-manager.horizontal-pod-autoscaler-downscale-stabilization=30s \
  --extra-config=controller-manager.horizontal-pod-autoscaler-cpu-initialization-period=30s \
  --extra-config=controller-manager.horizontal-pod-autoscaler-sync-period=10s 
minikube ssh -- "mkdir -p /tmp/m2 && sudo chmod 777 /tmp/m2"

kubectl create namespace cicd

git clone https://github.com/rafabene/cicd-kb8s/
cd cicd-kb8s/
```

## Create the Jenkins slave image

```
cd jenkins-slave
./build-docker.sh
```


## Deploy Jenkins

```
cd jenkins/

# Build and deploy Jenkins
./deploy-jenkins.sh

# Open Jenkins Console
./open-jenkins.sh

```

Perform the first build manually using Jenkins. This will enable the SCM polling.

## Open the application

```
cd webstore/
./open-app.sh
```

# If you want to deploy just the application without Jenkins

```
cd webstore/
mvn package -Pnative -Dnative-image.docker-build=true  -DskipTests
eval $(minikube docker-env)
docker build -t rafabene/cloudnative -f src/main/docker/Dockerfile.native .
kubectl create -f Deployment.yaml -f Service.yaml
./open-app.sh
```
