kubectl create -f mongo-persistence.yaml
kubectl create -f mongo-pvc.yaml
kubectl create -f app-configmap.yaml
kubectl create -f mongo-secret.yaml
kubectl create -f local-storage-class.yaml
kubectl create -f mongodb-statefulset.yaml
kubectl create -f mongodb-headless-service.yaml
kubectl create -f mongodb-service.yaml
sleep 15
kubectl create -f nodejs-app-deployment.yaml
kubectl create -f node-service.yaml