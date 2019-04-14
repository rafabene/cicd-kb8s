# CI/CD example on Kubernetes
Example of Quarkus CI/CD application using Jenkins on Kubernetes

## Requirenments

- minikube v1.0.0+ <https://github.com/kubernetes/minikube/releases>

## Start the environment

```
minikube profile cicd
minikube config set memory 8192
minikube config set cpus 3

minikube start

kubectl create namespace cicd

git clone https://github.com/rafabene/cicd-kb8s/
cd cicd-kb8s/
```

## Deploy Jenkins

```
cd jenkins/

# Build Docker image
./build-docker.sh

# Deploy Jenkins on Kubernetes
./deploy-kb8s.sh

# Open Jenkins Console
./open-jenkins.sh

# If you need the Jenkins password, run
./get-jenkinspassword.sh

```




