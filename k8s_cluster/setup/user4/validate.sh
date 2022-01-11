export NAME=technoavengers.user4.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user4-com-state-store
kops validate cluster --name ${NAME}