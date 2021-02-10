output "cluster_endpoint" {
  value = google_container_cluster.cluster.endpoint
}

output "cluster_version" {
  value = data.google_container_engine_versions.version.latest_master_version
}

output "network_tags" {
  value = google_container_node_pool.nodepool[0].node_config[0].tags
}

output "vpc-network" {
  value = google_compute_network.vpc-network
}

output "subnetwork" {
  value = google_compute_subnetwork.vpc-subnetwork
}