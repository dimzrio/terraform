resource "google_compute_instance" "vm" {
  name         = format("%s-%s", var.vm_name, terraform.workspace)
  machine_type = "e2-medium"
  zone         = "asia-southeast2-a"

  tags = ["nginx"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork.name

    access_config {
    }
  }

  metadata_startup_script = "sudo apt -y update; sudo apt -y install nginx;"
}