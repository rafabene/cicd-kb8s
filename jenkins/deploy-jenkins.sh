eval $(minikube docker-env)
kubectl apply -f Service.yaml
export KB8IP=`kubectl get services -n cicd|grep jenkins|awk  '{printf $3}'`
envsubst < config.xml.template > config.xml
docker build -t rafabene/myjenkins .
kubectl delete pods -n cicd -l app=myjenkins --force --grace-period=0 || echo "Deploy jenkins using deploy-kb8s.sh"
kubectl apply -f Deployment.yaml
kubectl create rolebinding -n cicd my-sa-admin --clusterrole=admin --serviceaccount=cicd:default || echo "Security already configured"