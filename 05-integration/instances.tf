resource "google_compute_instance" "vm" {
  name          = var.name
  zone          = var.zone
  machine_type  = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network         = google_compute_network.vpc.name
    subnetwork      = google_compute_subnetwork.subnet.name
    access_config {
    }
  }

  # expected output: "sudo yum install -y nginx; systemctl restart nginx;"
  metadata_startup_script = join("; ", [
      "sudo yum install -y nginx", 
      "systemctl restart nginx"
      ])
}