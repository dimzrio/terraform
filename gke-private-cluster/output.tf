output "cluster_endpoint" {
  value = nonsensitive(module.gke.endpoint)
}