resource "helm_release" "argo_cd" {
  name              = "argo-cd"
  chart             = "../charts/argo-cd"
  namespace         = "argo-cd"
  create_namespace  = true
  dependency_update = true
  values = [
    file("../charts/argo-cd/values.yaml")
  ]
}

resource "helm_release" "infra" {
  name              = "infra"
  chart             = "../infra"
  namespace         = "argo-cd"
  create_namespace  = true
  dependency_update = true
  values = [
    file("../infra/values.yaml")
  ]
}
