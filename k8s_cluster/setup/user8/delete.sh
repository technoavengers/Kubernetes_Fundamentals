export NAME=technoavengers.user8.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user8-com-state-store
kops delete cluster --name ${NAME} --yes