resource "google_compute_firewall" "firewall" {
    name = var.name
    network = google_compute_network.vpc.name
    
    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = var.ports
    }

    source_ranges = ["0.0.0.0/0"]

    source_tags = ["nginx"]
  
} 