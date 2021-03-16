resource "google_container_node_pool" "nodepool" {
  name       = "dimzrio"
  location   = google_container_cluster.cluster.location
  version    = data.google_container_engine_versions.version.latest_master_version
  cluster    = google_container_cluster.cluster.name
  node_count = 2

  autoscaling {
    min_node_count = 2
    max_node_count = 4
  }

  management {
    auto_repair     = true
    auto_upgrade    = true
  }

  node_config {
    disk_size_gb    = 20
    disk_type       = "pd-standard"
    machine_type    = "e2-standard-2"
    labels          = {
                        "provisioner" = "terraform",
                        "machine" = "e2-standard-2"
                      }
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]

  }

  depends_on = [google_container_cluster.cluster]
}