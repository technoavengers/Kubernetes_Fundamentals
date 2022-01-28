################ Before starting this setup, your bootstrapping instance must have following policies #################

#AmazonEC2FullAccess
#AmazonSQSFullAccess
#IAMFullAccess
#AmazonS3FullAccess
#AmazonVPCFullAccess
#AmazonRoute53FullAccess
#AmazonEventBridgeFullAccess
#AWSAppRunnerServicePolicyForECRAccess
#AWSCloud9EnvironmentMember
#AWSCloud9User

### You can create a role (IAM) and attach that role to your bootstrapping instance

########## Step1: Install kops ############################
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f4)/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

########## Step2: Install kubectl ############################
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/kubectl

############## Kubectl Config View ########################

########## Step3: Create S3 Bucket ############################
aws s3api create-bucket \
    --bucket kops-technoavengers-user3-com-state-store \
    --region us-east-1

########## Step4: Set ENV Variable ############################
export NAME=technoavengers.user3.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user3-com-state-store

########## Step5: Create Configuration ############################
kops create cluster \
    --zones=us-east-1a,us-east-1b \
    --api-loadbalancer-type public \
    --networking calico \
    ${NAME}

########## Step6: Check Configuration ############################
### * list clusters with: kops get cluster
### * edit this cluster with: kops edit cluster technoavengers.user3.k8s.local
### * edit your node instance group: kops edit ig --name=technoavengers.user3.k8s.local nodes-us-east-1a
### * edit your master instance group: kops edit ig --name=technoavengers.user3.k8s.local master-us-east-1a

########## Step7: Create kops Secret ############################
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa
kops create secret --name ${NAME} sshpublickey admin -i ~/.ssh/id_rsa.pub

########## Step8: Create Cluster ############################
kops update cluster --name ${NAME} --yes --admin=87600h

############## Kubectl Config View ########################