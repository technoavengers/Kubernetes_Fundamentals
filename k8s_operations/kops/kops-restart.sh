export NAME=technoavengers.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-com-state-store
kops create cluster \
    --zones=us-east-1a,us-east-1b,us-east-1c \
    --api-loadbalancer-type public \
    ${NAME}
kops create secret --name ${NAME} sshpublickey admin -i ~/.ssh/id_rsa.pub
kops update cluster --name technoavengers.k8s.local --yes --admin=87600h