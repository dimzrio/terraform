terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.74.0"
    }
  }
}

provider "google" {
  project     = "dimzrio"
  region      = "asia-southeast2"
  zone        = "asia-southeast2-a"
  
}