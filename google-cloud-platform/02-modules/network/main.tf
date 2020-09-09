resource "google_compute_network" "vpc_network" {
  name = "nginx-instance"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_subnetwork" {
    name = "nginx-instance"
    ip_cidr_range = var.ip_cidr_range
    network = google_compute_network.vpc_network.name
}