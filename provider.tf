#_______________________________________________________________
#
# Terraform Provider - Helm
# https://registry.terraform.io/providers/hashicorp/helm/latest
#_______________________________________________________________

provider "helm" {
  kubernetes {
    #config_paths = [ "./new_cluster-kubeconfig.yml"]
    host                   = local.kubeconfig.clusters[0].cluster.server
    insecure               = false
    client_certificate     = base64decode(local.kubeconfig.users[0].user.client-certificate-data)
    client_key             = base64decode(local.kubeconfig.users[0].user.client-key-data)
    cluster_ca_certificate = base64decode(local.kubeconfig.clusters[0].cluster.certificate-authority-data)
  }
}
