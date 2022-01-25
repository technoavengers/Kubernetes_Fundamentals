export NAME=technoavengers.instructor.k8s.local
export KOPS_STATE_STORE=s3://kops-technoavengers-com-instructor-state-store
kops delete cluster --name ${NAME} --yes