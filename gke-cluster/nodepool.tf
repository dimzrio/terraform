resource "google_container_node_pool" "nodepool" {
  count      = length(var.node_pools)

  name       = var.node_pools[count.index].name
  location   = google_container_cluster.cluster.location
  version    = data.google_container_engine_versions.version.latest_master_version
  cluster    = google_container_cluster.cluster.name
  node_count = var.node_pools[count.index].node_count

  autoscaling {
    min_node_count = var.node_pools[count.index].min_node_count
    max_node_count = var.node_pools[count.index].max_node_count
  }

  upgrade_settings {
    max_surge       = var.node_pools[count.index].upgrade_max_surge
    max_unavailable = var.node_pools[count.index].upgrade_max_unavailable
  }

  management {
    auto_repair     = true
    auto_upgrade    = true
  }

  node_config {
    preemptible     = var.node_pools[count.index].preemptible
    disk_size_gb    = var.node_pools[count.index].disk_size_gb
    disk_type       = var.node_pools[count.index].disk_type
    machine_type    = var.node_pools[count.index].machine_type
    labels          = var.node_pools[count.index].labels
    taint           = var.node_pools[count.index].taint

    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]

    workload_metadata_config {
      node_metadata = "GKE_METADATA_SERVER"
    }
  }

  

  depends_on = [google_container_cluster.cluster]
}