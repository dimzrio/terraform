resource "google_compute_firewall" "fw" {
  count = length(var.firewall_rules)
  name    = var.firewall_rules[count.index].name
  network = google_compute_network.vpc_network.name

  allow {
    protocol = var.firewall_rules[count.index].protocol
    ports    = var.firewall_rules[count.index].ports
  }

  source_tags = var.firewall_rules[count.index].source_tags
  source_ranges = var.firewall_rules[count.index].source_ranges
}