terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  project     = "dimzrio"
  region      = "asia-southeast1"
}