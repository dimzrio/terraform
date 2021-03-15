resource "google_bigquery_dataset" "dataset" {
    dataset_id                  = var.dataset_id
    friendly_name               = var.friendly_name
    description                 = var.description
    location                    = var.region
    default_table_expiration_ms = var.default_table_expiration_ms

    labels = var.dataset_labels

    access {
        role          = "OWNER"
        special_group = "projectOwners"
    }

    access {
        role          = "READER"
        special_group = "projectReaders"
    }
    
    access {
        role          = "WRITER"
        special_group = "projectWriters"
    }

    timeouts {} 
}