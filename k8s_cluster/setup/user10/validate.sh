export NAME=technoavengers.user10.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user10-com-state-store
kops validate cluster --name ${NAME}