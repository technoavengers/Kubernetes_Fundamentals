export NAME=technoavengers.user5.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user5-com-state-store
kops delete cluster --name ${NAME} --yes