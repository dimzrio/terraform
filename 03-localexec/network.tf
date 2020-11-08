resource "google_compute_network" "vpc-network" {
  name = "nginx-instance"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-network" {
    name = "nginx-instance"
    ip_cidr_range = "192.168.7.0/24"
    network = google_compute_network.vpc-network.name
}