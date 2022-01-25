curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl
aws s3api create-bucket \
    --bucket kops-technoavengers-user4-com-state-store \
    --region us-east-1
aws s3api put-bucket-versioning --bucket kops-technoavengers-user4-com-state-store  --versioning-configuration Status=Enabled
export NAME=technoavengers.user4.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user4-com-state-store
kops create cluster \
    --zones=us-east-1a,us-east-1b \
    --api-loadbalancer-type public \
    ${NAME}
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa
kops create secret --name ${NAME} sshpublickey admin -i ~/.ssh/id_rsa.pub
kops update cluster --name ${NAME} --yes --admin=87600h
