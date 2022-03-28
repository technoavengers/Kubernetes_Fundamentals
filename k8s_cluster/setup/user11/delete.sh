export NAME=technoavengers.user11.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user11-com-state-store
kops delete cluster --name ${NAME} --yes