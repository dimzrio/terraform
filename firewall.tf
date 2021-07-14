resource "google_compute_firewall" "fw" {
  name    = format("allow-http-%s", terraform.workspace)
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["nginx"]
  source_ranges = ["0.0.0.0/0"]
}