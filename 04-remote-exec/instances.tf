resource "google_compute_instance" "compute-instance" {
  name = "nginx-instance"
  zone = "asia-southeast1-a"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "centos-7-v20200811"
    }
  }

  network_interface {
    network = google_compute_network.vpc-network.name
    subnetwork = google_compute_subnetwork.sub-network.name
    access_config {
    }
  }

  metadata = {
    name     = "Terraform Demo"
    ssh-keys = join(":", [
        "dimasriotantowi", 
        file("/Users/dimasriotantowi/.ssh/id_rsa.pub")
        ])
  }

  # Destory-time provisioner
  provisioner "local-exec" {
        # The "when" argument requires one of the following keywords: create or destroy
        when    = destroy
        command = "ls -lah"
  }
}