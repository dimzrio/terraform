resource "google_compute_network" "vpc_network" {
  name = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
    name = var.network_name
    ip_cidr_range = var.ip_cidr_range
    network = google_compute_network.vpc_network.name
}