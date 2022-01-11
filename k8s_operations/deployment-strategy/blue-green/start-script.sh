kubectl create -f app-configmap.yaml
kubectl create -f mongodb-deployment.yaml
kubectl create -f mongodb-service.yaml
sleep 10
kubectl create -f green-deployment.yaml
kubectl create -f green-service.yaml