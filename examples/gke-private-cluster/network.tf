resource "google_compute_network" "vpc-network" {
  auto_create_subnetworks         = "false"
  delete_default_routes_on_create = "false"
  routing_mode                    = var.routing_mode
  name                            = var.vpc_name
  project                         = var.project
}

resource "google_compute_subnetwork" "vpc-subnetwork" {  
  count         = length(var.vpc_subnet)
  name          = var.vpc_subnet[count.index].subnet_name
  ip_cidr_range = var.vpc_subnet[count.index].subnet_addr_cidr
  region        = var.region
  network       = google_compute_network.vpc-network.id
  
  secondary_ip_range = [
    for addr in var.vpc_subnet[count.index].secondary_address: {
      range_name    = addr.name
      ip_cidr_range = addr.network_addr
    }
  ]
}