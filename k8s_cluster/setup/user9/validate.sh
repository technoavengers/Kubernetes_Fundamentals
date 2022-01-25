export NAME=technoavengers.user9.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user9-com-state-store
kops validate cluster --name ${NAME}