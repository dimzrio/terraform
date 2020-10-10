### CREATE VM INSTANCES ###
resource "google_compute_instance" "compute-instance" {
  name = "nginx-instance"
  zone = var.zone
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.vpc_network
    subnetwork = var.vpc_subnetwork
    access_config {
    }
  }

  metadata_startup_script = "sudo yum install -y nginx; systemctl restart nginx;"
}