export NAME=technoavengers.user3.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user3-com-state-store
kops delete cluster --name ${NAME} --yes