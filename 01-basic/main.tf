### PROVIDER ###
terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  credentials = file("/home/rio/Downloads/dimzrio-8563dd31ddda.json")
  project     = "dimzrio"
  region      = "asia-southeast1"
}

### CREATE VPC NETWORK ###
resource "google_compute_network" "vpc-network" {
  name = "nginx-instance"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub-network" {
    name = "nginx-instance"
    ip_cidr_range = "192.168.7.0/24"
    network = google_compute_network.vpc-network.name
}

### CREATE FIREWALL ###
resource "google_compute_firewall" "firewall" {
    name = "nginx-instance"
    network = google_compute_network.vpc-network.name
    
    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["80", "443", "22"]
    }

    source_ranges = ["0.0.0.0/0"]

    source_tags = ["nginx"]
  
}

### CREATE VM INSTANCES ###
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

  metadata_startup_script = "sudo yum install -y nginx; systemctl restart nginx;"
}