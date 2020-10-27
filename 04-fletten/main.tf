terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  project     = "kitabisa-infra"
  region      = "asia-southeast1"
}