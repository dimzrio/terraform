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

### Network ###
module "network" {
    source = "./network"
    ip_cidr_range = var.ip_cidr_range
    network_name = var.network_name
}

### Firewall ###
module "firewall" {
    source = "./firewall"
    network_name = var.network_name
    vpc_network = module.network.vpc_network_name
}

### Compute ###
module "compute" {
    source = "./compute"
    zone = var.zone
    machine_type = var.machine_type
    image = var.image
    vpc_network = module.network.vpc_network_name
    vpc_subnetwork = module.network.vpc_subnetwork_name
}