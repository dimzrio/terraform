resource "google_compute_network" "vpc" {
  name = var.name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
    name = var.name
    ip_cidr_range = var.ip_cidr_range
    network = google_compute_network.vpc.name
}


