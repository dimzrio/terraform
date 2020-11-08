terraform {
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  credentials = file("/Users/dimasriotantowi/Downloads/dimzrio-13327c807a89.json")
  project     = "dimzrio"
  region      = "asia-southeast1"
}