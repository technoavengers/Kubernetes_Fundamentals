export NAME=technoavengers.user6.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user6-com-state-store
kops delete cluster --name ${NAME} --yes