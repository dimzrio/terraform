resource "google_compute_instance" "vm" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  tags = var.tags

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork

    access_config {
    }
  }

  metadata_startup_script = join("; ", var.metadata_startup_script)
}