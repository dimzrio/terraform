resource "google_compute_network" "network" {
  auto_create_subnetworks         = "false"
  delete_default_routes_on_create = "false"
  routing_mode                    = "REGIONAL"
  name                            = "dimzrio-network"
  project                         = "dimzrio"
}

resource "google_compute_subnetwork" "subnetwork" {  
  name          = "dimzrio-subnet"
  ip_cidr_range = "192.168.0.0/20"
  region        = "asia-southeast2"
  network       = google_compute_network.network.id
  
  secondary_ip_range = [
    {
      range_name = "pods-address"
      ip_cidr_range = "10.7.0.0/16"
    },
    {
      range_name = "services-address"
      ip_cidr_range = "10.9.0.0/23"
    }
  ]
}

// Subnet calc: https://www.davidc.net/sites/default/subnets/subnets.html

###### External NAT IP (to be used by cloud-router for nodes-to-internet communication ######
resource "google_compute_address" "nat" {
  name    = "dimzrio-nat-ip"
  project = "dimzrio"
  region  = "asia-southeast2"
}

###### Create a cloud router (to be use by the Cloud NAT) ######
resource "google_compute_router" "router" {
  name    = "dimzrio-cloud-router"
  project = "dimzrio"
  region  = "asia-southeast2"
  network = google_compute_network.network.self_link
}

###### Create a cloud NAT (Using cloud-router and NAT IP) ######
resource "google_compute_router_nat" "nat" {
  name    = "dimzrio-cloud-nat"
  project = "dimzrio"
  router  = google_compute_router.router.name
  region  = "asia-southeast2"
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = [google_compute_address.nat.self_link]
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.subnetwork.self_link

    source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE", "LIST_OF_SECONDARY_IP_RANGES"]

    secondary_ip_range_names = [
      google_compute_subnetwork.subnetwork.secondary_ip_range.0.range_name,
      google_compute_subnetwork.subnetwork.secondary_ip_range.1.range_name,
    ]
  }
}