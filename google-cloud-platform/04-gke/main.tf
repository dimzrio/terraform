### PROVIDER ###
terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

### GKE ###
module "gke" {
    source = "./gke"
    region = var.region
    cluster_name = var.cluster_name
    node_pool_count = var.node_pool_count
    machine_type = var.machine_type
}