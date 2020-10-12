data "google_container_engine_versions" "version" {
  location        = var.zone
  version_prefix  = var.version_prefix_master
  project         = var.project
}

resource "google_container_cluster" "cluster" {
  name                      = var.cluster_name
  min_master_version        = data.google_container_engine_versions.version.latest_master_version
  location                  = var.zone
  remove_default_node_pool  = true
  initial_node_count        = var.initial_node_count
  resource_labels           = var.resource_labels
  default_max_pods_per_node = "32"
  logging_service           = "logging.googleapis.com/kubernetes"
  monitoring_service        = "monitoring.googleapis.com/kubernetes"
  
  network  = "default"
  subnetwork = "default"
  
  vertical_pod_autoscaling {
    enabled = "true"
  }

  cluster_autoscaling {
    auto_provisioning_defaults {
      oauth_scopes    = [
        "https://www.googleapis.com/auth/compute", 
        "https://www.googleapis.com/auth/devstorage.read_only", 
        "https://www.googleapis.com/auth/logging.write", 
        "https://www.googleapis.com/auth/monitoring", 
        "https://www.googleapis.com/auth/service.management.readonly", 
        "https://www.googleapis.com/auth/servicecontrol"
      ]

    }

    enabled = "true"

    resource_limits {
      maximum       = "80"
      minimum       = "4"
      resource_type = "cpu"
    }

    resource_limits {
      maximum       = "320"
      minimum       = "16"
      resource_type = "memory"
    }
  }

  maintenance_policy {
    recurring_window {
      end_time   = "2020-01-26T21:00:00Z"
      recurrence = "FREQ=WEEKLY;BYDAY=MO,TU,WE,TH,FR,SA,SU"
      start_time = "2020-01-26T17:00:00Z"
    }
  }
  
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

}