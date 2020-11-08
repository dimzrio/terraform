resource "google_compute_firewall" "firewall" {
    name = "nginx-instance"
    network = google_compute_network.vpc-network.name
    
    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["80", "443", "22", "9100"]
    }

    source_ranges = ["0.0.0.0/0"]

    source_tags = ["nginx"]
  
}