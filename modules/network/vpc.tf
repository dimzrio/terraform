locals {
  create_vpc = var.network != "default" ? 1 : 0
}

resource "google_compute_network" "vpc_network" {
  count = local.create_vpc
  name  = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  count         = local.create_vpc
  name          = var.subnetwork
  ip_cidr_range = var.ip_cidr_range
  region        = var.region
  network       = var.network
  depends_on    = [google_compute_network.vpc_network]
}