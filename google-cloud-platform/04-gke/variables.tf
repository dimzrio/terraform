### Project ###
variable "credentials" {
    description = "Path of google services account (e.g. /root/service-account.json)"
    type = string
}

variable "project" {
    description = "The google cloud project name"
    type = string
}

variable "region" {
    description = "The name of region (e.g. asia-southeast2)"
    type = string
    default = "asia-southeast2"
}
variable "zone" {
    description = "The name of region zone (e.g. asia-southeast2)"
    type = string
    default = "asia-southeast2-a"
}

### GKE ###
variable "cluster_name" {
    description = "The name of cluster"
    type = string
}

### Node Pool ###
variable "node_pool_count" {
    description = "Number of node pool"
    type = number
}

variable "machine_type" {
    description = "Machine type for nood pool (e.g. f1-micro)"
}