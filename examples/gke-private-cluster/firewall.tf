resource "google_compute_firewall" "firewall" {
    name = "bastion"
    network = google_compute_network.network.name
    
    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["22"]
    }

    source_ranges = ["0.0.0.0/0"]

    source_tags = ["bastion"]
}