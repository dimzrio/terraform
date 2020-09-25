### PROVIDER ###
terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  credentials = file("/home/rio/Downloads/kitabisa-dev-16e352facbf3.json")
  project     = "kitabisa-dev"
}

data "google_compute_network" "share_network" {
    name = "kitabisa-shared-dev-vpc-1"
    project = "kitabisa-infra"
}

output "list_subnet" {
  value = data.google_compute_network.share_network.subnetworks_self_links
}