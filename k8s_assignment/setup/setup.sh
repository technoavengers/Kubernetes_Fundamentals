##Pod Assignment#######
kubectl run httpd-pod  --image httpd-new
kubectl create -f pod-defination.yaml

kubectl create -f replica-set1.yaml
kubectl create -f replica-set2.yaml

kubectl create namespace mars
kubectl create namespace venus
kubectl create namespace earth

kubectl run httpd-mars --image httpd -n mars
kubectl run nginx-venus --image nginx -n venus

kubectl create deployment myweb-dep --image httpd:2.4  --replicas 3
kubectl set image deployment myweb-dep  httpd=httpd:2.4.49 --record
kubectl set image deployment myweb-dep  httpd=httpd:latest  --record
kubectl set image deployment myweb-dep  httpd=httpd-junk  --record
