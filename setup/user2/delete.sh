export NAME=technoavengers.user2.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-user2-com-state-store
kops delete cluster --name ${NAME} --yes