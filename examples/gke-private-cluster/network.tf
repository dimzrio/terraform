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

###### External NAT IP (to be used by cloud-router for nodes-to-internet communication ######
resource "google_compute_address" "nat" {
  name    = format("%s-nat-ip", var.cluster_name)
  project = var.project
  region  = var.region
}

###### Create a cloud router (to be use by the Cloud NAT) ######
resource "google_compute_router" "router" {
  name    = format("%s-cloud-router", var.cluster_name)
  project = var.project
  region  = var.region
  network = google_compute_network.vpc-network.self_link
}

###### Create a cloud NAT (Using cloud-router and NAT IP) ######
resource "google_compute_router_nat" "nat" {
  name    = format("%s-cloud-nat", var.cluster_name)
  project = var.project
  router  = google_compute_router.router.name
  region  = var.region
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = [google_compute_address.nat.self_link]
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.vpc-subnetwork[0].self_link

    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE", "LIST_OF_SECONDARY_IP_RANGES"]

    secondary_ip_range_names = [
      google_compute_subnetwork.vpc-subnetwork[0].secondary_ip_range.0.range_name,
      google_compute_subnetwork.vpc-subnetwork[0].secondary_ip_range.1.range_name,
    ]
  }
}