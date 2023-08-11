resource "helm_release" "argo_cd" {
  name              = "argo-cd"
  chart             = "../charts/argo-cd"
  namespace         = "argo-cd"
  create_namespace  = true
  dependency_update = true
}