data "google_container_engine_versions" "version" {
  location        = "asia-southeast2-a" 
  version_prefix  = "1.18."
  project         = "dimzrio"
}

resource "google_container_cluster" "cluster" {
  name                      = "dimzrio-labs"
  min_master_version        = data.google_container_engine_versions.version.latest_master_version
  location                  = "asia-southeast2-a" 
  remove_default_node_pool  = true
  initial_node_count        = 1
  resource_labels           = {
                                "provisioner" = "terraform",
                                "app" = "dimzrio"
                              }
  logging_service           = "logging.googleapis.com/kubernetes"
  monitoring_service        = "monitoring.googleapis.com/kubernetes"
  
  network  = google_compute_network.network.name
  subnetwork = google_compute_subnetwork.subnetwork.name
  
  ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_subnetwork.subnetwork.secondary_ip_range.0.range_name
    services_secondary_range_name = google_compute_subnetwork.subnetwork.secondary_ip_range.1.range_name
  }

  private_cluster_config {
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.101.0.0/28"
    enable_private_nodes    = true
  }

  master_authorized_networks_config {
    
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}