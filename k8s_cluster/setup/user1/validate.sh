export NAME=technoavengers.user1.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user1-com-state-store
kops validate cluster --name ${NAME}