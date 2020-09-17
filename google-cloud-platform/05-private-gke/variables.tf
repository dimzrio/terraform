###############
### Project ###
###############
variable "credentials" {
    default = ""
}

variable "project" {
    default = ""
}

variable "region" {
    default = "us-central1"
}
variable "zone" {
    default = "us-central1-a"
}

###############
### Cluster ###
###############
variable "cluster_name" {
    default = ""
}

variable "resource_labels" {
    default = {}
}

#################
### Node Pool ###
#################
variable "initial_node_count" {
  default = 1
}

variable "node_count" {
  default = 3
}

variable "autoscaling_min_node_count" {
  default = 3
}

variable "autoscaling_max_node_count" {
  default = 5
}

variable "labels" {
    default = {}
}

################
### Instance ###
################
variable "disk_size_gb" {
  default = 20
}

variable "disk_type" {
  default = "pd-standard"
}

variable "machine_type" {
  default = "n1-standard-2"
}

###############
### Network ###
###############
variable "network" {
    default = "default"
}

variable "subnetwork" {
    default = "default"
}

variable "cluster_secondary_range_name" {
    default = ""
}

variable "services_secondary_range_name" {
    default = ""
}

variable "master_ipv4_cidr_block" {
    default = ""
}
