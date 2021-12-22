aws s3api create-bucket \
    --bucket kops-technoavengers-com-state-store \
    --region us-east-1
aws s3api put-bucket-versioning --bucket kops-technoavengers-com-state-store  --versioning-configuration Status=Enabled
export NAME=technoavengers.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-com-state-store
kops create cluster \
    --zones=us-east-1a,us-east-1b,us-east-1c \
    --api-loadbalancer-type public \
    ${NAME}
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa
kops create secret --name ${NAME} sshpublickey admin -i ~/.ssh/id_rsa.pub
kops update cluster --name technoavengers.k8s.local --yes --admin=87600h