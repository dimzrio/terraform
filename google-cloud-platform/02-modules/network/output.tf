output "vpc_network_name" {
    value = google_compute_network.vpc_network.name
}

output "vpc_subnetwork_name" {
    value = google_compute_subnetwork.vpc_subnetwork.name
}