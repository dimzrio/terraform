resource "google_compute_firewall" "fw" {
  name    = "allow-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["nginx"]
  source_ranges = ["0.0.0.0/0"]
}