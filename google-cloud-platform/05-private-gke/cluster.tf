data "google_container_engine_versions" "version" {
  location        = var.zone
  version_prefix  = "1.16."
  project         = var.project
}

resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  # node_version = data.google_container_engine_versions.version.latest_master_version
  min_master_version = data.google_container_engine_versions.version.latest_master_version
  location = var.zone
  network  = var.network
  subnetwork = var.subnetwork
  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count
  resource_labels = var.resource_labels

  ip_allocation_policy {
    cluster_secondary_range_name = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  private_cluster_config {
    enable_private_endpoint = false
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
    enable_private_nodes = true
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  master_authorized_networks_config {}
}

resource "google_container_node_pool" "nodepool" {
  name       = var.cluster_name
  location   = google_container_cluster.cluster.location
  version    = data.google_container_engine_versions.version.latest_master_version
  cluster    = google_container_cluster.cluster.name
  node_count = var.node_count

  autoscaling {
    min_node_count = var.autoscaling_min_node_count
    max_node_count = var.autoscaling_max_node_count
  }

  management {
    auto_repair = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type
    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_write",
    ]
    
    labels = var.labels

  }

  depends_on = [google_container_cluster.cluster]
}