resource "google_compute_network" "vpc_network" {
  name = "dimzrio-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "dimzrio-subnetwork"
  ip_cidr_range = "192.168.7.0/24"
  region        = "asia-southeast2"
  network       = google_compute_network.vpc_network.name
}