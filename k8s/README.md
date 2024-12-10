https://signoz.io/docs/tutorial/kubernetes-infra-metrics/
helm install my-release signoz/k8s-infra -f values.yaml


Cert Manager Instalation
helm repo add jetstack https://charts.jetstack.io --force-update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.16.2 \
  --set crds.enabled=true