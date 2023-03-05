kubectl apply -f mongodb-deployment.yaml
kubectl apply -f mongodb-service.yaml
sleep 5
kubectl apply -f app-configmap.yaml
kubectl apply -f webapp-deployment.yaml
kubectl apply -f webapp-service.yaml