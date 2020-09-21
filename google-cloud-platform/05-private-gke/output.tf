output "cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "cluster_version" {
  value = data.google_container_engine_versions.version.latest_master_version
}