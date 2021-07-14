resource "google_compute_network" "vpc_network" {
  name = format("%s-%s", var.network, terraform.workspace)
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = format("%s-%s-subnet", var.network, terraform.workspace)
  ip_cidr_range = var.ip_cidr_range
  region        = "asia-southeast2"
  network       = google_compute_network.vpc_network.name
}