resource "google_compute_instance" "bastion" {
  name          = "bastion"
  zone          = "asia-southeast2-a"
  machine_type  = "f1-micro"

  boot_disk {
    initialize_params {
      image = "centos-7-v20200811"
    }
  }

  network_interface {
    network         = google_compute_network.network.name
    subnetwork      = google_compute_subnetwork.subnetwork.name
    access_config {
    }
  }

  tags = ["bastion"]

  metadata = {
    name     = "Terraform - Bastion"
    ssh-keys = join(":", [
        "dimasriotantowi", 
        file("/Users/dimasriotantowi/.ssh/id_rsa.pub")
        ])
  }
}