export NAME=technoavengers.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-com-state-store
kops delete cluster ${NAME} --yes