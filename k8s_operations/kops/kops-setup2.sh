################ Create a aws S3 bucket to store cluster state #########
aws s3api create-bucket \
    --bucket kops-technoavengers-com-state-store-instructor \
    --region us-east-1

aws s3api put-bucket-versioning --bucket kops-technoavengers-com-state-store  --versioning-configuration Status=Enabled

################ Set cluster name and state_store env variable #########
export NAME=technoavengers.k8s.local-instructor
export KOPS_STATE_STORE=s3://kops-technoavengers-com-state-store-instructor

################ Create Kops Cluster Configuration files #########
kops create cluster \
    --zones=us-east-1a,us-east-1b,us-east-1c \
    --api-loadbalancer-type public \
    ${NAME}



################ Create key and secret for kops #########
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa
kops create secret --name ${NAME} sshpublickey admin -i ~/.ssh/id_rsa.pub

################ Run your cluster #########
kops update cluster --name ${NAME} --yes --admin=87600h