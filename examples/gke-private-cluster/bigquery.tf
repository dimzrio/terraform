// resource "google_bigquery_dataset" "dataset" {
//   dataset_id                  = "gke_cluster"
//   friendly_name               = "gke"
//   description                 = "This is dateset uses for metering resources of gke cluster"
//   location                    = "asia-southeast1"
//   default_table_expiration_ms = 3600000

//   labels = {
//     env = "default"
//   }

//   access {
//     role          = "OWNER"
//     user_by_email = "kubernetes@dimzrio.iam.gserviceaccount.com"
//   }
  
// }

// resource "google_service_account" "bqowner" {
//   account_id = "kubernetes"
// }