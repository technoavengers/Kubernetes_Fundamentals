export NAME=technoavengers.user7.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user7-com-state-store
kops delete cluster --name ${NAME} --yes