resource "google_compute_network" "vpc" {
  count = 2
  name = format("dimzrio-vpc%s", count.index)
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
    count = 2
    name = format("dimzrio-vpc%s", count.index)
    ip_cidr_range = format("192.168.%s.0/28", count.index)
    network = google_compute_network.vpc[count.index].name
}