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

resource "helm_release" "argo_apps" {
  name             = "argo-apps"
  chart            = "argocd-apps"
  repository       = "https://argoproj.github.io/argo-helm"
  namespace        = "argo-cd"
  create_namespace = true
  version          = "1.4.1"
  values = [
    file("../infra/values.yaml")
  ]
}
