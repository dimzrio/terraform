terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

terraform {
  backend "gcs"{
    bucket      = "dimzrio-tf-state"
    prefix      = "dimzrio"
  }
}

provider "google" {
  project     = var.project
  region      = var.region
}

