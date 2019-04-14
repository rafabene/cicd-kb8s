# cicd-kb8s
Example of Quarkus CI/CD application using Jenkins on Kubernetes

## Requirenments

- minikube v1.0.0+ <https://github.com/kubernetes/minikube/releases>

## Start the environment

```
minishift profile set cicd
minishift config set memory 8192
minishift config set cpus 3

minishift start
```
