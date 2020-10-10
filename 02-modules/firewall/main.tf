resource "google_compute_firewall" "vpc_firewall" {
    name = var.network_name
    network = var.vpc_network
    
    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["80", "443", "22"]
    }

    source_ranges = ["0.0.0.0/0"]

    source_tags = ["nginx"] 
}
